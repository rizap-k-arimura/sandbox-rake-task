docker build -f ./build/Dockerfile.sample_task -t sandbox-rake-task .
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 943714519719.dkr.ecr.ap-northeast-1.amazonaws.com
docker tag sandbox-rake-task:latest 943714519719.dkr.ecr.ap-northeast-1.amazonaws.com/sandbox-rake-task:latest
docker push 943714519719.dkr.ecr.ap-northeast-1.amazonaws.com/sandbox-rake-task:latest
