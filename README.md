# About the project
This project aims to generate passwords for the user via command line.
Having the ability to generate passwords of different sizes, which can include upper and lower case letters, numbers and symbols.
 
# Usage examples
~$ ./password_generator
>Your generated password: sdafglsl

~$ ./password_generator -h
>Use: ./password-generator.sh [OPTIONS]
>
>Options:
>
> -l [lenght] : password lenght
>
> -u          : include uppercase letters
>
> -d          : include numbers
>
> -s          : include symbols
>
> -h          : shows this help message
>
>The default behavior of the script is to generate a password of 8 lowercase characters.

~$ ./password_generator.sh -s -l 4
>Your generated password: #a>|
