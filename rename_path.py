#!/bin/env/python
"""Recursively rename files and directories

Usage
-----

python rename_path.py 's/Shape-Out2/CytoPlot/g' ./path
"""
import pathlib
import sys


if __name__ == '__main__':
    replstr = sys.argv[-2]
    path = pathlib.Path(sys.argv[-1])

    if not path.is_dir():
        raise ValueError(f"Please specify a directory, got {path}")

    if (not replstr.startswith("s/")
        or not replstr.endswith("/g")
            or not replstr.count("/") == 3):
        raise ValueError("Please specify the replacement string like so: "
                         f"'s/original/replacement/g', got '{replstr}'")

    paths = sorted(path.rglob("*"), reverse=True)

    s, old, new, g = replstr.split("/")
    assert s == "s"
    assert g == "g"

    # first rename all the files
    for pp in paths:
        if pp.is_file():
            pp.rename(pp.with_name(pp.name.replace(old, new)))

    # then rename all the directories
    for pp in paths:
        if pp.is_dir():
            pp.rename(pp.with_name(pp.name.replace(old, new)))
