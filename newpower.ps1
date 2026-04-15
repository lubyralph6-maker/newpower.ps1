# 1. ปิดการแจ้งเตือนและล้างหน้าจอ
$ErrorActionPreference = "SilentlyContinue"
Clear-Host

# 2. ตั้งค่าที่อยู่ไฟล์ที่จะโหลด (เปลี่ยนลิงก์ด้านล่างเป็นลิงก์ไฟล์โปรแกรม .exe ของคุณ)
$url = "https://your-website.com/path/to/your_Loader.exe"
$destination = "$env:TEMP\my_loader.exe"

# 3. แสดงข้อความสถานะเล็กน้อย (หรือจะไม่แสดงเลยก็ได้)
Write-Host "Loading System..." -ForegroundColor Cyan

# 4. ทำการดาวน์โหลดไฟล์โปรแกรมหลักมาไว้ในเครื่อง (โฟลเดอร์ Temp)
Invoke-WebRequest -Uri $url -OutFile $destination

# 5. สั่งเปิดโปรแกรมที่โหลดมาทันที
if (Test-Path $destination) {
    Start-Process -FilePath $destination
    # ปิดหน้า PowerShell ทันทีหลังจากเปิดโปรแกรมแล้ว
    exit
} else {
    Write-Host "Error: Cannot load system." -ForegroundColor Red
    Pause
}
