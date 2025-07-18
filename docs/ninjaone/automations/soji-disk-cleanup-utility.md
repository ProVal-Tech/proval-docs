---
id: 'ef289b50-fe18-4114-93d0-680437f7c480'
slug: /ef289b50-fe18-4114-93d0-680437f7c480
title: 'Soji (Disk Cleanup Utility)'
title_meta: 'Soji (Disk Cleanup Utility)'
keywords: ['disk', 'cleanup', 'utility', 'windows', 'ninjaone']
description: 'This document provides a comprehensive guide on creating the Soji disk cleanup Task in ConnectWise RMM. Soji is a smart disk cleanup utility designed to enhance system cleanliness on Windows, utilizing native System.IO file and directory management along with COM references to the deprecated cleanmgr tool.'
tags: ['cleanup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

Soji is a smart yet straightforward disk cleanup utility designed to enhance system cleanliness on Windows. It utilizes both native System.IO file and directory management along with COM references to the deprecated cleanmgr tool.

This document provides a guide on creating the Soji disk cleanup automation in Ninja One.

Please reference [Soji](/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc) for argument usage.

## Sample Run

![Image](../../../static/img/docs/ef289b50-fe18-4114-93d0-680437f7c480/image1.webp)

![Image](../../../static/img/docs/ef289b50-fe18-4114-93d0-680437f7c480/image2.webp)

![Image](../../../static/img/docs/ef289b50-fe18-4114-93d0-680437f7c480/image3.webp)  
![Image](../../../static/img/docs/soji-disk-cleanup-utility/image-2.png)

## Dependencies

- [Soji](/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc)
- [cPVAL Soji Result](/docs/0d8c8069-8883-4135-b322-da61e1a932e0)

## Automation Setup/Import

Add a "New Script" to the Automation library for this automation.  
![Image](../../../static/img/docs/ef289b50-fe18-4114-93d0-680437f7c480/image5.webp)

- **Name:** `Soji (Disk Cleanup Utility)`  
- **Description:** `Soji is an intelligent yet simple disk cleanup utility that uses both native System.IO file and directory management and COM references to the deprecated cleanmgr tool to tidy up one or more volumes on a Windows system.`  
- **Category:** `Maintenance`  
- **Language:** `PowerShell`  
- **Operating System:** `Windows`  
- **Architecture:** `All`  
- **Run As:** `System`  

![Image](../../../static/img/docs/ef289b50-fe18-4114-93d0-680437f7c480/image6.webp)

Paste in the following PowerShell script into the Ninja One editor

![Image](../../../static/img/docs/ef289b50-fe18-4114-93d0-680437f7c480/image7.webp)

```PowerShell
# Set working directory and paths
$WorkingDirectory = "$Env:SystemDrive\ProgramData\_automation\script\$env:ExeName"
$EXEPath = "$WorkingDirectory\$env:ExeName.exe"

# Create working directory
New-Item -Type Directory -Path $WorkingDirectory -ErrorAction SilentlyContinue | Out-Null

# Check and install .NET 8 Runtime if needed
$dotnetRuntimes = (dotnet --list-runtimes 2>$null) -join " "
if($dotnetRuntimes -notmatch "WindowsDesktop\.App 8") {
  Write-Host "Installing .NET 8 Desktop Runtime..."
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  $dotnetInstallerPath = Join-Path $WorkingDirectory "windowsdesktop-runtime-8.0.11-win-x64.exe"
  try {
    (New-Object System.Net.WebClient).DownloadFile(
      'https://download.visualstudio.microsoft.com/download/pr/27bcdd70-ce64-4049-ba24-2b14f9267729/d4a435e55182ce5424a7204c2cf2b3ea/windowsdesktop-runtime-8.0.11-win-x64.exe', $dotnetInstallerPath
    )
    $process = Start-Process -FilePath $dotnetInstallerPath -ArgumentList "/quiet", "/norestart" -NoNewWindow -Wait -PassThru
    if ($process.ExitCode -ne 0) {
      Write-Error "Failed to install .NET 8 Runtime. Exit code: $($process.ExitCode)"
      exit 1
    }
    Remove-Item $dotnetInstallerPath -Force -ErrorAction SilentlyContinue
  }
  catch {
    Write-Error "Failed to download or install .NET 8 Runtime: $_"
    exit 1
  }
}

# Download the main executable
[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
try {
  (New-Object System.Net.Webclient).DownloadFile("https://file.provaltech.com/repo/app/$env:ExeName.exe", $EXEPath)
}
catch {
  Write-Error "Failed to download application: $_"
  exit 1
}

if (!(Test-Path -Path $EXEPath)) {
  Write-Error -Message 'An error occurred and the application was unable to be downloaded. Exiting.'
  exit 1
}

# List of potential parameters to check
$PossibleParameters = @(
  # Boolean/switch parameters
  'Json',
  'Csv',
  'All',
  'Debug',
  # String value parameters
  'Drives',
  'Days',
  'SystemPaths',
  'UserPaths',
  'WinsxsSeconds',
  # Hyphenated parameters (stored without hyphens in env vars)
  'PurgeDownloads',
  'CleanWinsxs',
  'RunCleanmgr',
  'EmptyRecyclebin'
)

# Create an array to store our parameters
$Parameters = @()

# Parameter mapping for hyphenated parameters
$HyphenMapping = @{
  'PurgeDownloads' = 'purge-downloads'
  'CleanWinsxs' = 'clean-winsxs'
  'RunCleanmgr' = 'run-cleanmgr'
  'EmptyRecyclebin' = 'empty-recyclebin'
}

# Check each possible parameter
foreach ($Param in $PossibleParameters) {
  $EnvVar = Get-Item "Env:$Param" -ErrorAction SilentlyContinue
  if ($EnvVar -and $EnvVar.Value -and $EnvVar.Value -notlike "null") {
    # Handle different parameter types
    switch ($Param) {
      # Boolean/switch parameters
      { $_ -in @('Json','Csv','All','Debug') } {
        if ($EnvVar.Value.ToLower() -eq 'true') {
          $Parameters += "--$($Param.ToLower())"
        }
      }
      # String value parameters
      { $_ -in @('Drives','Days','SystemPaths','UserPaths','WinsxsSeconds') } {
        $paramName = $_.ToLower()
        if ($_ -eq 'WinsxsSeconds') { $paramName = 'winsxs-seconds' }
        $Parameters += "--$paramName"
        $Parameters += "`"$($EnvVar.Value)`""
      }
      # Hyphenated parameters
      { $HyphenMapping.ContainsKey($_) } {
        if ($EnvVar.Value.ToLower() -eq 'true') {
          $Parameters += "--$($HyphenMapping[$_])"
        }
      }
    }
  }
}

