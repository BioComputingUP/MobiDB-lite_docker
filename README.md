# MobiDB-lite Docker 
MobiDB-lite is a lightweight tool for predicting intrinsic disorder in proteins. This guide explains how to build and use the Dockerized version of [MobiDB-lite 4.0](https://github.com/BioComputingUP/MobiDB-lite)

## Building the Docker image
Before running the tool, you need to build the Docker image.

### Step 1: clone this repository
    git clone https://github.com/BioComputingUP/MobiDB-lite_docker.git
    cd MobiDB-lite_docker

### Step 2: Build the Docker image
    docker build -t mobidb-lite .
This creates a Docker image named mobidb-lite

## Pulling the Docker image from docker hub
Alternatively you can find the docker image [here](https://hub.docker.com/r/mahtamehdiabadi/mobidb-lite). 

## Running MobiDB-lite in Docker
Once the image is built, you can use it to analyze multi-fasta files. 

### Basic usage

    docker run --rm -v $PWD:/data mobidb-lite [options] [input_file] [output_file]

**Note:** It is better to use the option "--force" , so that even if any of the predictors fail, the consensus is still calculated. 

Example:

    docker run --rm -v $PWD:/data mobidb-lite --force /data/example/first10sp.fasta /data/example/output.tsv

To calculate the ensemble properties, you must specify --extra option with --format mobidb:

    docker run --rm -v $PWD:/data mobidb-lite --force --extra --format mobidb /data/example/first10sp.fasta /data/example/output.mjson
