#!/bin/bash -       
#title           :mkscript.sh
#description     :This script will make a header for a bash script.
#author :bgw + cemac
#date            :20190228
#version         :na    
#usage :bash mkscript.sh
#Note: adapted from active state code recipes
#bash_version    :4.1.5(1)-release
#====================================================================

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

    # Add .sh to the end of the title if it is not there already.
    [ "${title: -3}" != '.sh' ] && title=${title}.sh

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
%s\n\n\n" '#!/bin/bash -' '#title' ":$title" '#description' \
":${dscrpt}" '#author' ":CEMAC - $name" '#date' ":$today" '#version' \
":$vnum" '#usage' ":./$title" '#notes' ':' '#bash_version' \
":${BASH_VERSION}" \#$div${div} > $title

# Make the file executable.
chmod +x $title

/usr/bin/clear
