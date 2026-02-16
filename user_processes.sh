#!/bin/bash

while true
do
	read -p "How to sort output? 1) cpu; 2) memory. Type the number: " choice
	if [ "$choice" == 1 ] || [ "$choice" == 2 ]
	then
		break
	else
		echo "Wrong input! Try again"
	fi
done

if [ "$choice" == 1 ]
then
	option="-%cpu"
elif [ "$choice" == 2 ]
then
	option="-%mem"
fi

while true
do
	read -p "How many processes to print? Enter the number: " amount
	if [[ "$amount" =~ ^[1-9]+[0-9]*$ ]]
	then
		break
	else
		echo "Wrong input! Try again"
	fi
done
ps aux --sort "$option" | grep ^$USER | head -n "$amount"
