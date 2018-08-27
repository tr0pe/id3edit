#!/usr/bin/env bash

SOURCE=$(find . -type f ! -path './test/*' -name "*.c")
HEADER="-I."
LIBS="-lprinthex -lz"
VERSION=$(head -n1 CHANGELOG | cut -d ' ' -f 1)

for c in $SOURCE ;
do    
    echo -e "\e[1;34mCompiling $c …\e[0m"
    clang -DxDEBUG -DVERSION="\"$VERSION\"" -Wno-multichar --std=gnu99 $HEADER -O2 -g -c -o "${c%.*}.o" $c
done


OBJECTS=$(find . -type f ! -path './test/*' -name "*.o")

clang -o id3edit $OBJECTS $LIBS

# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4

