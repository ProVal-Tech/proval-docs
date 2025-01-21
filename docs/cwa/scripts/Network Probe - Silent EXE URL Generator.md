---
id: 'babcfa7d-a4cd-404f-9375-e2498856ff24'
title: 'GPO Deployment Script for Silent Installer'
title_meta: 'GPO Deployment Script for Silent Installer'
keywords: ['gpo', 'deployment', 'silent', 'installer', 'probe', 'url']
description: 'This document details a script that is part of a GPO deployment process, capable of generating a silent installer URL. It can be executed standalone or as part of a larger deployment strategy. The script saves time by automating the installer generation process and requires specific dependencies to function correctly.'
tags: ['database', 'deployment', 'gpo']
draft: false
unlisted: false
---

## Summary

This script is part of our GPO deployment process but can also be run standalone. The script generates the silent installer in the same way the probe naturally would.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Network-Probe---Silent-EXE-URL-Generator/image_1.png)

## Dependencies

- Requires you to have a probe set up and the script **run on the probe**.

## Variables

- `@LTSilentEXEURL@` = `@serveraddress@/Labtech/Deployment.aspx?%sqlresult%` — This will be the full URL to download the silent installer.
- `@serveraddress@` = `%sqlresult%` — Setting an internal variable to your default template's connection string.
- `%sqlresult%` = `select substring_index(serveraddress,'|',1) from templates where templates.name = 'default'` — This pulls in your default template's connection string.

## Process

1. The script inserts the Probe command to update the agent installer.
2. Once the command completes, the script parses out the server address and the URL.
3. It queries the default template connection string from the database.
4. Lastly, it combines all the strings to create your silent installer URL download link.

- This would return the full URL to be used in the GPO Deployment script.

## Output

- Script log -> Logs the silent install URL to the script logs.
