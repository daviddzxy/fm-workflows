#!/bin/bash

cd ..
# Get yang schema git submodule
echo -e "Pulling submodules..."
if [[ ! -d '.git' ]]; then
  git clone https://github.com/FRINXio/yang-schemas.git
else
  git submodule update --init yang-schemas
fi

echo -e "Copying specific pulled schemas into schema folder..."
cp -r yang-schemas/cisco-iosxr-653 sample-topology/schemas
cp -r yang-schemas/cisco-iosxr-663 sample-topology/schemas
cp -r yang-schemas/junos-16-2021 sample-topology/schemas

# After all schemas are copied to sample-topology/schemas then build image
docker build sample-topology/ -t frinx/sample-topology:latest