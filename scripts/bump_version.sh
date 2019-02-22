#!/bin/bash

# ACS
GIT_ACS_VERSION=$1
GIT_ACS_VERSION_BITS=(${GIT_ACS_VERSION//./ })

# UI
GIT_UI_VERSION=$2
GIT_UI_VERSION_BITS=(${GIT_UI_VERSION//./ })

# Server
GIT_SERVER_VERSION=$3
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
