FROM ubuntu:20.10

ENV PATH /opt/conda/bin:$PATH

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -qqy update --fix-missing && \
    apt-get -qqy dist-upgrade && \
    apt-get -qqy install --no-install-recommends \
				 wget curl git bzip2 ca-certificates procps zlib1g-dev \
    			 make build-essential cmake libncurses-dev ncurses-dev g++ gcc \
    			 nfs-common pigz bedtools gawk fuse mdadm time \
    			 libbz2-dev lzma-dev liblzma-dev libglib2.0-0 libxext6 libsm6 libxrender1 \
    			 syslog-ng libssl-dev libtool autoconf automake \
    			 libcurl4-openssl-dev libffi-dev libblas-dev liblapack-dev \
    			 libatlas-base-dev

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda2-4.5.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

RUN conda update conda \
	&& conda create -n cnvpytor-env -c bioconda python=3.6 cnvpytor \
	&& echo "conda activate cnvpytor-env" >> ~/.bashrc

ENV PATH /opt/conda/envs/cnvpytor-env/bin:$PATH
