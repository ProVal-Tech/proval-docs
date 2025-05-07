---
id: '34694743-10f7-4bfa-8a38-79ccf5c68c90'
slug: /34694743-10f7-4bfa-8a38-79ccf5c68c90
title: 'External DNS - Domain Joined - Check'
title_meta: 'External DNS - Domain Joined - Check'
keywords: ['dns', 'domain', 'check', 'settings', 'machine', 'log']
description: 'This document outlines a procedure to verify if a machine is domain-joined and to check its DNS settings. It includes an example agent procedure log detailing the actions taken during the check and the outcomes of each action.'
tags: ['dns', 'domain', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This procedure checks to see if a machine is domain-joined and then verifies the DNS settings on the machine.

## Example Agent Procedure Log

| Time                    | Action                                                   | Status                                                | User          |
|-------------------------|----------------------------------------------------------|-------------------------------------------------------|---------------|
| 1:40:36 pm 30-Aug-23   | External DNS - Domain Joined - Check                     | Success THEN                                          | derek.joniak  |
| 1:40:36 pm 30-Aug-23   | External DNS - Domain Joined - Check-0002                | Success THEN                                          | derek.joniak  |
| 1:40:36 pm 30-Aug-23   | External DNS - Domain Joined - Check-0002                | Updating custom field                                 | derek.joniak  |
| 1:40:36 pm 30-Aug-23   | External DNS - Domain Joined - Check-0001                | Success THEN                                          | derek.joniak  |
| 1:40:36 pm 30-Aug-23   | External DNS - Domain Joined - Check-0001                | Found DNS servers outside the private address space: 8.8.8.8 | derek.joniak  |
| 1:40:35 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)      | Success THEN                                          | derek.joniak  |
| 1:40:35 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0001  | Success THEN                                          | derek.joniak  |
| 1:40:35 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0002  | Success THEN                                          | derek.joniak  |
| 1:40:35 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0011  | Success THEN                                          | derek.joniak  |
| 1:40:35 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0014  | Success ELSE                                          | derek.joniak  |
| 1:40:35 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0014  | Powershell command completed!                         | derek.joniak  |
| 1:40:32 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0011  | Executing 64-bit Powershell command as System: "" -command "%ProgramData%/_automation/AgentProcedure/ExternalDNS/ExternalDNS-Check.ps1" "" | derek.joniak  |
| 1:40:32 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0012  | Success THEN                                          | derek.joniak  |
| 1:40:32 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0013  | Success ELSE                                          | derek.joniak  |
| 1:40:32 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0013  | Not sending output to variable.                       | derek.joniak  |
| 1:40:32 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0003  | Success ELSE                                          | derek.joniak  |
| 1:40:32 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0008  | Success THEN                                          | derek.joniak  |
| 1:40:32 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0009  | Success ELSE                                          | derek.joniak  |
| 1:40:32 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0010  | Success ELSE                                          | derek.joniak  |
| 1:40:32 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0008  | Custom commands detected as %ProgramData%/_automation/AgentProcedure/ExternalDNS/ExternalDNS-Check.ps1 | derek.joniak  |
| 1:40:32 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0003  | No powershell file variable detected.                 | derek.joniak  |
| 1:40:31 pm 30-Aug-23   | Execute Powershell Command (64-bit, Run As System)-0002  | Powershell is present.                                | derek.joniak  |
| 1:40:30 pm 30-Aug-23   | External DNS - Domain Joined - Check                     | Deploying ExternalDNS-Check to endpoint               | derek.joniak  |
| 1:40:30 pm 30-Aug-23   | Execute Powershell Command                                | Success THEN                                          | derek.joniak  |
| 1:40:30 pm 30-Aug-23   | Execute Powershell Command-0001                           | Success THEN                                          | derek.joniak  |
| 1:40:30 pm 30-Aug-23   | Execute Powershell Command-0002                           | Success THEN                                          | derek.joniak  |
| 1:40:30 pm 30-Aug-23   | Execute Powershell Command-0011                           | Success THEN                                          | derek.joniak  |
| 1:40:30 pm 30-Aug-23   | Execute Powershell Command-0012                           | Success THEN                                          | derek.joniak  |
| 1:40:30 pm 30-Aug-23   | Execute Powershell Command-0012                           | Results returned to global variable #global:psresult# and saved in Documents tab of server. | derek.joniak  |
| 1:40:30 pm 30-Aug-23   | Execute Powershell Command-0012                           | Results returned to global variable #global:psresult# and saved in Documents tab of server. | derek.joniak  |
| 1:40:30 pm 30-Aug-23   | Execute Powershell Command-0011                           | Powershell command completed!                         | derek.joniak  |
| 1:40:27 pm 30-Aug-23   | Execute Powershell Command-0011                           | Executing powershell "" -Command "New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name ExternalDNS" "" | derek.joniak  |
| 1:40:27 pm 30-Aug-23   | Execute Powershell Command-0009                           | Success THEN                                          | derek.joniak  |
| 1:40:27 pm 30-Aug-23   | Execute Powershell Command-0010                           | Success ELSE                                          | derek.joniak  |
| 1:40:27 pm 30-Aug-23   | Execute Powershell Command-0010                           | Not sending output to variable.                       | derek.joniak  |
| 1:40:27 pm 30-Aug-23   | Execute Powershell Command-0007                           | Success THEN                                          | derek.joniak  |
| 1:40:27 pm 30-Aug-23   | Execute Powershell Command-0008                           | Success THEN                                          | derek.joniak  |
| 1:40:27 pm 30-Aug-23   | Execute Powershell Command-0008                           | New command variable is: -Command "New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name ExternalDNS" | derek.joniak  |
| 1:40:27 pm 30-Aug-23   | Execute Powershell Command-0008                           | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData/_automation/AgentProcedure -name ExternalDNS | derek.joniak  |
| 1:40:27 pm 30-Aug-23   | Execute Powershell Command-0003                           | Success THEN                                          | derek.joniak  |
| 1:40:27 pm 30-Aug-23   | Execute Powershell Command-0004                           | Success ELSE                                          | derek.joniak  |
| 1:40:22 pm 30-Aug-23   | Execute Powershell Command-0002                           | Powershell is present.                                | derek.joniak  |
| 1:40:21 pm 30-Aug-23   | External DNS - Domain Joined - Check                     | Creating folder for procedure                         | derek.joniak  |
| 1:40:14 pm 30-Aug-23   | Run Now - External DNS - Domain Joined - Check           | Admin derek.joniak scheduled procedure Run Now - External DNS - Domain Joined - Check to run at Aug 30 2023 2:40 PM | derek.joniak  |

## Dependencies

[Documentation Link](/docs/324645f2-c11e-4ca8-80b4-4ba1f53bd602)

## Output

Procedure log files and other outputs.


