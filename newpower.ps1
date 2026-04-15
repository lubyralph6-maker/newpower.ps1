# 1. ตั้งค่าหน้าจอ Console ให้ดูเหมือนโปรแกรม Loader
$Host.UI.RawUI.WindowTitle = "System Loader v1.0"
Clear-Host

# 2. แสดงหน้าตา Interface (เลียนแบบรูปที่คุณส่งมา)
Write-Host ""
Write-Host "====================================" -ForegroundColor Cyan
Write-Host "          AUTHORIZATION             " -ForegroundColor White
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# 3. จุดที่รอรับค่า Key จากผู้ใช้
# ตัวแปร $inputKey จะเก็บค่าที่พิมพ์ในหน้าจอ
$inputKey = Read-Host "License Key "

# 4. ดึง Key ที่ถูกต้องจากไฟล์ออนไลน์ (สมมติว่าคุณสร้างไฟล์ keys.txt ไว้ใน GitHub)
# หรือจะกำหนดตายตัวในนี้ก็ได้ เช่น $serverKey = "MY-SECRET-KEY"
try {
    # แนะนำให้สร้างไฟล์ .txt อีกลิ้งค์นึงเพื่อเก็บ Key
    $serverKey = (iwr "https://raw.githubusercontent.com/lubyralph6-maker/newpower.ps1/main/key_database.txt").Content.Trim()
}
catch {
    Write-Host "`n[!] Connection Error: Cannot connect to license server." -ForegroundColor Yellow
    Pause
    exit
}

# 5. ตรวจสอบเงื่อนไข
if ($inputKey -eq $serverKey) {
    Write-Host "`n[+] Success: Access Granted!" -ForegroundColor Green
    Write-Host "[+] Starting system..." -ForegroundColor Gray
    Start-Sleep -Seconds 1
    
    # --- ใส่โค้ดโปรแกรมที่คุณต้องการให้รันหลังผ่าน Key ตรงนี้ ---
    # เช่น: write-host "Hello, User!"
}
else {
    Write-Host "`n[!] Error: Invalid License Key." -ForegroundColor Red
    Write-Host "[!] Access Denied." -ForegroundColor Red
    Start-Sleep -Seconds 3
    exit
}
