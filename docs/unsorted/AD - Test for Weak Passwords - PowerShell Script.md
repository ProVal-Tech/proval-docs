---
id: 'c413c86c-d168-4809-ab13-a1c19df58773'
title: 'AD - Test for Weak Passwords - PowerShell Script'
title_meta: 'AD - Test for Weak Passwords - PowerShell Script'
keywords: ['active-directory', 'password', 'testing', 'infrastructure', 'database']
description: 'This document provides an overview of a PowerShell script designed to run on an Active Directory Infrastructure Master server. The script outputs data in a comma-separated format for database insertion and includes steps for checking directory existence, downloading necessary files, and testing password quality against user accounts.'
tags: ['active-directory', 'database', 'security', 'setup']
draft: true
unlisted: false
---

## Overview

This script runs on any Active Directory Infrastructure Master server and outputs data into a comma-separated format to be inserted into a database. This script can be easily modified to work in any solution.

## Requirements

The only requirement is that it needs to be run against an Infrastructure Master Domain Controller running Server 2016 or above. The script may work on older versions, but it has not been tested.

## Process

1. Checks to see if the `C:/Windows/LTSvc` directory exists.
   - If not, it will use the agnostic path of `C:/PwdTesting`.
2. Downloads 7-Zip if needed.
3. Downloads the specified Password Dictionary; if none is specified, it will default to the 9MB one.
4. Extracts the Password Dictionary zip file.
5. Installs the PowerShell module 'DSInternals'.
6. The script then runs the password test against all Active Directory user accounts.
7. Outputs the comma-separated string for use with inserting the values into the database.
8. If set, it will clean up the password dictionary files from the server after everything is done.
9. The script then outputs the information in a comma-separated value format to be easily imported into a database.

## Payload Usage

This script does not require any parameters to be passed to it. The script has been pasted below:

