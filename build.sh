#!/bin/bash

set -eux
set -o pipefail

DIR=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
cd "$DIR"

NAME=simple-ping

docker build -t "$NAME" .
docker run --rm -it --name "$NAME"_app "$NAME"
