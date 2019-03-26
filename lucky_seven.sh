#!/bin/bash

echo "Enter a number and check if its a lucky number or not"
echo "Enter the number: "
read num
function luckyseven() {
sum=0
if [[ "$num" =~ ^[0-9]+$ ]]
then
        while [ $num -gt 0  ]; do
            rem=$(( $num % 10 ))
            sum=$(( $sum + $rem ))
            num=$(( $num / 10 ))
            if [[ $sum -gt 9  && $num -eq 0 ]]; then
                num=$sum
                sum=0
            fi
        done
        if [[ $sum -eq 7 ]]; then
                echo "Entered number is a lucky number"
        else
                echo "Entered number is not a lucky number"
        fi
elif [ -z "$num" ]
then
        echo "you must enter a number"
else
        echo "you entered the string instead of number"

fi
}

luckyseven
