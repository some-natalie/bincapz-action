#!/bin/sh

# recursive for loop for every file in every directory and subdirectory
echo "Generating report.md" > report.md
find . -type f | while read -r file; do
     echo "Processing $file"
     bincapz --format=markdown "$file" >> report.md
done