#!/bin/bash
set -e
set -x

# set default release to 1.1.1.1
RELEASE_VERSION="${RELEASE_VERSION:-1.1.1.1}"
if [[ "$RELEASE_VERSION" =~ "main" ]]; then
  $RELEASE_VERSION="1.1.1.1"
fi

# override version
python write_version.py $RELEASE_VERSION ./project/cytoplot/_version.py
sed -i "s/dynamic = \[\x22version\x22\]/version=\x22${RELEASE_VERSION}\x22/" ./project/pyproject.toml
sed -i "s/\[build-system\]/\[no-build-system]/" ./project/pyproject.toml

# install package
python3 -m pip install ./project
