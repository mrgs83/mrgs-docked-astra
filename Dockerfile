# Start from a base Ubuntu image
FROM ubuntu:latest

# Update and install necessary packages
RUN apt-get update && apt-get install -y curl

# Copy Astra binary
COPY astra /usr/bin/astra
RUN chmod +x /usr/bin/astra

# Expose port for Astra
EXPOSE 8000

# Set default command to run Astra
CMD ["/usr/bin/astra", "-c", "/etc/astra/astra.conf", "-p", "8000"]
