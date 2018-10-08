#!/usr/bin/env python3

import json
import sys

import flaskwsk
from deepaas import api

APP = api.get_app()


def main(args):
    return flaskwsk.invoke(APP, args)


if __name__ == "__main__":
    args = json.loads(sys.argv[1])
    ret = main(args)
    try:
        ret = json.dumps(ret)
    except TypeError:
        pass
    finally:
        print(ret)
