#!/bin/env bash

ROLENAME1="MyCodePipelineRole"
TRUSTPOLICYFILE1="codepipeline-iam-trust-policy.json"
POLICYFILE1="codepipeline-policy-for-cloudformation.json"

ROLENAME2="MyCloudFormationRole"
TRUSTPOLICYFILE2="cloudformation-iam-trust-policy.json"
POLICYFILE2="cloudformation-policy-for-s3.json"


#IAM Role for CodePipeline
aws iam create-role --role-name $ROLENAME1 --assume-role-policy-document file://$TRUSTPOLICYFILE1 --output json >> output.json 2>&1
# Attach Inline Policy to Role 
aws iam put-role-policy --role-name $ROLENAME1 --policy-name  MyCodePipelinePolicy --policy-document file://$POLICYFILE1 

echo "IAM role and Policy created: $ROLENAME1"


#IAM Role for CloudFormation
aws iam create-role --role-name $ROLENAME2  --assume-role-policy-document file://$TRUSTPOLICYFILE2 --output json >> output.json 2>&1

# Attach Inline Policy to Role MyCloudFormationRole
aws iam put-role-policy --role-name $ROLENAME2  --policy-name  MyCloudFormationPolicy --policy-document file://$POLICYFILE2 

echo "IAM role and Policy created: $ROLENAME2"