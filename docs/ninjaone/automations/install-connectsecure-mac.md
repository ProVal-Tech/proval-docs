---
id: '19378af5-7ee0-43b4-8051-58b280467a6c'
slug: /19378af5-7ee0-43b4-8051-58b280467a6c
title: 'CyberCNS ConnectSecure Mac - Install/Update'
title_meta: 'CyberCNS ConnectSecure Mac - Install/Update'
keywords: ['cybercns', 'connectsecure', 'vulnerability', 'management']
description: 'Install and Update the ConnectSecure v4 on Mac'
tags: ['vulnerability', 'security']
draft: false
unlisted: false
---

## Overview

Install and Update the ConnectSecure v4 on Mac

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

![Sample Run 2](../../../static/img/docs/556a0c6f-20ee-41ed-a802-b844ef54ae55/image6.webp)

![Sample Run 3](../../../static/img/docs/556a0c6f-20ee-41ed-a802-b844ef54ae55/image7.webp)

![Sample Run 4](../../../static/img/docs/556a0c6f-20ee-41ed-a802-b844ef54ae55/image8.webp)

## Dependencies

[cpval ConnectSecure CompanyID](/docs/c104e227-d5f3-432b-90fa-f31186536181)
[cpval ConnectSecure TenantID](/docs/3d1a16b3-688c-4911-a92d-835a578254a9)
[cpval ConnectSecure Deployment](/docs/9065b847-eadf-4f4a-9021-28ef2fc0f6cf)


## Automation Setup/Import

### Step 1

Navigate to `Administration` > `Library` > `Automation`  
![Step1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/step1.webp)

### Step 2

Locate the `Add` button on the right-hand side of the screen, click on it and click the `New Script` button.  
![Step2](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/step2.webp)

The scripting window will open.  
![ScriptingScreen](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/scriptingscreen.webp)

### Step 3

Configure the `Create Script` section as follows:

**Name:** `CyberCNS ConnectSecure Mac - Install/Update`  
**Description:** `Install and Update the ConnectSecure v4 on Mac`  
**Categories:** `ProVal`  
**Language:** `ShellScript`  
**Operating System:** `Mac`  
**Architecture:** `64-bit`  
**Run As:** `System`  
![Image10](../../../static/img/docs/556a0c6f-20ee-41ed-a802-b844ef54ae55/image10.webp)

## Step 4

Paste the following Shell script in the scripting section:  

```bash
#!/usr/bin/env bash

# Variables
cybercnscompanyid_v4=$(/Applications/NinjaRMMAgent/programdata/ninjarmm-cli get cpvalConnectsecureCompanyid)
cybercnstenant_v4=$(/Applications/NinjaRMMAgent/programdata/ninjarmm-cli get cpvalConnectsecureTenantid)

echo "Starting CyberCNS installation process..."

# Check if old CyberCNS v2 exists
if [ -f "/opt/CyberCNSAgentV2/cybercnsagentv2_darwin" ]; then
    echo "CyberCNS old version exists."

    # Uninstall old version
    sudo /opt/CyberCNSAgentV2/cybercnsagentv2_darwin -r

    # Remove old service plist if exists
    if [ -f "/Library/LaunchDaemons/com.CyberCNSAgent.AgentService.plist" ]; then
        sudo rm /Library/LaunchDaemons/com.CyberCNSAgent.AgentService.plist
        echo "Service has been uninstalled."
    fi

    # 7) Check if old binary is removed
    if [ ! -f "/opt/CyberCNSAgentV2/cybercnsagentv2_darwin" ]; then
        echo "CyberCNSv2 was uninstalled successfully."
    else
        echo "An error occurred: Failed to uninstall CyberCNSv2."
        exit 1
    fi
else
    echo "CyberCNSv2 does not exist."
fi

# If old version does not exist, proceed with v4 installation
if [ ! -f "/opt/CyberCNSAgentV2/cybercnsagentv2_darwin" ]; then
    echo "CyberCNS old version does not exist, Proceed installing CyberCNSv4."

    # Check if v4 is already installed
    if [ -f "/opt/CyberCNSAgent/cybercnsagent_darwin" ]; then
        echo "CyberCNSV4 is already installed."
        exit 0
    else
        echo "CyberCNSV4 does not exist, installation will start."
    fi

    # Validate variables
    if [ -z "$cybercnscompanyidv4" ]; then
        echo "An error occurred: CyberCNS Company ID Variable cannot be empty."
        exit 1
    fi

    if [ -z "$cybercnstenantidv4" ]; then
        echo "An error occurred: CyberCNS Tenant ID Variable cannot be empty."
        exit 1
    fi

    echo "Company and Tenant ID exist."

    # Create directory
    sudo mkdir -p /Library/NinjaOne/CyberCNSv4/

    # Create download2.sh script
    cat << 'EOF' | sudo tee /Library/NinjaOne/CyberCNSv4/download2.sh > /dev/null
#!/bin/bash
curl -k $(curl -L -s -g "https://configuration.myconnectsecure.com/api/v4/configuration/agentlink?ostype=darwinpkg" | tr -d '"') -o /Library/Kaseya/kworking/CyberCNSv4/cybercnsagent_darwin.pkg
EOF

    # Make script executable
    sudo chmod +x /Library/NinjaOne/CyberCNSv4/download2.sh

    # Execute download script
    echo "Downloading CyberCNSV4 package..."
    sudo /Library/NinjaOne/CyberCNSv4/download2.sh

    # Sleep 10 seconds
    sleep 10

    # Install pkg
    echo "Installing CyberCNSV4 package..."
    sudo installer -pkg /Library/Kaseya/kworking/CyberCNSv4/cybercnsagent_darwin.pkg -target /

    # Sleep 10 seconds
    sleep 10

    # Run install.sh with parameters
    echo "Running CyberCNS installation script..."
    sudo /opt/install.sh -c "$cybercnscompanyid_v4" -e "$cybercnstenant_v4" -j 'fzIj2inbybSKEcIkb0ALcN6eP3igod3XjiAgQ8-M-mun-cIFWEtBeX_-xPyJmRzBR7l3KeymRjmoXyrUPkHXwHT5iUVF4q4EVz2nuw' -i
    
    echo "sudo /opt/install.sh -c \"$cybercnscompanyid_v4\" -e \"$cybercnstenant_v4\" -j 'fzIj2inbybSKEcIkb0ALcN6eP3igod3XjiAgQ8-M-mun-cIFWEtBeX_-xPyJmRzBR7l3KeymRjmoXyrUPkHXwHT5iUVF4q4EVz2nuw' -i"

    # Sleep 30 seconds
    sleep 30

    # Check if v4 installed
    if [ -f "/opt/CyberCNSAgent/cybercnsagent_darwin" ]; then
        echo "CyberCNSV4 installation is successful."
    else
        echo "CyberCNSV4 installation failed."
        exit 1
    fi
fi
```

![Image11](../../../static/img/docs/556a0c6f-20ee-41ed-a802-b844ef54ae55/image11.webp)

## Saving the Automation

Click the `Save` button in the top-right corner of the screen to save your automation.  
![SaveButton](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/savebutton.webp)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/mfa.webp)

## Completed Automation

![image9](../../../static/img/docs/556a0c6f-20ee-41ed-a802-b844ef54ae55/image9.webp)

## Output

- Activity Details  
- Custom Field
