![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/k3jph/torch-diffeq)
![Docker Pulls](https://img.shields.io/docker/pulls/k3jph/torch-diffeq)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/k3jph/torch-diffeq?sort=semver)
[![DOI](https://zenodo.org/badge/367334926.svg)](https://zenodo.org/badge/latestdoi/367334926)

# TorchCDE Dockerfile

[Docker](http://docker.com) container to use [TorchCDE](https://github.com/patrick-kidger/torchcde).

## Usage

### Install

Pull `k3jph/torch-diffeq` from the Docker repository:

    docker pull k3jph/torch-diffeq

Or build `k3jph/torch-diffeq` from source:

    git clone https://github.com/k3jph/torch-diffeq.git
    docker build -t k3jph/torch-diffeq .

## Services

This is for [Open Science Grid's Singularity](https://support.opensciencegrid.org/support/solutions/articles/12000024676-docker-and-singularity-containers) containers, so no services
are provided.


## Volumes

Volume          | Description
----------------|-------------
`/srv`          | The location of the application root
`/cvmfs`        | The OSG's CVMFS storage system
