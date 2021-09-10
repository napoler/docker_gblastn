FROM nvidia/cuda:10.1-cudnn8-devel-centos7
COPY . /tmp
RUN yum install -y \
    which make gcc gcc-c++ zlib-devel wget && \
    rm -rf /var/cache/yum/*


RUN tar -zxvf /tmp/gpu-blast-1.1_ncbi-blast-2.2.28.tar.gz && rm /tmp/gpu-blast-1.1_ncbi-blast-2.2.28.tar.gz && sh /tmp/install.sh

ENV PATH /usr/local/cuda/bin/:$PATH
ENV PATH /ncbi-blast-2.2.28+-src/c++/GCC485-ReleaseMT64/bin/:$PATH
WORKDIR /input
# /ncbi-blast-2.2.28+-src/c++/GCC485-ReleaseMT64/bin/blastp
CMD ["bash"]

