# Use an official Ubuntu image as a base image
FROM ubuntu:latest

# Install curl and other dependencies
RUN apt-get update && apt-get install -y curl

# Download astra-latest binary
RUN curl -Lo /usr/bin/astra https://cesbo.com/astra-latest && \
    chmod +x /usr/bin/astra

# Set up environment variables for the user and group IDs
ENV PUID=1000
ENV PGID=1000
ENV TZ=Etc/UTC
ENV RUN_OPTS="/usr/bin/astra-latest -c /etc/astra/astra.conf -p 8080"

# Expose port 8080 for Astra
EXPOSE 8080

# Set a volume for configuration files
VOLUME /config

# Command to run Astra with the given options
CMD ["/bin/sh", "-c", "$RUN_OPTS"]
