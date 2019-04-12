#!/bin/bash -
#title          :mkpy.sh
#description    :Add default header to python script
#author         :CEMAC - Helen
#date           :20190412
#version        :1.0
#usage          :./mkpy.sh
#notes          :
#bash_version   :4.2.46(2)-release
#============================================================================



today=$(date +%Y%m%d)
div=======================================

/usr/bin/clear

_select_title(){

    # Get the user input.
    printf "Enter a title: " ; read -r title

    # Remove the spaces from the title if necessary.
    title=${title// /_}

    # Convert uppercase to lowercase.
    title=${title,,}

    # Add .py to the end of the title if it is not there already.
    [ "${title: -3}" != '.py' ] && title=${title}.py

    # Check to see if the file exists already.
    if [ -e $title ] ; then
        printf "\n%s\n%s\n\n" "The script \"$title\" already exists." \
        "Please select another title."
        _select_title
    fi

}

_select_title

printf "Enter a description: " ; read -r dscrpt
printf "Enter your name: " ; read -r name
printf "Enter the version number: " ; read -r vnum
printf "Enter a platform information: " ; read -r plfm
printf "Enter corresponding repo name: " ; read -r repo


# Format the output and write it to a file.
printf "%-16s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%s\n\n\n" '#!/usr/bin/env python' '# -*- coding: utf-8 -*-' "\"\"\" "$title" '.. module:: ' "$title"  \
":${dscrpt}" '..author' ":CEMAC - $name" '..date' ":$today" '..version' \
":$vnum" '..usage' ":./$title" '..notes' ':' '..python_version' \
":\$({(python --version)})" \#$div${div} > $title

# Make the file executable.
chmod +x $title

/usr/bin/clear
