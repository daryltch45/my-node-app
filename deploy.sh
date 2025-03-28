#!/bin/bash

echo "Starting server..."

# Login to AWS ECR
aws ecr get-login-password --region us-east-1 | \
docker login --username AWS --password-stdin 464858727517.dkr.ecr.us-east-1.amazonaws.com

# Build Docker image
docker build --platform=linux/amd64 -t my-node-app .

# Tag the image
docker tag my-node-app:latest 464858727517.dkr.ecr.us-east-1.amazonaws.com/my-node-app:latest

# Push the image to ECR
docker push 464858727517.dkr.ecr.us-east-1.amazonaws.com/my-node-app:latest

echo "Image updated!"

