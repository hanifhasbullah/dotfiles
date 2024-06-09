#!/bin/bash

instance_id="i-0e1fc5821a5ee4ef6"
region="ap-southeast-1"
profile="hcd"
sg_id="sg-09ceeedd8638c2a4c"
sgr_id="sgr-088bb95a09ab07a6a"
sgr_desc="hanif ip" # allowed characters: a-zA-Z0-9. _-:/()#,@[]+=&;{}!$*

echo "Starting EC2 instance $instance_id..."
starting_ec2=$(aws ec2 start-instances --instance-ids $instance_id --region $region --profile $profile --output text)
echo $starting_ec2

echo "Waiting for EC2 instance to start..."
aws ec2 wait instance-running --instance-ids $instance_id --region $region --profile $profile

echo "Fetching public IP address..."
ec2_public_ip=$(aws ec2 describe-instances \
  --instance-ids $instance_id \
  --region $region \
  --profile $profile \
  --filter Name="instance-id",Values=$instance_id \
  --query "Reservations[0].Instances[0].PublicIpAddress" \
  --output text)
echo "EC2 public ip: $ec2_public_ip"

echo "Fetching local public ip..."
local_public_ip=$(curl -s -4 ifconfig.me)
echo "Local public ip: $local_public_ip"

# echo "Updating security group inbound rule..."
# update_sg_rule=$(aws ec2 modify-security-group-rules \
#     --group-id $sg_id \
#     --security-group-rules SecurityGroupRuleId=$sgr_id,SecurityGroupRule='{Description='"$sgr_desc"',IpProtocol=6,CidrIpv4='$local_public_ip'/32,FromPort=22,ToPort=22}' \
#     --profile $profile \
#     --output text)
#
# if [[ $update_sg_rule != "True" ]]; then
#   echo "Something went wrong :("
#   echo $update_sg_rule
#   exit 1
# fi
#
# echo "Successfully update inbound rule :D"

echo "update config c9 hostname"
sed -i '' "/Host c9$/,/HostName/ s/HostName .*/HostName $ec2_public_ip/" $HOME/.ssh/config

echo "Public IP Sync Completed <3"

exit 0
