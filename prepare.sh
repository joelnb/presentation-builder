#!/bin/bash

function openBrowser(){
    sleep 5
    xdg-open "http://localhost:3000"
}

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

INPUT_DIR="${1:-$(pwd)/input}"
OUTPUT_DIR="${2:-$(pwd)/output}"

mkdir -p "${OUTPUT_DIR}"

docker build -t presentation-builder:local "${DIR}/.builder/"

openBrowser &

docker run -it --rm -p 3000:80 -v "${INPUT_DIR}:/app/input" -v "${OUTPUT_DIR}:/app/output" presentation-builder:local ./preparer.sh
