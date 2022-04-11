FROM ubuntu:20.04

ENV REVEAL_JS_VERSION=4.3.1

VOLUME /app/input
VOLUME /app/output

RUN apt-get update && \
    apt-get install -y pandoc \
        curl \
        ca-certificates \
        bash \
        inotify-tools \
        sudo \
        coreutils \
        rsync \
        python && \
    mkdir /reveal.js && \
    curl -sSL https://github.com/hakimel/reveal.js/archive/${REVEAL_JS_VERSION}.tar.gz | tar xz --strip 1 -C /reveal.js && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

ADD presenter.sh .
ADD preparer.sh .

CMD bash ./preparer.sh
