# If using AWS, credentials are required
# If not using AWS, this has no effect
mkdir ~/.aws
echo "[default]" >> ~/.aws/credentials
echo "aws_access_key_id=${AWS_ACCESS_KEY_ID}" >> ~/.aws/credentials
echo "aws_secret_access_key=${AWS_SECRET_ACCESS_KEY}" >> ~/.aws/credentials

/probr/cmd/probr