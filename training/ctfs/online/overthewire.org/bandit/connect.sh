#!/bin/bash
cat  flags
echo "SSH Client Using Bash"
echo "Use the flags as passwords...."
echo "Enter User ID:"
read userid
echo "logging in as " $userid
ssh $userid@bandit.labs.overthewire.org -p 2220

