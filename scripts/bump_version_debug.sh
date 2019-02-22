#!/bin/bash

# ACS
GIT_ACS_VERSION=$1
echo "ACS version: ${GIT_ACS_VERSION}"
echo "ACS version length: ${#GIT_ACS_VERSION}"

GIT_ACS_VERSION=$(echo ${GIT_ACS_VERSION} | xargs)
echo "ACS version trimmed: ${GIT_ACS_VERSION}"
echo "ACS version trimmed length: ${#GIT_ACS_VERSION}"

GIT_ACS_VERSION_BITS=(${GIT_ACS_VERSION//./ })
echo "ACS version bit length: ${#GIT_ACS_VERSION_BITS}"

# UI
GIT_UI_VERSION=$2
echo "UI version: ${GIT_UI_VERSION}"
echo "UI version length: ${#GIT_UI_VERSION}"
GIT_UI_VERSION_BITS=(${GIT_UI_VERSION//./ })

# Server
GIT_SERVER_VERSION=$3
echo "SERVER version: ${GIT_SERVER_VERSION}"
echo "SERVER version length: ${#GIT_SERVER_VERSION}"
GIT_SERVER_VERSION_BITS=(${GIT_SERVER_VERSION//./ })

# Make array of patches
PATCHES=(${GIT_ACS_VERSION_BITS[2]} ${GIT_UI_VERSION_BITS[2]} ${GIT_SERVER_VERSION_BITS[2]})

# Default patch to UI (UI generally has the most commits)
PATCH=${PATCHES[2]}

# Find the max patch
for n in "${PATCHES[@]}" ; do
  ((n > PATCH)) && PATCH=$n
done

# Bump the max patch by 1
PATCH=$(( ${PATCH} + 1 ))

# Create new version
NEW_VERSION="${GIT_UI_VERSION_BITS[0]}.${GIT_UI_VERSION_BITS[1]}.${PATCH}"

# Trim whitespace
NEW_VERSION=$(echo ${NEW_VERSION} | xargs)

# Echo result to be captured by caller
echo "${NEW_VERSION}"

echo "NEW_VERSION: ${NEW_VERSION}"
echo "NEW_VERSION length: ${#NEW_VERSION}"