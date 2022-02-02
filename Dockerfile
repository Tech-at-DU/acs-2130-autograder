# You can change these variables to use a different base image, but
# you must ensure that your base image inherits from one of ours.
# You can also override these at build time with --build-arg flags
ARG BASE_REPO=gradescope/auto-builds
ARG TAG=latest

# Create a base layer so the builds go quickly:
FROM ${BASE_REPO}:${TAG} as AUTOGRADER_BASE

# Create directory structure for autograder.
# Create .ssh directory and copy config files.
RUN mkdir -p /autograder/source && \
    mkdir /autograder/results && \
    mkdir -p /root/.ssh

# Install dependencies:
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-pip python3-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add deploy key so we can use GitHub in here if we need to.
# ssh-keyscan prevents host key verification errors at runtime:
COPY ssh_config /root/.ssh/config
COPY deploy_key /root/.ssh/deploy_key
RUN ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts

# Add only the requirements to the base image, then install them:
COPY requirements.txt /autograder/source/requirements.txt
RUN pip3 install --user -r /autograder/source/requirements.txt

# Add code files (and anything else that requires a build) to the second layer:
FROM ${BASE_REPO}:${TAG} as AUTOGRADER_FILES

# Copy directory structure and python from base image:
COPY --from=AUTOGRADER_BASE /autograder /autograder
COPY --from=AUTOGRADER_BASE /root/.local /root/.local

# Add autograder codebase:
COPY . /autograder/source

# Make sure scripts in .local are usable:
ENV PATH=/root/.local/bin:$PATH

# NOTE: The base image defines the CMD and ENTRYPOINT,
# so don't redefine those at the end of the Dockerfile!
