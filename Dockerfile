FROM ubuntu:latest

LABEL version="1.0"
LABEL maintainer="dawnkuo.us@gmail.com"

RUN apt-get update -y
RUN apt-get install -y curl \
      python \
      git
RUN mkdir ~/bin
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
RUN chmod a+x ~/bin/repo
RUN mkdir ~/android
WORKDIR /root/android
ENV PATH="/root/bin:${PATH}"
RUN git config --global user.name "danwkuo"
RUN git config --global user.email "dawnkuo.us@gmail.com"
RUN repo init --depth 1 -u https://android.googlesource.com/platform/manifest
RUN repo sync -c --no-tags -j4
