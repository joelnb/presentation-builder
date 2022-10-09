#!/bin/bash

set -e

USER_GID="$(stat -c '%g' /app/input/slides.md)"
USER_UID="$(stat -c '%u' /app/input/slides.md)"

groupadd -g "$USER_GID" user

useradd --shell /bin/bash -u "$USER_UID" -g "$USER_GID" -m user

function build {
    sudo -u user rsync -a /app/input/res/ /app/output/res/
    sudo -u user pandoc -V history=true -t revealjs -V revealjs-url=https://revealjs.com --self-contained -s /app/input/slides.md -o /app/output/index.html
}

build

pushd /app/output/
exec python3 -m http.server 80
