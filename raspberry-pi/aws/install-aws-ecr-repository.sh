#!/bin/sh

# Register an AWS ECR repository with Docker.

command_exists() {
	command -v "$@" > /dev/null 2>&1
}

echo ----------------------------------------
echo Verifying Docker Installation...
echo ----------------------------------------
if ! command_exists docker; then
    echo 'Docker not yet installed.'
    echo 'Please install Docker before running this script.'
fi

echo ----------------------------------------
echo Verifying AWS CLI Installation...
echo ----------------------------------------
if ! command_exists aws; then
    echo 'AWS CLI not yet installed.'
    echo 'Please install AWS CLI before running this script.'
fi

echo ----------------------------------------
echo Installing AWS ECR Registry...
echo ----------------------------------------
read -p "AWS ECR Region: " AWS_ECR_REGION
aws ecr get-login --no-include-email --region $AWS_ECR_REGION | sh

echo ----------------------------------------
echo Complete!
echo ----------------------------------------