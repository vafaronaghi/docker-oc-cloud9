#!/bin/bash
set -e

docker build -t registry.ott-consult.de/oc/cloud9:latest .
docker push registry.ott-consult.de/oc/cloud9:latest
