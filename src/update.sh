#!/bin/bash
# update.sh
# should be in ~/luka/src/update.sh
# License : GPL3.0

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

function echo_error() {
    echo -e "${RED}$1${NC}"
}

function echo_success() {
    echo -e "${GREEN}$1${NC}"
}

function echo_info() {
    echo -e "${CYAN}$1${NC}"
}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

VERSION_FILE="$ROOT_DIR/bin/.VERSION"

# ログファイルの設定
LOG_FILE="$ROOT_DIR/update.log"

# 現在のバージョンを取得
if [ -f "$VERSION_FILE" ]; then
    old_version=$(cat "$VERSION_FILE")
else
    old_version="unknown"
fi

echo_info "Starting Luka update process at $(date)" | tee -a "$LOG_FILE"

cd "$ROOT_DIR" || { echo_error "Failed to navigate to root directory: $ROOT_DIR" | tee -a "$LOG_FILE"; exit 1; }

echo_info "Pulling latest changes from Git repository..." | tee -a "$LOG_FILE"
git pull | tee -a "$LOG_FILE"
if [ ${PIPESTATUS[0]} -ne 0 ]; then
    echo_error "Git pull failed. Please check your network connection or repository status." | tee -a "$LOG_FILE"
    exit 1
fi

echo_info "Installing/updating Python dependencies..." | tee -a "$LOG_FILE"
pip install -r src/requirements.txt | tee -a "$LOG_FILE"
if [ ${PIPESTATUS[0]} -ne 0 ]; then
    echo_error "Failed to install Python dependencies." | tee -a "$LOG_FILE"
    exit 1
fi

if [ -f "$VERSION_FILE" ]; then
    new_version=$(cat "$VERSION_FILE")
else
    new_version="unknown"
fi

if [ "$old_version" != "$new_version" ]; then
    echo_success "Luka updated from version $old_version to $new_version successfully." | tee -a "$LOG_FILE"
else
    echo_info "Luka is already up to date (version $new_version)." | tee -a "$LOG_FILE"
fi