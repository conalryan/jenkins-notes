#!/bin/bash

BRANCH=$(git branch | sed -n '/\* /s///p')

echo ${BRANCH}