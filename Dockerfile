FROM nvidia/cuda:11.3.0-cudnn8-devel-ubuntu20.04

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && \
    apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    curl \
    davix-dev \
    dcap-dev \
    fonts-freefont-ttf \
    g++ \
    gcc \
    gfal2 \
    gfortran \
    git \
    libafterimage-dev \
    libavahi-compat-libdnssd-dev \
    libcfitsio-dev \
    libfftw3-dev \
    libfreetype6-dev \
    libftgl-dev \
    libgfal2-dev \
    libgif-dev \
    libgl2ps-dev \
    libglew-dev \
    libglu-dev \
    libgraphviz-dev \
    libgsl-dev \
    libjemalloc-dev \
    libjpeg-dev \
    libkrb5-dev \
    libldap2-dev \
    liblz4-dev \
    liblzma-dev \
    libmysqlclient-dev \
    libpcre++-dev \
    libpng-dev \
    libpq-dev \
    libpythia8-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libtbb-dev \
    libtiff-dev \
    libx11-dev \
    libxext-dev \
    libxft-dev \
    libxml2-dev \
    libxpm-dev \
    libz-dev \
    libzmq3-dev \
    locales \
    lsb-release \
    make \
    openjdk-11-jdk \
    pkg-config \
    python3 \
    python3-dev \
    python3-markdown \
    python3-pip \
    python3-requests \
    python3-tk \
    python3-yaml \
    r-base \
    r-cran-rcpp \
    r-cran-rinside \
    rsync \
    srm-ifce-dev \
    unixodbc-dev \
    unzip \
    vim \
    wget \
    && \
    apt-get clean

# bazel is required for some TensorFlow projects
RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" >/etc/apt/sources.list.d/bazel.list && \
    curl https://bazel.build/bazel-release.pub.gpg | apt-key add -

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated \
    bazel

RUN python3 -m pip --no-cache-dir install -U pip wheel setuptools

RUN python3 -m pip --no-cache-dir install \
    fire \
    h5py \
    matplotlib \
    numpy \
    pandas \
    Pillow \
    scipy \
    sklearn \
    sklearn-pandas \
    sktime \
    tqdm

RUN python3 -m pip install -U pybind11 spdlog

# Install TensorFlow GPU version and torch
RUN python3 -m pip install --upgrade tensorflow==2.3 keras
RUN python3 -m pip install -U torch torchaudio torchvision
RUN python3 -m pip install -U torchtuples pycox
RUN python3 -m pip install -U git+https://github.com/google-research/torchsde.git
RUN python3 -m pip install -U git+https://github.com/patrick-kidger/torchcde.git
RUN python3 -m pip install -U git+https://github.com/patrick-kidger/NeuralCDE.git

RUN mkdir -p /cvmfs
