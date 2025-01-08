---
id: 'cwa-windows-update-report'
title: 'Windows Update Report for Automate'
title_meta: 'Windows Update Report for Automate'
keywords: ['windows', 'update', 'report', 'patches', 'monitoring', 'auditing']
description: 'This document provides a comprehensive guide on how to implement and use the Windows Update Report in ConnectWise Automate for auditing and monitoring installed or available patches on local machines. It includes associated content, implementation steps, and FAQs.'
tags: ['monitoring', 'patches', 'auditing', 'dataview', 'script', 'custom-table']
draft: false
unlisted: false
---
## Purpose

Displays a list of the patches that are installed or available on the local machine for auditing and monitoring purposes.  
This solution is the Automate implementation of the [EPM - Data Collection - Get-WindowsUpdateReport](https://proval.itglue.com/DOC-5078775-10372095) agnostic script.

NOTE: In the [CWM - Automate - Dataview - Windows Update Report [Script]](https://proval.itglue.com/DOC-5078775-10861701) dataview,

## Associated Content

| Content                                                                                                         | Type                     | Function                                                                                                                  |
|-----------------------------------------------------------------------------------------------------------------|--------------------------|--------------------------------------------------------------------------------------------------------------------------|
| [EPM - Data Collection - Get-WindowsUpdateReport](https://proval.itglue.com/DOC-5078775-10372095)             | Agnostic PowerShell Script | Get a list of patches that are installed or available on the local machine.                                            |
| [CWM - Automate - Script - Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10861682)        | Script                   | Get a detailed list of patches that are installed or available on the local machine and store it in the [plugin_proval_windows_update_report](https://proval.itglue.com/5078775/docs/10861700) custom table. |
| [CWM - Automate - Custom Table - plugin_proval_windows_update_report](https://proval.itglue.com/DOC-5078775-10861700) | Custom Table             | To store the data grabbed by the [CWM - Automate - Script - Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10861682) script in order to feed into the [CWM - Automate - Dataview - Windows Update Report [Script]](https://proval.itglue.com/DOC-5078775-10861701) dataview. |
| [CWM - Automate - Dataview - Windows Update Report [Script]](https://proval.itglue.com/DOC-5078775-10861701)   | Dataview                 | This dataview was required to display a detailed list of patches that are installed or available on the local machine. The data is being populated by the [CWM - Automate - Script - Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10861682) script. |
| [CWM - Automate - Internal Monitor - ProVal - Development - Fetch Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10946276) | Internal Monitor          | The purpose of this monitor set is to execute the [CWM - Automate - Script - Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10861682) script once per week against all the machines with the Managed Patching Policy. It will execute the script against 200 online machines at a time and will run every 15 minutes interval to avoid jacking up with the script queue for the larger environments. |
| ~Fetch Windows Update Report                                                                                  | Alert Template           | Alert template to be used along with the [CWM - Automate - Internal Monitor - ProVal - Development - Fetch Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10946276) Internal monitor to call the [CWM - Automate - Script - Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10861682) script. |
| [CWM - Automate - Internal Monitor -ProVal - Development - Windows - Patches Not Installing > 45 Days](https://proval.itglue.com/5078775/docs/10946278) | Internal Monitor          | The Purpose of this monitor set is to detect the machines that do have not any Cumulative/Security Patches installed in the past 45 days. It will not detect any EOL machine, and will only detect the machines where the [CWM - Automate - Script - Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10861682) script is executed even once over the past 7 days. |
| [CWM - Automate - Internal Monitor - ProVal - Development - Script Failure - Windows Update Report](https://proval.itglue.com/DOC-5078775-11563432) | Internal Monitor          | This is an optional monitor set to keep an eye on the machines where the [CWM - Automate - Script - Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10861682) script had executed at least twice in a month but failed to fetch any data. |

## Implementation

- Import the [CWM - Automate - Script - Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10861682) script.
- Import the [CWM - Automate - Dataview - Windows Update Report [Script]](https://proval.itglue.com/DOC-5078775-10861701) dataview.
- Run the script against an online windows machine to create the [plugin_proval_windows_update_report](https://proval.itglue.com/5078775/docs/10861700) table.
- Schedule the [CWM - Automate - Script - Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10861682) script to run at a regular frequency against the patch-managed computers. The recommended schedule is once per week.

Optional Setup:
- If you don't prefer scheduling the script against a group then, import the [CWM - Automate - Internal Monitor - ProVal - Development - Fetch Windows Update Report [DV]](https://proval.itglue.com/DOC-5078775-10946276) monitor set.
- Import/Create the ~Fetch Windows Update Report alert template. SQL Query to create the template:
  ```
  INSERT INTO `alerttemplate` (`Name`, `Comment`, `Last_User`, `Last_Date`, `Permission`, `EditPermission`, `GUID`) VALUES ( '~Fetch Windows Update Report', '~Fetch Windows Update Report', 'PRONOC', '2022-09-20 07:00:04', '', '', '58f3a50a-39c3-11ed-ab7e-000c295e5f17');
  INSERT INTO `alerttemplates` ( `AlertActionID`, `DayOfWeek`, `TimeStart`, `TimeEnd`, `AlertAction`, `ContactID`, `UserID`, `ScriptID`, `Message`, `Trump`, `GUID`, `WarningAction`) VALUES ( (SELECT alertactionid FROM alerttemplate WHERE `GUID` = '58f3a50a-39c3-11ed-ab7e-000c295e5f17'), 127, '00:00:00', '23:59:00', 512, -2, 0, (SELECT scriptid fROM lt_scripts WHERE scriptGUID = '24e0791d-1733-11ed-9676-000c295e5f17'), '', 0, '10790c38-6995-4e3f-be1b-f21e8a0eae7c', 512);
  ```
- If you would like to get a ticket for the machines missing the Cumulative/Security Updates from the past 45 days, then import the [CWM - Automate - Internal Monitor -ProVal - Development - Windows - Patches Not Installing > 45 Days](https://proval.itglue.com/5078775/docs/10946278) monitor set.
- Assign ~Custom Ticket Creation Computer Template to this monitor set.
- Import the [CWM - Automate - Internal Monitor - ProVal - Development - Script Failure - Windows Update Report](https://proval.itglue.com/DOC-5078775-11563432) monitor set, do not set any alert template to this monitor set unless you want to receive a ticket for the machines that do not have any data in the [plugin_proval_windows_update_report](https://proval.itglue.com/5078775/docs/10861700) table even after the script had executed at least twice in the last 30 days.

## FAQ

**Q: The dataview is not populating anything after running the script for the first time?**  
A: It's most probably because of the permissions, try running [CWM - Automate - Script - Update User Permissions for ProVal Custom Tables](https://proval.itglue.com/DOC-5078775-8056027) script.  

**Q: Even after executing the script, I am unable to find my computer in the dataview, and it shows 'Information Not Available' in the monitor set?**  
A: You'll have to ensure that necessary exclusions are defined in the AV/security products. [AV Exclusions - ProVal Standard](https://proval.itglue.com/DOC-5078775-10955006). Alternatively, a whitelist object can be defined/added in the AV/security product's portal using the certificate attached to the email to run this particular script.  
**Whitelisting the certificate will not overcome any restrictions/rules blocking/restricting the computers to communicate with [https://file.provaltech.com](https://file.provaltech.com)**.

