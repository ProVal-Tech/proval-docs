---
id: 'aeb4ccec-bf76-436d-8b0c-cd3ec3d39131'
slug: /aeb4ccec-bf76-436d-8b0c-cd3ec3d39131
title: 'User Profile - Get Information'
title_meta: 'User Profile - Get Information'
keywords: ['user', 'profiles', 'data', 'gather', 'information']
description: 'This is RMM version of the Get User Profiles script. It gathers information about user profiles and stores the data in the custom field.'
tags: ['report', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-03-11
---

## Summary
Gathers information about user profiles and stores the data in the custom field.

## Sample Run

![Image](../../../static/img/docs/aeb4ccec-bf76-436d-8b0c-cd3ec3d39131/image9.webp)

## Dependencies

- [Get-UserProfiles](/docs/dee76265-9071-47bb-9262-d656dd8b5c6d)
- PowerShell v5
- [Solution - Windows User Profiles](/docs/0ebb7e89-d2d8-40d4-ba1e-330ab20f86cd)

## Output Description

Script Output looks like below and here is the output description :

Output has 5 parts for each user profile and each user profile is separated by a `|`

1. `Username` : The username of the target profile. If (Inferred) is appended, then the user could not be found and the username was inferred from the profile path.
2. `LocalUser` : Indicates if the user is a local user. `1` if its a localuser, `0` if its not a local user.
3. `Admin` : 	Indicates if the user is a local admin. `1` if its a local admin, `0` if its not.
4. `ProfileSizeMB` : 	The size of the user folder for the target profile.
5. `Enabled` : `1` if local account is enabled, `0` if disabled. `2` when the account is not local.

![Image](../../../static/img/docs/aeb4ccec-bf76-436d-8b0c-cd3ec3d39131/image8.webp)

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

- **Name:** `User Profile - Get Information`  
- **Description:** `Gathers information about user profiles and stores the data in the custom field.`  
- **Category:** `Custom`

![Image](../../../static/img/docs/aeb4ccec-bf76-436d-8b0c-cd3ec3d39131/image1.webp)


### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)


#### Row 1 Function: `PowerShell Script`

Search and select the `PowerShell Script` function.  
 
![PowerShell Function Selected](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addedpowershellfunction.webp)  

The following function will pop up on the screen:  
![PowerShell Function Example](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankpowershellfunction.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `600` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/user-profile-get-information/script.ps1)



![Image](../../../static/img/docs/aeb4ccec-bf76-436d-8b0c-cd3ec3d39131/image2.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)  

Search and select the `Script Log` function.  
![Script Log Search](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addscriptlogfunction.webp)  
 

In the script log message, simply type `%output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/outputscriptlogfunction.webp)

#### Step 3 Logic: If/Then

Click on `Add Logic` > select `If/Then`

#### Row 3a Condition: Output Does Not Contains

- **Condition:** `Output`  
- **Operator:** `Does Not Contain`  
- **Input Values:** `Error`

![Image](../../../static/img/docs/aeb4ccec-bf76-436d-8b0c-cd3ec3d39131/image3.webp)

#### Row 3b Function: Set Custom Field

- Select `User Profiles` from dropdown
- Add `%output%` in the Value

![Image](../../../static/img/docs/aeb4ccec-bf76-436d-8b0c-cd3ec3d39131/image4.webp)

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Image](../../../static/img/docs/aeb4ccec-bf76-436d-8b0c-cd3ec3d39131/image5.webp)

## Schedule Task

### Task Details

- **Name:** `User Profile - Get Information`  
- **Description:** `Gathers information about user profiles and stores the data in the custom field.`  
- **Category:** `Custom`


### Schedule

- **Schedule Type:**  `Schedule`  
- **Timezone:** `Local Machine Time`  
- **Start:** `<Current Date>`  
- **Trigger:** `Time` `At` `<Current Time>`  
- **Recurrence:** `Every week on Monday`


### Targeted Resource

**Device Groups:** `Windows Machines (Non‑DC)`

![Image](../../../static/img/docs/aeb4ccec-bf76-436d-8b0c-cd3ec3d39131/image6.webp)

### Completed Scheduled Task

![Image](../../../static/img/docs/aeb4ccec-bf76-436d-8b0c-cd3ec3d39131/image7.webp)


## Output
- Script Logs
- Custom Field

## Changelog

### 2026-03-11

- Initial version of the document
