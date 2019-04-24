#!/bin/bash -
#title          :generic_archiving.sh
#description    :Archive tool
#author         :CEMAC - Helen
#date           :20190404
#version        :0.1-beta
#usage          :./generic_archiving.sh
#notes          :
#bash_version   :4.2.46(2)-release
#============================================================================

print_usage() {
  echo "
 generic_archiving.sh

 A CEMAC script to create folder and move to
 Usage:
  .\generic_archiving.sh <opts>

 Options:
  -d <date> YYYYMM
  -i <starting loaction>
  -o <output location>
  -b sets bulk archiving
  -n set
 "
}
# Set current and archive location defaults
in=~earmgr/CEMAC/UNRESPForecastingSystem/NAM_data/raw/
out="/ds/shared/Earth&Environment/Research/SEE/Research-1/UNRESP/UNRESPForecastingSystem/NAM_data"
year=$(date +%Y)
# find previous month
m=$(date --date="$(date +%Y%m15) -1 month" +%Y%m)
bulk=true
set_bulk() {
  bulk=true
}
# A flag for NAM processed
nam=true
set_nam() {
  nam=true
}
# Set year to out
while getopts 'd:i:o:bnh' flag; do
  case "${flag}" in
    d) date="${OPTARG}" ;;
    i) in="${OPTARG}" ;;
    o) out="${OPTARG}" ;;
    n) set_nam ;;
    b) set_bulk ;;
    h) print_usage
       exit 1 ;;
    *) print_usage
       exit 1 ;;
  esac
done

if [ "$bulk" = false ]; then
  echo "Archiving month"
  year=${m:(-5)}
  # Check and create the year folder in the archive space
  cd $out
  if [ ! -e  $year ]
  then
    mkdir $year
  fi
  cd $year
  # Check and create the year month folders in the archive space
  if [ ! -e  m$year$i ]
  then
    mkdir m$year$mm
  fi
  cd $in/
fi

if [ "$bulk" = true ]; then
  echo "Archiving current year"
  # Check and create the year folder in the archive space
  cd $out
  if [ ! -e  $year ]
  then
    mkdir $year
  fi
  cd $year
  # Check and create the year month folders in the archive space
  for i in $(seq -f "%02g" 1 12)
    do
      if [ ! -e  m$year$i ]
      then
        mkdir m$year$i
      fi
    done
  cd $in/
  if [ "$nam" = true ]; then
    for d in *$year*; do
      # extract month
      m=${d:(8):(2)}
      folder=$out/$year/m$year$m/
      if [ ! -e $folder ]
      then
        mkdir $folder
      fi
      cp -p $d* $folder
    done
  else
    for d in $year*/; do
      md=${d:(-5)}
      m=${md:(0):(2)}
      folder=$out/$year/m$year$m/$d
      if [ ! -e $folder ]
      then
        mkdir $folder
      fi
      cp -p $d* $folder
    done
  fi
  echo "data copied to " $out
  echo "run checks and delete duplicates from " $in
fi
