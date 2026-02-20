---
id: '5f0490f8-c2ce-4afe-92a0-d75699150a24'
slug: /5f0490f8-c2ce-4afe-92a0-d75699150a24
title: 'Install DNSFilter Agent'
title_meta: 'Install DNSFilter Agent'
keywords: ['dns', 'filter', 'agent', 'installation', 'windows', 'macintosh']
description: 'Deploys DNSFilter Agent on both windows and MAC machines.'
tags: ['installation', 'dns']
draft: false
unlisted: false
---

## Summary
Deploys DNSFilter Agent on both windows and MAC machines.

## Sample Run
![Sample Run](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/SampleRun.webp)

## Dependencies

- [Custom Field - DNSFilter Deployment Key](/docs/b4038e72-ef58-4e35-8b7b-cfe0e2536c87)
- [Solution - DNS Filter Agent Deployment](/docs/fd6fcda6-9a87-4275-b6eb-1a8f8f63099d)

## Task Creation

### Script Details

#### Step 1

Navigate to `Automation` ➞ `Tasks`  
![step1](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step1.webp)

#### Step 2

Create a new `Script Editor` style task by choosing the `Script Editor` option from the `Add` dropdown menu  
![step2](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step2.webp)

The `New Script` page will appear on clicking the `Script Editor` button:  
![step3](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/step3.webp)

#### Step 3

Fill in the following details in the `Description` section:  

- **Name:** `Install DNSFilter Agent`  
- **Description:** `Deploys DNSFilter Agent on both windows and MAC machines.`  
- **Category:** `Custom`

![Image1](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/image1.webp)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

#### Row 1: Set Pre-defined Variable ( @DeploymentKey@ = DNSFilter Deployment Key )

- **Variable Name:** `DeploymentKey`  
- **Type:** `Custom Field`  
- **Custom Field:** `DNSFilter Deployment Key`  
- **Continue on Failure:** `True`  
- **Operating System:** `Windows,MacOs`

![Image2](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/image2.webp)

#### Row 2: PowerShell script

- **Use Generative AI Assist for script creation:** `False`  
- **Expected time of script execution in seconds:** `600`  
- **Continue on Failure:** `False`  
- **Run As:** `System`  
- **Operating System:** `Windows`  
- **PowerShell Script Editor:**  

