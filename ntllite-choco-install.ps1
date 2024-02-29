Write-Host -ForegroundColor Green "Starting Chocolatey install now!"

Get-ExecutionPolicy -List
Start-Sleep -Seconds 15

Set-ExecutionPolicy Unrestricted -Force
Start-Sleep -Seconds 10

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Start-Sleep -Seconds 10