---
id: '93f9cbb9-656e-418b-97d7-3e8a51171940'
slug: /93f9cbb9-656e-418b-97d7-3e8a51171940
title: 'User Class Permissions - Group'
title_meta: 'User Class Permissions - Group'
keywords: ['view', 'userclass', 'windows', 'dataview', 'sql']
description: 'This dataview displays the type of permissions applied to each user class on a group level.'
tags: ['database','windows']
draft: false
unlisted: false
---
 
## Summary
This dataview displays the type of permissions applied to each user class on a group level.


## Dependencies
- [Create View plugin_proval_userclasses_group_client_perm[DV]](/docs/898bcfcc-8dfa-421d-b188-68170661916a)
- [View - plugin_proval_userclasses_group_client_perm](/docs/5257f6b1-3afe-484d-87ea-7b1a0a9c850f)


## Columns

| Column | Explanation |
| ------ | ----------- |
| User Class |  Name of the user class |
| Group Name | Name of the group |
| Group Path | Full Path of the Group |
| Edit Configuration | `1` if user class has permission to edit the agent template configuration of the computers associated with the client. `0` if disabled. |
| Edit information | `1` if user class has permission to edit information on a computer that is associated with the client. If disabled, if any changes are made to the information they are not saved when exiting the Computer Management screen. `0` if disabled.  |
| Send Commands | `1` if user class has permission to send commands to a computer that is associated with the client. If disabled, the menu option is not visible. `0` if disabled. |
| Allow Redirector/Remote Command | `1` if user class has permission to run redirector programs, and requires [User Level] Allow HTTP Tunnel permission. If disabled, the button and menus are removed. `0` if disabled. |
| Allow Peer-to-peer Tunnel | `1` if user class has permission to create a tunnel to the computers associated with this client. `0` if disabled. |
| Allow File Explorer |  `1` if user class has permission to run the Automate File Explorer, and requires Send Commands permission. If disabled, the menu option is not visible. `0` if disabled. |
| Allow Registry Editor | `1` if user class has permission to run the Automate Registry Editor, and requires Send Commands permission. If disabled, the menu option is not visible. `0` if disabled. |
| Access Command Prompt | `1` if user class has permission to the command prompt for computers associated with this client. This permission is required to view the Command Prompt option on the Computer Management screen. `0` if disabled. |
| Sniff Network Traffic | `1` if user class has permission to sniff the network traffic for computers associated with this client and requires the Send Commands permission. `0` if disabled, and then the menu options are not visible.|
| Install Software and Tools | `1` if user class has permission to view the computer history (e.g., commands, processes, event logs, etc.). If disabled, the option is not available from the Computer Management screen. `0` if disabled. |
|Access History     | `1` if user has permission to view the computer history (e.g., commands, processes, event logs, etc.). `0`, if disabled. The option is then not available from the Computer Management screen. |
| View Commands | `1` if user class has permission to view commands that have been sent by other technicians from the Computer Management screen. `0` if disabled. |
| Delete Monitors | `1` if user class has permission to delete computer-specific monitors associated with this client. If disabled, the menu option is not visible. `0` if disabled. |
| Create Monitors | `1` if user class has permission to add computer-specific monitors associated with this client.If disabled, the menu option is not visible. `0` if disabled. |
| Edit Monitors | `1` if user class has permission to edit computer-specific monitors to computers associated with this client. If disabled, the menu option is not visible. `0` if disabled. |
| Clear Alerts | `1` if user class has permission to clear alerts for computers associated with this client. `0` if disabled. |
| Schedule Scripts | `1` if user class has permission to schedule and run scripts on computers at the client level. `0` if disabled. |
| Delete Scheduled Scripts | `1` if user class has permission to delete scheduled scripts. `0` if disabled.  |
