---
id: '6457fdae-9e34-4f8a-8339-ec132baadc16'
slug: /6457fdae-9e34-4f8a-8339-ec132baadc16
title: 'Remove Windows.old - Windows'
title_meta: 'Remove Windows.old - Windows'
keywords: ['windows','cleanup']
description: 'This script will remove the C:\Windows.old directory if it is found on the endpoint.'
tags: ['cleanup','windows']
draft: false
unlisted: false
---

## Overview

This script will remove the C:\Windows.old directory if it is found on the endpoint.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

Search and select `Remove Windows.old - Windows`
![Image1](../../../static/img/docs/remove-windows-old/image.png)

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

- **Name:** `Remove Windows.old - Windows`  
- **Description:**  `This script will remove the 'C:\Windows.old' directory if it is found on the endpoint.`  
- **Categories:** `ProVal`  
- **Language:**  `PowerShell`  
- **Operating System:** `Windows`  
- **Architecture:** `All`  
- **Run As:** `System`

![Image2](../../../static/img/docs/remove-windows-old/image-1.png)

## Step 4

Paste the following powershell script in the scripting section:  

```PowerShell
if (Test-Path 'C:\Windows.old') { 
  try {
    Write-Host "Attempting to remove Windows.old directory"
    Remove-Item C:\Windows.old -Recurse
  }
  catch {
    Write-Host "An error occurred: Failed to remove Windows.old directory. Reason: $($_.Exception.Message)" -Level Error
    return
  }
  if (!Test-Path 'C:\Windows.old') {
    Write-Host "Windows.old directory successfully removed."
  }
} 
else {
  Write-Host "Windows.old directory does not exist"
}
```

![Image3](../../../static/img/docs/remove-windows-old/image-2.png)

## Saving the Automation

Click the Save button in the top-right corner of the screen to save your automation.  
![SaveButton](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/savebutton.webp)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/mfa.webp)

## Completed Automation

![Image4](../../../static/img/docs/remove-windows-old/image-3.png)

## Output

- Activity Details  
