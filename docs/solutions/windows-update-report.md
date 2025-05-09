---
id: 'affc0b47-f0fe-43f9-95f6-0e0d1205b4d6'
slug: /affc0b47-f0fe-43f9-95f6-0e0d1205b4d6
title: 'Windows Update Report'
title_meta: 'Windows Update Report'
keywords: ['windows', 'update', 'report', 'patches', 'monitoring', 'auditing']
description: 'This document provides a comprehensive guide on how to implement and use the Windows Update Report in ConnectWise Automate for auditing and monitoring installed or available patches on local machines. It includes associated content, implementation steps, and FAQs.'
tags: ['auditing', 'custom-table']
draft: false
unlisted: false
---

## Purpose

Displays a list of the patches that are installed or available on the local machine for auditing and monitoring purposes.  
This solution is the Automate implementation of the [EPM - Data Collection - Get-WindowsUpdateReport](/docs/b5940a1c-0e82-4756-86a2-b49e57d664f1) agnostic script.

NOTE: In the [CWM - Automate - Dataview - Windows Update Report [Script]](/docs/88f63da5-1a24-4545-b322-f6a3dfbc79cf) dataview,

## Associated Content

| Content                                                                                                         | Type                     | Function                                                                                                                  |
|-----------------------------------------------------------------------------------------------------------------|--------------------------|--------------------------------------------------------------------------------------------------------------------------|
| [EPM - Data Collection - Get-WindowsUpdateReport](/docs/b5940a1c-0e82-4756-86a2-b49e57d664f1)             | Agnostic PowerShell Script | Get a list of patches that are installed or available on the local machine.                                            |
| [CWM - Automate - Script - Windows Update Report [DV]](/docs/41141ff5-ef57-4900-93d4-642b4a9d254f)        | Script                   | Get a detailed list of patches that are installed or available on the local machine and store it in the [plugin_proval_windows_update_report](/docs/845fe569-12ec-48e3-86f4-34377aba03ec) custom table. |
| [CWM - Automate - Custom Table - plugin_proval_windows_update_report](/docs/845fe569-12ec-48e3-86f4-34377aba03ec) | Custom Table             | To store the data grabbed by the [CWM - Automate - Script - Windows Update Report [DV]](/docs/41141ff5-ef57-4900-93d4-642b4a9d254f) script in order to feed into the [CWM - Automate - Dataview - Windows Update Report [Script]](/docs/88f63da5-1a24-4545-b322-f6a3dfbc79cf) dataview. |
| [CWM - Automate - Dataview - Windows Update Report [Script]](/docs/88f63da5-1a24-4545-b322-f6a3dfbc79cf)   | Dataview                 | This dataview was required to display a detailed list of patches that are installed or available on the local machine. The data is being populated by the [CWM - Automate - Script - Windows Update Report [DV]](/docs/41141ff5-ef57-4900-93d4-642b4a9d254f) script. |
| [CWM - Automate - Internal Monitor - ProVal - Development - Fetch Windows Update Report [DV]](/docs/fa9b4535-5711-4cde-ac58-cb9759dbd65a) | Internal Monitor          | The purpose of this monitor set is to execute the [CWM - Automate - Script - Windows Update Report [DV]](/docs/41141ff5-ef57-4900-93d4-642b4a9d254f) script once per week against all the machines with the Managed Patching Policy. It will execute the script against 200 online machines at a time and will run every 15 minutes to avoid overloading the script queue for larger environments. |
| ~Fetch Windows Update Report                                                                                  | Alert Template           | Alert template to be used along with the [CWM - Automate - Internal Monitor - ProVal - Development - Fetch Windows Update Report [DV]](/docs/fa9b4535-5711-4cde-ac58-cb9759dbd65a) Internal monitor to call the [CWM - Automate - Script - Windows Update Report [DV]](/docs/41141ff5-ef57-4900-93d4-642b4a9d254f) script. |
| [CWM - Automate - Internal Monitor - ProVal - Development - Windows - Patches Not Installing > 45 Days](/docs/663a6cf8-f3da-4a44-9725-73aae8d4d954) | Internal Monitor          | The purpose of this monitor set is to detect the machines that do not have any Cumulative/Security Patches installed in the past 45 days. It will not detect any EOL machine, and will only detect the machines where the [CWM - Automate - Script - Windows Update Report [DV]](/docs/41141ff5-ef57-4900-93d4-642b4a9d254f) script has been executed at least once in the past 7 days. |
| [CWM - Automate - Internal Monitor - ProVal - Development - Script Failure - Windows Update Report](/docs/4a1b21f7-1b25-4640-9405-8c07277c54f0) | Internal Monitor          | This is an optional monitor set to keep an eye on the machines where the [CWM - Automate - Script - Windows Update Report [DV]](/docs/41141ff5-ef57-4900-93d4-642b4a9d254f) script has executed at least twice in a month but failed to fetch any data. |

