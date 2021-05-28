#!/bin/bash

# dir with files - this should be configurable
DIR=hello

find "$DIR" \( -name \*c -o -name \*h \) -exec clang-format -i {} \;
find "$DIR" \( -name \*c -o -name \*h \) -exec ./gen.sh {} \;

./annotate.sh

rm patches -r