```
$CWAPath = "$((Get-Location).Drive.Name):/Windows/LTSvc"
$FolderName = "PwdTesting"
$AgnosticPath = "$((Get-Location).Drive.Name):/$FolderName"
$PwdDict = "400MB"
$DictFileName = "PasswordDict$PwdDict.7z"
$DC = hostname
$ValidData = $False
$CleanupAllFiles = $False
$CleanupTxtFile = $True

# Is Automate Installed? If so, place downloaded files in the LTSvc directory
If (Test-Path -Path $CWAPath) {
    # Make sure the directory for this exists
    If (Test-Path -Path "$CWAPath/$FolderName") {
        $DictFileLoc = "$CWAPath/$FolderName"
        # Write-Host "Debug: Verified \"$CWAPath/$FolderName\" Exists"
    }
    else {
        # Create Folder
        # Write-Host "Debug: Verified \"$CWAPath/$FolderName\" Did not exist. Creating"
        New-Item -Path $CWAPath -Name "$FolderName" -ItemType "directory"
        $DictFileLoc = "$CWAPath/$FolderName"
        If (Test-Path -Path "$CWAPath/$FolderName") {
        }
        else {
            Write-Host "Failed to create directory ($DictFileLoc). Exiting Script"
            Exit 
        }
    }
}
else {
    # Make sure the directory for this exists
    If (Test-Path -Path "$((Get-Location).Drive.Name):/$FolderName") {
        $DictFileLoc = $AgnosticPath
        # Write-Host "Debug: Looks Like Automate is not Installed - Switching to Agnostic: \"$AgnosticPath\""
    }
    else {
        # Create Folder
        New-Item -Path "$((Get-Location).Drive.Name):/" -Name "$FolderName" -ItemType "directory"
        $DictFileLoc = $AgnosticPath
        If (Test-Path -Path "$((Get-Location).Drive.Name):/$FolderName") {
            # Success. No Action Required
            # Write-Host "Debug: Verified \"$((Get-Location).Drive.Name):/$FolderName\" Exists"
        }
        else {
            Write-Host "Failed to create directory ($DictFileLoc). Exiting Script"
            Exit
        }
    }
}

# Download 7-Zip if required
If (Test-Path -Path "$DictFileLoc/7za.exe" -PathType leaf) {
    # No Download Required
    # Write-Host "Debug: Verified \"$DictFileLoc/7za.exe\" Exists - No Download required"
}
else {
    [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
    (New-Object System.Net.WebClient).DownloadFile("https://file.provaltech.com/repo/tools/7za.exe", "$DictFileLoc/7za.exe")
    If (Test-Path -Path "$DictFileLoc/7za.exe" -PathType leaf) {
        # Success. No action Required
        # Write-Host "Debug: Verified \"$DictFileLoc/7za.exe\" Exists after downloading"
    }
    else {
        Write-Host "Failed to Download 7-Zip"
        Exit 
    }
}

# Begin Downloading Proper Password Dictionary
if ($PwdDict -eq "140MB") {
    Write-Host "Dictionary File is set to 140MB file."
    $ValidData = $True
    $txtfilename = "rockyou.txt"
    If (Test-Path -Path "$DictFileLoc/$DictFileName" -PathType leaf) {
        # Success. No action Required
        # Write-Host "Debug: Verified \"$DictFileLoc/$DictFileName\". No Download Required."
    }
    else {
        If (Test-Path -Path "$DictFileLoc/$txtfilename" -PathType leaf) {
            # Success. No action Required
            # Write-Host "Debug: Verified \"$DictFileLoc/$DictFileName\" does not exist, but The Password Dictionary \"$DictFileLoc/$txtfilename\" Does Exist. No download required."
        }
        else {
            # Download File
            [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
            (New-Object System.Net.WebClient).DownloadFile("http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2", "$DictFileLoc/$DictFileName")    
            If (Test-Path -Path "$DictFileLoc/$DictFileName" -PathType leaf) {
                # Success. No action Required
                # Write-Host "Debug: Verified \"$DictFileLoc/$DictFileName\" after downloading."
            }
            else {
                Write-Host "Failed to download the password dictionary \"$DictFileLoc/$DictFileName\". Exiting Script."
                Exit
            }
        }
    }      
}

if ($PwdDict -eq "400MB") {
    # Write-Host "Debug: Dictionary File is set to 400MB file."
    $ValidData = $True
    $txtfilename = "hk_hlm_founds.txt"
    If (Test-Path -Path "$DictFileLoc/$DictFileName" -PathType leaf) {
        # Success. No action Required
        # Write-Host "Debug: Verified \"$DictFileLoc/$DictFileName\". No Download Required."
    }
    else {
        If (Test-Path -Path "$DictFileLoc/$txtfilename" -PathType leaf) {
            # Success. No action Required
            # Write-Host "Debug: Verified \"$DictFileLoc/$DictFileName\" does not exist, but The Password Dictionary \"$DictFileLoc/$txtfilename\" Does Exist. No download required."
        }
        else {
            [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
            (New-Object System.Net.WebClient).DownloadFile("https://download.weakpass.com/wordlists/1256/hk_hlm_founds.txt.gz", "$DictFileLoc/$DictFileName")
            If (Test-Path -Path "$DictFileLoc/$DictFileName" -PathType leaf) {
                # Success. No action Required
                # Write-Host "Debug: Verified \"$DictFileLoc/$DictFileName\" after downloading."
            }
            else {
                Write-Host "Failed to download the password dictionary \"$DictFileLoc/$DictFileName\". Exiting Script."
                Exit
            }
        }
    }
}

if ($PwdDict -eq "12GB") {
    # Write-Host "Debug: Dictionary File is set to 12GB file."
    $ValidData = $True
    $txtfilename = "weakpass_3w.txt"
    If (Test-Path -Path "$DictFileLoc/$DictFileName" -PathType leaf) {
        # Success. No action Required
        # Write-Host "Debug: Verified \"$DictFileLoc/$DictFileName\". No Download Required."
    }
    else {
        If (Test-Path -Path "$DictFileLoc/$txtfilename" -PathType leaf) {
            # Success. No action Required
            # Write-Host "Debug: Verified \"$DictFileLoc/$DictFileName\" does not exist, but The Password Dictionary \"$DictFileLoc/$txtfilename\" Does Exist. No download required."
        }
        else {
            [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
            (New-Object System.Net.WebClient).DownloadFile("https://download.weakpass.com/wordlists/1950/weakpass_3w.7z", "$DictFileLoc/$DictFileName")
            If (Test-Path -Path "$DictFileLoc/$DictFileName" -PathType leaf) {
                # Success. No action Required
                # Write-Host "Debug: Verified \"$DictFileLoc/$DictFileName\" after downloading."
            }
            else {
                Write-Host "Failed to download the password dictionary \"$DictFileLoc/$DictFileName\". Exiting Script."
                Exit
            }   
        }
    }
}

if ($ValidData) {
    # Nothing to do here. Already downloaded.
}
else {
    if ($PwdDict -eq "9MB") {
        # Do Nothing - This is normal
    }
    else {
        # Write-Host "Debug: Password Dictionary Setting Unmatched - Setting default 9MB Pwd List"
    }  
    $txtfilename = "ignis-1M.txt"
    $DictFileName = "PasswordDict9MB.7z"
    If (Test-Path -Path "$DictFileLoc/$DictFileName" -PathType leaf) {
        # Success. No action Required
        # Write-Host "Debug: Verified \"$DictFileLoc/$DictFileName\". No Download Required."
    }
    else {
        [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
        (New-Object System.Net.WebClient).DownloadFile("https://download.weakpass.com/wordlists/1937/ignis-1M.txt.7z", "$DictFileLoc/$DictFileName")
        If (Test-Path -Path "$DictFileLoc/$DictFileName" -PathType leaf) {
            # Success. No action Required
            # Write-Host "Debug: Verified \"$DictFileLoc/$DictFileName\" after downloading."
        }
        else {
            Write-Host "Failed to download the password dictionary \"$DictFileLoc/$DictFileName\". Exiting Script."
            Exit
        }
    }   
}

# Extract all files
$7zipEXE = "$DictFileLoc/7za.exe"
If (Test-Path -Path "$DictFileLoc/$txtfilename" -PathType leaf) {
    # Success. No action Required
    # Write-Host "Debug: Verified \"$DictFileLoc/$txtfilename\". No Extracting Required."
}
else {
    # 7-Zip Command Functions: https://sevenzip.osdn.jp/chm/cmdline/switches/index.htm
    Start-Process -FilePath $7zipEXE -ArgumentList "x $DictFileLoc/$DictFileName -aoa -o$DictFileLoc" -Wait -NoNewWindow -RedirectStandardOutput "./NUL"
    If (Test-Path -Path "$DictFileLoc/$txtfilename" -PathType leaf) {
        # Success. No action Required
        # Write-Host "Debug: Verified \"$DictFileLoc/$txtfilename\" after extracting"
    }
    else {
        Write-Host "Failed to Extract the password dictionary \"$DictFileLoc/$txtfilename\". Exiting Script."
        Exit
    }
}

# Write-Host "Debug: Password Dictionary Located Here - $DictFileLoc/$txtfilename"
If (Get-Module -ListAvailable -Name "DSInternals") {
    # Write-Host "Debug: DSInternals Module Exists"
}
else {
    # Write-Host "Debug: DSInternals Module does not exist - Installing"
    Install-Module DSInternals
    If (Get-Module -ListAvailable -Name "DSInternals") {
        # Write-Host "Debug: DSInternals Module Exists after installing"
    }
    else {
        Write-Host "Failed to install the DSInternals Module. Exiting Script"
        Exit
    }
}

# Sets Variables with output information
$Domain = (Get-ADDomain).DistinguishedName
$PasswordReport = Get-ADReplAccount -All -Server $DC -NamingContext $Domain | Test-PasswordQuality -WeakPasswordsFile "$DictFileLoc/$txtfilename"
$stringArrayDuplicatePW = $PasswordReport.DuplicatePasswordGroups | % {$_}
$stringArrayDuplicatePW = $stringArrayDuplicatePW.Replace((Get-ADDomain).NetBIOSName, '').Replace('//', '')
$FinalStringDuplicatePW = $stringArrayDuplicatePW -join ','
$stringArrayWeakPW = $PasswordReport.WeakPassword | % {$_}
$stringArrayWeakPW = $stringArrayWeakPW.Replace((Get-ADDomain).NetBIOSName, '').Replace('//', '')
$FinalStringWeakPW = $stringArrayWeakPW -join ','

# Get Formatted Duplicate Password List
$outstring = ""
$counter = 0
$PasswordReport.DuplicatePasswordGroups | % {
    $outstring += "Group $($counter + 1):`n"
    $_ | % {$outstring += "`t$($_)`n"}
    $counter++
}
$FormattedDuplicatePW = $outstring.Replace((Get-ADDomain).NetBIOSName, '').Replace('//', '')

