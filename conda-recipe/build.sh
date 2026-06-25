#!/bin/bash
# Install pre-built BV-BRC CLI binaries into the conda prefix.
# The source tarball unpacks as bin/p3-* in the working directory.

set -euo pipefail

# Binaries land in bin/ after the source tarball is extracted
if [ ! -d "bin" ]; then
    echo "ERROR: expected bin/ directory from source tarball not found" >&2
    exit 1
fi

# Copy all p3-* binaries to the conda prefix bin directory
install -d "$PREFIX/bin"
install -m 755 bin/p3-* "$PREFIX/bin/"

echo "Installed $(ls bin/p3-* | wc -l) BV-BRC CLI tools to $PREFIX/bin/"
