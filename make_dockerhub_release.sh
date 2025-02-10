# ---------------------------------------------------------------------------- #
# make_dockerhub_release.sh
# Build, tag, and upload the autograder on Docker Hub.
# ---------------------------------------------------------------------------- #
#!/usr/bin/env bash

docker build . -t droxey/autograder-acs-2130
docker push droxey/autograder-acs-2130:latest
