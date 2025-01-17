---
id: '186ae433-e9bc-46d1-9056-71924879ae6e'
title: 'Enable IE Mode for a Specific Site in Edge'
title_meta: 'Enable IE Mode for a Specific Site in Edge'
keywords: ['ie', 'edge', 'integration', 'site', 'mode']
description: 'This document provides a PowerShell script that enables Internet Explorer mode for a specific site within the Microsoft Edge browser. It outlines the necessary variables, user parameters, and the process for implementation, ensuring that users can easily configure their settings for seamless browsing.'
tags: ['setup', 'software', 'windows']
draft: false
unlisted: false
---
## Summary

This script enables the IE mode for a particular site.  
Please provide the variable `InternetExplorerIntegrationCloudSiteList` in the PowerShell to allow the other sites to open in IE mode inside the Edge.

## Sample Run

![Sample Run](../../../static/img/Enable-IE-Mode-in-Microsoft-Edge/image_1.png)

## Variables

| Name                          | Description                                               |
|-------------------------------|-----------------------------------------------------------|
| Enabled IE Mode in Edge      | Computer EDF - Checked when IE Mode set in Edge          |

#### User Parameters

| Name                          | Example    | Required | Description                                           |
|-------------------------------|------------|----------|-------------------------------------------------------|
| InternetExplorerIntegrationCloudSiteList | https://   | True     | The site link which requires to open in Edge in IE Mode |

## Process

This script enables the IE mode for a particular site.  
Please provide the variable `InternetExplorerIntegrationCloudSiteList` in the PowerShell to allow the other sites to open in IE mode inside the Edge.  
Once the setting is done it checks the computer EDFs for the logging in the database.

## Output

- Script log












