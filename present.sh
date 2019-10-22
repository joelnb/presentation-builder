#!/bin/bash

function openBrowser(){
    sleep 5
    xdg-open "http://localhost:3000"
}

INPUT_DIR="${1:-$(pwd)/input}"
OUTPUT_DIR="${2:-$(pwd)/output}"

mkdir -p "{OUTPUT_DIR}"

docker build -t presentation-builder:local ./.builder/

openBrowser &

docker run -it --rm -p 3000:80 -v "${INPUT_DIR}:/app/input" -v "${OUTPUT_DIR}:/app/output" presentation-builder:local ./presenter.sh
