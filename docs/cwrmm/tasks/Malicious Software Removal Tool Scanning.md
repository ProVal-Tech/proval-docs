---
id: 'ef14e376-ec97-4f0d-8563-1430fb47e97e'
title: 'Malicious Software Removal Tool Scanning'
title_meta: 'Malicious Software Removal Tool Scanning'
keywords: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
description: 'This script performs the endpoint scanning using the MSRT and provided option to creates ticket if failure detected.'
tags: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
draft: false
unlisted: false
---

## Summary

This Task performs the endpoint scanning using the MSRT and provided option to creates ticket if failure detected. It also save result to the custom field `MSRT Scanner Result` so that the agent gets excluded from the dynamic [Group - Malicious software removal tool scanning enable](<../groups/Malicious Software Removal Tool Scanning Enable.md>) if the task ran successfully.
This script can be run on demand as well or by scheduling it to the [Group - Malicious software removal tool scanning enable](<../groups/Malicious Software Removal Tool Scanning Enable.md>).

## Dependencies

- [MSRT Custom fields](<../custom-fields/MSRT Custom Fields.md>)
- [Group - Malicious software removal tool scanning enable](<../groups/Malicious Software Removal Tool Scanning Enable.md>)

## Sample Run

![Sample Run 1](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{CA3244F0-8CE8-4A3C-85CA-E103E2A9F901}.png>)

Check the `Create Ticket` flag option if you want to create ticket for the endpoint during failure and click `Continue to Scheduling`.

![Sample Run 2](<../../../static/img/docs/Malicious Software Removal Tool Scanning/image.png>)

Click `Run Task`

![Sample Run 3](<../../../static/img/docs/Malicious Software Removal Tool Scanning/image-1.png>)

## Implementation

### Create Task

**Malicious Software Removal Tool Scanning**  
To implement this script, please `Add Parameter` first:

Click `Add Parameter` on the top right side of the new script:

![Add Parameter](<../../../static/img/docs/Malicious Software Removal Tool Scanning/image-3.png>)

Set parameter `CreateTicket` as a flag with `Default Value` set to `False` and do not turn on the `Required Field`. This is set to not create a ticket by default, if required to create ticket on failure change the default value to `True`.

![CreateTicket](<../../../static/img/docs/Malicious Software Removal Tool Scanning/image-2.png>)

To implement this script, please create a new "PowerShell" style script in the system.

![Create Task](../../../static/img/Reboot-Pending-Check-Automation/image_3.png)

- **Name:** Malicious Software Removal Tool Scanning
- **Description:** This script performs the endpoint scanning using the MSRT and provided option to creates ticket if failure detected. Based on the output, it sets the custom field `MSRT Scanning Result`.
- **Category:** Security

![Task Details](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{51BB91CC-3C85-4974-A2DD-35B0BEF39470}.png>)

### Script

Start by creating a separate row. You can do this by clicking the "Add Row" button at the bottom of the script page.

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

![Row 2 PowerShell continued](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{CE580F79-1556-40BE-B967-3EC9AE6CA176}.png>)

Paste in the following PowerShell script and set the expected time of script execution to `1800` seconds.

