---
id: 'd21f56f3-43d8-4080-a7f0-ae57c27465e2'
slug: /d21f56f3-43d8-4080-a7f0-ae57c27465e2
title: 'Huntress Agent (Uninstall) - MAC'
title_meta: 'Huntress Agent (Uninstall) - MAC'
keywords: ['uninstall', 'huntress', 'mac', 'agent', 'script']
description: 'This document provides a comprehensive guide on uninstalling the Huntress agent from a Mac system using a custom script. It includes step-by-step instructions for creating and deploying the script, as well as handling potential errors during the uninstallation process.'
tags: ['uninstallation']
draft: false
unlisted: false
---

## Summary

This script uninstalls the Huntress agent from a Mac system.

## Create Script

Please create a new "PowerShell" style script to implement this process.

![Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_1_1.png)  
![Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_2_1.png)  

**Name:** Huntress Agent (Uninstall) - MAC  
**Description:** This script uninstalls the Huntress agent from a Mac system.  
**Category:** Custom  

![Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_3_1.png)  

# Script

## Row 1 Function: Bash Script

![Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_4_1.png)  

Paste the following Bash script and set the expected script execution time to 900 seconds.

```
#!/bin/bash

# Check if Huntress is installed
if [ ! -d "/Applications/Huntress.app" ]; then
    echo "Huntress is already uninstalled."
    exit 0
fi

# Uninstall Huntress
/Applications/Huntress.app/Contents/MacOS/Uninstall -S

# Revalidate uninstallation
if [ -d "/Applications/Huntress.app" ]; then
    echo "Failed to uninstall Huntress."
else
    echo "Huntress uninstalled successfully."
fi
```

![Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_5_1.png)  

## Step 2 Function: Script Log

- Add a new row in the If Section of the If/Else part by clicking the Add Row button.
- Search and select the `Script Log` function.
- Input the following:  

```
%Output%
```

![Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_6_1.png)  
![Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_7_1.png)  

## Step 3 Logic: If/Then

- Add a new `If/Then/Else` logic from the Add Logic dropdown menu.  

![Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_8_1.png)  

## Row 3a Condition: Output Contains

- Type `Failed to uninstall Huntress` in the Value box.  

![Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_9_1.png)  

## Row 3b Function: Script Exit

- Add a new row in the If Section of the If/Else part by clicking the Add Row button.
- Search and select the `Script Exit` function.
- Input the following:  

```
Huntress failed to uninstall. Refer to the logs: %Output%
```

![Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_10_1.png)  
![Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_11_1.png)  

## Step 4 Function: Script Exit

- Add a new row in the If Section of the If/Else part by clicking the Add Row button.
- Search and select the `Script Exit` function.
- Leave it blank  

```
```

![Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_10_1.png)  
![Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_12_1.png)  

## Step 5: Complete Script

![Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_13_1.png)  

## Script Deployment

For now, the task has been created to run manually on the machines.  
Go to Automations > Tasks.  
Search for Huntress Agent (Uninstall) - MAC.  
Then click on Schedule and provide the necessary parameters for script completion.  

![Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_14_1.png)  

## Output

- Script log

