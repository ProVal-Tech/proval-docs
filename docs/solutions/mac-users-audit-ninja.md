---
id: 'd4d9f6a6-92f9-4a6c-a197-136ff523c547'
slug: /d4d9f6a6-92f9-4a6c-a197-136ff523c547
title: 'Mac Users Audit'
title_meta: 'Mac Users Audit'
keywords: ['user', 'profiles', 'data', 'gather', 'information']
description: 'This document outlines a solution for auditing user accounts on macOS machines. It includes a custom field, automation, group, and scheduled task used to collect and maintain macOS user account information.'
tags: ['report', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-08-17
---

## Purpose

The goal of this solution is to audit user accounts available on macOS machines and maintain the collected account information in NinjaOne.

The solution audits both local and directory-based user accounts available through the macOS directory service search path. The collected information includes the username, full name, UID, account type, account status, account source, and last login information.

The solution is designed for **macOS machines only** and provides a centralized view of user account information through the NinjaOne custom field.

## Associated Content

### Custom Field

| Content | Type | Function |
|---------|------|----------|
| [cPVAL MAC User Audit](/docs/501108e2-70fe-4510-8614-11081d489ffc) | Custom Field | Displays local macOS user account details, including username, account type, status, UID, and last login information. It is updated by [Automation - Mac User Audit](/docs/4c215a71-9d5a-4bf4-a9db-c4b4ca4fed97).|


### Automation 

| Content | Type | Function |
|---------|------|----------|
| [Mac User Audit](/docs/4c215a71-9d5a-4bf4-a9db-c4b4ca4fed97) | Automation | Audits local and directory based macOS user accounts and updates [Custom field - cPVAL MAC User Audit](/docs/501108e2-70fe-4510-8614-11081d489ffc) with the collected user account information. |

### Group

| Content | Type | Function |
|---------|------|----------|
| [cPVAL Macintosh Machines](/docs/beb21a9b-e13c-4f6f-86cf-942d68f3861e) | Group |A group designated for machines running macOS only. |


### Task

| Content | Type | Function |
|---------|------|----------|
| [Audit Mac Users](/docs/63cc0fa9-43fb-4030-9303-d0053cc80ab8) | Task | This task executes the [Automation - Mac User Audit](/docs/4c215a71-9d5a-4bf4-a9db-c4b4ca4fed97) daily to identify user accounts on [Group - cPVAL Macintosh Machines](/docs/beb21a9b-e13c-4f6f-86cf-942d68f3861e).|
 |


## Implementation

- Import the [Custom field - cPVAL MAC User Audit](/docs/501108e2-70fe-4510-8614-11081d489ffc) into the NinjaOne environment.
- Import the [Automation - Mac User Audit](/docs/4c215a71-9d5a-4bf4-a9db-c4b4ca4fed97) into the NinjaOne environment.
- Create or verify the [Group - cPVAL Macintosh Machines](/docs/beb21a9b-e13c-4f6f-86cf-942d68f3861e) group contains only macOS machines.
- Configure the [Task - Audit Mac Users](/docs/63cc0fa9-43fb-4030-9303-d0053cc80ab8) to execute the [Automation - Mac User Audit](/docs/4c215a71-9d5a-4bf4-a9db-c4b4ca4fed97) daily against the [Group - cPVAL Macintosh Machines](/docs/beb21a9b-e13c-4f6f-86cf-942d68f3861e).
- Verify the custom field after the scheduled task executes to ensure the user account information is being updated as expected.

## FAQ

**Q:** What types of user accounts does this solution audit?  
**A:** The solution audits local and directory-based user accounts that are available through the macOS directory service search path.

**Q:** Does this solution only audit local macOS users?  
**A:** No. The automation queries the macOS directory service search path, allowing it to identify local users as well as users provided by configured directory services such as Active Directory, LDAP, and cached or mobile accounts.

**Q:** What information is collected for each user?  
**A:** The solution collects the username, full name, UID, account type, account status, account source, and last login information.

**Q:** Are macOS system accounts included?  
**A:** No. Accounts with a UID below 500 are excluded to prevent system and service accounts from appearing in the user inventory.

**Q:** How often is the user information updated?  
**A:** The [Task - Audit Mac Users](/docs/63cc0fa9-43fb-4030-9303-d0053cc80ab8) executes the automation daily.

**Q:** What happens if a Mac does not have a directory service configured?  
**A:** The automation falls back to the local directory and continues to audit the local user accounts on the Mac.

**Q:** Where are the audit results stored?  
**A:** The collected information is stored in the [Custom field - cPVAL MAC User Audit](/docs/501108e2-70fe-4510-8614-11081d489ffc) as an HTML-formatted table.

## Changelog

### 2026-08-17

- Initial version of the document
