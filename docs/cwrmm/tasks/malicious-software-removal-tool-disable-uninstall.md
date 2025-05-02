---
id: '89e1f1cd-9b80-4874-96c6-f1e8b067298e'
slug: /89e1f1cd-9b80-4874-96c6-f1e8b067298e
title: 'Malicious Software Removal Tool Disable/Uninstall'
title_meta: 'Malicious Software Removal Tool Disable/Uninstall'
keywords: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
description: 'This script disables and uninstalls the MSRT from the endpoint and provided option to creates ticket if failure detected.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary

This script disables and uninstalls the MSRT from the endpoint and provided option to creates ticket if failure detected. It also save result to the custom field `MSRT Scanner Result` so that the agent gets excluded from the dynamic group [Malicious Software Removal Tool Uninstall-Disable group](/docs/5b31977a-2e6d-4647-8c4b-5b1055b31ff4) if the task ran successfully.
This script can be on demand as well or by scheduling it to the group [Malicious Software Removal Tool Uninstall-Disable group](/docs/5b31977a-2e6d-4647-8c4b-5b1055b31ff4).

## Dependencies

- [MSRT Custom fields](/docs/c6a36d73-01c8-4ef9-ace2-e9d6a4bc2363)
- [Malicious Software Removal Tool Uninstall-Disable group](/docs/5b31977a-2e6d-4647-8c4b-5b1055b31ff4)

## Sample Run

![Sample Run](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/{FF7AA4DD-DFDC-4CFB-966D-F23293C8B5F1}.png>)

Check the `Create Ticket` flag option if you want to create ticket for the endpoint during failure and if you do not want to uninstall the MSRT KB890830 then change the `MSRTUninstall` value from 1 to anything and then click `Continue to Scheduling`.

![Sample Run 2](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/image-1.png>)

Click `Run Task`

![Sample Run 3](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/{2574F2B6-ADE9-4A98-A851-869225C5E428}.png>)

## Implementation

### Create Task

**Malicious Software Removal Tool Disable/Uninstall**  
To implement this script, please `Add Parameter` first:

Click `Add Parameter` on the top right side of the new script:

![Add Parameter](<../../../static/img/docs/Malicious Software Removal Tool Scanning/image-3.png>)

Set parameter `CreateTicket` as a flag with `Default Value` set to `False` and do not turn on the `Required Field`. This is set to not create a ticket by default, if required to create ticket on failure change the default value to `True`.

![CreateTicket](<../../../static/img/docs/Malicious Software Removal Tool Scanning/image-2.png>)

Add second parameter `MSRTUninstall` as a Number Value with `Default Value` set to `1` and do not turn on the `Required Field`. This is set to uninstall the MSRT patches if already installed, if not required to uninstall the patch change the default value to anything other than 1.

![MSRTUninstall](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/{7538EB10-EA8D-47F9-97E9-30F5FE22D3FE}.png>)

To implement this script, please create a new "PowerShell" style script in the system.

![Create Task](../../../static/img/Reboot-Pending-Check-Automation/image_3.png)

- **Name:** Malicious Software Removal Tool Disable/Uninstall
- **Description:** This script disables and uninstalls the MSRT from the endpoint and provided option to creates ticket if failure detected. Based on the output, it sets the custom field `MSRT Scanning Result`.
- **Category:** Security

![Task Details](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/{7BEDCA08-F397-4065-B48F-F794BBC9FCDD}.png>)

### Script

Start by creating a row. You can do this by clicking the "Add Row" button at the bottom of the script page.

![Add Rows](../../../static/img/Reboot-Pending-Check-Automation/image_5.png)

### Row 1: Function: Pre-defined Variable

![Set Pre-defined Variable](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{4DBC89D7-5D08-4A6C-830A-1B97E7EEAB8D}.png>)

Paste the highlighted text:  

```plaintext
Variable Name: Systemname
System Variable: Drop down Endpoint>Asset>Friendlyname
```

![Pre-Defined Variable](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{EF8C2BCA-F0B4-4D13-A742-24BA817515AE}.png>)

### Row 2: Function: PowerShell Script

![Row 2 PowerShell](../../../static/img/Reboot-Pending-Check-Automation/image_8.png)

![Row 2 PowerShell Continued](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/{2836C78C-7ECB-4D78-A52D-90431A8B6B71}.png>)

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds.

```powershell
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
(Import-Module -Name Strapper) 3>&1 2>&1 1>$null
(Set-StrapperEnvironment) 3>&1 2>&1 1>$null
$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\MRT'
$Name = 'DontOfferThroughWUAU'
$KBNumber = '890830'

try {
    # Check if the registry path exists; if not, create it
    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -Force
    }

    # Set the registry key value
    Set-ItemProperty -Path $Path -Name $Name -Value 1 -Type DWord -Force
    Write-Output 'Registry key set successfully.'
    Write-Log 'Registry key set successfully.' -Level Information

    #Check if MSRT Uninstall Approved
    $MSRTUninstall = '@MSRTUninstall@'
    if ($MSRTUninstall -eq 1) {
        Write-Output 'MSRT Uninstall Approved'
        Write-Log 'MSRT Uninstall Approved'
        # Check if MSRT is installed
        $msrtInstalled = Get-HotFix -Id $KBNumber -ErrorAction SilentlyContinue

        if ($msrtInstalled) {
            # Uninstall MSRT
            $uninstallProcess = Start-Process -FilePath "wusa.exe" -ArgumentList "/uninstall /kb:$KBNumber /quiet /norestart" -Wait -PassThru

            if ($uninstallProcess.ExitCode -eq 0) {
                Write-Output 'MSRT uninstalled successfully.'
                Write-Log 'MSRT uninstalled successfully.' -Level Information
            }
            else {
                Write-Output "An error occurred: MSRT uninstallation failed with exit code $($uninstallProcess.ExitCode)."
                Write-Log "An error occurred: MSRT uninstallation failed with exit code $($uninstallProcess.ExitCode)." -Level Error
            }
        }
        else {
            Write-Output 'MSRT is not installed on this system.'
            Write-Log 'MSRT is not installed on this system.' -Level Information
        }
    }
    else { 
        Write-Output 'MSRT Uninstall is suspended'
        Write-Log 'MSRT Uninstall is suspended' -Level Information
    } 
}
catch {
    Write-Output "An error occurred: $_"
    Write-Log "An error occurred: $_" -Level Error
}
```

