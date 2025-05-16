---
id: '11444307-4a3f-4388-b5c5-096a50725b4e'
slug: /11444307-4a3f-4388-b5c5-096a50725b4e
title: 'Threatlocker Deployment [MAC]'
title_meta: 'Threatlocker Deployment [MAC]'
keywords: ['Threatlocker','MAC','GroupKey','Deployment']
description: 'This script deploys threatlocker agent on Mac machines'
tags: ['security','setup','macos']
draft: false
unlisted: false
---

## Overview
This script deploys threatlocker agent on Mac machines.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

## Dependencies
- [cPVAL ThreatLocker Mac GroupKey](/docs/8305e5b2-41ee-44bb-848e-758ac72b185f)  

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

`Name`: Threatlocker Deployment [MAC]
`Description`: This script deploys threatlocker agent on Mac machines 
`Categories`: ProVal  
`Language`: ShellScript 
`Operating System`: Mac 
`Architecture`: 64-bit
`Run As`: System  
![CreateSript](../../../static/img/docs/11444307-4a3f-4388-b5c5-096a50725b4e/image1.webp)


### Step 4

Paste the following Shell script in the scripting section:

```
#!/bin/bash
    GroupKey= Ninja-property-get cpvalThreatlockerMacGroupkey
#install
if [ ! -d /Applications/Threatlocker.app ]
    then
        curl --output-dir "/Applications" -O https://updates.threatlocker.com/repository/mac/1.0/Threatlocker.app.zip
        echo "Downloading Threatlocker"
        open /Applications/Threatlocker.app.zip
        sleep 5
        osascript -e 'quit app "Finder"'
        rm -d /Applications/Threatlocker.app.zip
        if [ ! -d /Applications/Threatlocker.app ]
            then
                echo "Not able to download the file"
                exit 1
                else
                open /Applications/ThreatLocker.app --args -groupKey $GroupKey
                echo "Installing Threatlocker"
                sleep 15
                echo "Verifying Group Key"
                sleep 15
                if [ ! -d /Library/Application\ Support/Threatlocker ]
                    then
                        echo "GroupKey is Invalid"
                        exit 1
                    else
                        echo "Threatlocker Installed"
                        exit 0
                fi
        fi
fi
```
![CreateSript](../../../static/img/docs/11444307-4a3f-4388-b5c5-096a50725b4e/image2.webp)

## Script Variables

Click the `Add` button next to `Script Variables`.  
![AddVariableButton](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/addvariablebutton.webp)

## Saving the Automation

Click the Save button in the top-right corner of the screen to save your automation.  
![SaveButton](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/savebutton.webp)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/mfa.webp)

## Completed Automation
![CompletedAutomation](../../../static/img/docs/11444307-4a3f-4388-b5c5-096a50725b4e/image3.webp)

## Output
- Activity Details  
