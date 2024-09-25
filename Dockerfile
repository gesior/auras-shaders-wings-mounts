FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/London

RUN apt-get update && apt-get -yq install tzdata
RUN apt-get update && apt-get -yq install git cmake build-essential libluajit-5.1-dev \
    libmysqlclient-dev libboost-system-dev libboost-iostreams-dev libboost-filesystem-dev \
	libpugixml-dev libcrypto++-dev libfmt-dev libboost-date-time-dev git cmake build-essential \
	libluajit-5.1-dev libgmp3-dev libmysqlclient-dev \
	libboost-system-dev libboost-iostreams-dev libboost-filesystem-dev libpugixml-dev libcrypto++-dev

COPY cmake /usr/src/forgottenserver/cmake/
COPY src /usr/src/forgottenserver/src/
COPY CMakeLists.txt /usr/src/forgottenserver/
WORKDIR /usr/src/forgottenserver/build
RUN cmake -DCMAKE_BUILD_TYPE=Release .. && make -j $(nproc)

ENTRYPOINT ["/bin/tfs"]
