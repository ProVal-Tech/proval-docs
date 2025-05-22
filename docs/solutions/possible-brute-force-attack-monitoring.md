---
id: '1b773da4-e288-4874-9d6b-2e765ddcf248'
slug: /1b773da4-e288-4874-9d6b-2e765ddcf248
title: 'Possible Brute Force Attack Monitoring'
title_meta: 'Possible Brute Force Attack Monitoring'
keywords: ['brute', 'force', 'attack', 'domain', 'controller', 'monitoring', 'security']
description: 'This document outlines a solution for monitoring domain controllers for excessive logon failures within a one-hour window, which may indicate a potential brute force attack. It includes details on custom fields, dynamic groups, tasks, and monitoring setup necessary for effective security management.'
tags: ['security']
draft: false
unlisted: false
---

## Purpose

The solution monitors the domain controller for excessive logon failures within one hour, indicating a possible brute force attack.

## Associated Content

### Custom Fields

| Content | Level | Function |
|---------|-------|----------|
| [Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae) | Endpoint | Used to determine whether a Domain Controller is an infrastructure master or not. |

### Groups

| Content | Type | Function |
|---------|------|----------|
| [Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68) | Dynamic Group | Stores the Domain Controllers in a single place. |
| [Infrastructure Master](/docs/c2c2d22b-f735-4ec5-91a6-a014ab2e84a8) | Dynamic Group | Stores all the available infrastructure masters in a single place. |

### Tasks/Scripts

| Content | Type | Function |
|---------|------|----------|
| [Validate Primary Domain Controller](/docs/7bc6ac21-322d-4630-836f-f00e93b94168) | Task | Validate whether a computer is an infrastructure master or not and update the custom field [Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae). |

### Monitor

| Content | Type | Function |
|---------|------|----------|
| [Possible Brute Force Attack](/docs/3691bc36-640e-4d39-8a41-0513d44c7d41) | Monitor | Check the computer for security event log event ID 4625 where the count of occurrences is greater than 10 in the last 60 minutes. |

## Implementation

1. Create the required Custom Fields (if not exist) using the documentation below:
   - [Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae)

2. Create the following Dynamic Groups (if not exist):
   - [Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68)
   - [Infrastructure Master](/docs/c2c2d22b-f735-4ec5-91a6-a014ab2e84a8)

3. Create and schedule the following Task(s) (if not exist):
   - [Validate Primary Domain Controller](/docs/7bc6ac21-322d-4630-836f-f00e93b94168)

### Monitor

4. Create and enable the following monitor:
   - [Possible Brute Force Attack](/docs/3691bc36-640e-4d39-8a41-0513d44c7d41)

## FAQ

#### **General Troubleshooting Steps**

**Identify the Account Type:**

- Domain Account: Check in Active Directory Users and Computers (ADUC).

- Local Account: Use Computer Management > Local Users and Groups.
- Service Account: Check services or scheduled tasks using the account.
- Unknown Account: Investigate for potential brute-force or enumeration attacks.
Review Event Logs:

Look for Event ID 4625 in the Security log.

Pay attention to:

Status/SubStatus codes

Logon Type

Source IP/Workstation

Target Account Name

#### **Error Code Specific Troubleshooting**

| Error Code   | Meaning                          | Action Steps                                                                 |
|--------------|----------------------------------|------------------------------------------------------------------------------|
| 0xC000006A   | Bad password                     | - Check if the password was recently changed. <br> - Reset the password if needed. <br> - Investigate repeated attempts (possible brute-force). |
| 0xC000006D   | Bad username or auth info        | - Verify username. <br> - Check for typos or outdated credentials. <br> - Investigate source of repeated failures. |
| 0xC0000064   | Bad or misspelled username       | - Confirm the account exists. <br> - Investigate for enumeration attempts.   |
| 0xC000005E   | No logon servers available       | - Check domain controller availability. <br> - Ensure network connectivity. <br> - Restart Netlogon service. |
| 0xC000006F   | Logon outside authorized hours   | - Review account restrictions in AD. <br> - Adjust allowed logon hours if needed. |
| 0xC0000070   | Unauthorized workstation         | - Check workstation restrictions in AD. <br> - Update allowed workstations.  |
| 0xC0000072   | Account disabled                 | - Enable the account in AD. <br> - Investigate why it was disabled.         |
| 0xC000015B   | Logon type not granted           | - Check Group Policy or Local Security Policy. <br> - Grant appropriate logon rights. |
| 0xC0000192   | Netlogon service not started     | - Start the Netlogon service. <br> - Set it to automatic.                   |
| 0xC0000193   | Expired account                  | - Extend or renew the account expiration date.                              |
| 0xC0000413   | Auth firewall restriction        | - Review firewall or security policies. <br> - Allow the account to authenticate. |


#### **Service Account Specific Checks**

Find Services Using the Account:

Run: Get-WmiObject win32_service | Where-Object { $_.StartName -like "*accountname*" }
Or check manually in Services.msc.
Update Password:

Change the password in AD.

Update it in all services, scheduled tasks, and applications using it.

#### **If the Account is Unknown or Suspicious**

Investigate Source IP: Use firewall logs or SIEM tools.
Check for Patterns: Repeated failures from the same IP or targeting multiple accounts.
Block IP or Account: If malicious, take immediate action.
Enable Account Lockout Policies: To prevent brute-force attacks.