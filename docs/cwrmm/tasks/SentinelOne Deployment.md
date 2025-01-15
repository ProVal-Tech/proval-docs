---
id: '25651d1f-99d6-4906-8666-220994a4862e'
title: 'SentinelOne Deployment'
title_meta: 'SentinelOne Deployment for Windows, Linux, and Mac'
keywords: ['sentinelone', 'deployment', 'agent', 'windows', 'linux', 'mac', 'security']
description: 'This document provides a comprehensive guide on deploying the SentinelOne agent across Windows, Linux, and Mac machines, detailing the necessary tasks, scripts, and configurations required for successful installation and management of the agent.'
tags: ['security', 'installation', 'setup', 'windows', 'linux', 'mac']
draft: false
unlisted: false
---
## Summary

This task deploys the SentinelOne agent on Windows, Linux, and Mac machines.

## Sample Run

![Sample Run 1](../../../static/img/SentinelOne-Deployment/image_7.png)

![Sample Run 2](../../../static/img/SentinelOne-Deployment/image_8.png)

## Dependencies

[CW RMM - Solution - SentinelOne Deployment](https://proval.itglue.com/DOC-5078775-15822040)

## Variables

| Name         | Description                                         |
|--------------|-----------------------------------------------------|
| S1SiteToken  | Site Token to install SentinelOne agent             |
| Output       | Output of the previously executed PowerShell script. |

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation 1](../../../static/img/SentinelOne-Deployment/image_9.png)
![Task Creation 2](../../../static/img/SentinelOne-Deployment/image_10.png)

**Name:** SentinelOne Deployment  
**Description:** This task deploys the SentinelOne agent on Windows, Linux, and Mac machines.  
**Category:** Security  
![Task Creation 3](../../../static/img/SentinelOne-Deployment/image_11.png)

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/SentinelOne-Deployment/image_12.png)

A blank function will appear.

![Blank Function](../../../static/img/SentinelOne-Deployment/image_13.png)

### Row 1 Logic: If/Then/Else

![Row 1 Logic](../../../static/img/SentinelOne-Deployment/image_14.png)

#### ROW 1a Condition: Custom Field Contains

Select the `Custom Field` from the dropdown menu.

![Select Custom Field 1](../../../static/img/SentinelOne-Deployment/image_15.png)
![Select Custom Field 2](../../../static/img/SentinelOne-Deployment/image_16.png)

Search and select the `SentinelOne Group Key` custom field and type `NA` in the comparator and change Contains to Does not Equal and press `Enter`.

![Condition Setup](../../../static/img/SentinelOne-Deployment/image_17.png)

#### ROW 1b Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.

![Set Pre-defined Variable 1](../../../static/img/SentinelOne-Deployment/image_18.png)
![Set Pre-defined Variable 2](../../../static/img/SentinelOne-Deployment/image_19.png)

The following function will pop up on the screen:

![Set Pre-defined Variable Function](../../../static/img/SentinelOne-Deployment/image_20.png)

- Type `S1SiteToken` in the `Variable Name` field.
- Select the `Custom Field` Radio button.
- Search and select the Site-level `SentinelOne Group Key` Custom Field in the `Search Custom Field` field.
- Click the `Save` button to save the changes.
- Select `Windows` as Operating System.

![Windows Selection 1](../../../static/img/SentinelOne-Deployment/image_21.png)
![Windows Selection 2](../../../static/img/SentinelOne-Deployment/image_22.png)

#### ROW 1c Function: Set Pre-defined Variable

Repeat the Row 1b steps but limit the pre-defined variable to MAC machines.

![MAC Selection 1](../../../static/img/SentinelOne-Deployment/image_23.png)
![MAC Selection 2](../../../static/img/SentinelOne-Deployment/image_24.png)

#### ROW 1d Function: Set Pre-defined Variable

Repeat the Row 1b steps but limit the pre-defined variable to Linux machines.

![Linux Selection 1](../../../static/img/SentinelOne-Deployment/image_23.png)
![Linux Selection 2](../../../static/img/SentinelOne-Deployment/image_25.png)

#### ROW 1e Logic: If/Then/Else

Add if/then/else logic in the else section.

![Row 1e Logic](../../../static/img/SentinelOne-Deployment/image_14.png)

##### ROW 1e(i) Condition: Custom Field Contains

Select the `Custom Field` from the dropdown menu inside the If section of the inner If else.

![Select Custom Field 3](../../../static/img/SentinelOne-Deployment/image_15.png)
![Select Custom Field 4](../../../static/img/SentinelOne-Deployment/image_16.png)

Search and select the `SentinelOne Site Key` custom field and type `NA` in the comparator and change Contains to Does not Equal and press `Enter`.

![Condition Setup 2](../../../static/img/SentinelOne-Deployment/image_26.png)

##### ROW 1e(ii) Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function inside the If section of the inner If else.

![Set Pre-defined Variable 3](../../../static/img/SentinelOne-Deployment/image_18.png)
![Set Pre-defined Variable 4](../../../static/img/SentinelOne-Deployment/image_19.png)

