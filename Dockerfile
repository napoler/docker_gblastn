FROM nvidia/cuda:10.1-cudnn8-devel-centos7
COPY . /input
WORKDIR /input
RUN yum install -y \
    which make gcc gcc-c++ zlib-devel wget && \
    rm -rf /var/cache/yum/*

RUN tar -zxvf /input/gpu-blast-1.1_ncbi-blast-2.2.28.tar.gz && rm /input/gpu-blast-1.1_ncbi-blast-2.2.28.tar.gz && sh /input/install.sh

ENV PATH /usr/local/cuda/bin/:$PATH
ENV PATH /ncbi-blast-2.2.28+-src/c++/GCC485-ReleaseMT64/bin/:$PATH
WORKDIR /input
# /ncbi-blast-2.2.28+-src/c++/GCC485-ReleaseMT64/bin/blastp
CMD ["bash"]

