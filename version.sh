#!/bin/sh

# Ref. to release
RELEASE=$1

# Split into array
RELEASE_BITS=(${RELEASE//./ })

# Get branch name
BRANCH_NAME=$(git branch | sed -n '/\* /s///p')

# Remove prefix release
BRANCH_VERSION=$(echo "$BRANCH_NAME" | sed "s/release\///")

# Get last tag on the branch
VERSION=$(git describe --tags --match=$RELEASE* --abbrev=0)

# Split into array
VERSION_BITS=(${VERSION//./ })

# Generate new version
if [[ ${RELEASE_BITS[0]} -ne ${VERSION_BITS[0]} ]] || [[ ${RELEASE_BITS[1]} -ne ${VERSION_BITS[1]} ]]
then
  # Can't find a tag with the Major or Minor default to release and 0
  VNUM1=${RELEASE_BITS[0]}
  VNUM2=${RELEASE_BITS[1]}
  VNUM3=0
else
  VNUM1=${VERSION_BITS[0]}
  VNUM2=${VERSION_BITS[1]}
  VNUM3=$(( ${VERSION_BITS[2]} + 1 ))
fi

#create new tag
NEW_TAG="$VNUM1.$VNUM2.$VNUM3"

# Echo result to be captured by caller
echo "${NEW_TAG}"
