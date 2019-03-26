#########################

#! /bin/bash
read usr              #read an input from user and store in usr variable
echo "username $usr"    #print the usr variable
#nothing

##########################

read -p "username:" user_var
read -sp "password:" pass
echo
echo "username is $user_var"
echo "password is $pass"

echo "Enter Names:"
read -a names
echo "name: ${names[0]}, ${names[1]}"


echo "Enter Name:"
read
echo "Name: $REPLY"
#nothing

############################

#! /bin/bash

echo $0 $1 $2 $3 ' > echo $1 $2 $3'

args=("$@")

echo ${args[0]} ${args[1]} ${args[2]}

echo $@

echo $#

#############################

#! /bin/bash

echo "enter the word"
read  word
if [[ $word = "kush" ]]
then
        echo "condition is true"
elif [ $word = "ankit" ]
then
        echo "condition is true"
else
        echo "condition is not true" 
fi

##############################

#! /bin/bash

echo -e "Enter the Name of the file: \c"
read file_name

if [ -e $file_name ]
then
        echo "$file_name Found"
else
        echo "$file_name Not Found"
fi

###############################

#! /bin/bash

echo -e "Name of the file: \c"
read file_name

if [ -f $file_name ]
then
        if [ -w $file_name ]
        then
                echo "Type some text. to quit press ctrl+d"
                cat >> $file_name
        else "$file_name doesnt have write permission"
        fi
else
        echo "$file_name not exist"
fi

################################

#! /bin/bash

read age


if [ "$age" -gt 18 ] && [ "$age" -lt 30 ]
#if [ "$age" -gt 18 -a "$age" -lt 30 ]
#if [[ "$age" -gt 18 && "$age" -lt 30 ]]

then
echo "$age eligible"
else
echo "$age not eligible"
fi

################################

#! /bin/bash

echo "enter the age"
read age

if [[ $age -eq 18 || $age -gt 55 ]]
then
echo "$age is valid"
else
echo "$age is not valid"
fi

###############################

#! /bin/bash


num1=5
num2=2

echo $(( num1+num2 ))
echo $(( num1-num2 ))
echo $(( num1*num2 ))
echo $(( num1/num2 ))
echo $(( num1%num2 ))

echo $(expr $num1 + $num2 )
echo $(expr $num1 - $num2 )
echo $(expr $num1 \* $num2 )
x=`expr $num1 / $num2 `
echo $x
echo $(expr $num1 % $num2 )

################################

#! /bin/bash


num1=5.5
num2=2
num3=11
echo "$num1+$num2" | bc
echo "$num1-$num2" | bc
echo "$num1*$num2" | bc
echo "$num1/$num2" | bc
echo "$num1%$num2" | bc
echo "scale=2;sqrt($num3)" | bc
echo "scale=2;3^3" | bc -l

################################

#! /bin/bash

vehicle=$1

case $vehicle in
        "car" )
        echo "rent of the $vehicle is 100 Dollar" ;;
        "van" )
        echo "rent of the $vehicle is 80 Dollar" ;;
        "Bicycle" )
        echo "rent of the $vehicle is 5 Dollar" ;;
        "Bike" )
        echo "rent of the $vehicle is 40 Dollar" ;;
        * )
        echo "Unknown Vehicle" ;;
esac

#################################

#! /bin/bash

os=('ubuntu' 'windows' 'rhel')

echo "${os[@]}"         # printing array
echo "${os[1]}"         # printing 2nd element of array         
echo "${!os[@]}"        # printing the index of array
echo "${#os[@]}"        # printing the total element in array

#################################

#! /bin/bash

os=('ubuntu' 'windows' 'rhel')
os[3]='mac'             # adding element to array
unset os[2]             # deleting element from array
echo "${os[@]}"         # printing array
echo "${os[1]}"         # printing 1st element of array         
echo "${!os[@]}"        # printing the index of array
echo "${#os[@]}"        # printing the total element in array

string=saksdnjajnanfknfsam
echo "${string[@]}"
echo "${string[0]}"
echo "${string[1]}"
echo "${#string[@]}"

###################################

#! /bin/bash
#while loops


#while [ condition ]
#do
#       command1
#       command2
#       command3
#done

n=1

while [ $n -le 10 ] #or (( $n <= 10 ))
do
        echo "$n"

        n=$(( n+1 )) #or #(( n++ )) 
done

####################################

#! /bin/bash

#method1
while read var
do
        echo $var
done < 1.sh


#method2
cat 5.sh | while read var2
do
        echo $var2
done

#method3

while IFS=' ' read -r line
do
        echo $line
done < 7.sh

####################################

#! /bin/bash

#until loops
n=1
until (( $n > 10 ))
do
        echo $n
        n=$(( n+1 ))
done

####################################

#! /bin/bash

#for loop
echo ${BASH_VERSION}
#method1

for var in 1 2 3 4 5
do
        echo $var
done

#method2
for var in {1..10..2}   #start..end..increment
do
        echo $var
done

#method3
for (( i=0;i<5;i++ ))
do
        echo $i
done

####################################

#! /bin/bash

#for loop
echo ${BASH_VERSION}

for command in ls pwd date
do
        echo "----------------------------$command--------------------------------"
        $command
done

for item in *
do
        if [ -f $item ]
        then
                echo $item
        fi
done

###################################

#! /bin/bash

#select loop

select varName in kush ankit mark john
do
        case $varName in
        kush)
                echo kush selected
        ;;
        ankit)
                echo ankit selected
        ;;
        mark)
                echo mark selected
        ;;
        john)
                echo john selected
        ;;
        *)
                echo "Error please provide the no. between 1 to 4"
        esac
done

######################################

#! /bin/bash

#break and continue statement

for (( i=1; i<=10; i++ ))
do
        if (( $i == 6 ))
        then
        #continue 
        break
        fi
        echo $i
done

#######################################

#! /bin/bash

#function

print(){
echo $1 $2 $3
}

function quit(){        #its optional to write keyword function 
exit
}
print Hello kush 
print Hello ankit raj

echo "foo"
quit

#######################################

#! /bin/bash

#function

print(){
local name=$1
echo "the name is $name"
}

name="tom"
echo "the name is $name : before"

print Max

echo "the name is $name : after"

########################################

#! /bin/bash

#function example

usage(){
echo "you need to provide an argument : "
echo "usage : $0  file_name"
}


is_file_exist(){
        local file_name=$1
        [[ -f "$file_name" ]] && return 0 || return 1
}

[[ $# -eq 0 ]] && usage


if ( is_file_exist "$1")
then
        echo "file is found"
else
        echo "file is not found"
fi

########################################

#! /bin/bash

#function example


readonly var=31


var=50

echo "var= $var"



hello()
{
echo "hello world"
}


readonly -f hello       #for function to use readonly we have to use -f flag


hello()
{
echo "hello world sexy"
}

readonly -f     #to see all the readonly varibles use readonly -p and for function use -f

############################################

#! /bin/bash         

set -x

#Trap statement
file=/home/kushagra/Desktop/shell/empty
trap "rm -f $file && echo file deleted; exit" 0 2 9 15

set +x

echo "pid is $$"

while (( count < 10 ))
do
        sleep 10
        (( count++ ))
        echo $count
done
exit 0

############################################
