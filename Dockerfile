FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  autoconf \
  automake \
  autotools-dev \
  bc \
  bison \
  build-essential \
  curl \
  flex \
  gawk \
  git \
  gperf \
  libtool \
  ncurses-dev \
  cmake \
  vim \
  astyle \
  cflow \
  graphviz \
  doxygen \
  libgtest-dev

WORKDIR /usr/src/gtest
RUN cmake  CMakeLists.txt
RUN make
RUN cp *.a /usr/lib

WORKDIR /root
