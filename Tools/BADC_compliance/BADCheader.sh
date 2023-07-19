#!/bin/bash

# Header CSV file 
source_file="BADCheader.csv"

# Data folder with CSV files
destination_folder="test_folder"

# Temporary file to store modified contents
temp_file="temp.csv"

# Loop through each data file in the folder
for destination_file in "$destination_folder"/*.csv; do
    # Get the data file name
    destination_filename=$(basename "$destination_file")

    # Copy the data file to a temporary file
    cp "$destination_file" "$temp_file"

    # Our headerfile contains additional end_data line or may contain example data, extract just the header
    # Here our example contains 17 lines of BADC header information
    # Extract the first 17 rows from the source file and overwrite the temporary file
    head -n 17 "$source_file" > "$temp_file"

    # your title might vary with each file so here I'm assumed your file name can be used as a title
    # Replace the second row, third column with the data file name
    awk -v var="${destination_filename},,,,,,," 'NR == 2 { $3 = var } 1' "$temp_file" > "$temp_file.tmp" && mv "$temp_file.tmp" "$temp_file"

    # Replace the first row in the data with the header informaiton
    tail -n +2 "$destination_file" >> "$temp_file"


    # Add an extra row and column with "end data" to the modified CSV file
    echo "end data" >> "$temp_file"


    # Overwrite the original data file with the updated contents
    mv "$temp_file" "$destination_file"

    echo "Header added for file: $destination_file"
done

echo "All BADC headers added successfully."
