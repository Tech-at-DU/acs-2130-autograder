# You can change these variables to use a different base image, but
# you must ensure that your base image inherits from one of ours.
# You can also override these at build time with --build-arg flags
ARG BASE_REPO=gradescope/auto-builds
ARG TAG=latest

FROM ${BASE_REPO}:${TAG}

# Create directory structure:
RUN mkdir -p /autograder/source && mkdir /autograder/results

# Copy codebase:
ADD . /autograder/source

# Install dependencies:
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create .ssh directory and copy config files.
# ssh-keyscan prevent host key verification errors at runtime:
RUN mkdir -p /root/.ssh && \
    cp /autograder/source/ssh_config /root/.ssh/config && \
    cp /autograder/source/deploy_key /root/.ssh/deploy_key && \
    ssh-keyscan -t rsa github.com >>~/.ssh/known_hosts

# Install the requirements from this repository:
RUN pip3 install -r /autograder/source/requirements.txt

# NOTE: The base image defines the CMD and ENTRYPOINT,
# so don't redefine those at the end of the Dockerfile!
