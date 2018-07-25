#
# Python Dockerfile
#
# https://github.com/dockerfile/python
#

# Pull base image.
FROM ubuntu:16.04

# Install Python.
RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data
COPY requirements.txt /data/requirements.txt
RUN pip install -r /data/requirements.txt

COPY test.py /data/test.py
# Define default command.
CMD ["python","/data/test.py","p", "g", "k"]
