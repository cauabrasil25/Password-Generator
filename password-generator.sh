#!/bin/sh

# Help message
function help() {
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
<<<<<<< HEAD
LENGTH=8
USE_UPPERCASE=false
USE_NUMBERS=false
USE_SYMBOLS=false

# Analyze arguments
while getopts "l:udsh" opt; do
   case ${opt} in
   l )
          LENGTH=$OPTARG
          ;;
   u )
          USE_UPPERCASE=true
          ;;
   d )      
          USE_NUMBERS=true
          ;;
   s )
          USE_SYMBOLS=true
          ;;
   h )
          help
          exit 0
          ;;
   \? )   
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

# Set characters
LOWERCASE="abcdefghijklmnopqrstuvwxyz"
UPPERCASE="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
DIGITS="0123456789"
SYMBOLS="!@#$%^&*()-_=+[]{}|;:,.<>?/~"

# Build the list of allowed characters 
CHARSET="$LOWERCASE"

if [ "$USE_UPPERCASE" = true ]; then
   CHARSET+="$UPPERCASE"
fi

if [ "$USE_DIGITS" = true ]; then
   CHARSET+="$DIGITS"
fi

if [ "$USE_SYMBOLS" = true ]; then
   CHARSET+="$SYMBOLS"
fi
=======
LENGHT=8
USE_UPERCASE=false
USE_DIGITS=false
USE_SYMBOLS=false

# Input process
while getopts "l:udsh" opt; do
    case $opt in 
        l)
            lenght=$OPTARG
        ;;
        u)
            USE_UPERCASE=true
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
            echo "Option -$OPTARG requires a argument." >&2
            help
            exit 1
        ;;
    esac
done

# Character set
LOWERCASE="abcdefghijklmnopqrstuvwxyz"
UPPERCASE="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
DIGITS="0123456789"
SYMBOLS="!@#$%^&*()-_=+[]{}|;:,.<>?/~"
>>>>>>> f8086bb2320e0b92384b4dc7f53fc331fb14128a
