---
id: 'cwa-enable-ie-mode-for-site'
title: 'Enable IE Mode for a Specific Site in Edge'
title_meta: 'Enable IE Mode for a Specific Site in Edge'
keywords: ['ie', 'edge', 'integration', 'site', 'mode']
description: 'This document provides a PowerShell script that enables Internet Explorer mode for a specific site within the Microsoft Edge browser. It outlines the necessary variables, user parameters, and the process for implementation, ensuring that users can easily configure their settings for seamless browsing.'
tags: ['configuration', 'windows', 'software', 'setup']
draft: false
unlisted: false
---
## Summary

This script enables the IE mode for a particular site.  
Please provide the variable `InternetExplorerIntegrationCloudSiteList` in the PowerShell to allow the other sites to open in IE mode inside the Edge.

## Sample Run

![Sample Run](5078775/docs/10220561/images/14191887)

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


