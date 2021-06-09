#!/bin/bash

for textile_filename in *.txt; do
    markdown_filename="${textile_filename%.textile}.md"
    printf "Converting %s to %s\n" $textile_filename $markdown_filename
    pandoc --from textile --to markdown $textile_filename -o $markdown_filename
done
