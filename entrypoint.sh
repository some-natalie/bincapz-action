#!/bin/sh

# change to directory with source code, if set to something not github.workspace
if [ -z "$WORKDIR" ]; then
  echo "No source directory provided, using current directory"
else
  cd "$WORKDIR" || exit 2
fi

# generate report
echo "Generating report.md" > report.md
find . -type f -not -path '*/\.git/*' | while read -r file; do
     echo "Processing $file"
     bincapz --format=markdown "$file" >> report.md
done
