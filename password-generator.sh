#!/bin/sh

help() {
  echo "Welcome to the password-generator! Version 1.0, (c) 2024, Cauã and Alexandre, DIMAp, UFRN"
  echo "Use: ./password-generator.sh [OPTIONS]"
  echo "Options:"
  echo "-l [LENGHT] : Password length"
  echo "-u          : Include uppercase letters"
  echo "-d          : Include numbers"
  echo "-s          : Include symbols"
  echo "-h          : Shows this help message"
  echo "-o          : Save the generated password on a file"
  echo "-n [NAME]   : Add a name to the generated password"
  echo "-p          : Exhibit the generated passwords"
  echo ""
  echo "The default behavior of the script is to generate a password of 8 lowercase characters."
}

# Default values
LENGTH=8
USE_UPPERCASE=false
USE_DIGITS=false
USE_SYMBOLS=false
SAVE=false
SHOW_PASSWORDS=false
NAME=""

# Set characters
LOWERCASE="abcdefghijklmnopqrstuvwxyz"
UPPERCASE="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
DIGITS="0123456789"
SYMBOLS="!@#$%^&*()_=+[]{}|;:,.<>?/~"

OPTIND=1

# Analyze arguments
while getopts "l:n:opudsh" opt; do
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
      o)
         SAVE=true
         ;;
      n)       
         NAME=$OPTARG
         ;;
      p)
         SHOW_PASSWORDS=true
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

# Show all passwords
if [ "$SHOW_PASSWORDS" = true ]; then 
   cat passwords.txt
fi