#!/bin/bash

convert_to_number() {
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

calculate() {
	local total=0

	while read -r line; do
		for word in ${words[@]}; do
			line="$(echo "$line" | sed -r "s/($word)/${word}$(convert_to_number "$word")${word}/g" | tr -d '[[:space:]]')"
		done

		nums="$(echo $line | grep -Po "\d+")"
		first="${nums:0:1}"
		last="${nums:(-1)}"
		result="${first}${last}"
		total="$(( total + $result ))"
	done < input.txt

	echo $total
}

calculate