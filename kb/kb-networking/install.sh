#!/bin/bash
# KB Networking - Installation Script
# Usage: curl -sSL https://raw.githubusercontent.com/yourusername/kb-networking/main/install.sh | bash

set -e

REPO_USER="infoparticle"
REPO_NAME="bash-brain"
KB_NAME="kb-networking"
INSTALL_DIR="$HOME/.kb"
INSTALL_FILE="$INSTALL_DIR/${KB_NAME}.sh"
RAW_URL="https://raw.githubusercontent.com/${REPO_USER}/${REPO_NAME}/main/${KB_NAME}/kb.sh"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  KB Networking - Installation"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Create install directory
echo "Creating installation directory..."
mkdir -p "$INSTALL_DIR"

# Download kb.sh
echo "Downloading kb-networking from GitHub..."
if command -v curl &>/dev/null; then
    curl -sSL "$RAW_URL" -o "$INSTALL_FILE"
elif command -v wget &>/dev/null; then
    wget -qO "$INSTALL_FILE" "$RAW_URL"
else
    echo "Error: Neither curl nor wget found. Please install one of them."
    exit 1
fi

# Verify download
if [[ ! -f "$INSTALL_FILE" ]]; then
    echo "Error: Download failed"
    exit 1
fi

chmod +x "$INSTALL_FILE"
echo "✓ Downloaded to $INSTALL_FILE"

# Add to shell configuration
SOURCE_LINE="source $INSTALL_FILE"

# Function to add to config file
add_to_config() {
    local config_file="$1"

    if [[ -f "$config_file" ]]; then
        if grep -qF "$SOURCE_LINE" "$config_file"; then
            echo "  Already configured in $config_file"
        else
            echo "" >> "$config_file"
            echo "# KB Networking" >> "$config_file"
            echo "$SOURCE_LINE" >> "$config_file"
            echo "✓ Added to $config_file"
        fi
    fi
}

# Detect shell and add to appropriate config
if [[ -n "$BASH_VERSION" ]]; then
    add_to_config "$HOME/.bashrc"
    # macOS also uses .bash_profile
    if [[ "$OSTYPE" == "darwin"* ]]; then
        add_to_config "$HOME/.bash_profile"
    fi
elif [[ -n "$ZSH_VERSION" ]]; then
    add_to_config "$HOME/.zshrc"
else
    # Try .bashrc as fallback
    add_to_config "$HOME/.bashrc"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Installation Complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "To use immediately:"
echo "  source $INSTALL_FILE"
echo ""
echo "Or restart your shell."
echo ""
echo "Try:"
echo "  kb.net.help                    # Show help"
echo "  kb.net.osi_layers              # View OSI model"
echo "  kb.net.concepts.vlan           # Learn about VLANs"
echo "  kb.net.map                     # Show mind map"
echo ""
echo "Update:"
echo "  curl -sSL $RAW_URL -o $INSTALL_FILE"
echo "  source $INSTALL_FILE"
echo ""