# Execute the exe with all collected parameters
Set-Location -Path $WorkingDirectory
& $EXEPath @Parameters

# Write log files path
Write-Information "Script logs location: $WorkingDirectory\Sojilogs" -InformationAction Continue

# Write script results to custom field
$ResultSummary = Import-Csv -Path $WorkingDirectory\Sojilogs\soji-summary.csv

if ([Int64]$ResultSummary.freedspace -gt 1073741824) {
  [string]$SpaceReturned = [Math]::Round($ResultSummary.freedspace /1GB,2)
  $SpaceReturned += " GB"
} 
elseif ([Int64]$ResultSummary.freedspace -gt 1048576) {
  [string]$SpaceReturned = [Math]::Round($ResultSummary.freedspace /1MB,2)
  $SpaceReturned += " MB"
}
elseif ([Int]$ResultSummary.freedspace -gt 1024) {
  [string]$SpaceReturned = [Math]::Round($ResultSummary.freedspace /1KB,2)
  $SpaceReturned += " KB"
}
elseif ([Int]$ResultSummary.freedspace -eq 0) {
  $SpaceReturned = "0 bytes"
}
else {
  [string]$SpaceReturned = $ResultSummary.freedspace
  $SpaceReturned += " bytes"
}
$Date = Get-Date -Format "MM/dd/yyyy HH:mm"
$CFOutput = "Soji last run (" + $Date + ") - Results: Removed " + $ResultSummary.CleanedFileCount + " files, returned " + $SpaceReturned + " to the device."
Ninja-Property-Set cpvalSojiResult $CFOutput
```

![Image](../../../static/img/docs/ef289b50-fe18-4114-93d0-680437f7c480/image8.webp)

### Script Variables

Click the `Add` button next to Script Variables.  
![Image](../../../static/img/docs/ef289b50-fe18-4114-93d0-680437f7c480/image9.webp)

Select the appropriate variable type (referenced below)  
![Image](../../../static/img/docs/ef289b50-fe18-4114-93d0-680437f7c480/image10.webp)

Fill in the values as required (referenced below)  
![Image](../../../static/img/docs/ef289b50-fe18-4114-93d0-680437f7c480/image11.webp)

In the box fill in the following details one by one and click `Add` button to create the script variables.

- **Variable Name:** `ExeName`  
    - **Variable Type:** `String`  
    - **Description:** `(Do Not Modify) Name of the executable from the ProVal file repository.`  
    - **Default Value:** `Soji`  
    - **Mandatory:** `true`  

- **Variable Name:** `Drives`  
    - **Variable Type:** `String`  
    - **Description:** `(Default: All fixed drives) A comma-separated list of volume letters to process.`  
    - **Default Value:**  
    - **Mandatory:** `false`  

- **Variable Name:** `All`  
    - **Variable Type:** `CheckBox`  
    - **Description:** `(Default: false) Enable all possible cleaning tools (--purge-downloads, --clean-winsxs, --run-cleanmgr, --empty-recyclebin)`  
    - **Default Value:** `Unchecked`  
    - **Mandatory:** `false`  

- **Variable Name:** `Days`  
    - **Variable Type:** `Integer`  
    - **Description:** `(Default: 7.0) The maximum number of days between now and the last write time of files to keep.`  
    - **Default Value:**  
    - **Mandatory:** `false`  

- **Variable Name:** `Purge Downloads`  
    - **Variable Type:** `CheckBox`  
    - **Description:** `(Default: false) Purge all user Downloads folders.`  
    - **Default Value:** `Unchecked`  
    - **Mandatory:** `false`  

- **Variable Name:** `Clean WinSxS`  
    - **Variable Type:** `CheckBox`  
    - **Description:** `(Default: false) Enable WinSxS component cleanup.`  
    - **Default Value:** `Unchecked`  
    - **Mandatory:** `false`  

- **Variable Name:** `Run cleanmgr`  
    - **Variable Type:** `CheckBox`  
    - **Description:** `(Default: false) Enable legacy cleanmgr execution.`  
    - **Default Value:** `Unchecked`  
    - **Mandatory:** `false`  

- **Variable Name:** `Empty Recyclebin`  
    - **Variable Type:** `CheckBox`  
    - **Description:** `(Default: false) Empty the recycle bin. May still occur when running the legacy cleanmgr.`  
    - **Default Value:** `Unchecked`  
    - **Mandatory:** `false`  

- **Variable Name:** `WinSxS Seconds`  
    - **Variable Type:** `Integer`  
    - **Description:** `(Default: 300) The number of seconds to wait for WinSxS processing when --clean-winsxs or --all is passed.`  
    - **Default Value:**  
    - **Mandatory:** `false`  

- **Variable Name:** `Json`  
    - **Variable Type:** `CheckBox`  
    - **Description:** `(Default: false) Include JSON file output.`  
    - **Default Value:** `Unchecked`  
    - **Mandatory:** `false`  

- **Variable Name:** `Csv`  
    - **Variable Type:** `CheckBox`  
    - **Description:** `(Default: true) Include CSV file output. Required for custom field output.`  
    - **Default Value:** `Checked`  
    - **Mandatory:** `false`  

- **Variable Name:** `Debug`  
    - **Variable Type:** `CheckBox`  
    - **Description:** `(Default: false) Set this flag to enable debug output in the console.`  
    - **Default Value:** `Unchecked`  
    - **Mandatory:** `false`  

- **Variable Name:** `System Paths`  
    - **Variable Type:** `String`  
    - **Description:** `(Default: null) An optional comma separated list of additional paths to scan for files to clean with regex file filtering.`  
    - **Default Value:**  
    - **Mandatory:** `false`  

- **Variable Name:** `User Paths`  
    - **Variable Type:** `String`  
    - **Description:** `(Default: null) An optional comma separated list of additional user paths to scan with regex file filtering.`  
    - **Default Value:**  
    - **Mandatory:** `false`

Click the Save button to save the Automation.  
![Image](../../../static/img/docs/ef289b50-fe18-4114-93d0-680437f7c480/image12.webp)

## Completed Automation

![Image](../../../static/img/docs/ef289b50-fe18-4114-93d0-680437f7c480/image13.webp)

## Output

- Activity Details
    ![Image](../../../static/img/docs/ef289b50-fe18-4114-93d0-680437f7c480/image14.webp)

- Custom Field
    ![Image](../../../static/img/docs/soji-disk-cleanup-utility/image-1.png)