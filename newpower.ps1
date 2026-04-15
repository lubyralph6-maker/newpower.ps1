# ตั้งค่าภาษาให้รองรับภาษาไทย
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "================================" -ForegroundColor Cyan
Write-Host "    CHASERS SYSTEM STARTING     " -ForegroundColor White
Write-Host "================================" -ForegroundColor Cyan

# บรรทัดนี้คือคำสั่งเปิดโปรแกรม _Loader.exe ในเครื่อง
# โดยสมมติว่าไฟล์อยู่ในโฟลเดอร์เดียวกับที่รัน หรืออยู่ใน Downloads
$loaderPath = "$env:USERPROFILE\Downloads\Chaser\_Loader.exe"

if (Test-Path $loaderPath) {
    Write-Host "Starting _Loader.exe..." -ForegroundColor Green
    Start-Process $loaderPath
} else {
    Write-Host "Error: _Loader.exe not found at $loaderPath" -ForegroundColor Red
}

Write-Host "Successfully Connected to Server!" -ForegroundColor Green
Write-Host "--------------------------------" -ForegroundColor Gray
