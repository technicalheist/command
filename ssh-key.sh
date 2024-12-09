#!/bin/bash

# Prompt user for email ID
read -p "Enter your email ID: " email
read -p "Enter SSH Key Name " name

# Generate SSH key with provided email
ssh-keygen -t rsa -b 4096 -C "$email" -f ~/.ssh/$name


echo "SSH key generated successfully!"
