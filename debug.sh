#!/usr/bin/env bash

# To run your autograder image locally, you will currently need to bypass our autograder harness
# because otherwise it will try to communicate with Gradescope by default. You can do this by mounting a
# sample submission into the /autograder/submission directory and then running /autograder/run_autograder directly.
SUBMISSION_DIR="/Users/droxey/dev/repos/ACS/tutorials/tweet-generator-runthru/Code"
IMAGE_NAME="autograder-tweet-generator:latest"
START_SCRIPT="bash -c /autograder/source/run_autograder && cat /autograder/results/results.json"

docker run --rm -v $SUBMISSION_DIR:/autograder/submission $IMAGE_NAME $START_SCRIPT

# Uncomment to test the autograder in interactive mode:
# docker run --rm -it -v $SUBMISSION_DIR:/autograder/submission $IMAGE_NAME bash
