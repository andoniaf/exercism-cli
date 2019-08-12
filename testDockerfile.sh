#!/usr/bin/env sh
echo "Lintering..."
# Ignored: https://github.com/hadolint/hadolint/wiki/DL3018
docker run --rm -i hadolint/hadolint hadolint --ignore DL3018 - < Dockerfile && echo "Lintering OK"
echo "Structure tests"
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD/structure-tests:/tmp/tests" gcr.io/gcp-runtimes/container-structure-test test --image "$1" --config /tmp/tests/structure-tests.yml
