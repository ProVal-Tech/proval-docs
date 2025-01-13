---
id: 'cwa-modify-windows-host-file'
title: 'Modify Windows Host File'
title_meta: 'Modify Windows Host File'
keywords: ['windows', 'host', 'file', 'modify', 'audit', 'add', 'reset', 'dns']
description: 'This document provides a comprehensive guide on how to modify the Windows host file, including adding entries, gathering information, and resetting it to default settings. It outlines associated scripts for auditing, adding, and resetting host file entries, as well as implementation steps to ensure regular updates.'
tags: ['windows', 'configuration', 'dns', 'script', 'setup', 'update']
draft: false
unlisted: false
---
## Purpose

The purpose of this solution is to provide a quick and easy way to modify the windows host file. Either by adding values, gathering information, or resetting the host file to defaults.

## Associated Content

| Content                                                                                      | Type    | Function                                                                                                                      |
|----------------------------------------------------------------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------|
| [EPM - Windows Configuration - Script - Hosts File - Audit](https://proval.itglue.com/DOC-5078775-9106329) | Script  | This script gathers information on the contents of the windows host file and outputs them to the Host File Contents EDF.     |
| [EPM - Windows Configuration - Script - Hosts File - Add](https://proval.itglue.com/DOC-5078775-9106955)   | Script  | This script takes user parameters set when running the script and adds a host file entry to the machines host file and runs a ipconfig /flushdns. |
| [EPM - Windows Configuration - Script - Hosts File - Reset](https://proval.itglue.com/DOC-5078775-9107163)  | Script  | This script will reset the host file to defaults, removing any and all customizations and then run a ipconfig /flushdns.    |
| [CWM - Automate - Dataview - Hosts File - Audit [Script]](https://proval.itglue.com/DOC-5078775-10894199)   | Dataview| It shows the Uncommented content of the Host File at a single place.                                                          |

## Implementation

1. Import the following scripts
   1. [EPM - Windows Configuration - Script - Hosts File - Audit](https://proval.itglue.com/DOC-5078775-9106329)  
   2. [EPM - Windows Configuration - Script - Hosts File - Add](https://proval.itglue.com/DOC-5078775-9106955)  
   3. [EPM - Windows Configuration - Script - Hosts File - Reset](https://proval.itglue.com/DOC-5078775-9107163)  
2. Import the Dataview [CWM - Automate - Dataview - Hosts File - Audit [Script]](https://proval.itglue.com/DOC-5078775-10894199)  
3. Schedule the Script [EPM - Windows Configuration - Script - Hosts File - Audit](https://proval.itglue.com/DOC-5078775-9106329) to run against the desired computers at a regular interval to keep the dataview up to date.




