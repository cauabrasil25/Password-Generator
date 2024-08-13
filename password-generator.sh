#!/bin/sh

# Help message
help() {
 echo "Welcome to password-generator! Version 1.0, (c) 2024, Cauã and Alexandre, DIMAp, UFRN"
 echo "Use: ./password-generator.sh [OPTIONS]"
 echo "Options:"
 echo "-l [lenght] : password lenght"
 echo "-u          : include uppercase letters"
 echo "-d          : include numbers"
 echo "-s          : include symbols"
 echo "-h          : shows this help message"
 echo ""
 echo "The default behavior of the script is to generate a password of 8 lowercase characters."
}

# Default values
LENGTH=8
USE_UPPERCASE=false
USE_DIGITS=false
USE_SYMBOLS=false

# Set characters
LOWERCASE="abcdefghijklmnopqrstuvwxyz"
UPPERCASE="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
DIGITS="0123456789"
SYMBOLS="!@#$%^&*()-_=+[]{}|;:,.<>?/~"
