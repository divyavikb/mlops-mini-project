#!/bin/bash
# Update the package list
sudo apt-get update -y
sudo systemctl start docker
sudo systemctl enable docker
# Authenticate Docker to the AWS ECR registry

export DAGSHUB_PAT=addfe4700403f70eb2e2bc0e6cb76d67a67606e6
aws ecr get-login-password --region ap-southeast-2 | \
sudo docker login --username AWS \
--password-stdin 908928711788.dkr.ecr.ap-southeast-2.amazonaws.com


# Pull the latest Docker image from your ECR repository
sudo docker pull 908928711788.dkr.ecr.ap-southeast-2.amazonaws.com/divyavik_ecr:vupdated
#Stop the old container (if any) 
sudo docker stop divyavik_ecr || true 
sudo docker rm divyavik_ecr || true

docker run -d -p 8888:5000 --name my-app16 -e DAGSHUB_PAT=addfe4700403f70eb2e2bc0e6cb76d67a67606e6  908928711788.dkr.ecr.ap-southeast-2.amazonaws.com/divyavik_ecr:vupdated