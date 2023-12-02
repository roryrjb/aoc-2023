#!/bin/bash

to_digit() {
	case $1 in
		one) echo 1 ;;
		two) echo 2 ;;
		three) echo 3 ;;
		four) echo 4 ;;
		five) echo 5 ;;
		six) echo 6 ;;
		seven) echo 7 ;;
		eight) echo 8 ;;
		nine) echo 9 ;;
		*) echo 0 ;;
	esac
}

words=(
	one two three four five six seven eight nine
)

total=0

while read -r line; do
	for w in ${words[@]}; do
		line="$(echo "$line" | sed -r "s/($w)/${w}$(to_digit "$w")${w}/g" | tr -d '[[:space:]]')"
	done

	nums="$(echo $line | grep -Po "\d+")"
	first="${nums:0:1}"
	last="${nums:(-1)}"
	result="${first}${last}"
	total="$(( total + $result ))"
done < input.txt

echo $total
