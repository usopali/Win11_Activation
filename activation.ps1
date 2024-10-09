# Ensure the script runs as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "Please run this script as Administrator!"
    Start-Process powershell.exe -ArgumentList "-File", "$PSCommandPath" -Verb RunAs
    exit
}

# List of commands to run sequentially
$commands = @(
    'slmgr.vbs /upk',
    'slmgr.vbs /cpky',
    'slmgr.vbs /ckms',
    'DISM /online /Get-TargetEditions',
    'sc config LicenseManager start= auto & net start LicenseManager',
    'sc config wuauserv start= auto & net start wuauserv',
    'changepk.exe /productkey VK7JG-NPHTM-C97JM-9MPGT-3V66T',
    'slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX',
    'slmgr /skms kms8.msguides.com',
    'slmgr /ato'
)

# Execute each command
foreach ($command in $commands) {
    Write-Host "Executing: $command"
    Invoke-Expression $command
    Start-Sleep -Seconds 2 # Pause between commands for stability
}

Write-Host "All commands executed successfully."
