---
id: 'rmm-powershell-version-information'
title: 'PowerShell Version Information'
title_meta: 'PowerShell Version Information'
keywords: ['powershell', 'version', 'customfield', 'data', 'collection']
description: 'This document provides a detailed guide on how to gather the PowerShell version of a machine and store the results in a custom field. It includes instructions for manual execution, dependencies, variable documentation, and script deployment recommendations.'
tags: ['customfield', 'data', 'script', 'monitor', 'windows']
draft: false
unlisted: false
---
## Summary

This task will gather the PS version of the machine and put the results into the Powershell Version Custom Field.

*The custom field is required before this script will run properly. Please ensure that the PowerShell Version Custom Field is present.*

## Manual Run

This script does not have any parameters and can be run against any online Windows device.

## Dependencies

[CW RMM - Custom Field - PowerShell Version](https://proval.itglue.com/DOC-5078775-12824368)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name       | Description                                                                                   |
|------------|-----------------------------------------------------------------------------------------------|
| %output%   | The output is retrieved by PowerShell and will be inserted into the custom field.            |

## Create Script

To implement this script, please create a new "Script Editor" style script in the system.

![Image1](../../../static/img/PowerShell-Version-Information/image_1.png)  
![Image2](../../../static/img/PowerShell-Version-Information/image_2.png)  

**Name:** PowerShell Version Information  
**Description:** This task will gather the PS version of the machine and put the results into the Powershell Version Custom Field  
**Category:** Data Collection  

![Image3](../../../static/img/PowerShell-Version-Information/image_3.png)  

### Script Editor

From the script editor tab  
![Image4](../../../static/img/PowerShell-Version-Information/image_4.png)  

Add three (3) new "Rows"

#### Row 1 function: PowerShell

![Image5](../../../static/img/PowerShell-Version-Information/image_5.png)  

This will bring up the PowerShell Editor. Paste the PowerShell into the PowerShell Script Editor Field  
![Image6](../../../static/img/PowerShell-Version-Information/image_6.png)  

```
return "$(if($PSVersionTable.PSVersion.Major -lt 5) {'Failure'} else {'Success'}): $($PSVersionTable.PSVersion)"
```

Please leave the timeout set to 300 seconds.

#### Row 2 function: Script Log

![Image7](../../../static/img/PowerShell-Version-Information/image_7.png)  

This will open up the script log editor.  
![Image8](../../../static/img/PowerShell-Version-Information/image_8.png)  

Please type in %output% into this field. This will display the results of the above PowerShell in the script logs. This makes it easier to audit what happened when the script was run.

#### Row 3 function: Set Custom Field

*NOTE: The custom field must be created first.*  
![Image9](../../../static/img/PowerShell-Version-Information/image_9.png)  

When you select the "Set Custom Field" function you will get a dialog box used to write the output to a specific custom field.  

Search for the custom field:  
![Image10](../../../static/img/PowerShell-Version-Information/image_10.png)  
![Image11](../../../static/img/PowerShell-Version-Information/image_11.png)  

Please write in %output% to the "PowerShell Version" custom field. This will write the results of the PowerShell script to the PowerShell Version Custom Field.

## Script Deployment

ProVal recommends scheduling this task using a monitor and a machine group. Please review the [Solutions](https://proval.itglue.com/5078775/docs/12824365#version=published&documentMode=view) Document here for best practice implementation.

## Output

- Script log
- Custom Field



