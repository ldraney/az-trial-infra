#!/bin/bash
set -e

# Read the AZURE_CREDENTIALS input
echo "${INPUT_AZURE_CREDENTIALS}" > /azure-credentials.json

# Perform Azure login
az login --service-principal --username "$(jq -r '.clientId' /azure-credentials.json)" \
         --password "$(jq -r '.clientSecret' /azure-credentials.json)" \
         --tenant "$(jq -r '.tenantId' /azure-credentials.json)"

echo "Login successful!"
echo "::set-output name=status::success"

