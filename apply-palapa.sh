#!/bin/bash
echo "==> Menerapkan UI PalapaOS Majapahit Edition..."
DEVICE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOP_DIR="$(cd "$DEVICE_DIR/../../.." && pwd)"

cp -rf "$DEVICE_DIR/palapa_ui/frameworks" "$TOP_DIR/"
cp -rf "$DEVICE_DIR/palapa_ui/packages" "$TOP_DIR/"

echo "==> Berhasil! UI PalapaOS sudah terpasang di frameworks/base & Settings."
