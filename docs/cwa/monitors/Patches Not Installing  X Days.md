---
id: '663a6cf8-f3da-4a44-9725-73aae8d4d954'
title: 'Patches Not Installing  X Days'
title_meta: 'Patches Not Installing  X Days'
keywords: ['cumulative', 'patch', 'monitoring', 'updates', 'alerting']
description: 'This document outlines a monitoring setup to detect machines that have not installed any cumulative or security patches in the past specified days. It provides alert templates and instructions for adjusting the monitoring parameters, ensuring timely updates and maintenance of machines within a managed patching policy.'
tags: ['report', 'sql', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this monitor set is to detect machines that do not have any cumulative or security patches installed in the past X days. It will not detect any end-of-life (EOL) machines and will only identify machines where the [CWM - Automate - Script - Windows Update Report [DV]](<../scripts/Windows Update Report DV.md>) script has been executed at least once over the past 7 days.

### Suggested Alert Template: ~Custom - Ticket Creation Computer

**Alerting Tab:**

- **Subject:** LT - Patches Not Installing > X Days on %computername%

**Alert on Failure:** The machine %computername% at %clientname%/%locationname% is currently reporting that it has not installed a recent cumulative update for over X days. Please investigate why this machine is not receiving patches. The last cumulative update for this machine was installed on %Result%.

**%FieldName%**

**Alert on Success:** The machine %Computername% is no longer reporting that it has failed the monitor %Name%. Closing ticket.

### NOTES:
1. Adjustments to the SQL must be made at `AgentID = 'TYPE YOUR MONITOR ID HERE'` to make this functional.
   ![Image](../../../static/img/Patches-Not-Installing--X-Days/image_1.png)
2. To overwrite the default threshold of 45 days, the following changes should be made:
   1. Change 45 in the `INTERVAL 45 DAY` statement at the bottom of the additional condition of the monitor set to the preferred number of days.
      ![Image](../../../static/img/Patches-Not-Installing--X-Days/image_2.png)
   2. In the Alerting tab, replace 45 with the desired threshold in days.
      ![Image](../../../static/img/Patches-Not-Installing--X-Days/image_3.png)

## Dependencies

- [EPM - Solution - Windows Update History Audit](https://proval.itglue.com/DOC-5078775-12275092)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](<../tables/plugin_proval_windows_os_support.md>)
- [CWM - Automate - Script - Ticket Creation - Computer](<../scripts/Ticket Creation - Computer.md>)

## Target

SQL is limiting it to machines with a managed patching policy only.

## Reference Table

- pvl_windows_updates
- plugin_proval_windows_os_support
- Computers
- Clients
- Locations
- Agentcomputerdata
- h_scripts
- AgentIgnore
- lt_scripts
- installsoftwarepolicies
- hotfixdata
- hotfix
- computerpatchpolicies



