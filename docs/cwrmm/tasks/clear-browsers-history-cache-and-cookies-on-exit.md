---
id: 'a0fec809-e3bd-4ea8-828f-e2292d42e2a4'
slug: /a0fec809-e3bd-4ea8-828f-e2292d42e2a4
title: 'Clear Browsers History, Cache, and Cookies on Exit'
title_meta: 'Clear Browsers History, Cache, and Cookies on Exit'
keywords: ['browser', 'chrome', 'brave', 'edge', 'firefox', 'google-chrome', 'microsoft-edge', 'mozilla-firefox', 'history', 'cache', 'cookies']
description: 'The script configures the supported installed browsers to clear history, cache, and cookies upon exit'
tags: ['browsers', 'chrome', 'edge', 'firefox']
draft: false
unlisted: false
last_update:
  date: 2025-06-03
---

## Summary

The script configures the following installed browsers to clear history, cache, and cookies upon exit:

- Google Chrome
- Microsoft Edge
- Brave
- Mozilla Firefox

## Sample Run

![Image1](../../../static/img/docs/a0fec809-e3bd-4ea8-828f-e2292d42e2a4/image1.webp)  
![Image2](../../../static/img/docs/a0fec809-e3bd-4ea8-828f-e2292d42e2a4/image2.webp)

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

`Name:` Clear Browsers History, Cache, and Cookies on Exit   
`Description:`  The script configures the following installed browsers to clear history, cache, and cookies upon exit:

- Google Chrome
- Microsoft Edge
- Brave
- Mozilla Firefox`  

`Category:` Custom

![Image3](../../../static/img/docs/a0fec809-e3bd-4ea8-828f-e2292d42e2a4/image3.webp)

### Script Editor

Click the `Add Row` button in the `Script Editor` section to start creating the script  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear:  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

#### Row 1 Function: PowerShell

Search and select the `PowerShell Script` function.  
![AddPowerShell](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addpowershellfunction.webp)  
![AddedPowerShell](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addedpowershellfunction.webp)  

The following function will pop up on the screen:  
![BlankPowerShell](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankpowershellfunction.webp)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/clear-browsers-history-cache-and-cookies-on-exit/script.ps1)



![Image4](../../../static/img/docs/a0fec809-e3bd-4ea8-828f-e2292d42e2a4/image4.webp)

#### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![AddRow](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addrow.webp)

A blank function will appear.  
![BlankFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankfunction.webp)

Search and select the `Script Log` function.  
![AddScriptLogFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/addscriptlogfunction.webp)

The following function will pop up on the screen:  
![BlankScriptLogFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/blankscriptlogfunction.webp)

In the script log message, simply type `%Output%` and click the `Save` button.  
![OutputScriptLogFunction](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/outputscriptlogfunction.webp)

## Save Task

Click the `Save` button at the top-right corner of the screen to save the script.  
![SaveButton](../../../static/img/docs/b194bbed-fe64-4ced-8410-21281b08de07/savebutton.webp)

## Completed Task

![Image5](../../../static/img/docs/a0fec809-e3bd-4ea8-828f-e2292d42e2a4/image5.webp)

## Output

- Script logs

## Changelog

### 2025-05-28

- Initial version of the document

