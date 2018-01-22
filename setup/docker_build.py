#!/usr/bin/env python
from __future__ import print_function
import os

if __name__ == '__main__':
    cmd = """\
    docker build \
    -t titan-dependencies \
    -f titan.dockerfile . \
    --build-arg USER_NAME={user_name} \
    --build-arg USER_ID={user_id} \
    --build-arg USER_GID={group_id} \
    """.format(user_name=os.environ["USER"],
               user_id=os.getuid(),
               group_id=os.getgid())
    print("command:", cmd)
    os.system(cmd)

