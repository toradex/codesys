FROM bshibley/ubuntu-xorg:bionic

RUN apt-get -y update && apt-get install -y --no-install-recommends \
    lxqt-core \
    qterminal \
    qps \
    featherpad \
    openbox \
    falkon \
    && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/*
