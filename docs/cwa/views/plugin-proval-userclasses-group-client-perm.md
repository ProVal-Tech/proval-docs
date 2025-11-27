---
id: '5257f6b1-3afe-484d-87ea-7b1a0a9c850f'
slug: /5257f6b1-3afe-484d-87ea-7b1a0a9c850f
title: 'plugin_proval_userclasses_group_client_perm'
title_meta: 'plugin_proval_userclasses_group_client_perm'
keywords: ['view', 'userclass', 'windows', 'dataview', 'sql']
description: 'Serves as the base table for the User Class Permissions - Client and User Class Permissions - Group dataview.'
tags: ['database','windows']
draft: False
unlisted: false
---

## Purpose

Serves as the base table for the "[User Class Permissions - Client](/docs/af60f4a6-c13c-4fc9-b488-263ce5c38485)." and "[User Class Permissions - Group](/docs/93f9cbb9-656e-418b-97d7-3e8a51171940) dataview.

## Dependencies
- [Create View plugin_proval_userclasses_group_client_perm[DV]](/docs/898bcfcc-8dfa-421d-b188-68170661916a)
- [User Class Permissions - Client](/docs/af60f4a6-c13c-4fc9-b488-263ce5c38485)
- [User Class Permissions - Group](/docs/93f9cbb9-656e-418b-97d7-3e8a51171940)

## Views

### plugin_proval_userclasses_group_client_perm

| Column | Type | Explanation |
| ------ | ---- | ----------- |
| User Class | varchar(50) | Name of the user class |
| Client Name | varchar(50) | Name of the client |
| Group Name | varchar(50) | Name of the group |
| Group Path | varchar(2048) | Full Path of the Group |
| Location | varchar(18) | Location Permissions assigned to the user class. Can be Read/Edit/Delete/No Permission. Location permissions control access to the client's locations. |
| Project | varchar(18) | Project Permissions assigned to the user class. Can be Read/Edit/Delete/No Permission. Projects permission controls access to the client's projects.|
| Product Keys | varchar(18) | Product Keys Permissions assigned to the user class. Can be Read/Edit/Delete/No Permission. Product Keys permission controls the access to the client's product keys. |
| Documents | varchar(18) | Document Permissions assigned to the user class. Can be Read/Edit/Delete/No Permission. Documents permission controls the access to the client's documents and Visio files that have been added to a location. |
| Passwords | varchar(18) | Passwords Permissions assigned to the user class. Can be Read/Edit/Delete/No Permission. Passwords permission controls the client's passwords. |
| Edit Configuration | int |  `1` if user class has permission to edit the agent template configuration of the computers associated with the client. `0` if disabled. |
| Edit information | int |  `1` if user class has permission to edit information on a computer that is associated with the client. If disabled, if any changes are made to the information they are not saved when exiting the Computer Management screen. `0` if disabled.  |
| Send Commands | int | `1` if user class has permission to send commands to a computer that is associated with the client. If disabled, the menu option is not visible. `0` if disabled. |
| Allow Redirector/Remote Command | int | `1` if user class has permission to run redirector programs, and requires [User Level] Allow HTTP Tunnel permission. If disabled, the button and menus are removed. `0` if disabled. |
| Allow Peer-to-peer Tunnel | int | `1` if user class has permission to create a tunnel to the computers associated with this client. `0` if disabled. |
| Allow File Explorer | int | `1` if user class has permission to run the Automate File Explorer, and requires Send Commands permission. If disabled, the menu option is not visible. `0` if disabled. |
| Allow Registry Editor | int | `1` if user class has permission to run the Automate Registry Editor, and requires Send Commands permission. If disabled, the menu option is not visible. `0` if disabled. |
| Access Command Prompt | int |  `1` if user class has permission to the command prompt for computers associated with this client. This permission is required to view the Command Prompt option on the Computer Management screen. `0` if disabled. |
| Sniff Network Traffic | int | `1` if user class has permission to sniff the network traffic for computers associated with this client and requires the Send Commands permission. If disabled, the menu options are not visible. `0` if disabled. |
| Install Software and Tools | int | `1` if user class has permission to view the computer history (e.g., commands, processes, event logs, etc.). If disabled, the option is not available from the Computer Management screen. `0` if disabled. |
| View Commands | int | `1` if user class has permission to view commands that have been sent by other technicians from the Computer Management screen. `0` if disabled. |
| Delete Monitors | int | `1` if user class has permission to delete computer-specific monitors associated with this client. If disabled, the menu option is not visible. `0` if disabled. |
| Create Monitors | int | `1` if user class has permission to add computer-specific monitors associated with this client.If disabled, the menu option is not visible. `0` if disabled. |
| Edit Monitors | int | `1` if user class has permission to edit computer-specific monitors to computers associated with this client. If disabled, the menu option is not visible. `0` if disabled. |
| Clear Alerts | int | `1` if user class has permission to clear alerts for computers associated with this client. `0` if disabled. |
| Schedule Scripts | int | `1` if user class has permission to schedule and run scripts on computers at the client level. `0` if disabled. |
| Delete Scheduled Scripts | int | `1` if user class has permission to delete scheduled scripts. `0` if disabled.  |
