#!/bin/sh

#IAM Role for CodePipeline
aws iam create-role --role-name MyCodePipelineRole --assume-role-policy-document file://codepipeline-iam-trust-policy.json

# Attach Inline Policy to Role MyCodePipelineRole
aws iam put-role-policy --role-name MyCodePipelineRole --policy-name  MyCodePipelinePolicy --policy-document file://codepipeline-policy-for-cloudformation.json

#IAM Role for CloudFormation
aws iam create-role --role-name MyCloudFormationRole --assume-role-policy-document file://cloudformation-iam-trust-policy.json

# Attach Inline Policy to Role MyCloudFormationRole
aws iam put-role-policy --role-name MyCloudFormationRole  --policy-name  MyCloudFormationPolicy --policy-document file://cloudformation-policy-for-s3.json policy

