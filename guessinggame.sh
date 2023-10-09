#!/bin/bash

# Function to count the number of files in the current directory
count_files() {
  local num_files=$(ls -l | grep -v ^d | wc -l)
  echo "$num_files"
}

# Get the correct number of files in the current directory
correct_num_files=$(count_files)

# Start the guessing game loop
while true; do
  # Ask the user for their guess
  echo "How many files are in the current directory? Please make a guess:"
  read user_guess

  # Check if the guess is a valid number
  if ! [[ "$user_guess" =~ ^[0-9]+$ ]]; then
    echo "Please enter a valid number."
    continue
  fi

  # Compare the user's guess with the correct number of files
  if [ "$user_guess" -lt "$correct_num_files" ]; then
    echo "Your guess is too low. Try again."
  elif [ "$user_guess" -gt "$correct_num_files" ]; then
    echo "Your guess is too high. Try again."
  else
    echo "Congratulations! Your guess is correct."
    break
  fi
done