```powershell
$WorkingDirectory = 'C:\ProgramData\_automation\script\MSRT'
$File = "$WorkingDirectory\Windows-KB890830-x64.exe"
$MRTResult = 'C:\WINDOWS\debug\mrt.log'
if (Test-Path -Path $File) {
    Remove-Item -Path $File -Force -Recurse -ErrorAction SilentlyContinue
}

if (Test-Path -Path $MRTResult) {
    Remove-Item -Path $MRTResult -Force -Recurse -ErrorAction SilentlyContinue
}
#region Setup - Folder Structure
if ( !(Test-Path $WorkingDirectory) ) {
    try {
        New-Item -Path $WorkingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
    }
    catch {
        return "An error occurred: Failed to Create $WorkingDirectory. Reason: $($Error[0].Exception.Message)"
    }
} if (-not ( ( ( Get-Acl $WorkingDirectory ).Access | Where-Object { $_.IdentityReference -Match 'EveryOne' } ).FileSystemRights -Match 'FullControl' ) ) {
    $ACl = Get-Acl $WorkingDirectory
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule('Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'none', 'Allow')
    $Acl.AddAccessRule($AccessRule)
    Set-Acl $WorkingDirectory $Acl
}
$uri = 'https://www.microsoft.com/download/details.aspx?id=9905'
try {
    Write-Output "Attempting to download content from $uri"
    $response = Invoke-WebRequest -Uri $uri -UseBasicParsing
    Write-Output "Response status code: $($response.StatusCode)"
    if ($response.StatusCode -ne 200) {
        return 'An error occurred: The URI failed to output the html content'
    }
    $html = $response.Content
    $regex = [regex]::new("(?i)https://download\.microsoft\.com/download/2/C/5/2C563B99-54D9-4D85-A82B-45D3CD2F53CE/Windows-KB890830-x64-V\d+\.\d+\.exe")
    $URLCheck = $regex.Matches($html)
    if ($URLCheck.Count -gt 0) {
        $uniqueMatches = $URLCheck | Select-Object -Unique
        $URL = $uniqueMatches.Value
        Write-Output "Download URL found: $URL"
    }
    else {
        return 'An error occurred: Link not found'
    }
}
catch {
    return "An error occurred: Failed to download content from URI. Reason: $($_.Exception.Message)"
}

Invoke-WebRequest -Uri $URL -OutFile $File -UseBasicParsing

if (!(Test-Path -Path $File)) {
    return 'An error occurred and the exe was unable to be downloaded. Exiting.'
}

Start-Process -FilePath $File -ArgumentList "/N /Q"
Start-Sleep -Seconds 180
$logFilePath = 'C:\WINDOWS\debug\mrt.log'
$attempts = 0
$maxAttempts = 3
$sleepDuration = 300

while ($attempts -lt $maxAttempts) {
    if (Test-Path $logFilePath) {
        $logContent = Get-Content $logFilePath
        if ($logContent -match "Microsoft Windows Malicious Software Removal Tool Finished On") {
            Write-Output 'Scanning completed successfully. Displaying complete content'
            Write-Output $logContent
            break
        }
        else {
            Write-Output 'Scanning not completed yet. Waiting for the next attempt.'
        }
    }
    else {
        Write-Output "Log file not found. Attempt $($attempts + 1) of $maxAttempts."
    }
    $attempts++
    Start-Sleep -Seconds $sleepDuration
}

if ($attempts -eq $maxAttempts) {
    Write-Output 'An error occurred: Log file failed to create or scanning not completed after maximum attempts.'
}
```

### Row 3: Logic: If/Then/Else

![Row 3 Logic](../../../static/img/Reboot-Pending-Check-Automation/image_12.png)

![Row 3 Logic Continued](../../../static/img/Reboot-Pending-Check-Automation/image_13.png)

### Row 3a: Condition: Output Contains

In the IF part, enter `An error occurred` in the right box of the "Output Contains" part.

![Row 3a Condition](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{25283397-3336-478E-BA6F-FDE8B8DE9A63}.png>)

### Row 3b: Function: Set Custom Field

Add a new row by clicking on the Add row button and select `Set Custom Field`. 

![Row 3b Set Custom field](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{DCA73A1C-5B8E-4EC2-8AD3-494397D4DE04}.png>)

Clicking `Set Custom Field` opens up new window.

**Custom Field:** `MSRT Scanner Result`

**Value:** `MSRT Scanning Failed`

![Row 3b Custom field continued](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{2F358EAE-F606-4D47-9C3E-9301D9573D3E}.png>)

### Row 3c(i): Logic: If/Then

![Row 3c(i) Logic](../../../static/img/Reboot-Pending-Check-Automation/image_17.png)

![Row 3c(i) Logic Continued](../../../static/img/Reboot-Pending-Check-Automation/image_18.png)

### Row 3c(ii): Condition: Value

In the IF part, enter `@CreateTicket@` in the right box of the "Value contains" part where Value `1` `Equals` to `@CreateTicket@`.

![Row 3c(ii) Value Equals](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{CD09B3BE-8B8C-4C1B-8D0F-EBCEA7262050}.png>)

### Row 3c(iii): Function: Create Ticket

Add a new row by clicking on the Add row button.

Select Function 'Create Ticket'. When you select `Create Ticket`, it will open up a new window.

In this window, set the `Subject` as `Malicious Software Removal Tool scanning failed on computer: @SystemName@ of company: %companyname%`.

`Body` as `Malicious Software Removal Tool scanning failed to detect or detected an infection on the endpoint. Refer to the below logs:
%Output%`

`Priority` set to `Low`

![Create Ticket](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{5852E7C0-0A59-456B-B328-FF5D443D0032}.png>)

### Row 3d: Function: Script Exit

Add a new row in the If section and select `Script Exit`.

In the script exit message, simply type `Malicious Software Removal Tool scanning failed. Refer to the logs:
%output%`.

In the script exit message, leave it blank.

![Row 3d Script Exit Message](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{389B4191-F94C-4588-BAF9-26D440C591CD}.png>)

### Row 4: Logic: If/Then

Add a new logic in the Else section and select `If/Then`.

![Row 3c(i) Logic](../../../static/img/Reboot-Pending-Check-Automation/image_17.png)

![Row 3c(i) Logic Continued](../../../static/img/Reboot-Pending-Check-Automation/image_18.png)

### Row 4a: Condition: Output Does Not Contains

In the IF part, enter `No infection found` in the right box of the "Output Does Not Contains" part.

