#!/usr/bin/env sh

set -euo pipefail

function usage {
    echo "Usage: $0 -b <bucket>"; exit 1;
}

while getopts "b:" opt; do
    case $opt in
        b)
            TERRAFORM_BACKEND_S3_BUCKET_NAME=$OPTARG
        ;;
    esac
done

if [[ -z "${TERRAFORM_BACKEND_S3_BUCKET_NAME}" ]]; then
    usage
fi

aws s3 rb "s3://${TERRAFORM_BACKEND_S3_BUCKET_NAME}" --force
