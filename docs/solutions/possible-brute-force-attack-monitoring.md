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

## Troubleshooting

#### **General Troubleshooting Steps:**

**1. Identify the Account Type:**

- `Domain Account:` Check in Active Directory Users and Computers (ADUC).

- `Local Account:` Use Computer Management > Local Users and Groups.
- `Service Account:` Check services or scheduled tasks using the account.
- `Unknown Account:` Investigate for potential brute-force or enumeration attacks.  

**2. Review Event Logs:**

- Look for Event ID `4625` in the Security log.

**3. Pay attention to:**

- Status/SubStatus codes

- Logon Type

- Source IP/Workstation

- Target Account Name

#### **4. Error Code Specific Troubleshooting:**

| Error Code   | Meaning                          |    Action Steps                                                                 |
|--------------|----------------------------------|------------------------------------------------------------------------------|
| 0xC000006A   | Bad password                     |<ol><li>Check if the password was recently changed.</li><li> Reset the password if needed.</li><li> Investigate repeated attempts (possible brute-force).</li></ol>|
| 0xC000006D   | Bad username or auth info        | <ol><li>Verify username.</li><li>Check for typos or outdated credentials.</li><li>Investigate source of repeated failures.</li></ol> |
| 0xC0000064   | Bad or misspelled username       | <ol><li>Confirm the account exists.</li><li>Investigate for enumeration attempts.</li></ol>  |
| 0xC000005E   | No logon servers available       | <ol><li>Check domain controller availability.</li><li>Ensure network connectivity.</li><li>Restart Netlogon service.</li></ol>|
| 0xC000006F   | Logon outside authorized hours   | <ol><li>Review account restrictions in AD.</li><li>Adjust allowed logon hours if needed.</li></ol> |
| 0xC0000070   | Unauthorized workstation         | <ol><li>Check workstation restrictions in AD.</li><li> Update allowed workstations.</li></ol> |
| 0xC0000072   | Account disabled                 | <ol><li>Enable the account in AD.</li><li>Investigate why it was disabled.</li></ol>   |
| 0xC000015B   | Logon type not granted           | <ol><li>Check Group Policy or Local Security Policy.</li><li> Grant appropriate logon rights.</li></ol>|
| 0xC0000192   | Netlogon service not started     | <ol><li>Start the Netlogon service.</li><li>Set it to automatic.</li></ol>                 |
| 0xC0000193   | Expired account                  | <ol><li>Extend or renew the account expiration date.</li></ol>        |
| 0xC0000413   | Auth firewall restriction        | <ol><li>Review firewall or security policies.</li><li>Allow the account to authenticate.</li></ol>|


#### **5. Service Account Specific Checks:**

- Find Services Using the Account.

- Run: `Get-WmiObject win32_service | Where-Object { $_.StartName -like "*accountname*" }`  
Or check manually in Services.msc.

**6. Update Password:**

- Change the password in AD.

- Update it in all services, scheduled tasks, and applications using it.

#### **7. If the Account is Unknown or Suspicious**

- `Investigate Source IP:` Use firewall logs or SIEM tools.  
- `Check for Patterns:` Repeated failures from the same IP or targeting multiple accounts.
- `Block IP or Account:` If malicious, take immediate action.  
- `Enable Account Lockout Policies:` To prevent brute-force attacks.
