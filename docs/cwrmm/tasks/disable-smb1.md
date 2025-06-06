---
id: '10055a68-f513-4580-bdc1-73272516866f'
slug: /10055a68-f513-4580-bdc1-73272516866f
title: 'Disable SMB1'
title_meta: 'Disable SMB1'
keywords: ['smb1', 'protocol', 'disable', 'windows', 'security']
description: 'This document outlines the process to disable the SMB1 protocol on a target machine, including script creation, implementation steps, and deployment instructions. It is crucial for enhancing security on Windows systems by preventing vulnerabilities associated with SMB1.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script disables the SMB1 protocol on the target machine for both versions below and above '6.3'.

Output Syntax: `Harddisk - <Model> (Drives: <Drive Letter(s)>): Health Status - <Status>`

## Sample Run

![Sample Run 1](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_2.webp)

![Sample Run 2](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_3.webp)

## Implementation

### Create Script

Create a new `Script Editor` style script in the system to implement this task.

![Create Script](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_4.webp)

![Create Script](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_5.webp)

**Name:** Disable SMB1  
**Description:** This script disables the SMB1 protocol on the target machine for both versions below and above '6.3'.  
**Category:** Security

![Script](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_6.webp)

### Script

Start by making three separate rows. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Add Row](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_7.webp)

#### Row 1 Function: PowerShell Script

![PowerShell Script](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_8.webp)

![PowerShell Script](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_9.webp)

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds.

```powershell
$ver = [Version](Get-WmiObject -Class Win32_OperatingSystem).version
"$($ver.Major).$($ver.Minor)"

if ($ver -ge [version]'6.3') {
    # For OS versions 6.3 or higher
    if (((Get-WindowsOptionalFeature -Online -FeatureName "SMB1Protocol").state) -ne 'Enabled') {
        return 'SMB1 was already in a disabled state'
    } else {
        Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart
        return 'SMB1 has been successfully disabled'
    }
} else {
    # For OS versions below 6.3
    $s = Get-Item HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters |
         ForEach-Object { Get-ItemProperty $_.pspath -Name SMB1 }

    if ((-not $s) -or ($s -contains 1)) {
        Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Lanmanworkstation\Parameters' -Name 'SMB1' -Value 0 -Type DWORD -Force
        Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' -Name 'SMB1' -Value 0 -Type DWORD -Force
        return 'SMB1 has been successfully disabled'
    } else {
        return 'SMB1 was already in a disabled state'
    }
}
```

![PowerShell Script](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_10.webp)

Save and move to the next row.

#### Row 2 Function: Script Log

![Script Log](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_11.webp)

In the script log message, simply type `Output:%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Script Log](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_12.webp)

#### Row 3 Logic: If/Then/Else

![If/Then/Else](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_13.webp)

There will be two sections: If part and Else part.

![If/Then/Else](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_14.webp)

##### Row 3a Condition: Output Contains

In the IF part, enter **Disabled** in the right box of the "Output Contains" part.

![Output Contains](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_15.webp)

##### Row 3b Function: Script Exit

Add a new row by clicking on the Add Row button.

![Add Row](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_16.webp)

In the script exit message, simply type `SMB1 has been successfully disabled. Exiting script` so that the script will send a successful message on the Automation tab for the target device.

![Script Exit](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_17.webp)

![Script Exit](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_18.webp)

##### Row 3c Function: Script Exit

Add a new row by clicking on the Add Row button in the ELSE part and select Script Exit Function.

![Script Exit](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_17.webp)

In the script exit message, type `Failed to disable SMB1 on the machine` so that the script will send a failure message on the Automation tab for the target device.

![Script Exit](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_19.webp)

Once all items are added, please save the task.  
The final task should look like the screenshot below.

![Final Task](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_20.webp)

## Deployment

**IMPORTANT**: Only enable this automation if it is explicitly requested by the consultant. This can cause issues if deployed improperly.

It is suggested to run the task once per week against Windows computers.

- Go to `Automation` > `Tasks.`
- Search for `Disable SMB1` Task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.

![Schedule Task](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_21.webp)

- This screen will appear.

![Schedule Task](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_22.webp)

- Select the relevant time to run the script and click the Does not repeat button.

![Schedule Task](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_23.webp)

- This pop-up box will appear.
- Change the number of days to `7` and click `OK`.

![Change Days](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_24.webp)

![Change Days](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_25.webp)

- Search for `windows` in the `Resources*` and select `Windows Desktops` and `Windows Servers` groups. You can search and select any relevant group you would like to schedule the task against.

![Select Groups](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_26.webp)

- Now click the `Run` button to initiate the task.

![Run Task](../../../static/img/docs/70c7fa58-20bf-47b1-bbeb-aae491390406/image_27.webp)

- The task will start appearing in the Scheduled Tasks.

## Output

- Script log