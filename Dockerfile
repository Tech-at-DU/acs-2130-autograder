# Create a base layer so the builds go quickly:
FROM gradescope/auto-builds:latest

RUN mkdir -p /root/.ssh && mkdir -p /autograder/results

# Install dependencies:
RUN apt-get install -y --no-install-recommends git python3 python3-pip python3-dev

# Add autograder codebase:
ADD . /autograder

# Add code files (and anything else that requires a build) to the second layer:
# FROM ${BASE_REPO}:${TAG} as AUTOGRADER_FILES

# Copy directory structure and python from base image:
# COPY --from=AUTOGRADER_BASE /autograder /autograder
# COPY --from=AUTOGRADER_BASE /root/.local /root/.local


# Make sure scripts in .local are usable:
# ENV PATH=/root/.local/bin:$PATH

# NOTE: The base image defines the CMD and ENTRYPOINT,
# so don't redefine those at the end of the Dockerfile!
