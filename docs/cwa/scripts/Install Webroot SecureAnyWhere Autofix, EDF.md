---
id: 'cddb5b54-a76e-4d74-8226-8f536d8f0eb4'
title: 'Webroot Deployment Script for Agents'
title_meta: 'Webroot Deployment Script for Agents'
keywords: ['webroot', 'deployment', 'agents', 'keycode', 'edf', 'uninstall', 'groupname', 'groupcode']
description: 'This document provides a comprehensive guide on deploying Webroot to agents using the Webroot site keycode client-EDF. It includes sample runs, dependencies for obtaining the necessary Webroot information, detailed descriptions of the required EDFs, and the expected output of the script.'
tags: ['deployment', 'software', 'webroot']
draft: false
unlisted: false
---

## Summary

This script deploys Webroot to the agents using the "Webroot site keycode" client-EDF.

## Sample Run

![Sample Run](../../../static/img/Install-Webroot-SecureAnyWhere-Autofix,-EDF/image_1.png)

## Dependencies

Please follow the documents below to obtain the Webroot Site Keycode and the Webroot GroupName and GroupCode.

- [Webroot Site KeyCode](<./Webroot Site KeyCode.md>)
- [Webroot GroupCode and GroupName Fetching](<../roles/Webroot GroupCode and GroupName Fetching.md>)

## EDFs

| Name                                      | Level   | Required | Description                                                                                                                                                                                                                                                                                 |
|-------------------------------------------|---------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Webroot Site KeyCode                      | Client  | True     | This stores the site keycode, which is available at the portal.                                                                                                                                                                                                                           |
| Webroot DisableUninstall                  | Client  | False    | This sets the Webroot uninstallation to be disabled during installation. It will prevent uninstallation using the script, and the user will not be able to uninstall it manually.                                                                                                        |
| Exclude Webroot DisableUninstall          | Location| False    | If set to True, then the agents of the location will be excluded from the disable uninstall setting.                                                                                                                                                                                      |
| Exclude Webroot DisableUninstall          | Computer| False    | If set to True, then the agent will be excluded from the disable uninstall setting.                                                                                                                                                                                                         |
| WorkstationWebrootGroupName               | Client  | False    | If the name is provided in the text EDF, it will be used for audit purposes to show where the agent will move to a custom workstation group in the Webroot portal. To get the group name, follow the document: [Webroot GroupCode and GroupName Fetching](<../roles/Webroot GroupCode and GroupName Fetching.md>). |
| WorkstationWebrootGroupCode               | Client  | False    | This text EDF needs to be filled with the Group code to direct the agent to move to it in the portal after installation. To get the group code, follow the document: [Webroot GroupCode and GroupName Fetching](<../roles/Webroot GroupCode and GroupName Fetching.md>).                      |
| ServerWebrootGroupName                    | Client  | False    | This text EDF is used for servers and needs to be filled with the group name to direct the agent to move to a server group after installation. To get the group name, follow the document: [Webroot GroupCode and GroupName Fetching](<../roles/Webroot GroupCode and GroupName Fetching.md>).  |
| ServerWebrootGroupCode                    | Client  | False    | This text EDF is used for servers and needs to be filled with the group code to direct the agent to move to a server group after installation. To get the group code, follow the document: [Webroot GroupCode and GroupName Fetching](<../roles/Webroot GroupCode and GroupName Fetching.md>).  |

## Output

- Script log
