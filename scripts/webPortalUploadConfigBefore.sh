#!/usr/bin/env bash
source $(dirname "$0")/sweagle.env

env=$1
nodePathUI="webportal1,components,ui,versions,ui-1.1"
nodePathEnv="webportal1,environments,$env,assigned,properties"
nodePathHelm="webportal1,environments,$env,assigned,helm,nginx-ingress"

$sweagleScriptDir/webPortalUploadConfig.sh $nodePathUI
$sweagleScriptDir/uploadFileToSweagle.sh $nodePathEnv ./environments/$env.properties

# Upload all helm yaml configuration, if any for this environment
if [ -d "./environments/$env/helm/nginx-ingress" ]; then
  $sweagleScriptDir/uploadDirToSweagle.sh $nodePathHelm ./environments/$env/helm/nginx-ingress yaml
fi
