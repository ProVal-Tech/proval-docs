---
id: '38674bcd-8b19-4072-a58f-314efad2e856'  
slug: /38674bcd-8b19-4072-a58f-314efad2e856  
title: 'Remove-ChromiumHomepage'  
title_meta: 'Remove-ChromiumHomepage'  
keywords: ['remove', 'homepage', 'chromium', 'browser']  
description: 'Documentation for the Remove-ChromiumHomepage command to remove homepage settings from popular Chromium-based browsers.'  
tags: ['chrome', 'web-browser']  
draft: false  
unlisted: false  
---  

## Description  
Removes homepage settings from popular Chromium-based browsers.  

## Usage  
1. Removes registry values that set popular Chromium-based browser homepage and homepage actions.  

Describe how the payload is executed and if it requires any parameters. Delete the parameter block below if not needed. State that this does not use a payload if it doesn’t.  

Explanation of the usage of the example below.  

```powershell  
.\Remove-ChromiumHomepage.ps1  
```  
This will remove all homepage policies for all the targeted browsers.  

```powershell  
.\Remove-ChromiumHomepage.ps1 -Target 'Chrome','Brave'  
```  
This will remove all homepage policies for the Google Chrome and Brave browsers.  

## Output  

```
.\Remove-ChromiumHomepage-log.txt  
```  