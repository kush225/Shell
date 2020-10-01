read -p "Enter the Total numbers which you want in Array: " n
echo "Enter Numbers: "

i=0

while [ $i -lt $n ]
do
        read a[$i]
        i=$(( i+1 ))
done

echo "output: "
i=0

while [ $i -lt $n ]
do
        echo ${a[$i]}
        i=$(( i+1 ))
done
