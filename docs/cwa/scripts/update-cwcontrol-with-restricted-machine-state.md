---
id: '4edbd7bf-3815-4745-9c40-42cef872a4f4'
slug: /4edbd7bf-3815-4745-9c40-42cef872a4f4
title: 'Update CWControl with Restricted Machine State'
title_meta: 'Update CWControl with Restricted Machine State'
keywords: ['connectwise', 'control', 'restricted', 'machines', 'permissions', 'script']
description: 'This document outlines a script designed to transfer members of the Restricted Machines group in ConnectWise Automate to an equivalent permission set in ConnectWise Control, including manual setup requirements and detailed variable documentation.'
tags: ['connectwise', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

This script will transfer the members of the Restricted Machines group in ConnectWise Automate to an equivalent permission set in ConnectWise Control. 

**_This script has ConnectWise Control manual setup requirements!_**

## Sample Run

This script should be scheduled to run on a schedule and preferably not run manually.

## Requirements

1. ConnectWise Control Manual Steps
   1. Log into your ScreenConnect portal as an admin.
   2. Clone the All Machines group.
   3. Edit the clone name to "All Unrestricted Machines."
   4. Edit the clone session filter to `CustomProperty7 <> 'restricted'`.
   5. Subgroup expressions should match the All Machines group.
   6. Save the clone.
   7. Clone the All Machines group again and name the clone "All Restricted Machines."
   8. Edit the session filter to add `CustomProperty7 = 'restricted'`.
   9. Subgroup expressions should remain the same as the All Machines group.
   10. Create a security role named "Restricted Users."
   11. Deselect all items in global permissions.
   12. **Only select the** "All Unrestricted Machines" **group in scoped machines, and select** "Select All" **in configurable permissions.**
   13. Save the role.
   14. Add any restricted users to the Restricted Users group.

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name               | Description                                                                 |
|--------------------|-----------------------------------------------------------------------------|
| GroupID            | Holds the group ID for the Restricted Machines group.                      |
| SqlDataSet         | Holds all computers listed in the Restricted Machines group.               |
| Httpplugin_headers  | Needed for the RMM+ plugin                                                 |
| AccessKey          | Needed for the RMM+ plugin push command                                    |
| Group              | Needed for the RMM+ plugin push command                                    |
| SCURL              | The ScreenConnect URL                                                      |
| Port               | The port designated in the ScreenConnect table                              |
| SCFormattedUrl     | The URL formatted to be used by the RMM+ plugin.                           |
| SCCommandUrl       | The post call command                                                       |
| Iteration          | Used to stay within the bounds of the found computers                      |
| sc_guid            | The ScreenConnect GUID for the target computer                              |
| PluginResult       | The result of setting CustomProperty7 to restricted in ScreenConnect.      |

## Process

1. Set up the plugin push call variables.
2. Obtain the group ID for the All Agents group.
3. Get all members of the All Agents group.
4. Set the custom value to 'Restricted Off.'
5. Loop through all computers, setting Custom Property 7 to 'Restricted Off.'
6. Obtain the group ID for the Restricted Machines group.
7. Get all members of the Restricted Machines group.
8. Set up the plugin push call variables.
9. Loop through all computers, setting Custom Property 7 to 'Restricted.'
10. If any failures occur, log the failure and continue the loop.
11. Continue the loop until all computers are complete.

## Output

- Script log
