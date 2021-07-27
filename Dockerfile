FROM sdthirlwall/raspberry-pi-cross-compiler

# Install raspbian development libraries for edgex
RUN install-raspbian --update libzmq3-dev

# Install native build-time tools
RUN install-debian --update libzmq3-dev pkg-config

# Install go
RUN curl -Ls https://golang.google.cn/dl/go1.16.6.linux-amd64.tar.gz | tar -C /usr/local -xzf -
RUN echo 'export PATH=$PATH:/usr/local/go/bin' >> /root/.bashrc

ENV PATH="${PATH}:/usr/local/go/bin"

