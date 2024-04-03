#!/bin/sh

# change to directory with source code, if set to something not github.workspace
if [ -z "$INPUT_WORKDIR" ]; then
  echo "No source directory provided, using current directory"
else
  cd "$INPUT_WORKDIR" || exit 2
fi

# sort out input formats
case "$INPUT_FORMAT" in
  "json")
    FILE_EXT="json"
    ;;
  "markdown")
    FILE_EXT="md"
    ;;
  "yaml")
    FILE_EXT="yaml"
    ;;
  *)
    echo "Invalid format provided, using default markdown"
    INPUT_FORMAT="markdown"
    FILE_EXT="md"
    ;;
esac

# generate report
find . -type f -not -path '*/\.git/*' | while read -r file; do
     echo "Processing $file"
     bincapz --format="$INPUT_FORMAT" "$file" >> bincapz-report."$FILE_EXT"
done
