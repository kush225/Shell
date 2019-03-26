#! /bin/bash

user=$(whoami)
input=/home/$user
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

# the function total_files reports a total number of files for a given directory

function total_files {
        find $1 -type f | wc -l
}

# the function total_directories reports a total number of directories
# for a given directory

function total_directories {
        find $1 -type d | wc -l
}

tar -czf $output $input 2> /dev/null

echo -n "files to be included:"

total_files $input

echo -n "Directories to be included"


total_directories $input

echo "backup of $input completed!"

echo "details about the output backup file:"

ls -l $output
