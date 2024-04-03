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
    echo "Generating JSON report"
    find . -type f -not -path '*/\.git/*' | while read -r file; do
      bincapz --format=json "$file" >> raw-report.json
    done
    jq -s 'reduce .[] as $item ({}; .Files += $item.Files)' raw-report.json > bincapz-report.json
    rm raw-report.json
    ;;
  "markdown")
    echo "Generating markdown table of results"
    find . -type f -not -path '*/\.git/*' | while read -r file; do
      bincapz --format=markdown "$file" >> bincapz-report.md
    done
    ;;
  "yaml")
    echo "Generating YAML report"
    echo "files:" > bincapz-report.yaml
    find . -type f -not -path '*/\.git/*' | while read -r file; do
      bincapz --format=yaml "$file" >> raw-report.yaml
      tr -d '\n' < raw-report.yaml | \
        sed '0,/files:/!{/files:/d}' raw-report.yaml > temp && \
        cat temp >> bincapz-report.yaml
    rm raw-report.yaml temp
    done
    ;;
  *)
    echo "Invalid format provided, using default markdown"
    INPUT_FORMAT="markdown"
    ;;
esac

# generate report
