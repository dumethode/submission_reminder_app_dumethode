#!/bin/bash

# Prompt for the user's name

read -p "Enter your name: " user_input
folder="submission_reminder_${user_input}"

# Create the directory structure

mkdir -p "$folder"/{app,modules,assets,config}

# 1. Create app/reminder.sh

cat << 'EOF' > "$folder/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file

EOF


# 2. Create modules/functions.sh

cat << 'EOF' > "$folder/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}

EOF


# 3. Create config/config.env

cat << EOF > "$folder/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF


# 4. Create assets/submissions.txt

cat << EOF > "$folder/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Thon, Git, not submitted
Elie, Shell Navigation, submitted
Richard, Shell Navigation, not submitted
claude, Git, not submitted
Salah, Git, submitted
EOF

# 5. Create startup.sh

cat << 'EOF' > "$folder/startup.sh"
#!/bin/bash

# Run the main app
./app/reminder.sh
EOF


# 6. Make all .sh files executable

find "$folder" -type f -name "*.sh" -exec chmod +x {} \;

echo "Environment setup complete!"
echo "To test: cd $folder && ./startup.sh"

