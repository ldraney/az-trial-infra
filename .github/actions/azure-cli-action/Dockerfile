# Base image
FROM mcr.microsoft.com/azure-cli

# Set a default working directory
WORKDIR /workspace

# Add any additional dependencies if needed
# RUN apt-get update && apt-get install -y <other-tools>

# Verify installation (optional)
RUN az --version

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

