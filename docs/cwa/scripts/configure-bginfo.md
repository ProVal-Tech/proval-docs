---
id: '405866fb-2706-49b3-aed2-3d1f1fea4b4b'
slug: /405866fb-2706-49b3-aed2-3d1f1fea4b4b
title: 'Configure BGInfo'
title_meta: 'Configure BGInfo'
keywords: ['bginfo', 'configuration', 'download', 'tool', 'script']
description: 'This document outlines a script designed to download and configure the BGInfo tool, ensuring the proper .bgi configuration file is placed in the designated LTshare directory for optimal usage.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The purpose of the script is to download and configure the [BGInfo](https://learn.microsoft.com/en-us/sysinternals/downloads/bginfo) tool with the proper `.bgi` configuration file. `.bgi` file should be placed in the LTshare (WebDAV for hosted partners) at the `Transfer\Tools\BGInfo` directory, and the name of the file should be set in the Script's Global variable `bgiName`.

**Note:** The end machine might need to be restarted for the changes to take place.

## File Hash

**File Path:** `C:\ProgramData\_automation\Script\Deploy-BGinfo\Deploy-BGInfo.ps1`  
**File Hash (Sha256):** `2186E9DD322B29592686BF6F48A21E116187752AD5A748E40987F6C20B677A34`  
**File Hash (MD5):** `666A8A1AA66FE746EF224083BA52A737`

## Implementation

### Step 1  
Download the BGInfo.zip file to your computer from [Download BGInfo](https://download.sysinternals.com/files/BGInfo.zip).

### Step 2  
Expand the Zip file and run the `BGInfo.exe` file. This is how it will look, you can clear the contents on the left window and can write your own configuration.  
![Image1](../../../static/img/docs/405866fb-2706-49b3-aed2-3d1f1fea4b4b/Image1.webp)

### Step 3  
Write the required configuration to display on the user's desktop.  
![Image2](../../../static/img/docs/405866fb-2706-49b3-aed2-3d1f1fea4b4b/Image2.webp)

### Step 4  
Once your configuration file is written, Click on File option at the top right and Select `Save As`.  
![Image3](../../../static/img/docs/405866fb-2706-49b3-aed2-3d1f1fea4b4b/Image3.webp)

### Step 5  
Save the file with an appropriate name and .bgi extension. Try avoiding spaces and special characters in the file name.  
![Image4](../../../static/img/docs/405866fb-2706-49b3-aed2-3d1f1fea4b4b/Image4.webp)

### Step 6  
Now save the file in LTShare (WebDAV for hosted partners) at the `Transfer\Tools\BGInfo` directory. Create the Tools and BGInfo directory if missing.  
![Image5](../../../static/img/docs/405866fb-2706-49b3-aed2-3d1f1fea4b4b/Image5.webp)

### Step 7  
Open the script and save the exact name of the file under the global variable `bginame`.  
![Image6](../../../static/img/docs/405866fb-2706-49b3-aed2-3d1f1fea4b4b/Image6.webp)

### Step 8  
Save and test the script.  

The conguration file I have saved in the example screenshots will display the following information at the end machine.  

![Image7](../../../static/img/docs/405866fb-2706-49b3-aed2-3d1f1fea4b4b/Image7.webp)  

<span style={{color: 'skyblue'}}>**Note:** If the global variable `bgiName` is not set in the script then running the script will display the default information at user's desktop.</span>
![Image8](../../../static/img/docs/405866fb-2706-49b3-aed2-3d1f1fea4b4b/Image8.webp)  

## Sample Run  

![Image9](../../../static/img/docs/405866fb-2706-49b3-aed2-3d1f1fea4b4b/Image9.webp) 

## Variables  

| Name            | Description                                                                                           |
|-----------------|-------------------------------------------------------------------------------------------------------|
| Status          | FAILED/SUCCESS, returned by the EPM - Software Configuration - Remote Monitor - Configure BGInfo monitor set. |
| bgiURL          | URL to download .bgi configuration file from LTShare/WebDAV.                                          |
| Parameter       | Parameter to pass while running the PowerShell script configuring the tool on the end machine.        |
| ProjectName     | Deploy-BGInfo                                                                                         |
| WorkingDirectory| C:\ProgramData\_Automation\Script\Deploy-BGinfo                                                        |

## Global Variables  

| Name    | Example    | Required | Description                                                                                                      |
|---------|------------|----------|------------------------------------------------------------------------------------------------------------------|
| bgiName | proval.bgi | False    | Name of the .bgi configuration file generated and saved in LTShare. The tool will display the default information at the user's desktop if this variable is left blank/unconfigured. | 

## Output  

- Script Log