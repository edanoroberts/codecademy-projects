import random
name = 'Edan'
question = 'Are carrots see-through?'
answer = ''
random_number = random.randint(1, 12)

if random_number == 1:
  answer = 'Yes - definitely'
elif random_number == 2:
  answer = 'It is decidely so'
elif random_number == 3:
  answer = 'Without a doubt'
elif random_number == 4:
  answer = 'Reply hazy, try again'
elif random_number == 5:
  answer ='Ask again later'
elif random_number == 6:
  answer = 'Better not tell you now'
elif random_number == 7:
  answer = 'My sources say no'
elif random_number == 8:
  answer = 'Outlook not so good'
elif random_number == 9:
  answer = 'Very Doubtful'
elif random_number == 10:
  answer = 'So say the stars'
elif random_number == 11:
  answer = 'Not a scooby'
elif random_number == 12:
  answer = 'Ask ChatGPT'
else:
  answer = 'Error'

if question == '':
  print('You gotta ask to get an answer')
elif name == '':
  print('Question: ' + question)
  print('Magic 8-Ball\'s answer: ' + answer)
else:
  print(name + ' asks: ' + question)
  print('Magic 8-Ball\'s answer: ' + answer)
