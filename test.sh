#!/bin/sh

REGEXP_RELEASE="release\/"

SET_FROM_TEST_SH = "Hello"

$1_BRANCH_NAME=$(git branch | sed -n '/\* /s///p')

echo $1_BRANCH_NAME