#!/usr/bin/env python
from __future__ import print_function
import os
import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("-e", "--entrypoint", type=str, default="", help="(optional) thing to run in container")
    args = parser.parse_args()
    if args.entrypoint and args.entrypoint != "":
        entrypoint = "--entrypoint=\"{0.entrypoint}\"".format(args)
    else:
        entrypoint = "-it"
    cmd = """\
    docker run \
      --name titan \
      -v {source_dir}:/titan \
      {entrypoint} \
      --rm \
      titan-dependencies
    """.format(source_dir=os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."), entrypoint=entrypoint)
    os.system(cmd)
