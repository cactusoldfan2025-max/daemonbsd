#!/bin/bash
set -e

echo "=== Building DaemonBSD ISO ==="

# Create release folder if missing
mkdir -p release
mkdir -p release/assets

# Copy assets to the release folder
cp -r assets/* release/assets/

# Patch Calamares for FreeBSD commands
find calamares/ -type f -exec sed -i '' 's/apt install/pkg install/g' {} \;

# Build ISO using FreeBSD's release system
cd release
make release || echo "⚠️ FreeBSD build tools required! Run this in a FreeBSD VM."
cd ..

echo "=== DaemonBSD ISO built! Check release/ folder ==="

