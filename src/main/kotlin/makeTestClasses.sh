#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <number_of_copies>"
    exit 1
fi

# Number of copies
num_copies=$1

# Output file
output_file="TestClasses.kt"

# Kotlin class template
template='@Single
class TestClass{index} {

    fun ping{index}() {
        println("ping{index}")
    }
}'

# Create or empty the output file
> "$output_file"
echo "package com.thomask" >> "$output_file"
echo "import org.koin.core.annotation.Single" >> "$output_file"
echo "" >> "$output_file"

# Generate the classes and append to the output file
for ((i=1; i<=num_copies; i++))
do
    class_content=$(echo "$template" | sed "s/{index}/$i/g")
    echo "$class_content" >> "$output_file"
    echo "" >> "$output_file"
done

echo "Generated $num_copies classes in $output_file"
