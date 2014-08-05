#!/bin/bash

checkVars() {
    if [[ -z "$1" ]]; then
        echo $2
        exit 1
    fi
}

checkVars "$2" "Usage: exe <FILETYPE> <LOCATION> [additional parameters]"

LOCATION=$2
REPO="https://github.com/baabelfish"

initDir() {
    git clone --depth=1 "${REPO}/template-${1}" "$LOCATION"
    cd "$LOCATION"
    rm -rf .git
    git init
    git add .
}

case "$1" in
    cpp)
        echo "Initializing C++ project in $LOCATION"

        initDir $1

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
