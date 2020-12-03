#!/bin/bash
# Script normalize month to three letters shortcut
# Exits with 0 if no erro

month_num_to_name()
{
    # Sets month variable to appropriate value.
    case $1 in
    1 ) month="Jan"     ;;  2 ) month="Feb"     ;;
    3 ) month='Mar'     ;;  4 ) month="Apr"     ;;
    5 ) month="May"     ;;  6 ) month="Jun"     ;;
    7 ) month="Jul"     ;;  8 ) month="Aug"     ;;
    9 ) month="Sep"     ;;  10) month="Oct"     ;;
    11) month="Nov"     ;;  12) month="Dec"     ;;
    * ) echo "$0: Unknown month value $1" >&2
        exit 1
    esac
    return 0
}

# Input validation
if [ $# -ne 3 ] ; then #if num of arguments not equal 3 then
    echo "Usage: $0 month day year" >&2 #stdout to stderr
    echo "Formats are August 3 1962 and 8 3 1962" >&2
    exit 1
fi
if [ $3 -le 99 ] ; then #if third argument (year) less than or equal 99 then
    echo "$0: expected 4-digit year value." >&2
    exit 1
fi

if [ -z $(echo $1|sed 's/[[:digit:]]//g') ]; then #if string without digits is empty (-z) then
    month_num_to_name $1
else
    month="$(echo $1|cut -c1|tr '[:lower:]' '[:upper:]')" #extract first char of the input and make it uppercase
    month="$month$(echo $1|cut -c2-3 | tr '[:upper:]' '[:lower:]')" #extract second and third char of the input and make it lowercase 
fi

echo $month $2 $3

exit 0