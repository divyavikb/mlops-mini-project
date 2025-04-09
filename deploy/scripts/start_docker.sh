
#!/bin/bash
# Login to AWS ECR
aws ecr get-login-password --region ap-southeast-2 | \
sudo docker login --username AWS \
--password-stdin 908928711788.dkr.ecr.ap-southeast-2.amazonaws.com

# Pull the latest image
sudo docker pull 908928711788.dkr.ecr.ap-southeast-2.amazonaws.com/divyavik_ecr:vupdated2

# Check if the container 'my-app17' is running
if [ "$(docker ps -q -f name=my-app17)" ]; then
    # Stop the running container
    docker stop my-app17
fi

# Check if the container 'my-app17' exists (stopped or running)
if [ "$(docker ps -aq -f name=my-app17)" ]; then
    # Remove the container if it exists
    docker rm my-app17
fi

# Run a new container
docker run -d -p 80:5000 -e DAGSHUB_PAT=addfe4700403f70eb2e2bc0e6cb76d67a67606e6 --name my-app17 908928711788.dkr.ecr.ap-southeast-2.amazonaws.com/divyavik_ecr:vupdated2
