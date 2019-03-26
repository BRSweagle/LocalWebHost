#!/usr/bin/env bash
source $(dirname "$0")/sweagle.env

env=$1
nodePath="webportal1,environments,$env,lastDeployed"
nodePathEnv="webportal1,environments,$env,lastDeployed,properties"
nodePathEnv="webportal1,environments,$env,lastDeployed"

$sweagleScriptDir/webPortalUploadConfig.sh $nodePath
$sweagleScriptDir/uploadFileToSweagle.sh $nodePathEnv ./environments/$env.properties
# For debug purpose, this is handled directly in Gitlab script by after_deploy() function
#helm get "$CI_ENVIRONMENT_SLUG" > ./tmp/helm-values.yaml
#kubectl get deployment tst3-nginx-ingress-webportal1 --namespace=webportal1-tst3 -o=yaml > ./tmp/deployment.yaml
#kubectl get service tst3-nginx-ingress-webportal1 --namespace=webportal1-tst3 -o=yaml > ./tmp/service.yaml
if [ -d "./tmp" ]; then
  $sweagleScriptDir/uploadDirToSweagle.sh $nodePathEnv ./tmp yaml
fi

echo -e "\n**********"
echo "*** Transfer deployment status to SWEAGLE"
DATE=`date '+%Y-%m-%dT%H:%M:%S'`
echo -e "version=ui-1.1\ndate=$DATE\nstatus=successfull\nenvironment=$env" > ./status.properties
nodePath="webportal1,components,ui,deployHistory,ui-1.1_$env"_"$DATE"
$sweagleScriptDir/uploadFileToSweagle.sh "$nodePath" ./status.properties
rm -f ./status.properties
