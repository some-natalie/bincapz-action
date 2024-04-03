FROM cgr.dev/chainguard/wolfi-base:latest

# Labels
LABEL org.opencontainers.image.source https://github.com/some-natalie/bincapz-action
LABEL org.opencontainers.image.path "Dockerfile"
LABEL org.opencontainers.image.title "bincapz-action"
LABEL org.opencontainers.image.description "Run bincapz in a container for GitHub Actions"
LABEL org.opencontainers.image.authors "Natalie Somersall (@some-natalie)"
LABEL org.opencontainers.image.licenses "Apache-2.0"
LABEL org.opencontainers.image.documentation https://github.com/some-natalie/bincapz-action/README.md

# Install the required packages
RUN apk update && apk add --no-cache \
    bincapz \
    jq \
    yara

# Entrypoint script for Actions
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
