#!/bin/bash
# install.sh - Install review-as-persona commands for Claude Code

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
CLAUDE_COMMANDS_DIR="$CLAUDE_DIR/commands"
PERSONA_DIR="$CLAUDE_DIR/personas"
REFERENCE_DIR="$CLAUDE_DIR/reference"

echo ""
echo "  review-as-persona installer"
echo "  Persona-accurate content reviews for Claude Code"
echo ""

# Create target directories
for dir in "$CLAUDE_COMMANDS_DIR" "$PERSONA_DIR" "$REFERENCE_DIR"; do
  if ! mkdir -p "$dir" 2>/dev/null; then
    echo "ERROR: Could not create $dir"
    echo "Check that you have write access to $HOME/.claude/"
    exit 1
  fi
done

# Install commands
COMMANDS=(review-as review-multi review-for-audience rewrite-for debate red-team empathy-map persona-builder)
cmd_count=0
for cmd in "${COMMANDS[@]}"; do
  src="$SCRIPT_DIR/commands/$cmd.md"
  if [ -f "$src" ]; then
    cp "$src" "$CLAUDE_COMMANDS_DIR/$cmd.md"
    echo "  + /$cmd"
    cmd_count=$((cmd_count + 1))
  else
    echo "  ! $cmd.md not found, skipping"
  fi
done

# Install persona definitions
persona_count=0
if ls "$SCRIPT_DIR/personas/"*.md >/dev/null 2>&1; then
  for f in "$SCRIPT_DIR/personas/"*.md; do
    cp "$f" "$PERSONA_DIR/"
    name=$(basename "$f" .md)
    echo "  + persona: $name"
    persona_count=$((persona_count + 1))
  done
else
  echo "  ! No persona files found in personas/"
  exit 1
fi

# Install reference files
ref_count=0
if ls "$SCRIPT_DIR/reference/"*.md >/dev/null 2>&1; then
  for f in "$SCRIPT_DIR/reference/"*.md; do
    cp "$f" "$REFERENCE_DIR/"
    name=$(basename "$f")
    echo "  + reference: $name"
    ref_count=$((ref_count + 1))
  done
else
  echo "  ! No reference files found in reference/"
  exit 1
fi

echo ""
echo "  Done. Installed $cmd_count commands, $persona_count personas, $ref_count reference files."
echo ""
echo "  Try this first:"
echo ""
echo "    /debate ./README.md CTO vs SRE"
echo ""
echo "  Or get a single persona's honest reaction:"
echo ""
echo "    /review-as sre ./your-draft.md"
echo ""
