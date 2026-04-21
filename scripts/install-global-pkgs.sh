#!/bin/bash

# Install global npm packages required for opencode-devkit

echo "Installing global packages..."

# context-mode: Context window optimization for AI coding agents
# - Sandboxes tool output (98% reduction)
# - Session continuity via SQLite + FTS5
# - Think in Code paradigm
bun install -g context-mode

echo "Global packages installed successfully!"