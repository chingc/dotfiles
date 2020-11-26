#!/bin/bash


# prevent path from growing larger every time the profile is sourced
BASE_PATH="${BASE_PATH:-${PATH}}"

# append any additional paths here
PATH="${BASE_PATH}"

export BASE_PATH
export PATH
