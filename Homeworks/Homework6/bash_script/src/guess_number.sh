#!/bin/bash

target=$((RANDOM % 100 + 1))
attempts=0
max_attempts=5

echo "Вгадайте число від 1 до 100. У вас є $max_attempts спроб."

while (( attempts < max_attempts )); do
    read -p "Ваша спроба: " guess
    (( attempts++ ))

    if (( guess == target )); then
        echo "Вітаємо! Ви вгадали правильне число $target!"
        exit 0
    elif (( guess < target )); then
        echo "Занадто низько"
    else
        echo "Занадто високо"
    fi
done

echo "Вибачте, у вас закінчилися спроби. Правильним числом було $target."
