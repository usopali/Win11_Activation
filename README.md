
# Win11 Activation

This repository provides a PowerShell script for activating Windows 11 using KMS. The script automates the process of clearing existing activation keys, configuring KMS, and activating the product.

## Features

- Uninstall existing product keys.
- Clear any saved KMS configuration.
- Retrieve available target editions.
- Configure Windows services for activation.
- Change the product key and activate using KMS.

## Prerequisites

- Windows 11
- Administrator privileges
- PowerShell 5.1 or higher

## How to Use

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/usopali/Win11_Activation.git
   cd Win11_Activation

2.Run the Activation Script: Ensure you are running PowerShell as an Administrator, then execute:

powershell
```
.\activation_script.ps1
```

Or, if you prefer the .exe version, run:

bash

.\activation_script.exe

3.Follow the On-Screen Instructions: The script will guide you through the process and automatically activate your Windows 11 installation.

## Script Details

The script executes the following commands:

    - Uninstall the current product key:
    slmgr.vbs /upk
Clear any saved product keys:

powershell

slmgr.vbs /cpky

Clear KMS server settings:

powershell

slmgr.vbs /ckms

Get available Windows editions:

powershell

DISM /online /Get-TargetEditions

Configure and start required services:

powershell

sc config LicenseManager start= auto & net start LicenseManager
sc config wuauserv start= auto & net start wuauserv

Change the product key:

powershell

changepk.exe /productkey VK7JG-NPHTM-C97JM-9MPGT-3V66T

Install the KMS client key:
