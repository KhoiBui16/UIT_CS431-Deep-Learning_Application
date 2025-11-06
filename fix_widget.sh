#!/bin/bash
# ============================
# Script: fix_widget.sh
# Mục đích: quét và sửa các notebook thiếu "state" trong metadata.widgets
# ============================

ROOT_DIR="${1:-.}"

echo "🔍 Scanning notebooks in: $ROOT_DIR"

python3 - <<'EOF'
import os
import nbformat

def fix_widgets_metadata(nb_path):
    """Thêm key 'state' vào metadata.widgets nếu thiếu."""
    changed = False
    try:
        nb = nbformat.read(nb_path, as_version=nbformat.NO_CONVERT)
        meta = nb.metadata

        print(f"\n🔍 Checking: {nb_path}")

        # Kiểm tra metadata.widgets
        if "widgets" in meta and isinstance(meta["widgets"], dict):
            print("  • Found metadata.widgets keys:", list(meta["widgets"].keys()))
            if "state" not in meta["widgets"]:
                meta["widgets"]["state"] = {}
                changed = True
                print("  ➕ Added 'state' to metadata.widgets ✅")
        else:
            print("  ⚠️ No metadata.widgets found in notebook")

        # Ngoài ra, đôi khi lỗi nằm ở từng cell
        for i, cell in enumerate(nb.cells):
            if "metadata" in cell and "widgets" in cell["metadata"]:
                widgets_meta = cell["metadata"]["widgets"]
                if isinstance(widgets_meta, dict):
                    if "state" not in widgets_meta:
                        widgets_meta["state"] = {}
                        changed = True
                        print(f"  ➕ Added 'state' to cell {i} widgets metadata ✅")

        if changed:
            nbformat.write(nb, nb_path)
            print(f"✅ Fixed and saved: {nb_path}")
        else:
            print(f"✅ OK (no change needed): {nb_path}")

    except Exception as e:
        print(f"❌ Error processing {nb_path}: {e}")


def scan_and_fix(root_dir="."):
    """Duyệt qua tất cả notebook trong repo"""
    for subdir, _, files in os.walk(root_dir):
        for f in files:
            if f.endswith(".ipynb"):
                path = os.path.join(subdir, f)
                fix_widgets_metadata(path)


if __name__ == "__main__":
    scan_and_fix(".")
EOF
