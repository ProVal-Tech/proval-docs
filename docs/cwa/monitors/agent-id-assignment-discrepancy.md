---
id: '9e0a1ae1-c888-496b-b161-c154fc48466e'
slug: /9e0a1ae1-c888-496b-b161-c154fc48466e
title: 'Agent ID assignment discrepancy'
title_meta: 'Agent ID assignment discrepancy'
keywords: ['monitor', 'agent', 'discrepancy', 'ticket', 'automate', 'remediation']
description: 'This document outlines a monitoring set that creates a ticket in ConnectWise Automate whenever two or more machines report to a single agent, indicating potential discrepancies in machine identity. It includes details on how to address the issue through command execution and provides necessary SQL results for tracking changes.'
tags: ['connectwise']
draft: false
unlisted: false
---

## Summary

The monitor set will create a ticket whenever two or more machines are checking into a single Automate agent. It looks for instances where the name for the agent ID has changed more than two times in the last seven days.

**Subject:** LT - Agent Discrepancy Found with %computername% (%computerID%)

**Alert on Failure:** The agent with the ID of %ComputerID% is currently reporting that its computer name has changed %Result% times within the past seven days.  
%FieldName%  

To remediate this issue, please log in to ConnectWise Control --> Find one of the affected PCs (shown above) --> Run the following command on one of the agents through the Command Tab:  
```
#!ps
#maxlength=10000
#timeout=100000
[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/LabtechConsulting/LabTech-Powershell-Module/master/LabTech.psm1') | iex; Reset-LTService
```
If you would like to run it within PowerShell, outside of Control, simply remove any lines with `#` in front of them.

**Alert on Success:** There is no longer any indication of a discrepancy with the machine %Computername%. Closing ticket.

**Alert Template:** ~Custom - Ticket Creation - Computer  

**SQL Result (TestValue):** This should output the physical number of PC name changes that have occurred in the past seven days.  

**SQL FieldName (IdentityField):** This should simply show the PCs affected, as in the example below:  
PCs Affected: PC-2, PC-19, PC-3  

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035)  

## Target

Global  