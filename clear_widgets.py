import nbformat
import sys
from pathlib import Path

def clear_widget_metadata(filename: str):
    # Đảm bảo có đuôi .ipynb
    if not filename.endswith(".ipynb"):
        filename += ".ipynb"

    path = Path(filename)
    if not path.exists():
        print(f"❌ Không tìm thấy file: {path}")
        return

    # Đọc file notebook
    nb = nbformat.read(path, as_version=4)

    # Xóa phần metadata.widgets nếu có
    if "widgets" in nb.get("metadata", {}):
        del nb["metadata"]["widgets"]
        print("🧹 Đã xóa metadata.widgets lỗi.")
    else:
        print("✅ Không có metadata.widgets — không cần xóa.")

    # Ghi đè lại file
    nbformat.write(nb, path)
    print(f"💾 Đã lưu lại file: {path}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("⚠️ Cách dùng: python clear_widgets.py <tên_file>")
        print("Ví dụ: python clear_widgets.py cs431-4")
    else:
        clear_widget_metadata(sys.argv[1])
