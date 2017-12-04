#!/bin/bash -xe

INPUT_PATH="$1"
VERSION="$2"
OUTPUT_PATH="${3:-.}"

PACKAGE_NAME=sovrin

# copy the sources to a temporary folder
TMP_DIR="$(mktemp -d)"
cp -r "${INPUT_PATH}/." "${TMP_DIR}"

# prepare the sources
cd "${TMP_DIR}/build-scripts/centos-7.3.1611"
./prepare-package.sh ${TMP_DIR} ${VERSION}

fpm --input-type "python" \
    --output-type "rpm" \
    --verbose \
    --python-package-name-prefix "python35u" \
    --python-bin "/usr/bin/python3.5" \
    --python-easyinstall "/usr/bin/easy_install-3.5" \
    --exclude "*.pyc" \
    --exclude "*.pyo" \
    --maintainer "Sovrin Foundation <repo@sovrin.org>" \
    --before-install "preinst" \
    --after-install "postinst" \
    --before-remove "prerm" \
    --no-python-fix-dependencies \
    --name "${PACKAGE_NAME}" \
    --package "${OUTPUT_PATH}" \
    "${TMP_DIR}"

rm -rf "${TMP_DIR}"
