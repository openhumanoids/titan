#!/usr/bin/env python
from __future__ import print_function
import os

if __name__ == '__main__':
    cmd = """\
    docker build -t titan-dependencies -f titan.dockerfile . \
    """
    os.system(cmd)

