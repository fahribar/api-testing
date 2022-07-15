#!/bin/bash
version="0.$(./git-buildnumber|cut -d '.' -f2-4)"
#version=$(cat ./version.txt)
echo $version > ./version.txt
HELM_FOLDER=helm-chart
HELM_VERSION="0.$(./git-buildnumber|cut -d '.' -f2-3)"
sed -i '18s/.*/version: '${HELM_VERSION}'/' ${HELM_FOLDER}/Chart.yaml
sed -i '24s/.*/appVersion: '${HELM_VERSION}'/' ${HELM_FOLDER}/Chart.yaml
sed -i '13s/.*/  tag: "'${version}'"/' ${HELM_FOLDER}/values.yaml
sed -i '13s/.*/  tag: "'${version}'"/' ${HELM_FOLDER}/development.values.yaml
