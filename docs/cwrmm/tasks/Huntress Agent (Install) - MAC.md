---
id: 'ps-huntress-agent-install-mac'
title: 'Huntress Agent (Install) - MAC'
title_meta: 'Huntress Agent Installation Script for MAC'
keywords: ['huntress', 'mac', 'installation', 'agent', 'deploy']
description: 'This document provides a detailed guide on creating a script to check for the installation of the Huntress agent on MAC machines. If the agent is not installed, the script will attempt to download and install it while logging the results of the operation.'
tags: ['installation', 'mac', 'script', 'logging', 'custom']
draft: false
unlisted: false
---
## Summary

This task will check first if Huntress is installed or not. If not, then it attempts to install the agent and log the result for the MAC machines.

## Create Script

Please create a new "PowerShell" style script to implement this script.

![Image 1](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_1.png)  
![Image 2](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_2.png)  

**Name:** Huntress Agent (Install) - MAC  
**Description:** This task will check first if Huntress is installed or not. If not, then it attempts to install the agent and log the result for the MAC machines.  
**Category:** Custom  

![Image 3](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_3.png)  

# Script

## Row 1 Function: Script Log

![Image 4](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_4.png)  

Input the following:

The script will detect the Huntress Agent and if the agent is not found then it will install the agent.  
```
acct_key : @acct_key@  
org_key: @ORG_Key@  
Tags: @Tags@
```
Attempting to download the file using acct_key from the Huntress website as below:  
[https://huntress.io/script/darwin/@acctKey](https://huntress.io/script/darwin/@acctKey), and once downloaded the agent will be attempted to install.

## Row 2 Function: Set Pre-defined Variable

- Select `Set Pre-Defined Variable` Function  
![Image 5](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_5.png)  

- Select `Custom Field`  
- Input `acct_key` as Variable name  
- Select `Huntress Acct_Key` custom field from drop Down  
- Click Save  

![Image 6](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_6.png)  

## Row 3 Function: Set Pre-defined Variable

- Select `Set Pre-Defined Variable` Function  
![Image 7](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_5.png)  

- Select `Custom Field`  
- Input `ORG_Key` as Variable name  
- Select `Huntress Org_Key` custom field from the drop Down  
- Click Save  

![Image 8](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_7.png)  

## Row 4 Function: Set Pre-defined Variable

- Select `Set Pre-Defined Variable` Function  
![Image 9](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_5.png)  

- Select `Custom Field`  
- Input `Tags` as Variable name  
- Select `Huntress Tag` custom field from the drop Down  
- Click Save  

![Image 10](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_8.png)  

## Row 5 Function: Bash Script

![Image 11](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_9.png)  

Paste in the following PowerShell script and set the expected script execution time to 900 seconds.  
```
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

![Image 12](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_10.png)  

## Step 6 Function: Script Log

- Add a new row in the If Section of If else then part by clicking the Add Row button  
- Search and select the `Script Log` function.  
- Input the following:  
```
%Output%
```
![Image 13](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_11.png)  
![Image 14](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_12.png)  

## Step 7 Logic: If/Then

- Add a new `If/Then/Else` logic from the Add Logic dropdown menu.  
![Image 15](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_13.png)  

## ROW 7a Condition: Output Contains

- Type `Huntress agent is installed` in the Value box.  
![Image 16](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_14.png)  

## ROW 7b Function: Set Custom Field

- Add a new row in the If Section of If else then part by clicking the Add Row button  
- Search and select the `Set Custom Field` function.  
![Image 17](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_15.png)  

- Search and select the `Huntress Deploy_Result` Custom Field.  
- Type `Successfully Installed` in the `Value` box and click the Save button.  

## ROW 7c Function: Script Exit

- Add a new row in the If Section of If else then part by clicking the Add Row button  
- Search and select the `Script Exit` function.  
- Leave the value blank to allow the script to exit on success.  

![Image 18](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_16.png)  
![Image 19](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_17.png)  

## Step 8 Function: Script Exit

- Add a new row in the If Section of If else then part by clicking the Add Row button  
- Search and select the `Script Log` function.  
- Input the following:  
```
Huntress Agent failed to install. Refer to the logs: %Output%
```
![Image 20](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_16.png)  
![Image 21](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_18.png)  

## Step 10: Complete Script

![Image 22](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_19.png)  

## Script Deployment

This task has to be scheduled on `Deploy Huntress - MAC` the group for auto-deployment. The script can also be run manually if required.

Go to Automations > Tasks.  
Search for Huntress Agent Install.  
Then click on Schedule and click on the Select Target:  

![Image 23](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_20.png)  

Select the group "Deploy Huntress - MAC" and save the selection.  

![Image 24](..\..\..\static\img\Huntress-Agent-(Install)---MAC\image_21.png)  

Once selected, Click on Run to schedule the script as per requirement.

## Output

- Script log


