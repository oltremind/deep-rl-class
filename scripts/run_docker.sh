#!/bin/bash
REPO_ROOT=$(pwd)
docker run  --gpus all \
  --pids-limit=-1 \
  -e TZ=Asia/Seoul \
  -v ${REPO_ROOT}:/workspace \
  -v /etc/localtime:/etc/localtime:ro \
  -v /etc/timezone:/etc/timezone:ro \
  -itd \
  --name "ai" \
  ai:core
