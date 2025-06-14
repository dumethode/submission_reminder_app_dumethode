# submission_reminder_app_dumethode

cat << 'EOF' > README.md
### 1.Shell Scripting Assignment – Submission Reminder System

This project automates environment setup, student submission tracking, and reminder generation using Bash shell scripts. It also demonstrates a Git branching workflow with a `feature/setup` branch for rough work and a clean `main` branch for final deliverables.

---

### 2.Folder Structure

The project (when fully set up after you rub create_environment.sh) contains the following folders:

\`\`\`
submission_reminder_<your_name>/
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── config/
│   └── config.env
├── assets/
│   └── submissions.txt
└── startup.sh
\`\`\`

---

### What Each Script Does

 **create_environment.sh**
- Prompts for your name.
- Automatically creates the directory structure.
- Sets up the environment and configuration.
- Creates:
  - Reminder script (reminder.sh)
  - Helper functions (functions.sh)
  - Sample data for submissions (submission.txt)
  - configuration file (config.env)
  - startup.sh to run the app

### copilot_shell_script.sh
- Prompts for your **name** and a new **assignment name**.
- Updates the ASSIGNMENT value in `config/config.env`.
- Reruns the reminder system (`startup.sh`) using the updated assignment.

---

##  How to Run the Application

### 1. Make scripts executable

\`\`\`bash
chmod +x create_environment.sh copilot_shell_script.sh
\`\`\`

### 2. Run the environment setup

\`\`\`bash
./create_environment.sh
\`\`\`

 This will ask for your name and create a folder like `submission_reminder_A`, including all necessary files.

### 3. Change the assignment (and check reminders)

\`\`\`bash
./copilot_shell_script.sh
\`\`\`

 It will:
- Ask for your name (used to find the folder)
- Ask for the new assignment name
- Update the config and rerun the reminder checker

---

##  Sample Output ( find te image below: )

---

##  Git Workflow (Important)

This project follows a clean Git workflow:

| Branch           | Purpose                             |
|------------------|-------------------------------------|
| feature/setup     | Rough work and full script system   |
| main              | Final clean submission (3 files only) |

**Final files in \`main\` branch:**
- create_environment.sh
- copilot_shell_script.sh
- README.md

---

## 👨‍💻 Author

- Name: *<Methode Duhujubumwe>*
- Assignment: Individual Summative Lab


---
EOF

