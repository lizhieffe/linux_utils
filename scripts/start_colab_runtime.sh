#!/bin/bash

# This script starts the runtime for colab
#
# Once the runtime/server has started, it will print a message with the
# initial backend URL used for authentication. Make a copy of this URL,
# copy it in Colab "Connect to local runtime..." address field.
#
# To connect from a remote machine, set up the ssh forwarding on the
# remote machine 
# `ssh -L 8080:localhost:8080 <REMOTE_USER>@<REMOTE_HOST>`
#
# It is recommended to use conda to switch to a managed python env where
# to run the script.
#
# The script requires the env to have necessary libraries installed.
# Here is an instruction to install tf and jupyter.
#
# 1. install conda as you like
# 2. install tf in conda env: https://www.tensorflow.org/install/pip
# 3. install jupiter (step 1 + 2 only): https://research.google.com/colaboratory/local-runtimes.html
#
# You can install other necessary libraries to the env as you like.

jupyter notebook \
  --NotebookApp.allow_origin='*' \
  --NotebookApp.port_retries=0 \
  --no-browser \
  --port=8080