# Write-Host "(Duplicate Password Groups: $StringArrayDuplicatePW, Weak Passwords Reported: $StringArrayWeakPW)"

# Get Extra Info for Custom Table
# Generate XML docs for the effective GPO to be able to select other settings
[string]$domain = (Get-WmiObject Win32_ComputerSystem).Domain
New-Item -ItemType Directory -Force -Path "c:/temp" | Out-Null
[string]$Path = "c:/temp/"
Get-GPOReport -All -Domain $domain -ReportType xml -Path $Path/GPOReportsAll.xml
[xml]$xmldocument = Get-Content $path/GPOReportsAll.xml
# Extra Information pulled from this GPO report that is unneeded for CWA. 
#$xmldocument.report.gpo.computer.extensiondata.extension.policy | Format-Table -AutoSize -Wrap -Property name, state | Out-String -Width 4096 | Out-File $Path/GPOReportsAllProcessed.text
#$xmldocument.report.gpo.computer.extensiondata.extension.policy | Where-Object {$_} | Export-CSV $path/GPOReportsAllProcessedcomputer.csv -NoTypeInformation
#$xmldocument.report.gpo.computer.extensiondata.extension.account | Where-Object {$_} | Export-CSV $path/GPOReportsAllProcessedAccount.csv -NoTypeInformation
$xmldocument.report.gpo.computer.extensiondata.extension.securityOptions.display | Where-Object {$_} | Export-CSV $path/GPOReportsAllProcessedSecu.csv -NoTypeInformation
# Set results
$ReversibleEncryptionEnabled = if ((Get-ADDefaultDomainPasswordPolicy | Select -Exp "ReversibleEncryptionEnabled") -eq 'False') {1} else {0}
$InteractiveLogonMsg = if ((Import-Csv $path/gporeportsallprocessedsecu.csv | Where-Object {$_ -eq "Interactive logon: Message text for users attempting to log on"} | Select -Exp name)) {1} else {0}

