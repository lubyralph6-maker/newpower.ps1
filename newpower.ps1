# --- ไฟล์ newpower.ps1 บน GitHub ---

# ตั้งค่าให้ PowerShell อ่านภาษาไทย/UTF-8 ออก (ป้องกันเครื่องหมายคำถาม ?????)
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# แสดงข้อความเท่ๆ ตอนเริ่มทำงาน
Write-Host "================================" -ForegroundColor Cyan
Write-Host "    CHASERS INTERNAL SYSTEM    " -ForegroundColor White
Write-Host "================================" -ForegroundColor Cyan
Write-Host "Connecting to Server..." -ForegroundColor Yellow

# จำลองการทำงาน (คุณสามารถเปลี่ยนเป็นคำสั่งรันโปรแกรมของคุณได้)
Start-Sleep -Seconds 2
Write-Host "Status: Online" -ForegroundColor Green
Write-Host "Successfully Connected!" -ForegroundColor Green
Write-Host "--------------------------------" -ForegroundColor Gray

# ตัวอย่างคำสั่งเปิดโปรแกรม (ถ้ามีไฟล์ในเครื่อง)
# Start-Process "C:\Path\To\Your\Program.exe"

# บรรทัดสุดท้ายเพื่อให้หน้าต่างค้างไว้ดูสถานะ (ถ้าต้องการ)
Read-Host "Press Enter to continue..."
