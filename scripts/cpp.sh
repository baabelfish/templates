#!/bin/bash
LOCATION=$2
REPO="https://github.com/baabelfish/"

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
