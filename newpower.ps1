# ปรับแต่งหน้าต่าง Console
$Host.UI.RawUI.WindowTitle = "License Verification System"
Clear-Host

# แสดงข้อความ License Key : (เลียนแบบในรูป)
Write-Host ""
$userKey = Read-Host "License Key "

# --- ส่วนตรวจสอบ Key ---
# คุณสามารถเปลี่ยน "MY-KEY-2026" เป็น Key ที่คุณต้องการ
$validKey = "MY-KEY-2026" 

if ($userKey -eq $validKey) {
    Write-Host "`n[+] Access Granted! Loading..." -ForegroundColor Green
    Start-Sleep -Seconds 1
    
    # --- ใส่โค้ดโปรแกรมของคุณต่อจากตรงนี้ ---
    Write-Host "ยินดีต้อนรับเข้าสู่ระบบ..." -ForegroundColor Cyan
    # ตัวอย่าง: เรียกเปิด Notepad
    # notepad.exe 
}
else {
    Write-Host "`n[!] Invalid Key. Access Denied." -ForegroundColor Red
    Start-Sleep -Seconds 2
    exit
}
