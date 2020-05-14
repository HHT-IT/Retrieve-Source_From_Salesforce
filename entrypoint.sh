#!/bin/sh -l

#$1 SFDX Auth URL

#Check Node and NPM versions
node -v
npm -v

#Populate Auth, Passed in as first variable
echo $1 > ./SFDX_URL.txt

#Auth Org and Retreive Source
sfdx -v
sfdx force:auth:sfdxurl:store -f ./SFDX_URL.txt -a salesforce -d --json
sfdx force:source:retrieve -u salesforce --verbose -m  \
  "BrandingSet, \
   CustomObject, \
   Network, \
   ApexClass, \
   CommunityTemplateDefinition, \
   AuraDefinitionBundle, \
   CommunityThemeDefinition, \
   ApexComponent, \
   CspTrustedSite, \
   CustomMetadata, \
   Document:myhht_com_Customer_Portal_Branding/cp_footer, \
   Document:myhht_com_Customer_Portal_Branding/cp_header, \
   FlexiPage, \
   LightningComponentBundle, \
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
  
ls 
  
#Remove Auth File
rm -f ./SFDX_URL.txt
