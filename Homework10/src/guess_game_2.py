import random

def guessing_game():
    correct_number = random.randint(1, 100)
    attempts = 5

    print("Guess the number between 1 and 100. You have 5 attempts.")

    for attempt in range(1, attempts + 1):
        guess = int(input(f"Attempt {attempt}: Your guess: "))

        if guess == correct_number:
            print("Congratulations! You guessed the correct number.")
            return
        elif guess < correct_number:
            print("Too low.")
        else:
            print("Too high.")

    print(f"Sorry, you've run out of attempts. The correct number was {correct_number}.")

# Start the game
guessing_game()