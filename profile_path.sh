#!/bin/bash


BASE_PATH="${BASE_PATH:-${PATH}}"  # prevent path from growing larger every time this is sourced
PATH="${BASE_PATH}"  # add any additional paths here

export BASE_PATH
export PATH
