#!/bin/bash
echo "Enter Array Limit"
read limit
echo "Enter Elements"
n=0
while [ $limit -ne 0 ]
do
        read ar[$n]
        n=$(( n+1 ))
        limit=$(( limit-1 ))
done
count=$n
echo "Enter the Key Element"
read key

flag=0
for (( i=0; i < $count ; i++ ))
do
        if (( $key == ${ar[$i]} ))
        then
                flag=1
                break
        fi
done

if (( $flag == 1 ))
then
        echo "Successfull Search"
else
        echo "Unsuccessfull Search"
fi
