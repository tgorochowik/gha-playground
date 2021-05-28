#!/bin/bash

TAR=patches

FILE_DIR=$(dirname $1)

mkdir -p "$TAR/$FILE_DIR"

git diff $1 > "$TAR/$1"
