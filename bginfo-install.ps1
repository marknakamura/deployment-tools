## credit to wim matthyseen
## this is modified from his article:
## https://wmatthyssen.com/2019/09/11/powershell-bginfo-automation-script-for-windows-server-2012-r2/

$bgFolder = 'C:\bginfo'
$bgUri = 'https://download.sysinternals.com/files/BGInfo.zip'
$bgDownload = $bgFolder + '\BgInfo.zip'
$bgConfigUri = 'https://github.com/marknakamura/deployment-tools/raw/main/logon.bgi'
$bgConfigDownload = $bgFolder + '\logon.bgi'
$bgRegPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run'
$bgregKeyName = 'BgInfo'
$bgregKeyValue = 'C:\bginfo\Bginfo.exe C:\bginfo\logon.bgi /timer:0 /nolicprompt'
$regKeyExists = (Get-Item $bgRegPath -ErrorAction Ignore).Property -contains $bgregKeyName

# create bginfo folder if it does not exist
if (Test-Path -Path $bgFolder ) {
    Write-Host "Folder already exists!" -ForegroundColor Green
    }
    else {
        New-Item -ItemType Directory -Force -Path $bgFolder
        Write-Host "Created new folder for BGInfo!" -ForegroundColor Green
        }

# download bginfo from sysinternals
Invoke-WebRequest -Uri $bgUri -OutFile $bgDownload
Start-Sleep -Seconds 3

# extract bginfo to bginfo folder
Expand-Archive $bgDownload -DestinationPath $bgFolder
Start-Sleep -Seconds 3

# download bginfo config file from mark's repo
Invoke-WebRequest -Uri $bgConfigUri -OutFile $bgConfigDownload
Start-Sleep -Seconds 3

# configure autostart via registry
if ($regKeyExists -eq $true) {
    Write-Host "BgInfo registry key already exists!" -ForegroundColor Green
    }
    else {
        New-ItemProperty -Path $bgRegPath -Name $bgregKeyName -PropertyType 'String' -Value $bgregKeyValue
        Write-Host "Created new BgInfo registry key!" -ForegroundColor Green
        }

Start-Sleep -Seconds 3

# run bginfo
C:\bginfo\Bginfo.exe C:\bginfo\logon.bgi /timer:0 /nolicprompt /silent