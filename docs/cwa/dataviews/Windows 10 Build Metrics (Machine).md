---
id: '58e136de-46a7-4af2-9b84-0fb71405bbe4'
title: 'Windows 10 Build Metrics (Machine)'
title_meta: 'Windows 10 Build Metrics (Machine)'
keywords: ['windows', 'patch', 'policy', 'status', 'build', 'agent', 'last', 'contact']
description: 'This document provides an overview of Windows 10 machines, detailing their build and patch policy status, including whether patch policies are enabled or disabled, along with the latest patch information and agent contact details.'
tags: ['report', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview shows the Windows 10 machines with build and patch policy status, checking whether they are enabled or disabled, along with the last patch information.

## Dependencies

[SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](<../tables/plugin_proval_windows_os_support.md>)

## Columns

| Column                        | Description                                                 |
|-------------------------------|-------------------------------------------------------------|
| Client                        | Client name of the agent                                    |
| Location                      | Location name of the agent                                  |
| Computer                      | Computer name of the agent                                  |
| Operating System              | Operating system of the agent                               |
| Last Logged In User           | Last logged in user detail on the agent                    |
| ReleaseID                    | Release ID of the Windows 10 build                         |
| Build Number                  | Build number of the Windows 10 agent                        |
| Days Since Last Contact       | The number of days since the agent last logged in          |
| Is EOL                        | Confirms whether the Windows 10 build license has ended or not |
| Supported Till                | Provides the date when the agent was last supported until   |
| Last Contact                  | Last contact date of the agent with RMM                    |
| Online Last 30 Days           | Indicates whether the agent logged in within the last 30 days |
| Has Patch Policy              | Describes whether the Windows 10 agent has a patch policy enabled or not |
| Last Patched                  | Provides the date when the agent was last patched          |



