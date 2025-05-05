#!/bin/bash

# --------- CONFIGURATION ---------
GH_ORG="your-org"                       # 🔁 Replace with your GitHub org/user
REPO_NAME="azure-landingzone-chatapp"  # Desired repo name
TEMPLATE_REPO="your-org/template-repo" # 🔁 Replace with actual template repo
ENVIRONMENTS=("sandbox" "test" "prod")

# GitHub secrets (REPLACE with real values)
AZURE_CLIENT_ID="your-client-id"
AZURE_TENANT_ID="your-tenant-id"
AZURE_SUBSCRIPTION_ID="your-subscription-id"

# --------- REPO CREATION ---------
echo "Creating repo from template..."
gh repo create "$GH_ORG/$REPO_NAME" --template "$TEMPLATE_REPO" --public --confirm

# --------- ENVIRONMENTS SETUP ---------
for env in "${ENVIRONMENTS[@]}"; do
  echo "Creating environment: $env"
  gh api --method PUT "repos/$GH_ORG/$REPO_NAME/environments/$env"
done

# --------- ADD SECRETS ---------
echo "Adding required GitHub secrets..."

declare -A secrets=(
  ["AZURE_CLIENT_ID"]=$AZURE_CLIENT_ID
  ["AZURE_TENANT_ID"]=$AZURE_TENANT_ID
  ["AZURE_SUBSCRIPTION_ID"]=$AZURE_SUBSCRIPTION_ID
)

for secret in "${!secrets[@]}"; do
  gh secret set "$secret" -b"${secrets[$secret]}" -R "$GH_ORG/$REPO_NAME"
done

echo "✅ Bootstrap complete. Repo ready at: https://github.com/$GH_ORG/$REPO_NAME"