The following function will pop up on the screen:

![Set Pre-defined Variable Function 2](../../../static/img/SentinelOne-Deployment/image_20.png)

- Type `S1SiteToken` in the `Variable Name` field.
- Select the `Custom Field` Radio button.
- Search and select the Site-level `SentinelOne SiteKey` Custom Field in the `Search Custom Field` field.
- Click the `Save` button to save the changes.
- Select `Windows` as Operating System.

![Windows Selection 3](../../../static/img/SentinelOne-Deployment/image_27.png)
![Windows Selection 4](../../../static/img/SentinelOne-Deployment/image_28.png)

##### ROW 1e(iii) Function: Set Pre-defined Variable

Repeat the ROW 1e(ii) steps but limit the pre-defined variable to MAC machines.

![MAC Selection 3](../../../static/img/SentinelOne-Deployment/image_29.png)
![MAC Selection 4](../../../static/img/SentinelOne-Deployment/image_30.png)

##### ROW 1e(iv) Function: Set Pre-defined Variable

Repeat the ROW 1e(ii) steps but limit the pre-defined variable to Linux machines.

![Linux Selection 3](../../../static/img/SentinelOne-Deployment/image_29.png)
![Linux Selection 4](../../../static/img/SentinelOne-Deployment/image_25.png)

##### ROW 1e(v) Function: Script Exit

Click the `Add Row` button inside the `else` section of inner if/else.

![Add Row 2](../../../static/img/SentinelOne-Deployment/image_31.png)
![Add Row 3](../../../static/img/SentinelOne-Deployment/image_32.png)

Search and select the `Script Exit` function in the newly appeared row.

![Script Exit 1](../../../static/img/SentinelOne-Deployment/image_33.png)
![Script Exit 2](../../../static/img/SentinelOne-Deployment/image_34.png)

The following function will pop up on the screen:

![Script Exit Function](../../../static/img/SentinelOne-Deployment/image_35.png)

Type the below error message inside the `Error Message` box and hit save.

```
SentinelOne Group/Site key were not set. Please review the Company/Site custom fields and fill either of them, and then re-run the script.
```

![Error Message](../../../static/img/SentinelOne-Deployment/image_36.png)

##### ROW 1e(vi) Function: Script Exit

Repeat the ROW 1e(v) steps but limit the Script Exit function to MAC machines.

![MAC Exit](../../../static/img/SentinelOne-Deployment/image_37.png)

##### ROW 1e(vii) Function: Script Exit

Repeat the ROW 1e(v) steps but limit the Script Exit function to Linux machines.

![Linux Exit](../../../static/img/SentinelOne-Deployment/image_38.png)

### Row 2 Function: PowerShell Script

Add a new row by clicking on the `Add Row` button.

![Add Row 4](../../../static/img/SentinelOne-Deployment/image_39.png)

A blank function will appear.

![Blank Function 2](../../../static/img/SentinelOne-Deployment/image_13.png)

Search and select the `PowerShell Script` function.

![PowerShell Script Function](../../../static/img/SentinelOne-Deployment/image_40.png)

The following function will pop up on the screen:

![PowerShell Script Popup](../../../static/img/SentinelOne-Deployment/image_41.png)

Paste in the following PowerShell script and leave the expected time of script execution to `300` seconds. Click the `Save` button.

```
$regInstallPath = 'HKLM://SYSTEM//CurrentControlSet//Services//SentinelAgent//config'
if (Test-Path -Path $regInstallPath) {
    return 'SUCCESS - SentinelOne agent already installed.'
}
$siteToken = '@S1SiteToken@'
$tempDirectory = "$env:SystemDrive//temp"
$installerPath = "$tempDirectory//SentinelOneAgent-Windows.msi"
$downloadUri = "https://cwa.connectwise.com/tools/sentinelone/SentinelOneAgent-Windows_$(if([System.Environment]::Is64BitOperatingSystem) { '64' } else { '32' })bit.msi"
mkdir $tempDirectory -ErrorAction SilentlyContinue | Out-Null
(New-Object System.Net.WebClient).DownloadFile($downloadUri, $installerPath)
if (!(Test-Path $installerPath)) {
    return 'ERROR - File download failed.'
}
Start-Process -FilePath "$env:windir//system32//msiexec.exe" -ArgumentList '/i', $installerPath, "SITE_TOKEN=$siteToken", '/QUIET', '/NORESTART', '/L*V', "$tempDirectory//S1Install.log" -Wait | Out-Null
if (Test-Path -Path $regInstallPath) {
    return 'SUCCESS - SentinelOne agent installed.'
} else {
    return 'ERROR - SentinelOne agent failed to install.'
}
```

![PowerShell Script Execution](../../../static/img/SentinelOne-Deployment/image_42.png)

Limit this PowerShell function to run on `Windows` machines only.

## Row 3 Function: Bash Script

Add another row and select the `Bash Script` function.

![Bash Script Function 1](../../../static/img/SentinelOne-Deployment/image_43.png)

The following function will pop up on the screen:

