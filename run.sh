IP=$(curl ifconfig.me)
KEY=awskey

python3 stack.py  > stack.json

aws cloudformation update-stack \
--stack-name teststack \
--template-body file://./stack.json \
--parameters ParameterKey=KeyName,ParameterValue=$KEY ParameterKey=SSHLocation,ParameterValue=$IP/32 \
--capabilities CAPABILITY_IAM