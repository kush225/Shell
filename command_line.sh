#!/bin/bash
# extracting command line options as parameters
while [ -n "$*" ]
do
case "$*" in
-n) echo "enter a number";;
*) echo "$*""is not an option";;
esac
shift
done
read n
i=0
while [ $i -le 10 ]
do
        total=`expr $n \* $i`

        echo " $n x $i =$total"
        i=`expr $i + 1`
        var=$(( var+total ))
done

echo "Total of the multiplication table: $var"
echo
read -p "enter the number you want to add: " no

echo "sum: $(( var+no ))"
