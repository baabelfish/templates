#!/bin/bash

checkVars() {
    if [[ -z "$1" ]]; then
        echo $2
        exit 1
    fi
}

checkVars "$2" "Usage: exe <FILETYPE> <LOCATION> [additional parameters]"

LOCATION=$2
REPO="https://github.com/baabelfish/"

case "$1" in
    cpp)
        echo "Initializing C++ project to $LOCATION"
        rm -rf "$LOCATION" # FIXME REMOVE
        git clone --depth=1 "$REPO/template-cpp" "$LOCATION"
        cd "$LOCATION"
        rm -rf .git
        git init

        mkdir lib
        cd lib
        git submodule add "$REPO/ytest"

        cd ..
        cmake . && make
        ./ytest
        ;;
    *)
        echo "No such filetype"
        exit 2
        ;;
esac
