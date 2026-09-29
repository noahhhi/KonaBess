#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT="$DIR/KonaBess-CLI-Universal-v2.0.zip"

rm -f "$OUTPUT"
cd "$DIR/magisk_module"
zip -r9 "$OUTPUT" . -x "*.DS_Store"

echo "Successfully built release archive: $OUTPUT"
ls -lh "$OUTPUT"
