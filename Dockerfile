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
RUN repo init -u https://android.googlesource.com/platform/manifest -b android-10.0.0_r14
RUN repo sync
