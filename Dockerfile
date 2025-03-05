FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    wget \
    curl \
    unzip \
    libsqlite3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create oakvar user and directories
RUN useradd -ms /bin/bash oakvar
WORKDIR /home/oakvar

# Copy the application code
COPY --chown=oakvar:oakvar . /home/oakvar/oakvar

# Define build argument for OakVar version
ARG OAKVAR_VERSION="2.12.10"

# Set up virtual environment and install dependencies
RUN python -m pip install --upgrade pip && \
    pip install oakvar==${OAKVAR_VERSION}

# Define build arguments for credentials
ARG OV_EMAIL=""
ARG OV_PW=""

# Set environment variables for OakVar
ENV OV_ROOT_DIR=/home/oakvar/.oakvar \
    OV_MODULES_DIR=/home/oakvar/.oakvar/modules \
    OV_JOBS_DIR=/home/oakvar/.oakvar/jobs \
    OV_LOG_DIR=/home/oakvar/.oakvar/logs \
    OV_CONF_DIR=/home/oakvar/.oakvar/conf \
    OV_EMAIL=$OV_EMAIL \
    OV_PW=$OV_PW

# Switch to oakvar user
USER oakvar

# Set up OakVar system
RUN mkdir -p $OV_ROOT_DIR $OV_MODULES_DIR $OV_JOBS_DIR $OV_LOG_DIR $OV_CONF_DIR && \
    if [ -n "$OV_EMAIL" ] && [ -n "$OV_PW" ]; then \
        echo "Setting up OakVar with provided credentials..." && \
        ov system setup --email $OV_EMAIL --pw $OV_PW && \
        echo "OakVar setup complete. Checking if setup was successful..." && \
        if grep -q "INVALID_LOGIN_CREDENTIALS" /home/oakvar/.oakvar/logs/oakvar.log 2>/dev/null; then \
            echo "ERROR: Authentication failed with provided credentials"; \
            exit 1; \
        else \
            echo "Credentials appear to be accepted"; \
        fi \
    else \
        echo "WARNING: No credentials provided. OakVar may have limited functionality." && \
        ov system setup; \
    fi

# Install base modules (only if authentication succeeded)
#RUN if [ -n "$OV_EMAIL" ] && [ -n "$OV_PW" ]; then \
#        echo "Attempting to install clinvar module..." && \
#        ov module install -y clinvar || { \
#            echo "WARNING: Failed to install clinvar module. This may be due to authentication issues."; \
#        } \
#    else \
#        echo "Skipping module installation due to missing credentials"; \
#    fi

# Expose port for GUI
EXPOSE 8080

# Create a volume for each data directory
VOLUME ["/home/oakvar/.oakvar/modules", "/home/oakvar/.oakvar/jobs", "/home/oakvar/.oakvar/logs", "/home/oakvar/.oakvar/conf"]

# Set entrypoint
CMD ["ov", "--help"]