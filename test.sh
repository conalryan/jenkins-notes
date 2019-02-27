#!/bin/sh

REGEXP_RELEASE="release\/"

SET_FROM_TEST_SH="Hello"
echo $SET_FROM_TEST_SH

echo $1

if [ $1 = "UI" ]; then
  UI_BRANCH_NAME="$(git branch | sed -n '/\* /s///p')"
  echo ${UI_BRANCH_NAME}
else
  SERVER_BRANCH_NAME="$(git branch | sed -n '/\* /s///p')"
  echo ${SERVER_BRANCH_NAME}
fi