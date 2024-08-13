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