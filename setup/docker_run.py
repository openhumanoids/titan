#!/usr/bin/env python
from __future__ import print_function
import os

if __name__ == '__main__':
    cmd = """\
    docker run \
      --name titan \
      -v {source_dir}:/titan \
      -it \
      --rm \
      titan-dependencies
    """.format(source_dir=os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
    os.system(cmd)
