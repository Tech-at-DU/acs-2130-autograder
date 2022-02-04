# ---------------------------------------------------------------------------- #
# make_dockerhub_release.sh
# Build, tag, and upload the autograder on Docker Hub.
# ---------------------------------------------------------------------------- #
#!/usr/bin/env bash

docker build . -t droxey/autograder-tweet-generator
docker push droxey/autograder-tweet-generator:latest


