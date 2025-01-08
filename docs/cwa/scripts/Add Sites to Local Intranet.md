---
id: 'cwa-add-local-intranet-sites'
title: 'Add Local Intranet Sites'
title_meta: 'Add Local Intranet Sites'
keywords: ['intranet', 'windows', 'configuration', 'sites', 'local']
description: 'This document provides a detailed overview of a script that adds specified sites to the local intranet zone on Windows computers. It includes sample runs, user parameters, and output details to help users understand how to utilize the script effectively.'
tags: ['configuration', 'windows', 'setup', 'networking']
draft: false
unlisted: false
---
## Summary

The script functions by adding the site(s) specified in the `Sites` parameter to the 'local intranet zone' on the Windows computer.

![Image](5078775/docs/14680809/images/21248797)

## Sample Run

**Input:**  
![Image](5078775/docs/14680809/images/21280326)

**Result:**  
![Image](5078775/docs/14680809/images/21249062)

**Input:**  
![Image](5078775/docs/14680809/images/21280366)

**Result:**  
![Image](5078775/docs/14680809/images/21249092)

**Input:**  
![Image](5078775/docs/14680809/images/21280393)

**Result:**  
![Image](5078775/docs/14680809/images/21280692)

**Input:**  
**![Image](5078775/docs/14680809/images/21280394)**

**Result:**  
![Image](5078775/docs/14680809/images/21280693)

## Variables

| Name              | Description                                      |
|-------------------|--------------------------------------------------|
| ProjectName       | Add-LocalIntranetSites                           |
| WorkingDirectory   | C:\ProgramData\_Automation\Script\Add-LocalIntranetSites |
| ScriptPath        | C:\ProgramData\_Automation\Script\Add-LocalIntranetSites\Add-LocalIntranetSites.ps1 |

#### User Parameters

| Name      | Example                                    | Required | Description                                                                                      |
|-----------|--------------------------------------------|----------|--------------------------------------------------------------------------------------------------|
| Sites     | Automate<br>Automate,Ram,Development      | True     | Name of the site(s) to add to the local intranet zone. Multiple sites should be separated by a comma without any spaces between them. |
| Protocol  | https                                      | False    | Protocol to include along with the site. The default is HTTP. If this parameter is left blank, the script will automatically add HTTP along with the site. |

## Output

- Script Log


