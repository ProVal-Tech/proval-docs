---
id: 'cwa-remove-screenconnect'
title: 'Remove Additional ScreenConnect Clients'
title_meta: 'Remove Additional ScreenConnect Clients'
keywords: ['screenconnect', 'automate', 'script', 'removal', 'edf']
description: 'This document provides a script for removing all instances of ScreenConnect from machines, keeping only the version integrated with Automate or specified permitted versions. It includes setup instructions, client-level and location-level EDF configurations, and output details.'
tags: ['automation', 'script', 'connectwise', 'client', 'exclusions']
draft: false
unlisted: false
---
<div class='text-section scrollable'>

![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)

**_PLEASE NOTE_** -  

**If you are NOT a current ProVal partner - you are using this content at your own risk and support will NOT be provided!**

**This script will, by default, attempt to remove ALL ScreenConnect versions that do not match your Automate Deployed version.**

**If you would like to add another permitted ScreenConnect version, please refer to the ExtraDataFields section of the document. We also recommend testing the script before deploying it in mass.**

![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)

## Summary

This script removes all instances of ScreenConnect from the machine except the one integrated with Automate or any other optional ScreenConnect instances provided in client EDF `Other Permitted SC Instances`.

## Dependencies

[CWM - Automate - Internal Monitor - Remove Additional ScreenConnect Clients](https://proval.itglue.com/DOC-5078775-15274649)

## Importing Script via XML

1. Download the script XML

   ![Download XML](5078775/docs/14767921/images/22050579)

2. Login to your Automate thick client
3. Navigate to: System, General, Import, XML Expansion
4. Browse to the XML downloaded from this Document

   ![Browse XML](5078775/docs/14767921/images/22050428)

5. Click YES to the import warning

   ![Import Warning](5078775/docs/14767921/images/22050441)

6. Use CTRL-R or the Reload System Cache drop down

   ![Reload System Cache](5078775/docs/14767921/images/22050528)

7. Script will be located in: Automation, Scripts, ProVal, Connectwise Control folder

## Sample Run

![Sample Run](5078775/docs/14767921/images/21373649)

## Client Level EDF

| **Name**                       | **Type**   | **Required** | **Example**                      | **Section**      | **Description**                                                                                                                                                                                                 |
|--------------------------------|------------|--------------|----------------------------------|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Other Permitted SC Instances    | TextBox   | False        | 6ef67d57664499m5|0di7fd57637401k5 | ScreenConnect      | Mention the Instance IDs other than the Default one, which you would not like to remove from the client's machines. Remember to separate the instance IDs by Pipeline (|) if you are mentioning multiple instances and there should be no spacing in them. Like shown below: `@instanceid1@|@instanceid2@` |
| Remove Additional SC Clients    | CheckBox  | True         |                                  | ScreenConnect      | Mark the EDF to enable the Auto-Removal automation for the client.                                                                                                                                           |

![Client Level EDF](5078775/docs/14767921/images/22176874)

## Location Level EDF

| **Name**                        | **Type**   | **Required** | **Example** | **Section** | **Description**                                                                                               |
|---------------------------------|------------|--------------|-------------|-------------|---------------------------------------------------------------------------------------------------------------|
| Exclude - Additional SC Removal | Check-Box | False        |             | Exclusions   | Mark the EDF to exclude the location from the Auto-Removal Automation.                                       |

![Location Level EDF](5078775/docs/14767921/images/22176879)

## Computer Level EDF

| **Name**                        | **Type**   | **Required** | **Example** | **Section** | **Description**                                                                                               |
|---------------------------------|------------|--------------|-------------|-------------|---------------------------------------------------------------------------------------------------------------|
| Exclude - Additional SC Removal | Check-Box | False        |             | Exclusions   | Mark the EDF to exclude the computer from the Auto-Removal Automation.                                       |

![Computer Level EDF](5078775/docs/14767921/images/22176880)

## Output

- Script Logs

