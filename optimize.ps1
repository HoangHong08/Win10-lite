# optimize.ps1 - tối ưu hệ thống container Windows khi boot

# Tắt dịch vụ Windows không cần thiết
$services = "wuauserv", "WinDefend", "DiagTrack", "WSearch"
foreach ($svc in $services) {
    Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
    Set-Service -Name $svc -StartupType Disabled -ErrorAction SilentlyContinue
}

# Dọn rác hệ thống
Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue

# (Tuỳ chọn) Mở Wwise nếu đã cài
# Start-Process "C:\Program Files (x86)\Audiokinetic\Wwise 2023\Authoring.exe"
