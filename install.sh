#!/bin/bash
# install.sh - Install review-as-persona commands for Claude Code

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_COMMANDS_DIR="$HOME/.claude/commands"

echo "Installing review-as-persona commands..."

# Create the commands directory if it doesn't exist
mkdir -p "$CLAUDE_COMMANDS_DIR"

# Copy command files
cp "$SCRIPT_DIR/commands/review-as.md" "$CLAUDE_COMMANDS_DIR/review-as.md"
cp "$SCRIPT_DIR/commands/review-multi.md" "$CLAUDE_COMMANDS_DIR/review-multi.md"

# Copy persona definitions (commands reference these)
PERSONA_DIR="$CLAUDE_COMMANDS_DIR/../personas"
mkdir -p "$PERSONA_DIR"
cp "$SCRIPT_DIR/personas/"*.md "$PERSONA_DIR/"

echo ""
echo "Installed successfully."
echo ""
echo "Commands available:"
echo "  /review-as <persona> <content or file path>"
echo "  /review-multi <content or file path>"
echo ""
echo "Personas directory: $PERSONA_DIR"
echo ""
echo "Available personas: cto, vp-engineering, sre, developer, pm,"
echo "  security-architect, data-scientist, platform-engineer"
