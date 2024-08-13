#!/bin/sh

help() {
  echo "Welcome to password-generator! Version 1.0, (c) 2024, Cauã and Alexandre, DIMAp, UFRN"
  echo "Use: ./password-generator.sh [OPTIONS]"
  echo "Options:"
  echo "-l [length] : password length"  
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

OPTIND=1

# Analyze arguments
while getopts "l:udsh" opt; do
   case $opt in
       l)
          LENGTH=$OPTARG
          ;;
       u)
          USE_UPPERCASE=true
          ;;
       d)      
          USE_DIGITS=true
          ;;
       s)
          USE_SYMBOLS=true
          ;;
       h)
          help
          exit 0
          ;;
       \?)   
          echo "Invalid option: -$OPTARG" >&2
          help  
          exit 1
          ;;
       :)
         echo "Option -$OPTARG requires an argument" >&2
         help
         exit 1
         ;;

    esac
done

# Build the list of allowed characters 
CHARSET="$LOWERCASE"

if [ "$USE_UPPERCASE" = true ]; then
   CHARSET="$CHARSET$UPPERCASE"
fi

if [ "$USE_DIGITS" = true ]; then
   CHARSET="$CHARSET$DIGITS"
fi

if [ "$USE_SYMBOLS" = true ]; then
   CHARSET="$CHARSET$SYMBOLS"
fi

if [ -z "$CHARSET" ]; then
  echo "No character set specified. At least one option (-u, -d, -s) must be used."
  exit 1
fi

# Generate password 
PASSWORD=$(tr -dc "$CHARSET" </dev/urandom | head -c $LENGTH)

# Exhibit password
echo "Your generated password: $PASSWORD"
