#!/bin/bash
set -e

echo "=== Building DaemonBSD ISO ==="

# Copy assets to wherever the ISO build expects them
mkdir -p release/assets
cp -r assets/* release/assets/

# Patch Calamares for FreeBSD commands
find calamares/ -type f -exec sed -i '' 's/apt install/pkg install/g' {} \;

# Build ISO using FreeBSD's release system
cd release
make release
cd ..

echo "=== DaemonBSD ISO built! Check release/ folder ==="