# Build Insert Statement. --Do NOT Modify. Things will break if the order changes--
Write-Host "$ReversibleEncryptionEnabled, $InteractiveLogonMsg, '$FinalStringDuplicatePW', '$FormattedDuplicatePW', '$FinalStringWeakPW'"

# Cleanup Files if specified
If ($CleanupTxtFile) {
    If ($CleanupAllFiles) {
        Remove-Item "$DictFileLoc/$txtfilename" -ErrorAction Ignore
        Remove-Item "$DictFileLoc/$DictFileName" -ErrorAction Ignore
    }
    else {
        Remove-Item "$DictFileLoc/$txtfilename" -ErrorAction Ignore
    }
}
else {
    If ($CleanupAllFiles) {
        Remove-Item "$DictFileLoc/$txtfilename" -ErrorAction Ignore
        Remove-Item "$DictFileLoc/$DictFileName" -ErrorAction Ignore
    }
    else {
        # Write-Host "Debug: Files are not set to be cleaned up. Leaving all files."
    }
}
```

## Output

The script currently writes the information to the console and is formatted to work with a database import function. It can be easily modified to output the information however it is desired.

```
Write-Host "$ReversibleEncryptionEnabled, $InteractiveLogonMsg, '$FinalStringDuplicatePW', '$FormattedDuplicatePW', '$FinalStringWeakPW'"
```

## Locations

| ConnectWise Automate | Attached to Doc - Move wherever is recommended |
|----------------------|-------------------------------------------------|
| Kaseya               | Attached to Doc - Move wherever is recommended  |
## Attachments
[TestADPasswords.ps1](<..\..\static\attachments\itg\9492883\TestADPasswords.ps1>)
