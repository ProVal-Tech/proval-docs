---
id: '50838fdf-4f88-4fa4-a3b2-f4827af7a86c'
slug: /50838fdf-4f88-4fa4-a3b2-f4827af7a86c
title: 'Threatlocker Deployment'
title_meta: 'Threatlocker Deployment'
keywords: ['threatlocker', 'deployment', 'windows', 'mac', 'installer']
description: 'This document provides a comprehensive guide on how to install Threatlocker on both Windows and Mac operating systems, including task creation, script implementation, and scheduling for auto deployment.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This task installs Threatlocker on both Windows and Mac operating systems.

## Sample Run

![Sample Run 1](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_4.webp)  
![Sample Run 2](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_5.webp)

## Dependencies

[CW RMM - Solution - Threatlocker Deployment](/docs/c9969bad-d2da-45ec-90fe-d6be82479ebc)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation Image 1](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_6.webp)  
![Task Creation Image 2](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_7.webp)

**Name:** `Threatlocker Deployment`  
**Description:** `This script will check for ThreatLocker and attempt to install it if not present. It matches the organization to the client name; if no match is found, it will create the company for you. By default, servers will be installed into the Servers group, and workstations will be installed into the Workstations group.`  
**Category:** `Custom`  
![Category Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_8.webp)

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_9.webp)

A blank function will appear.  
![Blank Function Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_10.webp)

### Row 1 Function: Set Pre-Defined Variable

- Select `Set Pre-Defined Variable` function  
![Row 1 Function Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_11.webp)

- Select `Custom Field`
- Input `Organization` as Variable name
- Select `Threatlocker_Organization_Name` custom field from the dropdown
- Click Save
- Limit this step to Windows OS by selecting `Windows` from the `Operating System` dropdown on the left side

### Row 2 Function: Set Pre-Defined Variable

- Select `Set Pre-Defined Variable` function  
![Row 2 Function Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_11.webp)

- Select `Custom Field`
- Input `ThreatLockerAuthKey` as Variable name
- Select `ThreatLockerAuthKey` custom field from the dropdown
- Click Save
- Limit this step to Windows OS by selecting `Windows` from the `Operating System` dropdown on the left side

### Row 3 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Script Function Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_12.webp)

The following function will pop up on the screen:  
![PowerShell Script Popup Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_13.webp)

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds. Click the `Save` button.

```powershell
[Net.ServicePointManager]::SecurityProtocol = "Tls12"
$UniqueIdentifier='@ThreatLockerAuthKey@'
$organizationName = '@Organization@'

# Check if ThreatLocker is already installed
$service = Get-Service -Name ThreatLockerService -ErrorAction SilentlyContinue;
if ($service.Name -eq "ThreatLockerService" -and $service.Status -eq "Running") {
    return "Already Installed";
}

# Check if directory exists and create if not
if (!(Test-Path "C:/ProgramData/_automation/script/Threatlocker")) {
    mkdir "C:/ProgramData/_automation/script/Threatlocker";
}

# Check the OS architecture and download the correct installer
try {
    if ([Environment]::Is64BitOperatingSystem) {
        $downloadURL = "https://api.threatlocker.com/updates/installers/threatlockerstubx64.exe";
    } else {
        $downloadURL = "https://api.threatlocker.com/updates/installers/threatlockerstubx86.exe";
    }
    $localInstaller = "C:/ProgramData/_automation/script/Threatlocker/ThreatLockerStub.exe";
    Invoke-WebRequest -Uri $downloadURL -OutFile $localInstaller -UseBasicParsing;
} catch {
    Write-Output "Failed to download the installer";
    return;
}

# Attempt install
try {
    & "C:/ProgramData/_automation/script/Threatlocker/ThreatLockerStub.exe" key=$UniqueIdentifier Company=$organizationName
} catch {
    Write-Output "Installation Failed";
    return
}

# Verify install
$service = Get-Service -Name ThreatLockerService -ErrorAction SilentlyContinue;
if ($service.Name -eq "ThreatLockerService" -and $service.Status -eq "Running") {
    Write-Output "Installation successful";
    return;
} else {
    # Check the OS type
    $osInfo = Get-CimInstance -ClassName Win32_OperatingSystem
    if ($osInfo.ProductType -ne 1) {
        Write-Output "Installation Failed";
        return
    }
}
```

![PowerShell Script Execution Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_14.webp)  
Limit this step to `Windows OS` only.

### Row 4: Function: Script Log

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.  
![Script Log Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_15.webp)

Limit this step to `Windows OS` only.

### Row 5 Function: Set Pre-Defined Variable

- Select `Set Pre-Defined Variable` function  
![Row 5 Function Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_16.webp)

- Select `Custom Field`
- Input `ThreatLockerMacGroupKey` as Variable name
- Select `ThreatLockerMacGroupKey` custom field from the dropdown
- Click Save
- Limit this step to Windows OS by selecting `MacOS` from the `Operating System` dropdown on the left side

### Row 6 Function: Command Prompt (CMD) Script

Search and select the `Command Prompt (CMD) Script` function.  
![CMD Script Function Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_17.webp)

The following function will pop up on the screen:  
![CMD Script Popup Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_18.webp)

Paste in the following bash script and set the expected time of script execution to `600` seconds. Click the `Save` button.

```bash
#!/bin/bash
GroupKey="@ThreatLockerMacGroupKey@"
#install
if [ ! -d /Applications/Threatlocker.app ]
then
    curl --output-dir "/Applications" -O https://updates.threatlocker.com/repository/mac/1.0/Threatlocker.app.zip
    echo "Downloading Threatlocker"
    open /Applications/Threatlocker.app.zip
    sleep 5
    osascript -e 'quit app "Finder"'
    rm -d /Applications/Threatlocker.app.zip
    if [ ! -d /Applications/Threatlocker.app ]
    then
        echo "Not able to download the file"
        exit 1
    else
        open /Applications/ThreatLocker.app --args -groupKey $GroupKey
        echo "Installing Threatlocker"
        sleep 15
        echo "Verifying Group Key"
        sleep 15
        if [ ! -d /Library/Application/Support/Threatlocker ]
        then
            echo "GroupKey is Invalid"
            exit 1
        else
            echo "Threatlocker Installed"
            exit 0
        fi
    fi
fi
```

![CMD Script Execution Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_19.webp)  
Limit this step to `Mac OS` only.

### Row 7: Function: Script Log

In the script log message, simply type `%output%` so that the script will send the results of the bash script above to the output on the Automation tab for the target device.  
![Script Log Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_20.webp)

Limit this step to `Mac OS` only.

## Completed Task

![Completed Task Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_21.webp)

## Implementation

This task has to be scheduled on **`[CW RMM - Dynamic Group - Deploy Threatlocker](/docs/8645a522-a9e3-4755-a498-32c2904e51c6)`** group for auto deployment. The script can also be run manually if required.

Go to Automations > Tasks.  
Search for Threatlocker Deployment.  
Then click on Schedule and provide the parameters detail as necessary for the script completion.  
![Implementation Image](../../../static/img/docs/0298665b-0c3d-41de-83ee-bbf3b9d5cd8e/image_22.webp)

## Output

Script Log

