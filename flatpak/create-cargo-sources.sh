#!/usr/bin/env bash

set -euo pipefail

readonly VENV="flatpak-cargo-generator"
readonly CASRC="cargo-sources.json"

echo "Creating the virtualenv ${VENV}"
python3 -m venv --upgrade-deps "${VENV}"
source "${VENV}/bin/activate"
pip install aiohttp toml

echo "Downloading flatpak-cargo-generator.py"
curl -L https://github.com/flatpak/flatpak-builder-tools/raw/master/cargo/flatpak-cargo-generator.py > "${VENV}/bin/flatpak-cargo-generator.py"
chmod +x "${VENV}/bin/flatpak-cargo-generator.py"

echo "Creating ${CASRC}"
flatpak-cargo-generator.py ../Cargo.lock -o "${CASRC}"
deactivate

echo "Removing ${VENV}"
rm -rf -- "${VENV}"
