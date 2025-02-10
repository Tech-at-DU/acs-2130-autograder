# ---------------------------------------------------------------------------- #
# debug.sh
# Use this to run the Gradescope autograder locally.
# ---------------------------------------------------------------------------- #
#!/usr/bin/env bash

# To run your autograder image locally, you will currently need to bypass our autograder harness
# because otherwise it will try to communicate with Gradescope by default. You can do this by mounting a
# sample submission into the /autograder/submission directory and then running /autograder/run_autograder directly.
SUBMISSION_DIR="source"
IMAGE_NAME="droxey/autograder-acs-2130:latest"
START_SCRIPT="bash -c /autograder/source/run_autograder && cat /autograder/results/results.json"

docker build . -t $IMAGE_NAME
docker run --rm -v $SUBMISSION_DIR:/autograder/submission $IMAGE_NAME $START_SCRIPT

# Uncomment to test the autograder in interactive mode:
# docker run --rm -it -v $SUBMISSION_DIR:/autograder/submission $IMAGE_NAME bash
