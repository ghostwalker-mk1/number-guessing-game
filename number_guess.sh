#!/bin/bash

# Generate a random secret number between 1 and 1000
SECRET=$(($RANDOM % 1000 + 1))

# Define the PSQL command for executing SQL queries
PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"

# Prompt the user to enter their username
echo "Enter your username:"
read USERNAME

# Retrieve user information from the database based on the provided username
USER_INFO=$($PSQL "select user_id, name, game_counter, best_guess from users where name = '$USERNAME'")
USER_ID=$(echo $USER_INFO | cut -d '|' -f 1)       # Extract user ID from the result
USER_NAME=$(echo $USER_INFO | cut -d '|' -f 2)     # Extract user name from the result
GAME_COUNTER=$(echo $USER_INFO | cut -d '|' -f 3)  # Extract game counter from the result
BEST_GUESS=$(echo $USER_INFO | cut -d '|' -f 4)    # Extract best guess from the result

# Check if the user exists in the database
if [[ -z $USER_ID ]]; then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
else
    echo "Welcome back, $USER_NAME! You have played $GAME_COUNTER games, and your best game took $BEST_GUESS guesses."
fi

# Prompt the user to guess the secret number
echo "Guess the secret number between 1 and 1000:"
GUESSES=0
GUESS=-1

# Continue looping until the user guesses the correct number
while [[ $GUESS -ne $SECRET ]]; do
    read GUESS

    # Check if the input is a valid integer
    if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
        echo "That is not an integer, guess again:"
    elif [[ $GUESS -lt $SECRET ]]; then
        ((GUESSES++))
        echo "It's higher than that, guess again:"
    elif [[ $GUESS -gt $SECRET ]]; then
        ((GUESSES++))
        echo "It's lower than that, guess again:"
    elif [[ $GUESS -eq $SECRET ]]; then
        ((GUESSES++))
        echo "You guessed it in $GUESSES tries. The secret number was $SECRET. Nice job!"
    fi
done

# Update the user's information in the database based on the game result
if [[ -z $USER_ID ]]; then
    USER_INSERT=$($PSQL "insert into users(name, game_counter, best_guess) values('$USERNAME', 1, $GUESSES)")
else
    if [[ $GUESSES -lt $BEST_GUESS ]]; then
        USER_UPDATE=$($PSQL "update users set game_counter = game_counter + 1, best_guess = $GUESSES where user_id = $USER_ID")
    else
        USER_UPDATE=$($PSQL "update users set game_counter = game_counter + 1 where user_id = $USER_ID")
    fi
fi
