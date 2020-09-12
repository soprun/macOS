#!/bin/sh

# Shared functions for deploying solutions

# Get the absolute path to a file
# Arguments:
#   $1 - relative path to convert
# Returns:
#   Absolute path of file
function abspath() {
    if [ -d "$1" ]; then
        # dir
        (cd "$1"; pwd)
    elif [ -f "$1" ]; then
        # file
        if [[ $1 = /* ]]; then
            echo "$1"
        elif [[ $1 == */* ]]; then
            echo "$(cd "${1%/*}"; pwd)/${1##*/}"
        else
            echo "$(pwd)/$1"
        fi
    fi
}

PROJECT_DIR=$(dirname $(abspath $0))
UTIL_DIR=$(dirname $(abspath $BASH_SOURCE))
ROOT_DIR=$(dirname $UTIL_DIR)

if ! [ -x "$(command -v gcloud)" ]; then
    echo 'Error: gcloud is not installed.' >&2
    exit 1
fi

if ! [ -x "$(command -v python3)" ]; then
    echo 'Error: Python not available.' >&2
    exit 1
fi

PROJECT_ID="$1"
cd $PROJECT_DIR

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Must include a project ID to create"
fi

gcloud projects create "${PROJECT_ID}"
gcloud --project="${PROJECT_ID}" services enable \
    drive.googleapis.com

echo "Go to https://console.developers.google.com/apis/credentials?organizationId=0&project=${PROJECT_ID}"
echo "to create credentials."

for dir in */; do
    if [ -f "$dir/deploy.sh" ]; then
        "$dir/deploy.sh"
    fi
done