### Row 3: Logic: If/Then

![Row 3c Logic](../../../static/img/Reboot-Pending-Check-Automation/image_17.png)

![Row 3c Logic Continued](../../../static/img/Reboot-Pending-Check-Automation/image_18.png)

### Row 3a: Condition: Output Contains

In the IF part, enter `An error occurred` in the right box of the "Output Contains" part.

![Row 3a Condition](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{25283397-3336-478E-BA6F-FDE8B8DE9A63}.png>)

### Row 3b: Function: Set Custom Field

Add a new row by clicking on the Add row button and select `Set Custom Field`. 

![Row 3b Set Custom Field](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/{49BF3B0D-62FC-459C-B765-F870931AEC6F}.png>)

Clicking `Set Custom Field` opens up new window.

**Custom Field:** `MSRT Scanner Result`

**Value:** `MSRT Disable Failed`

![Row 3b Set Custom Field continued](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/{80DAAB03-B716-448A-9B1B-C141C0E2B350}.png>)

### Row 3c(i): Logic: If/Then

![Row 3c(i) Logic](../../../static/img/Reboot-Pending-Check-Automation/image_17.png)

![Row 3c(i) Logic Continued](../../../static/img/Reboot-Pending-Check-Automation/image_18.png)

### Row 3c(ii): Condition: Value

In the IF part, enter `@CreateTicket@` in the right box of the "Value contains" part where Value `1` `Equals` to `@CreateTicket@`.

![Row 3c(ii) Value Equals](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{CD09B3BE-8B8C-4C1B-8D0F-EBCEA7262050}.png>)

### Row 3c(iii): Function: Create Ticket

Add a new row by clicking on the Add row button.

Select Function 'Create Ticket'. When you select `Create Ticket`, it will open up a new window.

In this window, set the `Subject` as `Malicious Software Removal Tool Disable failed on computer: @SystemName@ of company: %companyname%`.

`Body` as `Malicious Software Removal Tool Disable failed on the endpoint. Refer to the logs:
%output%`

`Priority` set to `Low`

![Create Ticket](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/{2D27E98C-72D8-4A01-9AEA-7E8D1C8ACE74}.png>)

### Row 3d: Function: Script Exit

Add a new row in the If section and select `Script Exit`.

In the script exit message, simply type `Script failed to disable the Malicious Software Removal Tool. Exiting script with error.
Refer to the logs:  
%Output%`.

In the script exit message, leave it blank.

![Script Exit Message](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/{E89527DD-8E94-4E34-8581-CE682C4B496B}.png>)

### Row 4: Function: Set Custom Field

Add a new row after `End If` section by clicking on the Add row button and select `Set Custom Field`. 

![Row 4 Set Custom Field](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/{8979F21E-B8E0-494E-A077-DF634424D947}.png>).

**Custom Field:** `MSRT Scanner Result`

**Value:** `MSRT Disabled`

![Row 4 Set Custom field continued](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/{6E4ED12C-D9AD-4EEE-A783-B8C3E9E6DF99}.png>)

### Row 5: Function: Script Log

![Row 5 Script Log](../../../static/img/Reboot-Pending-Check-Automation/image_10.png)

In the script log message, simply type `Malicious Software Removal Tool disabled successfully. Refer to the logs:
%Output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 5 Script Log Message](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/{7AB23753-306A-48C7-AC9D-723DFCF49E0D}.png>)

### Row 6: Complete

![Row 6 Complete](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/{12C9F919-BCAA-4A83-905D-9EF93B3C687D}.png>)

## Deployment

It is suggested to run the Task every 2 hours against the group [Malicious Software Removal Tool Uninstall-Disable group](/docs/5b31977a-2e6d-4647-8c4b-5b1055b31ff4)

- Go to `Automation` > `Tasks.`
- Search for `Malicious Software Removal Tool Disable/Uninstall` Task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.

![Scheduled Task](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/{967AFD20-C102-4D7B-AA2C-64EC5198B43B}.png>)

![Scheduled Task Continued](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/{7D64A301-7B5B-4740-85C3-84325E447BE7}.png>)

Select the relevant time to run the script and click the Do not repeat button.

![Schedule Task Time](../../../static/img/Reboot-Pending-Check-Automation/image_27.png)

A pop-up box will appear.

Change the number of hours to `2` and click `OK`.

![Change Hours](../../../static/img/Reboot-Pending-Check-Automation/image_28.png)

Select the target `Device Group` to schedule on the group [Malicious Software Removal Tool Uninstall-Disable group](/docs/5b31977a-2e6d-4647-8c4b-5b1055b31ff4).

![Select Target](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/image-3.png>)

Now click the `Run` button once all customization is set to initiate the task.

![Run Task](<../../../static/img/docs/Malicious Software Removal Tool Disable-Uninstall/image-4.png>)

The task will start appearing in the Scheduled Tasks.

## Output

- Task log

