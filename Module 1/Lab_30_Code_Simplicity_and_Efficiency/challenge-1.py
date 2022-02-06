"""
This is a dumb calculator that can add and subtract whole numbers from zero to five.
When you run the code, you are prompted to enter two numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.

The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""

numbers = {
    'zero': 0,
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5
}

results = {
    0: 'zero',
    1: 'one',
    2: 'two',
    3: 'three',
    4:'four',
    5:'five',
    6:'six',
    7:'seven',
    8:'eight',
    9:'nine',
    10:'ten',
    -1:'negative one',
    -2:'negative two',
    -3: 'negative 3',
    -4:'negative four',
    -5:'negative five'
}

print('Welcome to this calculator!')
print('It can add and subtract whole numbers from zero to five')
a = input('Please choose your first number (zero to five): ')
b = input('What do you want to do? plus or minus: ')
c = input('Please choose your second number (zero to five): ')

if (a.lower() not in ['zero', 'one', 'two', 'three', 'four', 'five']) | (b.lower() not in ['zero', 'one', 'two', 'three', 'four', 'five']) | (c.lower() not in ['plus', 'minus']):
	print("Please choose a number from 0 to 5")

if b == 'plus':
    result = numbers[a] + numbers[c]
    print(f'{a} plus {b} equals {results[result]}')
elif b =='minus':
    result = numbers[a] - numbers[c]
    print(f'{a} minus {b} equals {results[result]}')

print("Thanks for using this calculator, goodbye :)")
