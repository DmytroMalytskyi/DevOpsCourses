import random

def guessing_game():
    correct_number = random.randint(1, 100)
    attempt = 5
    print("Guess the number between 1 and 100. You have 5 attempts.")
    while attempt >= 1:
        guess = int(input(f"It's left Attempt {attempt}: Your guess: "))
        if guess == correct_number:
            print("Congratulations! You guessed the correct number.")
            return
        elif guess < correct_number:
            print("Too low.")
        else:
            print("Too high.")
        attempt = attempt - 1
    print(f"Sorry, you've run out of attempts. The correct number was {correct_number}.")
guessing_game ()

