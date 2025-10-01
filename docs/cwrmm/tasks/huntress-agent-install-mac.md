---
id: '3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2'
slug: /3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2
title: 'Huntress Agent (Install) - MAC'
title_meta: 'Huntress Agent (Install) - MAC'
keywords: ['huntress', 'mac', 'installation', 'agent', 'deploy']
description: 'This document provides a detailed guide on creating a script to check for the installation of the Huntress agent on MAC machines. If the agent is not installed, the script will attempt to download and install it while logging the results of the operation.'
tags: ['installation', 'logging']
draft: false
unlisted: false
---

## Summary

This task will first check if Huntress is installed. If it is not, the script will attempt to install the agent and log the result for MAC machines.

## Create Script



- Go to `Automation` > `Tasks`
- At the top-right corner, click on the `Add` dropdown menu and select `Script Editor`
 
Task Details:
- **Name:** Huntress Agent (Install) - MAC  
- **Description:** This task will check if Huntress is installed. If not, it will attempt to install the agent and log the result for MAC machines.  
- **Category:** Custom  

![Image 3](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_3_1.webp)  

## Script

### Row 1 Function: Set Pre-defined Variable

- Select `Set Pre-Defined Variable` Function  
![Image 5](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_5_1.webp)  

- Select `Custom Field`  
- Input `acctKey` as Variable name  
- Select `Huntress Acct_Key` or (`Huntress Account Key`) custom field from the dropdown  
- Click `Save`  

![Image 6](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_6_1.webp)  

### Row 2 Function: Set Pre-defined Variable

- Select `Set Pre-Defined Variable` Function  
![Image 7](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_5_1.webp)  

- Select `Custom Field`  
- Input `orgKey` as Variable name  
- Select `Huntress Org_Key` custom field from the dropdown  
- Click `Save`  

![Image 8](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_7_1.webp)  

### Row 3 Function: Set Pre-defined Variable

- Select `Set Pre-Defined Variable` Function  
![Image 9](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_5_1.webp)  

- Select `Custom Field`  
- Input `tags` as Variable name  
- Select `Huntress Tag` custom field from the dropdown  
- Click `Save`  

![Image 10](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_8_1.webp)  

### Row 4 Function: Script Log

![Image 4](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_4_1.webp)  

Input the following:

```PlainText
The script will detect the Huntress Agent and if the agent is not found then it will install the agent.

acct_key : @acctKey@
org_key: @orgKey@
Tags: @tags@

Attempting to download the file using acct_key from the huntress website as below:

https://huntress.io/script/darwin/@acctKey@, and once downloaded the agent will be attempted to install.
```

## Row 5 Function: Bash Script

![Image 11](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_9_1.webp)  

Paste the following PowerShell script and set the expected script execution time to 900 seconds.  

```bash
#!/bin/bash

# Check if Huntress is installed
if command -v huntress &> /dev/null
then
    echo "Huntress agent is installed already."
    exit 0
else
    echo "Huntress is not installed. Proceeding with installation."
fi

# Download the Huntress installation script
curl -o /tmp/HuntressMacInstall.sh -L "https://huntress.io/script/darwin/@acctKey@"

# Execute the installation script
bash /tmp/HuntressMacInstall.sh -a @acctKey@ -o "@orgKey@" -t "@tags@"

# Revalidate if Huntress is installed
if command -v huntress &> /dev/null
then
    echo "Huntress agent is installed successfully."
else
    echo "Failed to install Huntress."
fi
```

![Image 12](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_10_1.webp)  

## Step 6 Function: Script Log

- Add a new row by clicking the `Add Row` button  
- Search and select the `Script Log` function.  
- Input the following:  

```shell
%Output%
```

![Image 13](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_11_1.webp)  
![Image 14](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_12_1.webp)  

## Step 7 Logic: If/Then

- Add a new `If/Then` logic from the `Add Logic` dropdown menu.  
![Image 15](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_13_1.webp)  

### Row 7a Condition: Output Contains

- Type `Huntress agent is installed` in the Value box.  
![Image 16](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_14_1.webp)  

### Row 7b Function: Set Custom Field

- Add a new row in the `If` Section by clicking the `Add Row` button  
- Search and select the `Set Custom Field` function.  
![Image 17](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_15_1.webp)  

- Search and select the `Huntress Deploy_Result` Custom Field.  
- Type `Successfully Installed` in the `Value` box and click the Save button.  

### Row 7c Function: Script Exit

- Add a new row in the `If` Section by clicking the `Add Row` button  
- Search and select the `Script Exit` function.  
- Leave the value blank to allow the script to exit on success.  

    ![Image 18](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_16_1.webp)   
![Image 19](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_17_1.webp)  

## Step 8 Function: Script Exit

- Add a new row after the `If/Then` Section by clicking the `Add Row` button  
- Search and select the `Script Log` function.  
- Input the following:  

```shell
Huntress Agent failed to install. Refer to the logs: %Output%
```

![Image 20](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_16_1.webp)  
![Image 21](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_18_1.webp)  

## Completed Script

![Image 22](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_19_1.webp)  

## Script Deployment

This task must be scheduled on `Deploy Huntress - MAC`, the group for auto-deployment. The script can also be run manually if required.

- Go to `Automations` > `Tasks`.  
- Search for `Huntress Agent (Install) - MAC`.  
- Then click on Schedule and select the Target:  

![Image 23](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_20_1.webp)  

Select the group "Deploy Huntress - MAC" and save the selection.  

![Image 24](../../../static/img/docs/3a0c2a5d-0d46-4c3b-b0a7-bdffd60c6fd2/image_21_1.webp)  

Once selected, click on Run to schedule the script as per requirement.

## Output

- Script log
