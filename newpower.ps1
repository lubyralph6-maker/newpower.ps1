# 1. ปิดการแสดงผล Error และล้างหน้าจอทันทีที่รัน
$ErrorActionPreference = "SilentlyContinue"
Clear-Host

# 2. ปรับขนาดหน้าต่าง PowerShell ให้ดูเหมือนหน้า Loader (เลือกขนาดตามชอบ)
$pshost = Get-Host
$pswindow = $pshost.UI.RawUI
$newsize = $pswindow.BufferSize
$newsize.Width = 60
$newsize.Height = 20
$pswindow.BufferSize = $newsize
$newsize = $pswindow.WindowSize
$newsize.Width = 60
$newsize.Height = 20
$pswindow.WindowSize = $newsize

# 3. แสดงผลหน้าจอ Loader (เลียนแบบรูปที่คุณส่งมาเป๊ะๆ)
Write-Host ""
# รับค่า License Key โดยตรง
$userKey = Read-Host "License Key "

# 4. ส่วนเช็ค Key (เปลี่ยน "1234" เป็น Key ของคุณ)
$secretKey = "1234" 

if ($userKey -eq $secretKey) {
    Write-Host "`n[+] Success! Connecting to server..." -ForegroundColor Green
    Start-Sleep -Seconds 1
    
    # --- ใส่คำสั่งที่คุณต้องการให้รันต่อด้านล่างนี้ ---
    Write-Host "Welcome, User." -ForegroundColor Cyan
    # ตัวอย่าง: เรียกเปิด CMD หรือ โปรแกรมอื่น
    # & cmd.exe
}
else {
    Write-Host "`n[!] Invalid License Key." -ForegroundColor Red
    Start-Sleep -Seconds 2
    exit
}
