---
id: 'cwa-identifying-computers-with-outdated-cumulative-updates'
title: 'Identifying Computers with Outdated Cumulative Updates'
title_meta: 'Identifying Computers with Outdated Cumulative Updates'
keywords: ['computers', 'cumulative', 'updates', 'monitor', 'ticket', 'alert', 'dependencies']
description: 'This document outlines a method for identifying computers that have not installed a Cumulative Update in the last 75 days, excluding End-of-Life machines. It details the configuration of monitors, dependencies, and alert templates, and provides guidance on adjusting the monitoring period as needed.'
tags: ['monitoring', 'cumulative', 'updates', 'alert', 'dependencies', 'configuration', 'ticket', 'windows']
draft: false
unlisted: false
---
## Summary

Identifies computers that have not installed a Cumulative Update in the last 75 days, excluding End-of-Life (EOL) machines.

If requested, the monitor can easily be adjusted to a lower or higher number of days since the last cumulative update was installed before a ticket was generated.

![Image](5078775/docs/13582373/images/22457526)

The monitor set will not keep detecting the computers where a ticket is already generated if it's using the suggested alert template `△ Custom - Autofix - Out of Date Cumulative Updates`.

This monitor has direct dependencies on the [Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478) schedule.

The p.Scriptruntime days in the monitor need to be set with one increment day to the [Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478) schedule as shown below:

![Image](5078775/docs/13582373/images/25966940)

Please review monitor [Internal Monitor - Execute Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849458) and get the value from it from the hs.dateissued days and set it with one day addition in the monitor p.scriptruntime value.

![Image](5078775/docs/13582373/images/25866197)

## Dependencies

- [CWM - Automate - Custom Table - pvl_win_latest_installed_cu](https://proval.itglue.com/DOC-5078775-12849460)
- [EPM - Windows Update - Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478)
- [CWM - Automate - Script - Out of Date Cumulative Updates [Autofix]*](https://proval.itglue.com/DOC-5078775-14790498)
- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690)
- [Internal Monitor - Execute Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849458)

## Target

Global

## Alert Template

`△ Custom - Autofix - Out of Date Cumulative Updates`

The alert template executes the [CWM - Automate - Script - Out of Date Cumulative Updates [Autofix]*](https://proval.itglue.com/DOC-5078775-14790498) script.

## FAQ

**Q1)** What happens if the machine hasn't logged in for several days or the interval of the [Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478) is different than the lastruntime check from the table "[Custom Table - pvl_win_latest_installed_cu](https://proval.itglue.com/DOC-5078775-12849460)"?

**Ans)** This monitor will ignore the agents whose last contact date is older than 7 days from monitoring and also exclude the agents where the [Script - Get Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12849478) has not run from the scheduled days period which should be matched to the p.scriptruntime set in the monitor.

