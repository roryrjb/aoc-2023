#!/bin/bash

total=0

while read -r line; do
	num="$(echo $line | grep -Po "\d+" | tr -d '[[:space:]]')"
	first="${num:0:1}"
	last="${num:(-1)}"
	result="${first}${last}"
	total="$(( total + result ))"
done < input.txt

echo $total