![Row 4a Condition](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{B4C8AB73-081E-41E3-83D9-4F9D60571256}.png>)

### Row 4b: Function: Set Custom Field

Add a new row by clicking on the Add row button and select `Set Custom Field`. 

![Row 4b Set Custom Field](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{46B4D16A-3E65-4C5F-A106-8A85DECCD6C4}.png>)

Clicking `Set Custom Field` opens up new window.

**Custom Field:** `MSRT Scanner Result`

**Value:** `MSRT Scanner Result - Infection detected`

![Row 4b Set Custom field continued](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{1C156A5B-64C2-49EC-8089-199AA41E3C34}.png>)

### Row 4c(i): Logic: If/Then

![Row 4c(i) Logic](../../../static/img/Reboot-Pending-Check-Automation/image_17.png)

![Row 4c(i) Logic Continued](../../../static/img/Reboot-Pending-Check-Automation/image_18.png)

### Row 4c(ii): Condition: Value

In the IF part, enter `@CreateTicket@` in the right box of the "Value contains" part where Value `1` `Equals` to `@CreateTicket@`.

![Row 4c(ii) Value Equals](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{CD09B3BE-8B8C-4C1B-8D0F-EBCEA7262050}.png>)

### Row 4c(iii): Function: Create Ticket

Add a new row by clicking on the Add row button.

Select Function 'Create Ticket'. When you select `Create Ticket`, it will open up a new window.

In this window, set the `Subject` as `Malicious Software Removal Tool scanning detected infection on computer: @SystemName@ of company: %companyname%`.

`Body` as `Malicious Software Removal Tool scanning detected infection on the endpoint. Refer to the logs:
%Output%`

`Priority` set to `Low`

![Create Ticket](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{7CEEFBE6-0392-4F9F-865F-D9D2ACCD9F97}.png>)

### Row 4d: Function: Script Exit

Add a new row in the IF section and select `Script Exit`.

In the script exit message, simply type `Malicious Software Removal Tool detected infection on the endpoint. Refer to the logs:
%Output%`.

In the script exit message, leave it blank.

![Row 4d Script Exit Message](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{AE725222-3FCD-4822-8740-E1EB67FB3A94}.png>)

### Row 4e: Function: Set Custom Field

Add a new row in the else section by clicking on the Add row button and select `Set Custom Field`. 

![Row 4e Set Custom Field](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{0DE2EE35-5850-4854-8853-EF43F66D2546}.png>)
Clicking `Set Custom Field` opens up new window.

**Custom Field:** `MSRT Scanner Result`

**Value:** `MSRT Scanner Result - No infection found`

![Row 4e Set Custom Field Continued](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{022804BC-BF8A-4D53-A13F-18DCE30AB1F9}.png>)

### Row 4f: Function: Script Log

![Row 4f Script Log](../../../static/img/Reboot-Pending-Check-Automation/image_10.png)

In the script log message, simply type `Malicious Software Removal Tool scanner detected on infection. Refer to the logs:
%Output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Row 4f Script Log Message](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{2208ACEA-5647-4AD5-BC50-083709319F5B}.png>)

### Row 5: Complete

![Row 5 Complete](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{4D9E7B6C-B535-4412-9971-D48DA2C48575}.png>)
![Row 5 Complete Continued](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{2F1A2309-4839-4345-B74D-B1F2BF28FAF2}.png>)

## Deployment

It is suggested to run the Task every 2 hours against the group [Group - Malicious software removal tool scanning enable](<../groups/Malicious Software Removal Tool Scanning Enable.md>)

- Go to `Automation` > `Tasks.`
- Search for `Malicious Software Removal Tool Scanning` Task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.

![Schedule Task](<../../../static/img/docs/Malicious Software Removal Tool Scanning/image-4.png>)
This screen will appear.

![Schedule Task Continued](<../../../static/img/docs/Malicious Software Removal Tool Scanning/{DABE9ED4-B30A-40DA-ABDE-BB6501CC8755}.png>)

Select the relevant time to run the script and click the Do not repeat button.

![Schedule Task Time](../../../static/img/Reboot-Pending-Check-Automation/image_27.png)

A pop-up box will appear.

Change the number of hours to `2` and click `OK`.

![Change Hours](../../../static/img/Reboot-Pending-Check-Automation/image_28.png)

Select the target `Device Group` to schedule on the group [Group - Malicious software removal tool scanning enable](<../groups/Malicious Software Removal Tool Scanning Enable.md>).

![Select Target](<../../../static/img/docs/Malicious Software Removal Tool Scanning/image-5.png>)

Now click the `Run` button once all customization is set to initiate the task.

![Run Task](<../../../static/img/docs/Malicious Software Removal Tool Scanning/image-6.png>)

The task will start appearing in the Scheduled Tasks.

## Output

- Task log




