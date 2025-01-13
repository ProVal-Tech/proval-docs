---
id: 'cwa-gpo-deployment-script'
title: 'GPO Deployment Script for Silent Installer'
title_meta: 'GPO Deployment Script for Silent Installer'
keywords: ['gpo', 'deployment', 'silent', 'installer', 'probe', 'url']
description: 'This document details a script that is part of a GPO deployment process, capable of generating a silent installer URL. It can be executed standalone or as part of a larger deployment strategy. The script saves time by automating the installer generation process and requires specific dependencies to function correctly.'
tags: ['gpo', 'installer', 'deployment', 'probe', 'url', 'database', 'configuration']
draft: false
unlisted: false
---
## Summary

This script is part of our GPO deployment script, but also can be run standalone. The script generates the silent installer, the same way the probe naturally would.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Network-Probe---Silent-EXE-URL-Generator/image_1.png)

## Dependencies

- Requires you to have a probe setup and the script **run on the probe**

## Variables

- `@LTSilentEXEURL@` = `@serveraddress@/Labtech/Deployment.aspx?%sqlresult%` --- This will be the full URL to download the silent installer
- `@serveraddress@` = `%sqlresult%` -- Setting internal variable to your default template's connection string
- `%sqlresult%` = `select substring_index(serveraddress,'|',1) from templates where templates.name = 'default'` --- This pulls in your default template's connection string.

## Process

1. The script inserts the Probe command to update the agent installer
2. Once the command completes, the script parses out the server address and the URL
3. Queries the default template connection string from the database.
4. Lastly, combines all the strings to create your silent installer URL download link.

- This would return the full URL to be used in the GPO Deployment script 

## Output

- Script log -> Logs the silent install URL to the script logs.



