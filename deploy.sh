#!/bin/bash
# Tag, push to ECR, and deploy

ACCOUNT_ID=<your-account-id>
REGION=<your-region>
REPO=monitoring-app

docker build -t $REPO .
docker tag $REPO:latest $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO:latest
docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO:latest

kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml