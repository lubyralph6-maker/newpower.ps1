# 1. ปิดการแจ้งเตือนและล้างหน้าจอ PowerShell เดิม
$ErrorActionPreference = "SilentlyContinue"
Clear-Host

# 2. ระบุที่อยู่ของไฟล์ _Loader.exe (ถ้าไฟล์อยู่ในโฟลเดอร์เดียวกันบนเครื่อง)
# แต่ถ้าจะให้โหลดจากเน็ต ให้ใช้คำสั่งดาวน์โหลด iwr ก่อนรัน
$exePath = ".\_Loader.exe"

# 3. สั่งรัน _Loader.exe ขึ้นมาในหน้าต่างใหม่แบบ CMD
if (Test-Path $exePath) {
    # ใช้ Start-Process เพื่อให้มันแยกหน้าต่างออกมาทำงานเอง
    Start-Process -FilePath $exePath
    
    # 4. สั่งปิดหน้า PowerShell สีน้ำเงินทิ้งทันที
    exit
} else {
    # กรณีหาไฟล์ไม่เจอ (เช่น ยังไม่ได้โหลดลงเครื่อง)
    Write-Host "[!] Error: _Loader.exe not found." -ForegroundColor Red
    Start-Sleep -Seconds 2
    exit
}
