FROM debian:trixie-slim

SHELL ["/bin/bash", "-c"]

ENV BASH_ENV ~/.bashrc
ENV VOLTA_HOME /root/.
ENV PATH $VOLTA_HOME/bin:$PATH


RUN apt update

RUN apt install -y \
    curl \
    ca-certificates \
    cmake \
    libssl-dev \
    pkg-config \
    libwebkit2gtk-4.0-dev \
    build-essential \
    file \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y

RUN curl https://get.volta.sh | bash

WORKDIR /usr/src/rivet

COPY . .

RUN volta install node

RUN yarn install

RUN yarn build

CMD yarn dev
