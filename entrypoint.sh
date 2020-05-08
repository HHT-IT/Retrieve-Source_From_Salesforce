#!/bin/sh -l

echo "Hello {salesforce-sfdx-auth-url}"
#time=$(date)
#echo "::set-output name=time::$time"

echo "Hello World"

#Install Salesforce CLI 
wget https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz
mkdir sfdx-cli
tar xJf sfdx-linux-amd64.tar.xz -C sfdx-cli --strip-components 1
./sfdx-cli/install
echo salesforce cli install completed.

#Populate Auth, Passed in as first variable
'echo $1 > ./SFDX_URL.txt'
echo ./SFDX_URL.txt


#Auth Org and Retreive Source
sfdx force:auth:sfdxurl:store -f ./SFDX_URL.txt -a salesforce -d
sfdx force:source:retrieve -u salesforce --verbose -m  \
  "AuraDefinitionBundle, \
  BrandingSet, \
  ApexClass, \
  CommunityTemplateDefinition, \
  CommunityThemeDefinition, \
  ApexComponent, \
  CspTrustedSite, \
  CustomMetadata, \
  Document:myhht_com_Customer_Portal_Branding/cp_footer, \
  Document:myhht_com_Customer_Portal_Branding/cp_header, \
  flexipage, \
  LightningComponentBundle, \
  Network, \
  CustomObject, \
  ApexPage, \
  ApexTestSuite, \
  PermissionSet, \
  CustomSite, \
  StaticResource, \
  ApexTrigger, \
  Layout, \
  SharingRules, \
  ApprovalProcess, \
  CustomField, \
  CustomPermission, \
  CustomTab, \
  EmailTemplate, \
  Flow, \
  Profile, \
  RecordType, \
  StandardValueSet, \
  ValidationRule, \
  WebLink, \
  WorkflowAlert
  "
  #Remove Auth File
  rm -f ./SFDX_URL.txt
