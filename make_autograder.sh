# ---------------------------------------------------------------------------- #
# make_autograder.sh
# Creates a zip file containing everything you need to upload on Gradescope.
# ---------------------------------------------------------------------------- #
#!/usr/bin/env bash

# Back up and timestamp the build:
cp autograder.zip autograder-$(date +%F_%H-%M-%S).zip

# Zip up everything required to submit the autograder on Gradescope:
cd source
cp ../.dockerignore . && cp ../Dockerfile .
zip -r -D ../autograder.zip .
rm .dockerignore && rm Dockerfile
