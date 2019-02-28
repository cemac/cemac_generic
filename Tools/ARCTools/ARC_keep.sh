#!/bin/bash

print_usage() {
  echo "
 ARC_keep.sh
 A script to prevent no backup files in folder from being deleted
 Edits access time not modified time to preserve timestamps
 Usage:
  .\ARC_keep.sh <opts>
 Options:
  -d <directory> directory
 "
}

while getopts 'd:h' flag; do
  case "${flag}" in
    d) folder="${OPTARG}" ;;
    h) print_usage
       exit 1 ;;
    *) print_usage
       exit 1 ;;
  esac
done

/bin/find /nobackup/$USER/$folder -exec /bin/touch -ah {} \;
