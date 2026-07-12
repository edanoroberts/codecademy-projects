/*
1.
Let’s see what these tables contain by running the following commands:

SELECT * 
FROM places;

SELECT * 
FROM reviews;

The places table has the following columns:
id
name
address
type
average_rating
price_point
total_reviews

The reviews table has the following columns:
id
username
place_id
review_date
rating
note

2.
If each dollar sign ($) represents $10, how could you find all places that cost $20 or less?

SELECT *
FROM places
WHERE price_point LIKE '$'
  OR price_point LIKE '$$';

3.
What columns can be used to JOIN these two tables?

-- places = id
-- reviews = place_id

4.
Let’s explore how the places on Welp stand up to reviewers.

Write a query to do an INNER JOIN on the two tables to show all reviews for restaurants that have at least one review.

SELECT *
FROM places
INNER JOIN reviews
  ON places.id = reviews.place_id;

5.
You probably noticed all the extra information in your results.

Modify your previous query to select only the most important columns in order to display a log of reviews by selecting the following:

From the places table: name, average_rating
From the reviews table: username, rating, review_date, note

SELECT places.name,
  places.average_rating,
  reviews.username,
  reviews.rating,
  reviews.review_date,
  reviews.note
FROM places
INNER JOIN reviews
  ON places.id = reviews.place_id;

6.
Now write a query to do a LEFT JOIN on the tables, selecting the same columns as the previous question.

How are the results of this query different? Would this or the INNER JOIN be more useful for a log of reviews?

SELECT places.name,
  places.average_rating,
  reviews.username,
  reviews.rating,
  reviews.review_date,
  reviews.note
FROM places
LEFT JOIN reviews
  ON places.id = reviews.place_id;
-- All rows with NULL values have been removed

7.
What about the places without reviews in our dataset?

Write a query to find all the ids of places that currently do not have any reviews in our reviews table.

SELECT places.id, places.name
FROM places
WHERE id NOT IN (
  SELECT place_id
  FROM reviews);

  --COULD BE SHOWN AS--
  
SELECT places.id, places.name
FROM places
LEFT JOIN reviews
  ON places.id = reviews.place_id
WHERE reviews.place_id IS NULL;

8.
Sometimes on Welp, there are some old reviews that aren’t useful anymore.

Write a query using the WITH clause to select all the reviews that happened in 2020. JOIN the places to your WITH query to see a log of all reviews from 2020.

WITH reviews_2020 AS(
  SELECT *
  FROM reviews
  WHERE strftime('%Y', review_date) = '2020'
)
SELECT places.name, review_date
FROM places
JOIN reviews_2020
ON places.id = reviews_2020.place_id;

9.
Businesses want to be on the lookout for …ahem… difficult reviewers. Write a query that finds the reviewer with the most reviews that are BELOW the average rating for places.
*/
WITH average_rating AS (
  SELECT AVG(rating) AS av_rating
  FROM reviews
)
SELECT username, COUNT(rating), AVG(rating)
FROM reviews
CROSS JOIN average_rating
WHERE reviews.rating < average_rating.av_rating
GROUP BY username
ORDER BY COUNT(rating) DESC
LIMIT 1;
