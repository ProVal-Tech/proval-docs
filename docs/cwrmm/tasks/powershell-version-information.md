---
id: 'a8419e91-9e07-4f16-be4b-769c78f86f1b'
slug: /a8419e91-9e07-4f16-be4b-769c78f86f1b
title: 'PowerShell Version Information'
title_meta: 'PowerShell Version Information'
keywords: ['powershell', 'version', 'customfield', 'data', 'collection']
description: 'This document provides a detailed guide on how to gather the PowerShell version of a machine and store the results in a custom field. It includes instructions for manual execution, dependencies, variable documentation, and script deployment recommendations.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This task will gather the PowerShell version of the machine and store the results in the PowerShell Version Custom Field.

*The custom field is required before this script will run properly. Please ensure that the PowerShell Version Custom Field is present.*

## Manual Run

This script does not have any parameters and can be run against any online Windows device.

## Dependencies

[Custom Field - PowerShell Version](/docs/945d88e0-81a9-4253-8406-63fa7430d45a)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name       | Description                                                                                   |
|------------|-----------------------------------------------------------------------------------------------|
| %output%   | The output is retrieved by PowerShell and will be inserted into the custom field.            |

## Create Script

To implement this script, please create a new "Script Editor" style script in the system.

![Image1](../../../static/img/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b/image_1.webp)  
![Image2](../../../static/img/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b/image_2.webp)  

**Name:** PowerShell Version Information  
**Description:** This task will gather the PowerShell version of the machine and store the results in the PowerShell Version Custom Field  
**Category:** Data Collection  

![Image3](../../../static/img/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b/image_3.webp)  

### Script Editor

From the script editor tab  
![Image4](../../../static/img/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b/image_4.webp)  

Add three (3) new "Rows"

#### Row 1 function: PowerShell

![Image5](../../../static/img/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b/image_5.webp)  

This will bring up the PowerShell Editor. Paste the PowerShell into the PowerShell Script Editor Field  
![Image6](../../../static/img/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b/image_6.webp)  

```PowerShell
return "$(if($PSVersionTable.PSVersion.Major -lt 5) {'Failure'} else {'Success'}): $($PSVersionTable.PSVersion)"
```

#### Row 2 function: Script Log

![Image7](../../../static/img/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b/image_7.webp)  

This will open the script log editor.  
![Image8](../../../static/img/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b/image_8.webp)  

Please type %output% into this field. This will display the results of the above PowerShell in the script logs, making it easier to audit what happened when the script was run.

#### Row 3 function: Set Custom Field

*NOTE: The custom field must be created first.*  
![Image9](../../../static/img/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b/image_9.webp)  

When you select the "Set Custom Field" function, you will get a dialog box used to write the output to a specific custom field.  

Search for the custom field:  
![Image10](../../../static/img/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b/image_10.webp)  
![Image11](../../../static/img/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b/image_11.webp)  

Please write %output% to the "PowerShell Version" custom field. This will write the results of the PowerShell script to the PowerShell Version Custom Field.

## Script Deployment

ProVal recommends scheduling this task using a monitor and a machine group. Review the [solution](/docs/84b2e461-c2a3-423f-8a2c-0ac4e8e62fb9) document here for best practice implementation.

## Output

- Script log
- Custom Field