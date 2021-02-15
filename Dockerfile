FROM python:3
ENV PYTHONUNBUFFERED=1
COPY . /src
WORKDIR /src
RUN apt-get update && apt-get install -y \ 
    build-essential \ 
    cmake
RUN mkdir build && \ 
    cd build && \
    cmake -D CMAKE_INSTALL_PREFIX=/opencv .. && \
    make -j4 && \
    make install && \
    ldconfig
WORKDIR /
RUN rm -rf /src