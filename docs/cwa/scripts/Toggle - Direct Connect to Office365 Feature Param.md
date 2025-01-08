---
id: 'cwa-direct-connect-office365-feature'
title: 'Direct Connect to Office365 Feature'
title_meta: 'Direct Connect to Office365 Feature Overview'
keywords: ['office365', 'outlook', 'autodiscover', 'migration', 'registry']
description: 'This document discusses the Direct Connect to Office365 feature in Outlook 2016, detailing its implications during migration to Office365, and provides a PowerShell script to manage the registry settings to prevent unwanted connections to Office365 accounts.'
tags: ['office365', 'outlook', 'configuration', 'migration', 'windows']
draft: false
unlisted: false
---
## Summary

Microsoft launched the **“Direct Connect to Office365 Feature”** (Outlook 2016 version 16.0.6741.2017 and higher) that forces your Outlook 2016 to connect to Office365 when:

- You have users that are not yet active to Office365 has a mailbox provisioned to it due to Exchange license assigned
- *Autodiscover* is not working on the source server.
- Connection of the computer and the source server is interrupted or blocked by firewall/antivirus

This feature is great since it would automatically detect your Office365 account; however, it can also be a huge problem when you’re in the process of migrating to Office365.

When this happens, email continues to work; however, the user is not going to receive any emails to Outlook since it’s connected to Office365; they receive it to their respective source server.

*See this article for more information about “Direct Connect To Office365” Feature:* [https://docs.microsoft.com/en-us/office365/troubleshoot/administration/unexpected-autodiscover-behavior](https://docs.microsoft.com/en-us/office365/troubleshoot/administration/unexpected-autodiscover-behavior)

The script can be used to create a user-level registry key for all the users to prevent this behavior or to reset this behavior back to normal. 

Please make sure the "ExcludeExplicitO365Endpoint" parameter has the right value. A value of 1 will "Prevent Outlook from Connecting to an Office 365 Account," while a value of 0 will "Allow Outlook to Connect to an Office 365 Account."

## Sample Run

![Sample Run](5078775/docs/10852119/images/15102582)

## Variables

| Name    | Description                                                  |
|---------|--------------------------------------------------------------|
| OutCome | Output of the PowerShell script Writing the Registry Value   |

#### User Parameters

| Name                       | Example | Required | Description                                                                                                                                                     |
|----------------------------|---------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ExcludeExplicitO365Endpoint | 1       | True     | It represents the action you would like to perform with the script. A value of 1 will "Prevent Outlook from Connecting to an Office 365 Account," while a value of 0 will "Allow Outlook to Connect to an Office 365 Account." |

## Process

1. Verify the value passed to the ExcludeExplicit0365Endpoint parameter. 
2. Executes the PowerShell script to modify/add the registry key.
3. Logs the output of the script.

## Output

Script Log


