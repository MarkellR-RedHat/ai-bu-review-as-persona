#!/bin/bash
# install.sh -- Install review-as-persona commands for Claude Code

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
CLAUDE_COMMANDS_DIR="$CLAUDE_DIR/commands"
PERSONA_DIR="$CLAUDE_DIR/personas"
REFERENCE_DIR="$CLAUDE_DIR/reference"

echo ""
echo "review-as-persona"
echo "Persona-accurate content reviews for Claude Code"
echo ""

# Create directories
mkdir -p "$CLAUDE_COMMANDS_DIR" "$PERSONA_DIR" "$REFERENCE_DIR"

# Copy command files
COMMANDS=(review-as review-multi review-for-audience rewrite-for debate red-team empathy-map persona-builder)
for cmd in "${COMMANDS[@]}"; do
  if [ -f "$SCRIPT_DIR/commands/$cmd.md" ]; then
    cp "$SCRIPT_DIR/commands/$cmd.md" "$CLAUDE_COMMANDS_DIR/$cmd.md"
  else
    echo "Warning: commands/$cmd.md not found, skipping"
  fi
done

# Copy persona definitions
cp "$SCRIPT_DIR/personas/"*.md "$PERSONA_DIR/"

# Copy reference files
cp "$SCRIPT_DIR/reference/"*.md "$REFERENCE_DIR/"

echo "Installed ${#COMMANDS[@]} commands, $(ls "$SCRIPT_DIR/personas/"*.md 2>/dev/null | wc -l | tr -d ' ') personas, and reference files."
echo ""
echo "Core commands:"
echo "  /review-as <persona> <content>         Single persona review"
echo "  /review-multi <content>                All personas at once"
echo "  /review-for-audience <desc> <content>  Custom audience review"
echo "  /rewrite-for <persona> <content>       Persona-native rewrite"
echo ""
echo "Advanced commands:"
echo "  /debate <content> CTO vs SRE           Two personas fight about your content"
echo "  /red-team <content>                    Adversarial review from 4 hostile angles"
echo "  /empathy-map <persona> <content>       Full empathy map for a persona"
echo "  /persona-builder <description>         Build and save a custom persona"
echo ""
echo "Try the debate command first. It is the fastest way to see two perspectives collide:"
echo ""
echo "  /debate ./README.md CTO vs SRE"
echo ""
echo "Available personas: cto, sre, developer, junior-dev, technical-writer,"
echo "  developer-advocate, pm, solutions-architect, security-engineer,"
echo "  open-source-maintainer, c-suite, platform-engineer, data-scientist,"
echo "  finance-director, new-hire, vp-engineering"
echo ""
echo "Build your own: /persona-builder A tired SRE on-call at 2 AM who hates YAML"
echo ""
