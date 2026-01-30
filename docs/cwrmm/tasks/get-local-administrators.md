---
id: '11f555cc-79ab-464f-87af-b46c324990ee'
slug: /11f555cc-79ab-464f-87af-b46c324990ee
title: 'Get Local Administrators'
title_meta: 'Get Local Administrators'
keywords: ['Local','Administators','Localgroup','Admins','Windows']
description: 'This Script lists the local administrators on windows machine and stores the result in a custom field.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary
This Script lists the local administrators on windows machine and stores the result in a custom field.

## Sample Run

![Sample Run 1](../../../static/img/docs/11f555cc-79ab-464f-87af-b46c324990ee/image1.webp)

![Sample Run 2](../../../static/img/docs/11f555cc-79ab-464f-87af-b46c324990ee/image2.webp)

## Dependencies
- [Custom Field - Localgroup Admins  ](/docs/03f2a420-5c70-4078-8b71-dc0fd7f6895d) 
- [Solution - Get Local Administrators](/docs/7e3f8472-2908-4491-b495-b87bd7ad0fe6) 

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

**Name:** `Get Local Administrators`  
**Description:** `This Script lists the local administrators on windows machine and stores the result in a custom field.`  
**Category:** `Custom`

![Summary](../../../static/img/docs/11f555cc-79ab-464f-87af-b46c324990ee/image3.webp)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

#### Step 1: Row -> PowerShell script

- **Use Generative AI Assist for script creation:** `False`  
- **Expected time of script execution in seconds:** `900`  
- **Operating System:** `Windows`  
- **Continue on Failure:** `True`  
- **PowerShell Script Editor:**

```PowerShell
try {
    $AllUsers = net localgroup administrators 2>&1

    if ($LASTEXITCODE -ne 0) {
        throw "Result: Failed to execute 'net localgroup administrators'. Output:  $AllUsers"
    }

    $users = $AllUsers |
        Where-Object {
            $_ -and
            $_ -notmatch 'command completed|---|Alias name|Members|comment'
        } |
        ForEach-Object { $_.Trim() }

    if (-not $users -or $users.Count -eq 0) {
        write-output "Result: No local administrator accounts were found."
        exit 0
    }

    $users -join '|'
}
catch {
    Write-Error "Result: Error fetching local administrators: $($_.Exception.Message)"
    throw
}
```
![image4](../../../static/img/docs/11f555cc-79ab-464f-87af-b46c324990ee/image4.webp)

#### Step 2: Row -> Script Log

- **Script Log Message:** `%Output%`  
- **Continue on Failure:** `False`  
- **Operating System:** `Windows`

![Image5](../../../static/img/docs/11f555cc-79ab-464f-87af-b46c324990ee/image5.webp)

#### Step 3a: Condition -> Output Contains ( Detected Updates: )

- **Condition:** `Output`  
- **Operator:** `Does not Contain`  
- **Input Values:** `Result`

![Image6](../../../static/img/docs/11f555cc-79ab-464f-87af-b46c324990ee/image6.webp)

#### Step 3b: Row -> Set Custom Field

- Select `LocalGroup Admins` from dropdown
- Add `%output%` in the Value

![Image7](../../../static/img/docs/11f555cc-79ab-464f-87af-b46c324990ee/image7.webp)

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Completed Task](../../../static/img/docs/11f555cc-79ab-464f-87af-b46c324990ee/image8.webp)

## Output
- Script Log

## Schedule Task

### Task Details

- **Name:** `Get Local Administrators`  
- **Description:** `This Script lists the local administrators on windows machine and stores the result in a custom field.`  
- **Category:** `Custom`

![Image9](../../../static/img/docs/11f555cc-79ab-464f-87af-b46c324990ee/image9.webp)

### Schedule

- **Schedule Type:**  `Schedule`  
- **Timezone:** `Local Machine Time`  
- **Start:** `<Current Date>`  
- **Trigger:** `Time` `At` `<Current Time>`  
- **Recurrence:** `Every day`

![Image10](../../../static/img/docs/11f555cc-79ab-464f-87af-b46c324990ee/image10.webp)

### Targeted Resource

**Device Group:** `Machines Opted for LocalAdmin Detection`

![Image11](../../../static/img/docs/11f555cc-79ab-464f-87af-b46c324990ee/image11.webp)

### Completed Scheduled Task

![Image12](../../../static/img/docs/11f555cc-79ab-464f-87af-b46c324990ee/image12.webp)