```PowerShell
#requires -RunAsAdministrator
#requires -Version 5.1
<#
.SYNOPSIS
Automates the deployment of the DNSFilter Agent.

.DESCRIPTION
This script performs a secure, automated installation of the DNSFilter Agent using custom fields for configuration. It ensures a clean environment, retrieves the required DNSFilter Key, downloads the latest agent installer, and executes the installation with appropriate parameters.

1. **Set Up Environment**:
   - Configures PowerShell preferences for silent progress and confirmation.
   - Sets TLS 1.2 for secure downloads.
   - Defines working directory, download URL, and custom field names.

2. **Prepare Working Directory**:
   - Removes any existing working directory for a clean setup.
   - Creates `C:\ProgramData\_Automation\Script\DNSFilter`.
   - Sets FullControl permissions for the `Everyone` group.

3. **Set Parameters**:
   - Retrieves the DNSFilter Key (`secretKey`) from the custom field `DNSFilter Deployment Key`.
   - Throws an error if the key is missing.

4. **Download the DNSFilter Agent Script**:
   - Downloads the DNSFilter installer from the official site.
   - Saves it to the working directory.
   - Throws an error if download fails.

5. **Execute the DNSFilter Installation Script**:
   - Installs the DNSFilter Agent using the retrieved key and MSI installer.

.NOTES
- Requires administrative privileges.
- Ensure the DNSFilter Key is set in the custom field `DNSFilter Deployment Key`.
- Outputs logs and errors to the working directory.

#>
# Begin block: Initialization and setup
Begin {
    $ErrorActionPreference = 'Stop'
    $WorkingDirectory = 'C:\ProgramData\_Automation\Script\DNSFilter'
    #endRegion
    $cfAcctKey = '@DeploymentKey@'
    if (-not [string]::IsNullOrEmpty($cfAcctKey)) {
        $secretKey = $cfAcctKey
    }
    else {
        throw 'An error occurred: DNSFilter Deployment Key is missing. Please set the DNSFilter Key in the Client custom field `DNSFilter Deployment Key`.'
    }
    ### Region Strapper ###
    $ProgressPreference = 'SilentlyContinue'
    [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
    Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
    try {
        Update-Module -Name Strapper -ErrorAction Stop
    }
    catch {
        Install-Module -Name Strapper -Repository PSGallery -SkipPublisherCheck -Force
        Get-Module -Name Strapper -ListAvailable | Where-Object { $_.Version -ne (Get-InstalledModule -Name Strapper).Version } | ForEach-Object { Uninstall-Module -Name Strapper -MaximumVersion $_.Version }
    }
    (Import-Module -Name 'Strapper') 3>&1 2>&1 1>$null
    Set-StrapperEnvironment

    ### Process ###

    #region Setup - Folder Structure
    if (!(Test-Path $WorkingDirectory)) {
        try {
            New-Item -Path $WorkingDirectory -ItemType Directory -Force | Out-Null
            Write-Log -Text "Created directory: $WorkingDirectory"
        }
        catch {
            Write-Log -Text "An error occurred: Failed to create $WorkingDirectory. Reason: $($_.Exception.Message)" -Level Error
            return
        }
    }

    try {
        $acl = Get-Acl $WorkingDirectory
        if (-not ($acl.Access | Where-Object { $_.IdentityReference -match 'Everyone' -and $_.FileSystemRights -match 'FullControl' })) {
            $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule('Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
            $acl.AddAccessRule($accessRule)
            Set-Acl $WorkingDirectory $acl
            Write-Log -Text "Set FullControl permissions for Everyone on $WorkingDirectory" -Level Information
        }
    }
    catch {
        Write-Log -Text "An error occurred: Failed to set permissions. Reason: $($_.Exception.Message)" -Level Error
        return
    }

    #endregion
}

# Process block: Execute the downloaded script with the specified parameters
Process {
    # Download and extract version
    $url = "https://download.dnsfilter.com/User_Agent/Windows/DNSFilter_Agent_Setup.msi"
    $MSIPath = "$WorkingDirectory\DNSFilter_Agent_Setup.msi"

    try {
        Invoke-WebRequest -Uri $url -OutFile $MSIPath
        Write-Log -Text 'Downloaded DNSFilter Agent MSI' -Level Information
    }
    catch {
        Write-Log -Text "An error occurred: Failed to download MSI. Reason: $($_.Exception.Message)" -Level Error
        return
    }

    try {
        $installer = New-Object -ComObject WindowsInstaller.Installer
        $database = $installer.GetType().InvokeMember("OpenDatabase", "InvokeMethod", $null, $installer, @($tempFile, 0))
        $query = "SELECT `Value` FROM `Property` WHERE `Property` = 'ProductVersion'"
        $view = $database.OpenView($query)
        $view.Execute()
        $record = $view.Fetch()
        $latestVersion = $record.StringData(1)
        Write-Log -Text "Latest DNSFilter Agent version: $latestVersion" -Level Information
    }
    catch {
        Write-Log -Text "An error occurred: Failed to read MSI version. Reason: $($_.Exception.Message)" -Level Error
        return
    }

    # Check existing application and version
    $dnsFilterApp = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'DNSFilter' } | Select-Object -First 1
    if ($dnsFilterApp) {
        $installedVersion = $dnsFilterApp.DisplayVersion
        Write-Log -Text "Installed DNSFilter Agent version: $installedVersion" -Level Information

        if ($installedVersion -eq $latestVersion) {
            Write-Log -Text 'DNSFilter Agent is up to date.' -Level Information
            Remove-Item -Path $WorkingDirectory -Recurse -Force
            return
        }
    }
    else {
        Write-Log -Text 'DNSFilter Agent not found in uninstall registry keys.' -Level  Warning
    }

    # Execute installation
    try {
        Start-Process -FilePath "msiexec.exe" -ArgumentList "/qn /i `"$tempFile`" NKEY=`"$secretKey`"" -Wait -NoNewWindow
        Write-Log -Text 'DNSFilter Agent installed successfully.' -Level Information
    }
    catch {
        Write-Log -Text "An error occurred: Installation failed. Reason: $($_.Exception.Message)" -Level Error
        return
    }
}
# End block: Final cleanup or additional actions (if needed)
End {}
```

![Image3](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/image3.webp)

#### Row 3: Bash script

- **Use Generative AI Assist for script creation:** `False`  
- **Expected time of script execution in seconds:** `600`  
- **Continue on Failure:** `False`  
- **Run As:** `System`  
- **Operating System:** `MacOs`  
- **Bash Script Editor:**

```bash
#!/bin/bash

# DNSFilter Installation Script for macOS

# Retrieve DNSFilter secret Key
secretkey="@DeploymentKey@"

# Validate secret Key exists
if [ -z "$secretkey" ]; then
    echo "DNSFilter Deployment Key is missing. Please set the DNSFilter Key in the Client custom field `DNSFilter Deployment Key`."
    exit 1
fi

# Define installer path and URL
installerPath="/tmp/DNSFilterAgent-Installer.pkg"
installerUrl="https://download.dnsfilter.com/User_Agent/MacOS/DNSFilter%20Agent-Installer.pkg"

# Download the installer
echo "Downloading DNSFilter installer..."
curl -L -o "$installerPath" "$installerUrl"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to download the DNSFilter installer"
    exit 1
fi

# Install the package
echo "Installing DNSFilter agent..."
sudo installer -pkg "$installerPath" -target /

# Wait for installation to complete
sleep 5

# Register the agent with the secret key
echo "Registering DNSFilter agent..."
/Applications/DNSFilter\ Agent.app/Contents/MacOS/agent register "$secretkey"

# Clean up
rm -f "$installerPath"

echo "DNSFilter agent installation and registration completed successfully."
```

![Image4](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/image4.webp)

#### Row 7: Script Log

- **Script Log Message:** `%Output%`  
- **Operating System:** `Windows`, `MacOs`

![Image5](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/image5.webp)


## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Image6](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/image6.webp)

## Deployment
This task has to be scheduled on the `DNSFilter Agent Deployment` group for auto deployment. The script can also be run manually if required.

- Go to Automations > Tasks.  
- Search for `Install DNSFilter Agent`.  
- Then click on Schedule and provide the parameter details as necessary for the script completion.

**Target Group**:
![Deployment1](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/Deployment1.webp)

**Complete Schedule Task**:
![Deployment2](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/Deployment2.webp)


## Output
- Script Logs