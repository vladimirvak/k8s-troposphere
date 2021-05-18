IP=$(curl ifconfig.me)

python3 vpc_and_instance.py  > stack.json

aws cloudformation create-stack \
--stack-name teststack \
--template-body file://./stack.json \
--parameters ParameterKey=KeyName,ParameterValue=awskey ParameterKey=SSHLocation,ParameterValue=$IP/32 \
--capabilities CAPABILITY_IAM