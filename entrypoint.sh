#!/bin/bash
# If using AWS, credentials are required
# If not using AWS, this has no effect
mkdir ~/.aws
echo "[default]" >> ~/.aws/credentials
echo "aws_access_key_id=${AWS_ACCESS_KEY_ID}" >> ~/.aws/credentials
echo "aws_secret_access_key=${AWS_SECRET_ACCESS_KEY}" >> ~/.aws/credentials

if [ -z "$AWS_ACCESS_KEY_ID" ]
then
      echo "\$AWS_ACCESS_KEY_ID is empty"
else
      echo "\$AWS_ACCESS_KEY_ID is NOT empty"
fi
if [ -z "$AWS_SECRET_ACCESS_KEY" ]
then
      echo "\$AWS_SECRET_ACCESS_KEY is empty"
else
      echo "\$AWS_SECRET_ACCESS_KEY is NOT empty"
fi

/probr/cmd/probr