#!/bin/bash

checkVars() {
    if [[ -z "$1" ]]; then
        echo $2
        exit 1
    fi
}

checkVars "$2" "Usage: exe <FILETYPE> <LOCATION> [additional parameters]"

SCRIPT="scripts/${1}.sh"

if [[ ! -e $SCRIPT ]]; then
    echo "No such file"
    exit 2
else
    ./$SCRIPT $*
fi
