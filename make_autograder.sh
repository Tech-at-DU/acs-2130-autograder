#!/usr/bin/env bash

zip -r autograder.zip Dockerfile .dockerignore deploy_key setup.sh run_autograder run_tests.py requirements_autograder.txt ssh_config tests/*.py
