#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/generate_web_icons.sh
# Requires macOS 'sips' utility. Generates icons in web/icons from lib/assets/eviuslife.png
SRC="lib/assets/eviuslife.png"
OUTDIR="web/icons"

if [ ! -f "$SRC" ]; then
  echo "Source image $SRC not found. Place your logo at $SRC and retry."
  exit 1
fi

mkdir -p "$OUTDIR"

echo "Generating web icons in $OUTDIR from $SRC"
# 192 and 512 icons
sips -Z 192 "$SRC" --out "$OUTDIR/Icon-192.png"
sips -Z 512 "$SRC" --out "$OUTDIR/Icon-512.png"
# Maskable variants (same image content)
cp "$OUTDIR/Icon-192.png" "$OUTDIR/Icon-maskable-192.png"
cp "$OUTDIR/Icon-512.png" "$OUTDIR/Icon-maskable-512.png"
# Favicon (32x32)
sips -Z 32 "$SRC" --out "web/favicon.png"
# Apple touch icon (use 180x180 recommended)
sips -Z 180 "$SRC" --out "$OUTDIR/apple-touch-icon.png"

echo "Done. Created:"
ls -la "$OUTDIR" || true
ls -la web/favicon.png || true

exit 0
