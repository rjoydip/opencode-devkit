---
name: shell-commands
description: Shell scripting patterns, cross-platform commands, and common utilities for AI agents.
---

# Shell Commands

Cross-platform shell command patterns.

## File Operations

```bash
# List files
ls -la
ls -la *.ts

# Create directory
mkdir -p src/components

# Copy files
cp file.ts backup/

# Move/rename
mv old.ts new.ts

# Remove
rm file.ts
rm -rf dist/

# Read file
cat file.ts
head -20 file.ts
tail -20 file.ts

# Find files
find . -name "*.ts"
find . -type d -name node_modules
```

## Process Management

```bash
# List processes
ps aux
ps aux | grep node

# Kill process
kill <pid>
pkill -f "node server"

# Run in background
npm run dev &

# Check port usage
lsof -i :3000
netstat -ano | findstr :3000
```

## Network

```bash
# HTTP requests
curl -X GET https://api.example.com
curl -X POST -H "Content-Type: application/json" -d '{}' https://api.example.com

# Check connectivity
ping google.com
curl -I https://google.com

# Download file
curl -O https://example.com/file.zip
wget https://example.com/file.zip
```

## Text Processing

```bash
# Search in files
grep "search-term" file.ts
grep -r "search-term" src/

# Find and replace (use with caution)
sed -i 's/old/new/g' file.ts

# Count lines
wc -l file.ts

# Sort lines
sort file.ts | uniq
```

## Environment

```bash
# Check environment variables
env
echo $PATH

# Set variable (current session)
export NODE_ENV=development

# Read from .env
source .env
```

## Package Managers

```bash
# npm
npm install
npm install package-name
npm run build
npm test

# bun
bun install
bun add package-name
bun run build
bun test

# pnpm
pnpm install
pnpm add package-name
```

## Cross-Platform Notes

```bash
# Use node instead of shell scripts when possible
node scripts/build.js

# Path separators
# Unix: /path/to/file
# Windows: C:\\path\\to\\file
# Use path.join() in Node.js

# Line endings
# Convert: dos2unix file.ts
# Or configure git: git config core.autocrlf true
```

## Common Patterns

```bash
# Chain commands
npm run build && npm run test

# Conditional
npm run build || echo "Build failed"

# Pipe output
cat file.ts | grep "function"

# Background process
npm run dev > dev.log 2>&1 &

# Wait for port
until nc -z localhost 3000; do sleep 1; done

# Kill process on port
fuser -k 3000/tcp
```

## Git Commands

```bash
# Clone repo
git clone https://github.com/user/repo.git

# Install deps after clone
npm install
# or
bun install
```

## System Info

```bash
# OS
uname -a
# Windows: systeminfo

# Disk usage
df -h
du -sh node_modules/

# Memory
free -h
# Windows: wmic OS get FreePhysicalMemory
```
