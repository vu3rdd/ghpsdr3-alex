#!/bin/bash

trim() {
    local var="$*"
    var="${var#"${var%%[![:space:]]*}"}"   # remove leading whitespace characters
    var="${var%"${var##*[![:space:]]}"}"   # remove trailing whitespace characters
    echo -n "$var"
}

filename="$1"


echo "const char *firmware[] = {"

k=0
if [ -e "$filename" ]
then
while read line;do

        line=$(trim "$line")

        echo -n "\""
        echo -n $line
        echo    "\","
        ((k++))
done < $filename
fi
echo " \"\" "

echo "//Total number of lines in file: $k"
echo "};"


