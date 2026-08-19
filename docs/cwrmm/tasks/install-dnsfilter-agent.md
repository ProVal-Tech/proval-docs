---
id: '5f0490f8-c2ce-4afe-92a0-d75699150a24'
slug: /5f0490f8-c2ce-4afe-92a0-d75699150a24
title: 'Install DNSFilter Agent'
title_meta: 'Install DNSFilter Agent'
keywords: ['dns', 'filter', 'agent', 'installation', 'windows', 'macintosh']
description: 'Deploys DNSFilter Agent on both windows and MAC machines.'
tags: ['installation', 'dns']
draft: false
unlisted: false
last_update:
  date: 2026-02-23
---

## Summary
Deploys DNSFilter Agent on both windows and MAC machines.

## Sample Run
![Sample Run](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/SampleRun.webp)

## Dependencies

- [Custom Field - DNSFilter Deployment Key](/docs/b4038e72-ef58-4e35-8b7b-cfe0e2536c87)
- [Solution - DNS Filter Agent Deployment](/docs/fd6fcda6-9a87-4275-b6eb-1a8f8f63099d)

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

- **Name:** `Install DNSFilter Agent`  
- **Description:** `Deploys DNSFilter Agent on both windows and MAC machines.`  
- **Category:** `Custom`

![Image1](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/image1.webp)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

#### Row 1: Set Pre-defined Variable ( @DeploymentKey@ = DNSFilter Deployment Key )

- **Variable Name:** `DeploymentKey`  
- **Type:** `Custom Field`  
- **Custom Field:** `DNSFilter Deployment Key`  
- **Continue on Failure:** `True`  
- **Operating System:** `Windows,MacOs`

![Image2](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/image2.webp)

#### Row 2: PowerShell script

- **Use Generative AI Assist for script creation:** `False`  
- **Expected time of script execution in seconds:** `600`  
- **Continue on Failure:** `False`  
- **Run As:** `System`  
- **Operating System:** `Windows`  
- **PowerShell Script Editor:**  

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/install-dnsfilter-agent/script.ps1)



![Image3](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/image3.webp)

#### Row 3: Bash script

- **Use Generative AI Assist for script creation:** `False`  
- **Expected time of script execution in seconds:** `600`  
- **Continue on Failure:** `False`  
- **Run As:** `System`  
- **Operating System:** `MacOs`  
- **Bash Script Editor:**

[Bash Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/install-dnsfilter-agent/script.sh)



![Image4](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/image4.webp)

#### Row 7: Script Log

- **Script Log Message:** `%Output%`  
- **Operating System:** `Windows`, `MacOs`

![Image5](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/image5.webp)


## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Image6](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/image6.webp)

## Deployment
This task has to be scheduled on the `DNSFilter Agent Deployment` group for auto deployment. The script can also be run manually if required.

- Go to Automations > Tasks.  
- Search for `Install DNSFilter Agent`.  
- Then click on Schedule and provide the parameter details as necessary for the script completion.

**Target Group**:
![Deployment1](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/Deployment1.webp)

**Complete Schedule Task**:
![Deployment2](../../../static/img/docs/5f0490f8-c2ce-4afe-92a0-d75699150a24/Deployment2.webp)


## Output
- Script Logs

## Changelog

### 2026-02-18

- Initial version of the document

