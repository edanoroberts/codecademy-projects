/*
1.
Let’s start by examining the three tables.

Write queries to select the rows from each table. Because some of the tables have many rows, select just the first 10 rows from each.

What are the column names of each table?

SELECT * FROM users
LIMIT 10;

SELECT * FROM posts
LIMIT 10;

SELECT * FROM subreddits
LIMIT 10;

The users table has:
id
username
email
join_date
score

The posts table has:
id
title
user_id
subreddit_id
score
created_date

The subreddits table has:
id
name
created_date
subscriber_count

2.
What is the primary key for each table? Can you identify any foreign keys?

-- posts = id
-- users = id || foreign key in posts = user_id
-- subreddits = id || foreign key in posts = subreddit_id

3.
Write a query to count how many different subreddits there are.

SELECT COUNT(*)
FROM subreddits;

4.
Write a few more queries to figure out the following information:

What user has the highest score?
What post has the highest score?
What are the top 5 subreddits with the highest subscriber_count?

SELECT username, MAX(score)
FROM users;

SELECT title, MAX(score)
FROM posts;

SELECT name, subscriber_count
FROM subreddits
ORDER BY subscriber_count DESC
LIMIT 5;

5.
Now let’s join the data from the different tables to find out some more information.

Use a LEFT JOIN with the users and posts tables to find out how many posts each user has made. Have the users table as the left table and order the data by the number of posts in descending order.

SELECT users.username AS 'username',
  COUNT(*) AS 'posts'
FROM users
LEFT JOIN posts
  ON posts.user_id = users.id
GROUP BY users.username
ORDER BY COUNT(*) DESC;

6.
Over time, posts may be removed and users might delete their accounts.

We only want to see existing posts where the users are still active, so use an INNER JOIN to write a query to get these posts. Have the posts table as the left table.

SELECT *
FROM posts
INNER JOIN users
  ON posts.user_id = users.id;

7.
Some new posts have been added to Reddit!

Stack the new posts2 table under the existing posts table to see them.

SELECT * FROM posts
UNION
SELECT * FROM posts2;

8.
Now you need to find out which subreddits have the most popular posts. We’ll say that a post is popular if it has a score of at least 5000. We’ll do this using a WITH and a JOIN.

WITH popular_posts AS(
SELECT *
FROM posts
WHERE score >= 5000
)
SELECT subreddits.name AS 'subreddit',
  popular_posts.title AS 'title',
  popular_posts.score AS 'score'
FROM subreddits
INNER JOIN popular_posts
  ON popular_posts.subreddit_id = subreddits.id
ORDER BY popular_posts.score DESC;

9.
Next, you need to find out the highest scoring post for each subreddit.

Do this by using an INNER JOIN, with posts as the left table.

SELECT posts.title AS 'post',
  subreddits.name AS 'subreddit',
  MAX(posts.score) AS 'highest_score'
FROM posts
INNER JOIN subreddits
ON posts.subreddit_id = subreddits.id
GROUP BY subreddits.id;

10.
Finally, you need to write a query to calculate the average score of all the posts for each subreddit.
*/
SELECT subreddits.name AS 'subreddit',
  ROUND(AVG(posts.score), 0) AS 'average_score'
FROM posts
INNER JOIN subreddits
ON posts.subreddit_id = subreddits.id
GROUP BY subreddits.id
ORDER BY 2 DESC;
