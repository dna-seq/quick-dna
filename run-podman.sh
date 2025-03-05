#!/bin/bash

# Script to run the quick-dna container using Podman
# Container: ghcr.io/dna-seq/quick-dna:local

# Check if the image exists in Podman
if ! podman image exists ghcr.io/dna-seq/quick-dna:local; then
    echo "Image not found in Podman. Pulling from Docker daemon..."
    
    # Pull directly from Docker daemon
    podman pull docker-daemon:ghcr.io/dna-seq/quick-dna:local
    
    if [ $? -ne 0 ]; then
        echo "Error: Failed to pull image from Docker daemon."
        echo "Please build the image first with: docker build -t ghcr.io/dna-seq/quick-dna:local ."
        exit 1
    fi
fi

# Run the container
echo "Running container..."
podman run --rm -it ghcr.io/dna-seq/quick-dna:local
