---
id: 'c1b906ec-7aea-41f3-8241-358d3d644900'
slug: /c1b906ec-7aea-41f3-8241-358d3d644900
title: 'Get Patch Config'
title_meta: 'Get Patch Config'
keywords: ['patch', 'config', 'windows', 'update', 'script', 'automation']
description: 'This document details the implementation of the Get-PatchConfig script within the ConnectWise Automate platform, focusing on retrieving and storing essential data for validating changes made by the WUA Settings Validation script. It includes information on file paths, hashes, update notices, sample runs, dependencies, variables, user parameters, and output.'
tags: ['database', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This Automate implementation of the [Get-PatchConfig](/docs/b43fd352-5874-472a-9fd9-02c8aee38515) agnostic script effectively retrieves and stores the essential data needed to validate the changes made by the [WUA Settings Validation](/docs/1f78325c-968a-4a73-ba85-2a18c061063e) script into a custom table.

**File Path:** `C:/ProgramData/_Automation/script/Get-PatchConfig/Get-PatchConfig.ps1`  
**File Hash (SHA256):** `0273E2B1D4A623A6AFD274B7E861D75225D8A5464FE51A5971ED331C7D7861E2`  
**File Hash (MD5):** `589E54907484FC449A129BEB2C47D246`  

**File Path:** `C:/ProgramData/_Automation/script/Get-PatchConfig/Get-PatchConfigAI.ps1`  
**File Hash (SHA256):** `28038C9DD4A966D5C75ECAD5E11D2E3F3A2E3CC93447F26854BB90151441881E`  
**File Hash (MD5):** `144299C1C2B3EF52723BAABEFF7FAC45`  

## Update Notice: 29-Oct-2024

The script has been updated to indicate whether Windows upgrades or feature updates are restricted from the registry key for Windows 10 and 11.  
Reference: [Windows Update Policy](https://admx.help/?Category=Windows_10_2016&Policy=Microsoft.Policies.WindowsUpdate::TargetReleaseVersion)

Execute the script against any online Windows computer with the `Set_Environment` parameter set to `1`. This will add the newly introduced column `upgradeRestricted` to the [pvl_patch_config](/docs/c9891eb9-3731-4b0d-9882-dcb4a73229eb) table, which is necessary for the solution.  

![Image](../../../static/img/docs/c1b906ec-7aea-41f3-8241-358d3d644900/image_1.webp)

## Sample Run

**First Execution:** Execute the script against any online Windows computer with the `Set_Environment` parameter set to `1`. This will create the [pvl_patch_config](/docs/c9891eb9-3731-4b0d-9882-dcb4a73229eb) table, which is necessary for the solution.  

![Image](../../../static/img/docs/c1b906ec-7aea-41f3-8241-358d3d644900/image_1.webp)

**Regular Execution:**  
![Image](../../../static/img/docs/c1b906ec-7aea-41f3-8241-358d3d644900/image_2.webp)

## Dependencies

[EPM - Data Collection - Agnostic - Script - Get-PatchConfig](/docs/b43fd352-5874-472a-9fd9-02c8aee38515)  

## Variables

| Name              | Description                       |
|-------------------|-----------------------------------|
| TableName         | pvl_patch_config                  |
| ProjectName       | Get-PatchConfig                   |
| WorkingDirectory   | C:/ProgramData/_Automation/Script/Get-PatchConfig |

## User Parameters

| Name              | Example | Required                      | Description                                                                                      |
|-------------------|---------|-------------------------------|--------------------------------------------------------------------------------------------------|
| Set_Environment    | 1       | True (For first execution)    | Execute the script with this parameter set to 1 after importing it to create the [pvl_patch_config](/docs/c9891eb9-3731-4b0d-9882-dcb4a73229eb) table. |

## Output

- Script log
- Local file on computer
- Custom Table
- Dataview