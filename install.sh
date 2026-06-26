#!/bin/bash
# install.sh - Install review-as-persona commands for Claude Code

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_COMMANDS_DIR="$HOME/.claude/commands"

echo "Installing review-as-persona commands..."
echo ""

# Create the commands directory if it doesn't exist
mkdir -p "$CLAUDE_COMMANDS_DIR"

# Copy command files
for cmd in review-as review-multi review-for-audience rewrite-for debate red-team empathy-map persona-builder; do
  cp "$SCRIPT_DIR/commands/$cmd.md" "$CLAUDE_COMMANDS_DIR/$cmd.md"
done

# Copy persona definitions (commands reference these)
PERSONA_DIR="$CLAUDE_COMMANDS_DIR/../personas"
mkdir -p "$PERSONA_DIR"
cp "$SCRIPT_DIR/personas/"*.md "$PERSONA_DIR/"

# Copy reference files
REFERENCE_DIR="$CLAUDE_COMMANDS_DIR/../reference"
mkdir -p "$REFERENCE_DIR"
cp "$SCRIPT_DIR/reference/"*.md "$REFERENCE_DIR/"

echo "Installed successfully."
echo ""
echo "Review commands:"
echo "  /review-as <persona> <content or file>      Single persona review"
echo "  /review-multi <content or file>              All personas at once"
echo "  /review-for-audience <description> <content> Custom audience review"
echo "  /rewrite-for <persona> <content or file>     Rewrite for a persona"
echo ""
echo "Advanced commands:"
echo "  /debate <content> CTO vs SRE                 Two personas debate your content"
echo "  /red-team <content or file>                  Adversarial review from 4 hostile angles"
echo "  /empathy-map <persona> <content or file>     Full empathy map for a persona"
echo "  /persona-builder <role description>          Build and save a custom persona"
echo ""
echo "Try the debate command -- it is the fastest way to see two perspectives collide:"
echo ""
echo "  /debate ./README.md CTO vs SRE"
echo ""
echo "Available personas: cto, sre, junior-dev, technical-writer, developer-advocate,"
echo "  product-manager, solutions-architect, security-engineer, open-source-maintainer,"
echo "  c-suite, platform-engineer, data-scientist, finance-director, new-hire,"
echo "  vp-engineering, developer"
echo ""
echo "Build your own: /persona-builder A tired SRE on-call at 2 AM who hates YAML"