## Implementation

- Import the [CWM - Automate - Script - Windows Update Report [DV]](/docs/41141ff5-ef57-4900-93d4-642b4a9d254f) script.
- Import the [CWM - Automate - Dataview - Windows Update Report [Script]](/docs/88f63da5-1a24-4545-b322-f6a3dfbc79cf) dataview.
- Run the script against an online Windows machine to create the [plugin_proval_windows_update_report](/docs/845fe569-12ec-48e3-86f4-34377aba03ec) table.
- Schedule the [CWM - Automate - Script - Windows Update Report [DV]](/docs/41141ff5-ef57-4900-93d4-642b4a9d254f) script to run at a regular frequency against the patch-managed computers. The recommended schedule is once per week.

**Optional Setup:**
- If you prefer not to schedule the script against a group, import the [CWM - Automate - Internal Monitor - ProVal - Development - Fetch Windows Update Report [DV]](/docs/fa9b4535-5711-4cde-ac58-cb9759dbd65a) monitor set.
- Import/Create the ~Fetch Windows Update Report alert template. SQL Query to create the template:
  ```sql
  INSERT INTO `alerttemplate` (`Name`, `Comment`, `Last_User`, `Last_Date`, `Permission`, `EditPermission`, `GUID`) VALUES ('~Fetch Windows Update Report', '~Fetch Windows Update Report', 'PRONOC', '2022-09-20 07:00:04', '', '', '58f3a50a-39c3-11ed-ab7e-000c295e5f17');
  INSERT INTO `alerttemplates` (`AlertActionID`, `DayOfWeek`, `TimeStart`, `TimeEnd`, `AlertAction`, `ContactID`, `UserID`, `ScriptID`, `Message`, `Trump`, `GUID`, `WarningAction`) VALUES ((SELECT alertactionid FROM alerttemplate WHERE `GUID` = '58f3a50a-39c3-11ed-ab7e-000c295e5f17'), 127, '00:00:00', '23:59:00', 512, -2, 0, (SELECT scriptid FROM lt_scripts WHERE scriptGUID = '24e0791d-1733-11ed-9676-000c295e5f17'), '', 0, '10790c38-6995-4e3f-be1b-f21e8a0eae7c', 512);
  ```
- If you would like to receive a ticket for the machines missing the Cumulative/Security Updates from the past 45 days, then import the [CWM - Automate - Internal Monitor - ProVal - Development - Windows - Patches Not Installing > 45 Days](/docs/663a6cf8-f3da-4a44-9725-73aae8d4d954) monitor set.
- Assign the ~Custom Ticket Creation Computer Template to this monitor set.
- Import the [CWM - Automate - Internal Monitor - ProVal - Development - Script Failure - Windows Update Report](/docs/4a1b21f7-1b25-4640-9405-8c07277c54f0) monitor set. Do not set any alert template for this monitor set unless you want to receive a ticket for the machines that do not have any data in the [plugin_proval_windows_update_report](/docs/845fe569-12ec-48e3-86f4-34377aba03ec) table even after the script has executed at least twice in the last 30 days.

## FAQ

**Q: The dataview is not populating anything after running the script for the first time?**  
A: It's most likely due to permissions. Try running the [CWM - Automate - Script - Update User Permissions for ProVal Custom Tables](/docs/7819fc75-aeae-457b-a451-59221396e900) script.  

**Q: Even after executing the script, I am unable to find my computer in the dataview, and it shows 'Information Not Available' in the monitor set?**  
A: Ensure that necessary exclusions are defined in the AV/security products. See [AV Exclusions - ProVal Standard](/docs/6ba96e6b-21df-4d96-9200-3bdb7d79aae2). Alternatively, a whitelist object can be defined/added in the AV/security product's portal using the certificate attached to the email to run this particular script.  
**Note:** Whitelisting the certificate will not override any restrictions or rules that block or restrict the computers from communicating with [https://file.provaltech.com](https://file.provaltech.com).