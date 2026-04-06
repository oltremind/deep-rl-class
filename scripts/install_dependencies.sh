#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
PYTHON_BIN="${PYTHON_BIN:-python3.10}"

SUDO=""
if [ "$(id -u)" -ne 0 ] && command -v sudo >/dev/null 2>&1; then
  SUDO="sudo"
fi

${SUDO} apt-get update
${SUDO} apt-get install -y swig cmake python3-opengl ffmpeg xvfb

"${PYTHON_BIN}" -m pip install --upgrade pip
"${PYTHON_BIN}" -m pip install -r "${ROOT_DIR}/requirements.txt"
"${PYTHON_BIN}" -m pip install pyvirtualdisplay

if [ -d "${ROOT_DIR}/thirdparty/gym" ]; then
  "${PYTHON_BIN}" -m pip install -e "${ROOT_DIR}/thirdparty/gym"
fi

if [ -d "${ROOT_DIR}/thirdparty/gymnasium" ]; then
  "${PYTHON_BIN}" -m pip install -e "${ROOT_DIR}/thirdparty/gymnasium"
fi

if [ -d "${ROOT_DIR}/thirdparty/stable-baselines3" ]; then
  "${PYTHON_BIN}" -m pip install -e "${ROOT_DIR}/thirdparty/stable-baselines3"
fi

echo "Dependencies installed successfully."
