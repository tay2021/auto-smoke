#!/usr/bin/env python3
"""
Script để setup môi trường và khởi tạo Browser cho dự án Robot Framework
Chạy được trên cả Windows và macOS
"""

import os
import sys
import subprocess
import platform
import shutil
from pathlib import Path

# Định nghĩa các đường dẫn
PROJECT_ROOT = Path(__file__).parent.absolute()
VENV_DIR = PROJECT_ROOT / ".venv"
REQUIREMENTS_FILE = PROJECT_ROOT / "requirement.txt"
BROWSER_PROFILE_DIR = PROJECT_ROOT / "chrome-profile"


def print_step(message):
    """In ra step với định dạng rõ ràng"""
    print("\n" + "=" * 60)
    print(f"▶ {message}")
    print("=" * 60)


def get_python_command():
    """Trả về lệnh python phù hợp với OS"""
    if platform.system() == "Windows":
        return "python"
    else:
        return "python3"


def get_venv_activate_script():
    """Trả về đường dẫn script activate cho OS tương ứng"""
    if platform.system() == "Windows":
        return VENV_DIR / "Scripts" / "activate"
    else:
        return VENV_DIR / "bin" / "activate"


def get_venv_python():
    """Trả về đường dẫn python trong venv"""
    if platform.system() == "Windows":
        return VENV_DIR / "Scripts" / "python.exe"
    else:
        return VENV_DIR / "bin" / "python"


def get_venv_pip():
    """Trả về đường dẫn pip trong venv"""
    if platform.system() == "Windows":
        return VENV_DIR / "Scripts" / "pip.exe"
    else:
        return VENV_DIR / "bin" / "pip"


def create_virtual_environment():
    """Tạo môi trường ảo nếu chưa tồn tại"""
    print_step("TẠO MÔI TRƯỜNG ẢO")

    if VENV_DIR.exists():
        print("✓ Môi trường ảo đã tồn tại tại:", VENV_DIR)
        return True

    python_cmd = get_python_command()
    try:
        subprocess.run(
            [python_cmd, "-m", "venv", str(VENV_DIR)],
            check=True,
            capture_output=True,
            text=True
        )
        print(f"✓ Đã tạo môi trường ảo tại: {VENV_DIR}")
        return True
    except subprocess.CalledProcessError as e:
        print(f"✗ Lỗi tạo môi trường ảo: {e.stderr}")
        return False


def install_requirements():
    """Cài đặt các thư viện từ requirement.txt"""
    print_step("CÀI ĐẶT THƯ VIỆN")

    if not REQUIREMENTS_FILE.exists():
        print(f"⚠ Không tìm thấy file {REQUIREMENTS_FILE}")
        print("📝 Tạo file requirement.txt với các thư viện cần thiết...")

        # Tạo requirement.txt mặc định cho Robot Framework
        default_requirements = """
            robotframework
            robotframework-browser
            robotframework-requests
            robotframework-jsonlibrary
        """.strip()

        with open(REQUIREMENTS_FILE, 'w') as f:
            f.write(default_requirements)
        print(f"✓ Đã tạo file {REQUIREMENTS_FILE} với các thư viện mặc định")

    venv_pip = get_venv_pip()

    try:
        print(f"📦 Đang cài đặt từ: {REQUIREMENTS_FILE}")
        subprocess.run(
            [str(venv_pip), "install", "--upgrade", "pip"],
            check=True,
            capture_output=True,
            text=True
        )
        print("✓ Đã nâng cấp pip")

        subprocess.run(
            [str(venv_pip), "install", "-r", str(REQUIREMENTS_FILE)],
            check=True,
            capture_output=True,
            text=True
        )
        print("✓ Đã cài đặt tất cả thư viện")
        return True
    except subprocess.CalledProcessError as e:
        print(f"✗ Lỗi cài đặt thư viện: {e.stderr}")
        return False


