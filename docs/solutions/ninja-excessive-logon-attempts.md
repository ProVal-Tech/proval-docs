---
id: 'e99ec890-ae05-4ad5-bdbc-6b0599be67e9'
slug: /e99ec890-ae05-4ad5-bdbc-6b0599be67e9
title: 'Excessive Logon Attempts'
title_meta: 'Excessive Logon Attempts'
keywords: ['excessive-logon-attempts', 'excessive', 'logon', 'bruteforce', 'brute']
description: 'This will Detect and summarize failed logon attempts (Event ID 4625) from the Windows Security event log within a specified time window.'
tags: ['security', 'accounts', 'eventlogs']
draft: false
unlisted: false
---

## Purpose
This solution is built to detect and summarize failed logon attempts (Event ID 4625) from the Windows Security event log within a specified time window on a given machine and based on it, if it meets the criteria then it creates a ticket. 

It simply checks the computer for security event log event ID 4625 where the count of occurrences is greater than 10 in the last 60 minutes. This is default setting and can be changed using the `Threshold` and `Minutes` parameters.

## Associated Content

| Name                                | Type               | Function                                                                                                      |
|-------------------------------------|--------------------|---------------------------------------------------------------------------------------------------------------|
|[Automation - Excessive Logon Attempts](/docs/3b52c821-6c63-4da6-87e8-8bd5c96e78de) | Automation             | Detects and summarizes failed logon attempts (Event ID 4625) from the Windows Security event log within a specified time window. |
| [Condition - Excessive Logon Attempts](/docs/d8ab94a8-8b00-401b-b1a4-48b7fd2713ae) | Conditions | The condition runs the automation once per hour and generates a ticket with the script’s results if any monitored event log is detected.     |
| [CW Manage - Ticket Template - Excessive Logon Attempts](/docs/87e8cc64-8a82-4d83-9a91-dcd82c63ffea)|CW Manage Ticket Template|This ticket template is used to manage the CW Manage ticket generation settings for the Excessive Logon Attempts Alert Condition |


## Implementation

- Create the [Automation - Excessive Logon Attempts](/docs/3b52c821-6c63-4da6-87e8-8bd5c96e78de) using the implementation instruction provided in the document.  
- Create the [Condition - Excessive Logon Attempts](/docs/d8ab94a8-8b00-401b-b1a4-48b7fd2713ae) using the implementation instruction provided in the document.
- Create the [CW Manage - Ticket Template - Excessive Logon Attempts](/docs/87e8cc64-8a82-4d83-9a91-dcd82c63ffea) using the implementation instruction provided in the document.


## FAQ

- The solution monitors the domain controller for excessive logon failures within one hour, indicating a possible brute force attack.

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
| 0xC000006A   | Bad password                     |<ol><li>Check if the password was recently changed.</li><li> Reset the password if needed.</li><li> Investigate repeated attempts (possible brute-force or excessive logon attempts).</li></ol>|
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
- `Enable Account Lockout Policies:` To prevent brute-force attacks or excessive logon attempts.