![Bash Script Function 2](../../../static/img/SentinelOne-Deployment/image_44.png)

Paste in the following Bash script and leave the expected time of script execution to `300` seconds. Click the `Save` button.

```
echo '@S1SiteToken@' > "/tmp/com.sentinelone.registration-token"

sleep 5

curl -o "/tmp/SentinelOneAgent-macos.pkg" "https://cwa.connectwise.com/tools/sentinelone/SentinelOneAgent-macos.pkg"

sleep 5

if [ -f "/Library/Sentinel/sentinel-agent.bundle/Contents/MacOS/SentinelAgent.app/Contents/MacOS/SentinelAgent" ]; then
    echo "SUCCESS - SentineOne agent already installed."
    exit 0
fi

sudo installer -pkg "/tmp/SentinelOneAgent-macos.pkg" -target /

sleep 5

if [ -f "/Library/Sentinel/sentinel-agent.bundle/Contents/MacOS/SentinelAgent.app/Contents/MacOS/SentinelAgent" ]; then
    echo "SUCCESS - SentineOne agent installed."
    exit 0
else 
    echo "ERROR - SentinelOne agent failed to install."
    exit 1
fi
```

![Bash Script Execution 1](../../../static/img/SentinelOne-Deployment/image_45.png)

Limit the bash file to run on `Mac` machines only.

## Row 4 Function: Bash Script

Add another row and select the `Bash Script` function.

![Bash Script Function 3](../../../static/img/SentinelOne-Deployment/image_43.png)

The following function will pop up on the screen:

![Bash Script Function 4](../../../static/img/SentinelOne-Deployment/image_44.png)

Paste in the following Bash script and leave the expected time of script execution to `300` seconds. Click the `Save` button.

```
#!/bin/bash
# https://community.automox.com/find-share-worklets-12/worklet-install-sentinelone-agent-linux-1807
rpm_filename="SentinelAgent-Linux_x86-64.rpm"
deb_filename="SentinelAgent-Linux_x86-64.deb"
site_token="@S1SiteToken@"

rpm_installer="$(pwd)/$rpm_filename"
deb_installer="$(pwd)/$deb_filename"

# Check if SentinelOne is already installed
if sudo sentinelctl version > /dev/null; then
  echo "Software is already installed"
  exit 0
fi

install_command=""
# Define install command based on system type
if [ -x "$(command -v dpkg)" ]; then
  echo "Installing $deb_installer"
  curl -o "$deb_installer" "https://s3.amazonaws.com/update2.itsupport247.net/SentinelOne/sentinelone_latest/SentinelAgent-Linux_x86-64.deb"
  install_command="sudo dpkg -i $deb_installer"
elif [ -x "$(command -v rpm)" ]; then
  echo "Installing $rpm_installer"
  curl -o "$rpm_installer" "https://s3.amazonaws.com/update2.itsupport247.net/SentinelOne/sentinelone_latest/SentinelAgent-Linux_x86-64.rpm"
  install_command="sudo rpm -i --nodigest $rpm_installer"
else
  echo "Unable to install software; either rpm or dpkg package manager must be present on system"
  exit 1
fi

if eval "$install_command"; then
  echo "Software successfully installed"

  echo "Registering SentinelOne agent"
  sudo /opt/sentinelone/bin/sentinelctl management token set "$site_token"
  sudo /opt/sentinelone/bin/sentinelctl control start
  exit 0
else
  echo "Software failed to install"
  exit 1
fi
```

![Bash Script Execution 2](../../../static/img/SentinelOne-Deployment/image_46.png)

Limit the bash file to run on `Linux` machines only.

## Row 5 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.

![Add Row 5](../../../static/img/SentinelOne-Deployment/image_47.png)

Search and select `Set Custom Field` function.

![Set Custom Field 1](../../../static/img/SentinelOne-Deployment/image_48.png)

Search and select `SentinelOne Deployment Result` in the `Search Custom Field` field and set `%output%` in the `Value` field and click the `Save` button.

![Set Custom Field 2](../../../static/img/SentinelOne-Deployment/image_49.png)

Limit the function to Windows machines.

![Windows Limit](../../../static/img/SentinelOne-Deployment/image_50.png)

## Row 6 Function: Set Custom Field

Repeat the ROW 5 steps but limit the function to Mac machines.

![Mac Limit](../../../static/img/SentinelOne-Deployment/image_51.png)

## Row 7 Function: Set Custom Field

Repeat the ROW 5 steps but limit the function to Linux machines.

## Completed Script

![Completed Script 1](../../../static/img/SentinelOne-Deployment/image_52.png)

![Completed Script 2](../../../static/img/SentinelOne-Deployment/image_53.png)

## Deployment

This task has to be scheduled on `SentinelOne Deployment` group for auto deployment. Script can also be run manually if required.

Go to Automations > Tasks.  
Search for SentinelOne Deployment.  
Then click on Schedule and provide the parameters detail as it is necessary for the script completion.

![Deployment](../../../static/img/SentinelOne-Deployment/image_54.png)

## Output

- Script Log
- Custom Field







