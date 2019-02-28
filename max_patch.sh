#!/bin/sh

# UI
GIT_UI_VERSION=$1
GIT_UI_VERSION_BITS=(${GIT_UI_VERSION//./ })

# Server
GIT_SERVER_VERSION=$2
GIT_SERVER_VERSION_BITS=(${GIT_SERVER_VERSION//./ })

# ACS
GIT_ACS_VERSION=$3
GIT_ACS_VERSION_BITS=(${GIT_ACS_VERSION//./ })

# Make array of patches
PATCHES=(${GIT_UI_VERSION_BITS[2]} ${GIT_SERVER_VERSION_BITS[2]} ${GIT_ACS_VERSION_BITS[2]})

# Default patch
PATCH=${PATCHES[0]}

# Find the max
for n in "${PATCHES[@]}" ; do
    ((n > PATCH)) && PATCH=$n
done

#create new tag
MAX_PATCH="${GIT_UI_VERSION_BITS[0]}.${GIT_UI_VERSION_BITS[1]}.${PATCH}"

# Echo result to be captured by caller
echo "${MAX_PATCH}"
