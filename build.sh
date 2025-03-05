#!/bin/bash

# Script to build the OakVar Docker image with credentials

# Check if email and password are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <email> <password>"
    echo "Example: $0 user@example.com mypassword"
    exit 1
fi

# Store arguments
OV_EMAIL=$1
OV_PW=$2

# Build the Docker image with build arguments
echo "Building Docker image with provided credentials..."
docker build \
    --build-arg OV_EMAIL="$OV_EMAIL" \
    --build-arg OV_PW="$OV_PW" \
    -t ghcr.io/dna-seq/quick-dna:local \
    .

echo "Build complete. Image is tagged as ghcr.io/dna-seq/quick-dna:local"
