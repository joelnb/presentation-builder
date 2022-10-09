FROM pandoc/ubuntu:2.16

VOLUME /app/input
VOLUME /app/output

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        coreutils \
        curl \
        inotify-tools \
        python3 \
        rsync \
        sudo \
    && \
    mkdir /reveal.js && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

ADD presenter.sh .
ADD preparer.sh .

ENTRYPOINT ["bash"]
CMD ["./preparer.sh"]
