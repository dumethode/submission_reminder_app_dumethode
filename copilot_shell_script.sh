#!/bin/bash

# Prompt user for the username or folder name suffix that he used when runnning create_environment.sh

read -p "Enter your username (the same as you used before when running create_environment.sh): " user_input

folder="submission_reminder_${user_input}"
config_file="${folder}/config/config.env"
startup_script="${folder}/startup.sh"

# Check if folder exists

if [[ ! -d "$folder" ]]; then
    echo "Error: Folder '$folder' does not exist. You've put mismatching username"
    echo "Or you have to run create_environment.sh first"
    exit 1
fi


# Prompt for new assignment name

read -p "Enter new assignment name: " new_assignment

# Update ASSIGNMENT in config/config.env (line 2)

sed -i "2s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" "$config_file"

echo "Updated assignment to \"$new_assignment\" in $config_file"
echo "Go re-run startup.sh, located inside generated folder with your name"

