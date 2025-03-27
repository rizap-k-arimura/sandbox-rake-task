docker build --platform linux/x86_64 -f ./Dockerfile -t sandbox-rails-app .
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 943714519719.dkr.ecr.ap-northeast-1.amazonaws.com
docker tag sandbox-rails-app:latest 943714519719.dkr.ecr.ap-northeast-1.amazonaws.com/sandbox-rails-app:latest
docker push 943714519719.dkr.ecr.ap-northeast-1.amazonaws.com/sandbox-rails-app:latest
