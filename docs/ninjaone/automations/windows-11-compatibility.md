---
id: 'fd6f7153-0a36-4a0b-a46d-ce403f13a540'
slug: /fd6f7153-0a36-4a0b-a46d-ce403f13a540
title: 'Windows 11 Compatibility'
title_meta: 'Windows 11 Compatibility'
keywords: ['Windows', 'compatibility', 'upgrade']
description: 'Runs the Microsoft Hardware Readiness Script to verify the hardware compliance.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Overview

Runs the Microsoft Hardware Readiness Script to verify the hardware compliance.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

Search and select `Windows 11 Compatibility`
![alt text](../../../static/img/docs/windows-11-compatibility/image.png)

Set the required arguments and click the `Run` button to run the script.  
**Run As:** `System`  
**Preset Parameter:** `<Leave it Blank>`  

![ImageRun](../../../static/img/docs/windows-11-compatibility/image-1.png)

**Run Automation:** `Yes`  
![RunAutomation](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/runautomation.webp)

## Dependencies

- [Custom field - cPVAL Win 11 Compatibility](/docs/7967028d-d2ff-4afe-a89e-437541c70208)  
- [Solution - Windows 11 Compatibility Validation](/docs/fa172fda-07d3-4a7c-bb17-5e7179db991a)

## Automation Setup/Import

### Step 1

Navigate to `Administration` > `Library` > `Automation`  
![Step1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/step1.webp)

### Step 2

Locate the `Add` button on the right-hand side of the screen, click on it and click the `New Script` button.  
![Step2](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/step2.webp)

The scripting window will open.  
![ScriptingScreen](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/scriptingscreen.webp)

### Step 3

Configure the `Create Script` section as follows:

- **Name:** `Windows 11 Compatibility`  
- **Description:** `Runs the Microsoft Hardware Readiness Script to verify the hardware compliance.`  
- **Categories:** `<Leave it blank>`  
- **Language:** `PowerShell`  
- **Operating System:** `Windows`  
- **Architecture:** `All`  
- **Run As:** `System`  

![Script](../../../static/img/docs/windows-11-compatibility/image-2.png)

## Step 4

Paste the following powershell script in the scripting section:  

```PowerShell
# Define working directory and script path
$WorkingDirectory = "$Env:SystemDrive\ProgramData\_automation\script\HardwareReadiness"
$PS1Path = "$WorkingDirectory\HardwareReadiness.ps1"

try {
    # Create directory if it doesn't exist
    if (-not (Test-Path -Path $WorkingDirectory)) {
        New-Item -Type Directory -Path $WorkingDirectory -Force | Out-Null
    }

    # Set TLS 1.2
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    # Download the script
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile("https://aka.ms/HWReadinessScript", $PS1Path)

    # Verify download
    if (-not (Test-Path -Path $PS1Path)) {
        throw "Script download failed"
    }

    # Execute script and capture output
    $scriptOutput = & $PS1Path

    # Get the last line which contains the JSON
    $jsonOutput = $scriptOutput | Select-Object -Last 1

    # Convert the JSON output
    $result = $jsonOutput | ConvertFrom-Json

    # Store the result in a variable
    $compatibilityStatus = $result.returnResult

    # Store the status in a custom field
    Ninja-Property-Set cpvalWin11Compat $compatibilityStatus
    Write-Output "Windows 11 Compatibility Status: $compatibilityStatus"

    # Format output for Ninja
    $output = @{
        Result = $result.returnResult
        Details = $result.logging
        ExitCode = $result.returnCode
    }

    # Output results
    $output | ConvertTo-Json

} catch {
    $errorOutput = @{
        Result = "ERROR"
        Details = $_.Exception.Message
        ExitCode = 1
    }
    $errorOutput | ConvertTo-Json
    exit 1
}
```

![NinjaPowerShell](../../../static/img/docs/windows-11-compatibility/image-4.png)

## Saving the Automation

Click the `Save` button in the top-right corner of the screen to save your automation.  
![SaveButton](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/savebutton.webp)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/mfa.webp)

## Completed Automation

![NinjaScript](../../../static/img/docs/windows-11-compatibility/image-3.png)

## Output

- Activity Details