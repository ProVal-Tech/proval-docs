---
id: '50779f68-4329-4d15-b069-c50fcba00614'
slug: /50779f68-4329-4d15-b069-c50fcba00614
title: 'Remove - All But My - ScreenConnect Client Installations'
title_meta: 'Remove - All But My - ScreenConnect Client Installations'
keywords: ['screenconnect', 'automate', 'script', 'removal', 'edf']
description: 'This document provides a script for removing all instances of ScreenConnect from machines, keeping only the version integrated with Automate or specified permitted versions. It includes setup instructions, client-level and location-level EDF configurations, and output details.'
tags: ['connectwise']
draft: false
unlisted: false
---

<div class='text-section scrollable'>

![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)

**_PLEASE NOTE_** -  

**If you are NOT a current ProVal partner, you are using this content at your own risk, and support will NOT be provided!**

**This script will, by default, attempt to remove ALL ScreenConnect versions that do not match your Automate deployed version.**

**If you would like to add another permitted ScreenConnect version, please refer to the ExtraDataFields section of the document. We also recommend testing the script before deploying it en masse.**

![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)

## Summary

This script removes all instances of ScreenConnect from the machine except the one integrated with Automate or any other optional ScreenConnect instances provided in the client EDF `Other Permitted SC Instances`.

## Dependencies

[CWM - Automate - Internal Monitor - Remove Additional ScreenConnect Clients](/docs/7803bfd7-52e0-482d-805a-29aca6cadf04)

## Importing Script via XML

1. Download the script XML

   ![Download XML](../../../static/img/docs/50779f68-4329-4d15-b069-c50fcba00614/image_1.webp)

2. Log in to your Automate thick client
3. Navigate to: System, General, Import, XML Expansion
4. Browse to the XML downloaded from this document

   ![Browse XML](../../../static/img/docs/50779f68-4329-4d15-b069-c50fcba00614/image_2.webp)

5. Click YES to the import warning

   ![Import Warning](../../../static/img/docs/50779f68-4329-4d15-b069-c50fcba00614/image_3.webp)

6. Use CTRL-R or the Reload System Cache dropdown

   ![Reload System Cache](../../../static/img/docs/50779f68-4329-4d15-b069-c50fcba00614/image_4.webp)

7. The script will be located in: Automation, Scripts, ProVal, Connectwise Control folder

## Sample Run

![Sample Run](../../../static/img/docs/50779f68-4329-4d15-b069-c50fcba00614/image_5.webp)

## Client Level EDF

| **Name**                       | **Type**   | **Required** | **Example**                      | **Section**      | **Description**                                                                                                                                                                                                 |
|--------------------------------|------------|--------------|----------------------------------|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Other Permitted SC Instances    | TextBox   | False        | 6ef67d57664499m5|0di7fd57637401k5 | ScreenConnect      | Mention the Instance IDs other than the Default one, which you would not like to remove from the client's machines. Remember to separate the instance IDs by pipe (|) if you are mentioning multiple instances, and there should be no spacing in them. Like shown below: `@instanceid1@|@instanceid2@` |
| Remove Additional SC Clients    | CheckBox  | True         |                                  | ScreenConnect      | Mark the EDF to enable the Auto-Removal automation for the client.                                                                                                                                           |

![Client Level EDF](../../../static/img/docs/50779f68-4329-4d15-b069-c50fcba00614/image_6.webp)

## Location Level EDF

| **Name**                        | **Type**   | **Required** | **Example** | **Section** | **Description**                                                                                               |
|---------------------------------|------------|--------------|-------------|-------------|---------------------------------------------------------------------------------------------------------------|
| Exclude - Additional SC Removal | Check-Box | False        |             | Exclusions   | Mark the EDF to exclude the location from the Auto-Removal Automation.                                       |

![Location Level EDF](../../../static/img/docs/50779f68-4329-4d15-b069-c50fcba00614/image_7.webp)

## Computer Level EDF

| **Name**                        | **Type**   | **Required** | **Example** | **Section** | **Description**                                                                                               |
|---------------------------------|------------|--------------|-------------|-------------|---------------------------------------------------------------------------------------------------------------|
| Exclude - Additional SC Removal | Check-Box | False        |             | Exclusions   | Mark the EDF to exclude the computer from the Auto-Removal Automation.                                       |

![Computer Level EDF](../../../static/img/docs/50779f68-4329-4d15-b069-c50fcba00614/image_8.webp)

## Output

- Script Logs

</div>
## Attachments
[Remove_-_All_But_My_-_ScreenConnect_Client_Installations.xml](<../../../static/attachments/itg/14767921/Remove_-_All_But_My_-_ScreenConnect_Client_Installations.xml>)