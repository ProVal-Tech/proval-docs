---
id: '79f777ee-3d90-43c9-a6dd-8e28444a260a'
slug: /79f777ee-3d90-43c9-a6dd-8e28444a260a
title: 'Get-LenovoWarrantyInfo'
title_meta: 'Get-LenovoWarrantyInfo'
keywords: ['lenovo', 'lenovo-workstations', 'warranty', 'warranty-info', 'lenovo-warranty']
description: 'Retrieves Lenovo device warranty information using Lenovo''s public API. This script is designed for Lenovo workstations running Windows 10 or Windows 11 and returns the warranty start date, end date, and days remaining on the warranty.'
tags: ['lenovo', 'api', 'data-collection']
draft: false
unlisted: false
---

## Overview

Retrieves Lenovo device warranty information using Lenovo's public API. This script is designed for Lenovo workstations running Windows 10 or Windows 11 and returns the warranty start date, end date, and days remaining on the warranty.

## Requirements

- Lenovo device (manufacturer must be 'Lenovo')
- Windows 10 or Windows 11
- PowerShell 5.1 or later
- Internet connectivity
- Strapper PowerShell module (auto-installed if missing)
- NuGet package provider (auto-installed if missing)

## Process

The script performs the following steps:

1. **Parameter and Globals Setup**
    - Declares the script as an advanced function with `[CmdletBinding()]`.
    - Sets `$ProgressPreference` to 'SilentlyContinue' and `$ConfirmPreference` to 'None'.

2. **Variables**
    - Defines the Lenovo warranty API endpoint URL.

3. **TLS Policy Configuration**
    - Checks for supported TLS versions (TLS 1.2 and 1.3).
    - Sets the highest available TLS version for secure API communication.
    - Warns if neither TLS 1.2 nor 1.3 is available.

4. **Strapper Module Setup**
    - Ensures the NuGet package provider is installed and bootstrapped.
    - Sets the PSGallery repository as trusted.
    - Updates or installs the 'Strapper' module as needed.
    - Removes any older versions of 'Strapper' to avoid conflicts.
    - Imports the 'Strapper' module and sets up the environment.

5. **Initial System Checks**
    - Verifies the device manufacturer is 'Lenovo'.
    - Checks the OS name to ensure it is Windows 10 or Windows 11.

6. **Warranty Information Retrieval**
    - Retrieves the device serial number from the BIOS.
    - Constructs a JSON payload with the serial number, country ('us'), and language ('en').
    - Sends a POST request to the Lenovo warranty API.
    - Handles any errors during the API call and logs them.

7. **Warranty Data Parsing**
    - Parses the JSON response to extract warranty start and end dates.
    - Sorts and selects the most recent start and end dates.
    - Calculates the number of days left on the warranty.

8. **Output**
    - Constructs a custom PowerShell object containing:
        - `warrantyStart`: Warranty start date (string)
        - `warrantyEnd`: Warranty end date (string)
        - `daysLeft`: Number of days remaining (float)
    - Logs the warranty information.
    - Returns the object as the script output.

9. **Logging**
    - Uses a `Write-Log` function (from the 'Strapper' module) to log errors, warnings, and information.

**Error Handling**
    - All critical operations are wrapped in try/catch blocks. Errors are logged and the script exits gracefully if a failure occurs.

**Security**
    - Ensures secure communication with Lenovo's API by enforcing TLS 1.2 or 1.3.

**Extensibility**
    - The script can be modified to support additional countries or languages by changing the payload.

## Payload Usage

```powershell
./Get-LenovoWarrantyInfo.ps1
```

## Output

The script returns a PowerShell object with the following properties:

- `warrantyStart` (string): Warranty start date.
- `warrantyEnd` (string): Warranty end date.
- `daysLeft` (float): Number of days remaining on the warranty.

Log and error files:  
- .\Get-LenovoWarrantyInfo-log.txt  
- .\Get-LenovoWarrantyInfo-error.txt
