#!/bin/bash

# Start SSH daemon
/usr/sbin/sshd -D &

# Start Jupyter Lab
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root
