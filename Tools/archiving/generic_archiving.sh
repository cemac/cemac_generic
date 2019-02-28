#! /bin/bash

print_usage() {
  echo "
 generic_archiving.sh

 A CEMAC script to create folder and move to
 Usage:
  .\generic_archiving.sh <opts>

 Options:
  -d <directory> directory
  -f <file> filename or pattern
 "
}

while getopts 'd:f:h' flag; do
  case "${flag}" in
    d) folder="${OPTARG}" ;;
    f) fpat="${OPTARG}" ;;
    h) print_usage
       exit 1 ;;
    *) print_usage
       exit 1 ;;
  esac
done


if [ ! -e $folder ]
then
  mkdir $folder
fi

mv $fpat $folder
