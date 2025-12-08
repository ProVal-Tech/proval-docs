---
id: 'adcaec00-fdee-4e38-add4-accca41b36b8'
slug: /adcaec00-fdee-4e38-add4-accca41b36b8
title: 'Test AD Health and Repair'
title_meta: 'Test AD Health and Repair'
keywords: ['ad', 'active-directory', 'domain-controller', 'self-heal', 'check-health', 'test-health', 'repair', 'repair-health']
description: 'This script automates health checks, self-healing, and conditional service restarts for Active Directory Domain Controllers. It helps administrators quickly identify and remediate AD issues, ensuring domain controller reliability and service continuity.'
tags: ['active-directory', 'domain']
draft: false
unlisted: false
---

## Overview
This script automates health checks, self-healing, and conditional service restarts for Active Directory Domain Controllers. It helps administrators quickly identify and remediate AD issues, ensuring domain controller reliability and service continuity.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/samplerun1.webp)

Search and select `Test Ad Health and Repair`
![SampleRun2](../../../static/img/docs/a8dc35d7-4708-4eca-9a3f-dca89cf90184/image.webp)

Set the required arguments and click the `Run` button to run the script.  
**Run As:** `System`  
**Preset Parameter:** `<Leave it Blank>`  
**SelfHeal:** `Initiates self-healing actions if AD issues are detected.Leave it blank to disable self-healing for the AD health issue fix, or set any value, such as 1, to enable the self-healing feature.`  
**RestartAllADService:** `Restarts all core AD-related services if issues are detected and SelfHeal is enabled.Leave it blank for no action, or set it to any value to allow all AD services to restart. Note: The SelfHeal parameter must be enabled for this feature to operate.`  
**ServicesToRestart:**  `Specify one or more AD-related services to restart if issues are detected and SelfHeal is enabled. Ex: DNS, Netlogon. Note: The SelfHeal parameter must be enabled for this feature to operate.`  

![SampleRun3](../../../static/img/docs/a8dc35d7-4708-4eca-9a3f-dca89cf90184/image1.webp)

**Run Automation:** `Yes`  
![RunAutomation](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/runautomation.webp)

## Dependencies

[Agnostic - Test-ADHealthAndRepair](/docs/f2c09601-b391-449b-9380-c022f1829eda)

[Custom field - cpvalAdHealthRepairResult](/docs/8777497d-0dd3-4f6e-af60-31e6d7debe58)

## Parameters

| Name | Required | Accepted Values | Default | Type | Description |
| ---- | -------- | --------------- | ------- | ---- | ----------- |
| SelfHeal | False | 1 | | String/Text | Initiates self-healing actions if AD issues are detected.Leave it blank to disable self-healing for the AD health issue fix, or set any value, such as 1, to enable the self-healing feature. |
| RestartAllADService | False | 1 | | String/Text | Restarts all core AD-related services if issues are detected and SelfHeal is enabled.Leave it blank for no action, or set it to any value to allow all AD services to restart. Note: The SelfHeal parameter must be enabled for this feature to operate. |
| ServicesToRestart | False | DNS, Netlogon | | String/Text | Specify one or more AD-related services to restart if issues are detected and SelfHeal is enabled. Ex: DNS, Netlogon. Note: The SelfHeal parameter must be enabled for this feature to operate. |


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

**Name:** `Test AD Health and Repair`  
**Description:** `This script automates health checks, self-healing, and conditional service restarts for Active Directory Domain Controllers. It helps administrators quickly identify and remedy AD issues, ensuring domain controller reliability and service continuity.`  
**Categories:** `ProVal`  
**Language:** `PowerShell`  
**Operating System:** `Windows`  
**Architecture:** `All`  
**Run As:** `System`  
![Script](../../../static/img/docs/a8dc35d7-4708-4eca-9a3f-dca89cf90184/image2.webp)

**PowerShell And Variables**

[Test-AdHealthAndRepair](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/test-adhealthandrepair.ps1)

## Saving the Automation

Click the `Save` button in the top-right corner of the screen to save your automation.  
![SaveButton](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/savebutton.webp)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/docs/b97b3d2c-ecc6-42ff-9236-36b14765c9b7/mfa.webp)

## Output

- Activity Details
- Refer to the logs: "C:\ProgramData\_automation\Script\Test-ADHealthAndRepair\Test-ADHealthAndRepair-log.txt"
- Refer to the error logs: "C:\ProgramData\_automation\Script\Test-ADHealthAndRepair\Test-ADHealthAndRepair-error.txt"
- Custom field [Custom field - cpvalAdHealthRepairResult](/docs/8777497d-0dd3-4f6e-af60-31e6d7debe58)
