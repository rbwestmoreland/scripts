#!/bin/sh

# Register an AWS ECR repository with Docker.

echo ----------------------------------------
echo Verifying Docker Installation...
echo ----------------------------------------
#todo

echo ----------------------------------------
echo Verifying AWS CLI Installation...
echo ----------------------------------------
#todo

echo ----------------------------------------
echo Installing AWS ECR Registry...
echo ----------------------------------------
read -p "AWS ECR Region: " AWS_ECR_REGION
aws ecr get-login --no-include-email --region $AWS_ECR_REGION | sh

echo ----------------------------------------
echo Complete!
echo ----------------------------------------