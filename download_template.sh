#!/bin/bash

TARGET_PATH="/boot/config/plugins/dockerMan/templates-user/astra-template.xml"
TEMPLATE_URL="https://raw.githubusercontent.com/mrgs83/mrgs-docked-astra/main/astra-template.xml"

log_message() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] - $1"
}

if ! command -v wget &> /dev/null
then
    log_message "ERROR: wget could not be found. Please install wget and try again."
    exit 1
fi

log_message "Attempting to download Astra Docker template..."

if wget "${TEMPLATE_URL}" -O "${TARGET_PATH}" -q -N --waitretry=1 --retry-connrefused --timeout=5 --tries=3; then
    log_message "Template downloaded successfully."
else
    log_message "ERROR: Failed to download the template. Check your internet connection and the URL: ${TEMPLATE_URL}"
    exit 1
fi
