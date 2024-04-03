FROM cgr.dev/chainguard/wolfi-base:latest

# Labels

# Install the required packages
RUN apk update && apk add --no-cache \
    bincapz \
    yara

# Entrypoint script for Actions
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
