#!/bin/bash

# This script automates tasks for working with a forked Git repository for course material.

# Constants
UPSTREAM="upstream"
BRANCH="main"
ORIGIN="origin"

echo "-------------------"
echo "Git Automation Script for Course Repo"
echo "-------------------"

# Function: Pull latest updates from upstream (professor's repository)
function pull_upstream() {
  echo "Fetching updates from upstream repository..."
  git fetch $UPSTREAM
  echo "Merging upstream changes..."
  git pull $UPSTREAM $BRANCH
  echo "Pulled the latest updates from upstream."
}

# Function: Push your own work to your private repository
function push_origin() {
  echo "Adding changes..."
  git add .
  echo "Committing changes..."
  git commit -m "Completed exercises on $(date)"
  echo "Pushing changes to your private repository..."
  git push $ORIGIN $BRANCH
  echo "Pushed your changes to origin."
}

# Function: Check for new updates from upstream without merging
function check_updates() {
  echo "Fetching updates from upstream..."
  git fetch $UPSTREAM
  echo "Checking for new commits..."
  git log $UPSTREAM/$BRANCH --oneline --decorate --graph
  echo "Displayed log of changes in upstream."
}

# Main menu
while true; do
  echo "-------------------"
  echo "Choose an option:"
  echo "1) Pull Updates from Upstream"
  echo "2) Push Work to Origin"
  echo "3) Check for New Updates"
  echo "q) Quit"
  echo "-------------------"
  read -p "Option: " opt
  case $opt in
  1)
    pull_upstream
    ;;
  2)
    push_origin
    ;;
  3)
    check_updates
    ;;
  q)
    echo "Quitting the script."
    break
    ;;
  *)
    echo "Invalid option. Please try again."
    ;;
  esac
done
