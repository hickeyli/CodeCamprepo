#!/bin/bash

# Database file
DB_FILE="guessing_game_db.txt"

# Function to check if a string is an integer
is_integer() {
  [[ "$1" =~ ^[0-9]+$ ]]
}

# Function to fetch user data from the database
get_user_data() {
  grep "^$1:" "$DB_FILE"
}

# Function to update user data in the database
update_user_data() {
  local username="$1"
  local games_played="$2"
  local best_game="$3"
  
  # Remove old entry if it exists
  sed -i "/^$username:/d" "$DB_FILE"
  
  # Add new entry
  echo "$username:$games_played:$best_game" >> "$DB_FILE"
}

# Prompt for username
echo "Enter your username:"
read username

# Ensure the username is at most 22 characters
username=${username:0:22}

# Fetch user data
user_data=$(get_user_data "$username")

if [ -n "$user_data" ]; then
  # If user exists, greet them with their stats
  games_played=$(echo "$user_data" | cut -d':' -f2)
  best_game=$(echo "$user_data" | cut -d':' -f3)
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
else
  # If user doesn't exist, greet them as a new user
  echo "Welcome, $username! It looks like this is your first time here."
  games_played=0
  best_game=1001 # A high number to start with
fi

# Generate a random number between 1 and 1000
secret_number=$((RANDOM % 1000 + 1))

# Start the guessing game
echo "Guess the secret number between 1 and 1000:"
guesses=0

while true; do
  read guess
  
  # Ensure the input is an integer
  if ! is_integer "$guess"; then
    echo "That is not an integer, guess again:"
    continue
  fi
  
  # Convert input to an integer
  guess=$(($guess))
  
  guesses=$(($guesses + 1))
  
  if [ "$guess" -lt "$secret_number" ]; then
    echo "It's higher than that, guess again:"
  elif [ "$guess" -gt "$secret_number" ]; then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $guesses tries. The secret number was $secret_number. Nice job!"
    break
  fi
done

# Update user stats
games_played=$(($games_played + 1))

if [ "$guesses" -lt "$best_game" ]; then
  best_game=$guesses
fi

# Save updated data
update_user_data "$username" "$games_played" "$best_game"

# refactor:
# refactor 2
# refactor 3
# refactor 4