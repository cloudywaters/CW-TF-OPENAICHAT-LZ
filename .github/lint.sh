
#!/bin/bash
set -e

echo "Running terraform fmt..."
terraform fmt -check -recursive

echo "Initializing TFLint..."
tflint --init

echo "Running TFLint..."
tflint

echo "Running terraform validate..."
terraform validate
