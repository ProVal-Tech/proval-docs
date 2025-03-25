---
id: 'b81bd6bd-9266-4c31-adad-9eaad5e90e31'
slug: /b81bd6bd-9266-4c31-adad-9eaad5e90e31
title: 'Active Directory - Privilege Escalation Attack Mitigation'
title_meta: 'Active Directory - Privilege Escalation Attack Mitigation'
keywords: ['active-directory', 'privilege', 'escalation', 'mitigation', 'patches', 'compliance']
description: 'This document outlines a dataview created to verify the applied workaround and installation of necessary patches to mitigate and detect Active Directory privilege escalation attacks. It provides a comprehensive overview of computer accounts with non-compliant sAMAccountNames and details about patch statuses.'
tags: ['active-directory', 'compliance', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

The dataview is created to verify the workaround applied and the installation of all necessary patches in order to mitigate and detect Active Directory privilege escalation attacks. It will present the names of the computer accounts with non-compliant sAMAccountNames as well. Essentially, it populates the information fetched by the [Workaround - Active Directory Privilege Escalation Attack [DV]](<../scripts/Active Directory - Privilege Escalation Attack Mitigation.md>) script.

## Dependencies

[Workaround - Active Directory Privilege Escalation Attack [DV]](<../scripts/Active Directory - Privilege Escalation Attack Mitigation.md>)

## Columns

| Column                              | Description                                                                                                                                       |
|-------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| Client Name                         | Name of the Client.                                                                                                                             |
| Location Name                       | Name of the Location.                                                                                                                           |
| Computer Name                       | Name of the Computer or Domain Controller.                                                                                                      |
| Domain                              | Name of the Domain.                                                                                                                             |
| Operating System                    | Operating System of the Machine.                                                                                                                |
| KB5008602 Status                    | Only applicable for Windows Server 2019. "Installed" or "Missing" depending on the installation status of KB5008602 or its superseded version KB5008218. |
| KB5008380 Status                    | "Installed" or "Missing" depending on the installation status of the CVE-2021-42287 patches or their superseded version.                      |
| KB5008102 Status                    | "Installed" or "Missing" depending on the installation status of the CVE-2021-42278 patches or their superseded version.                      |
| Missing Patches                     | Patches that are needed by the machine in order to apply the mitigation as per KB5008380 Status and KB5008102 Status.                          |
| CVE-2021-42287 Workaround           | Status of the PacRequestorEnforcement registry key.                                                                                            |
| Non-compliant sAMAccountName       | To find computer accounts that have a non-compliant sAMAccountName.                                                                            |
| Non-compliant UAC sAMAccountType   | To find computer accounts that have a non-compliant UAC sAMAccountType.                                                                        |
| Information Update Time             | Run-time of the script.                                                                                                                         |
| Last Contact                        | Last contact of the Computer.                                                                                                                   |