def init_browser():
    """Khởi tạo Browser (playwright install)"""
    print_step("KHỞI TẠO BROWSER")

    venv_python = get_venv_python()

    try:
        # Cài đặt browser drivers cho Robot Framework Browser library
        print("🌐 Đang tải và cài đặt các trình duyệt...")
        subprocess.run(
            [str(venv_python), "-m", "robotframework_browser", "install"],
            check=True,
            capture_output=True,
            text=True
        )
        print("✓ Đã cài đặt browser drivers thành công")
        return True
    except subprocess.CalledProcessError as e:
        print(f"✗ Lỗi khởi tạo browser: {e.stderr}")
        print("⚠ Thử cài đặt thủ công: rfbrowser init")
        return False


def setup_chrome_profile():
    """Tạo thư mục chrome-profile nếu chưa có"""
    print_step("CHUẨN BỊ CHROME PROFILE")

    if not BROWSER_PROFILE_DIR.exists():
        BROWSER_PROFILE_DIR.mkdir(parents=True, exist_ok=True)
        print(f"✓ Đã tạo thư mục chrome-profile tại: {BROWSER_PROFILE_DIR}")
    else:
        print(f"✓ Thư mục chrome-profile đã tồn tại: {BROWSER_PROFILE_DIR}")


def print_activation_instructions():
    """In hướng dẫn kích hoạt môi trường ảo"""
    print_step("HƯỚNG DẪN KÍCH HOẠT MÔI TRƯỜNG")

    venv_path = VENV_DIR.absolute()
    activate_script = get_venv_activate_script()

    if platform.system() == "Windows":
        print(f"""
📌 Để kích hoạt môi trường ảo trên Windows:
    {venv_path}\\Scripts\\activate

📌 Hoặc dùng:
    {venv_path}\\Scripts\\activate.bat

📌 Để chạy test:
    robot --variable BROWSER:chromium --variable HEADLESS:false tests/
    """)
    else:
        print(f"""
📌 Để kích hoạt môi trường ảo trên macOS/Linux:
    source {venv_path}/bin/activate

📌 Để chạy test:
    robot --variable BROWSER:chromium --variable HEADLESS:false tests/
    """)


def main():
    """Hàm chính"""
    print("""
    ╔══════════════════════════════════════════════════════════╗
    ║     🚀 ROBOT FRAMEWORK SETUP & BROWSER INITIATE         ║
    ║                                                         ║
    ║    Tự động setup môi trường cho dự án auto-test         ║
    ╚══════════════════════════════════════════════════════════╝
    """)

    print(f"📂 Thư mục dự án: {PROJECT_ROOT}")
    print(f"💻 Hệ điều hành: {platform.system()}")

    # Kiểm tra Python
    python_cmd = get_python_command()
    try:
        result = subprocess.run(
            [python_cmd, "--version"],
            capture_output=True,
            text=True,
            check=True
        )
        print(f"🐍 Python: {result.stdout.strip()}")
    except:
        print("⚠ Không tìm thấy Python. Vui lòng cài đặt Python 3.7+")
        return False

    # Thực hiện các bước
    steps = [
        ("Tạo môi trường ảo", create_virtual_environment),
        ("Cài đặt thư viện", install_requirements),
        ("Khởi tạo Browser", init_browser),
        ("Chuẩn bị Chrome Profile", setup_chrome_profile),
    ]

    success = True
    for step_name, step_func in steps:
        if not step_func():
            success = False
            print(f"\n❌ Bước '{step_name}' thất bại!")
            break

    if success:
        print_step("✅ SETUP HOÀN TẤT THÀNH CÔNG!")
        print_activation_instructions()

        # Thông tin thêm
        print("\n📋 Các lệnh hữu ích:")
        print(f"  • Chạy tất cả test:    robot tests/")
        print(f"  • Chạy test cụ thể:    robot tests/test_case.robot")
        print(f"  • Debug mode:          robot --variable DEBUG:true tests/")
        print(f"  • Xem report:          open log.html")
        print("\n✅ Sẵn sàng để chạy test!")
        return True
    else:
        print("\n❌ Setup thất bại! Vui lòng kiểm tra lỗi ở trên.")
        return False


if __name__ == "__main__":
    sys.exit(0 if main() else 1)