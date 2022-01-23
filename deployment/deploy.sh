#! /bin/bash

docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:release-candidate .
docker push $ECR_REGISTRY/$ECR_REPOSITORY:release-candidate

CURRENT_MANIFEST=$(aws ecr batch-get-image --repository-name $ECR_REPOSITORY --image-ids imageTag=current-release --query 'images[].imageManifest' --output text)
CANDIDATE_MANIFEST=$(aws ecr batch-get-image --repository-name $ECR_REPOSITORY --image-ids imageTag=release-candidate --query 'images[].imageManifest' --output text)

if [ ! -z "$CURRENT_MANIFEST" ]
then
  aws ecr put-image --repository-name $ECR_REPOSITORY --image-tag previous-release --image-manifest "$CURRENT_MANIFEST"
fi

aws ecr put-image --repository-name $ECR_REPOSITORY --image-tag current-release --image-manifest "$CANDIDATE_MANIFEST"

aws ecr batch-delete-image --repository-name $ECR_REPOSITORY --image-ids imageTag=release-candidate
