#!/bin/bash

args=("$@")

ARG_ONE=${args[0]}

ARG_TWO=${args[1]}

ARG_THREE=${args[2]}

echo message from three_arg_script.sh: ${ARG_ONE} , ${ARG_TWO} , ${ARG_THREE}