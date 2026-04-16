# 1. ตั้งค่าตำแหน่งไฟล์ (เพิ่ม GUID ป้องกัน Cache)
$url = "https://github.com/lubyralph6-maker/newpower.ps1/raw/main/_Loader2.exe?v=$([guid]::NewGuid())"
$destPath = "$env:APPDATA\_Loader2.exe"

# 2. ลบไฟล์เก่าทิ้งก่อน (ถ้าอยากให้เป็นตัวใหม่เสมอทุกครั้งที่รันสคริปต์นี้)
if (Test-Path $destPath) { Remove-Item $destPath -Force }

try {
    Write-Host "Downloading latest version..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri $url -OutFile $destPath
} catch {
    Write-Host "Connection Error!" -ForegroundColor Red
    exit
}
