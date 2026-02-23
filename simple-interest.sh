#!/usr/bin/env bash
# Simple Interest Calculator
# Formula: SI = (Principal * Rate * Time) / 100

read -p "Enter Principal amount: " principal
read -p "Enter Rate of Interest (% per year): " rate
read -p "Enter Time period (years): " time

# Validate numeric input
if ! [[ $principal =~ ^[0-9]+([.][0-9]+)?$ && \
        $rate =~ ^[0-9]+([.][0-9]+)?$ && \
        $time =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Please enter valid numeric values."
    exit 1
fi

interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

echo "Simple Interest = $interest"
echo "Total Amount = $(echo "scale=2; $principal + $interest" | bc)"
