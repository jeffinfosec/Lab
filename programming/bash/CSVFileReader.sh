#!/bin/bash
input="data.csv"
$IFS = ","
while read -r f1, f2, f3 
do
 echo "$f1 $f2"
done < "$input"
