---
id: 'e99ec890-ae05-4ad5-bdbc-6b0599be67e9'
slug: /e99ec890-ae05-4ad5-bdbc-6b0599be67e9
title: 'Excessive Logon Attempts'
title_meta: 'Excessive Logon Attempts'
keywords: ['excessive-logon-attempts', 'excessive', 'logon', 'bruteforce', 'brute', 'failed-logon', '4625', 'password-spraying', 'domain-controller']
description: 'Monitors the domain controller holding the Infrastructure Master role for failed logon attempts (Security event ID 4625) and creates a ConnectWise Manage ticket when the failures recorded since the last run reach the threshold, which can indicate a brute-force or password-spraying attack.'
tags: ['security', 'accounts', 'eventlogs', 'active-directory']
draft: false
unlisted: false
last_update:
  date: 2026-11-11
---

## Purpose

This solution watches domain controllers for an unusual number of failed logon attempts, which can indicate a brute-force or password-spraying attack. Every 4 hours, the [Monitor - Excessive Logon Attempts](/docs/e15874f0-0d01-409e-9131-b84494dadf29) compound condition runs the [Excessive Logon Attempts](/docs/3b52c821-6c63-4da6-87e8-8bd5c96e78de) automation on the domain controller that holds the Infrastructure Master role. The automation counts the failed logons (Security event ID 4625) recorded since its previous run. When the count reaches the threshold, NinjaOne creates a ConnectWise Manage ticket from the [Excessive Logon Failures](/docs/87e8cc64-8a82-4d83-9a91-dcd82c63ffea) ticket template. The ticket lists the failures grouped by user, domain and source IP address.

The threshold, the exclusions and whether monitoring is on are all set in `cPVAL Excessive Logon` custom fields at the organization, location or device level, so each client, site or domain controller can be tuned without editing the automation or the compound condition.

**Platform:** `NinjaOne`

### Key Capabilities

- **No gaps or overlaps between runs** – Each run counts the failed logons recorded since the previous run, using the time saved in [cPVAL Excessive Logon LastRunTime](/docs/1e9de0b4-cf50-419a-95b5-bd1e1fbf3599). After the agent has been offline, the next run covers the whole time since the last run.
- **Tuned per client, location or device** – The threshold, the exclusions and an on/off switch are custom fields that can be set at the organization, location or device level.
- **Targeted exclusions** – Known harmless failures can be ignored by username, by computer, by domain, by source workstation or by logon process. Every exclusion accepts the `*` and `?` wildcards.
- **Built-in noise filtering** – Batch and service logons, and a computer account failing from its own workstation, are never counted.
- **Detailed tickets** – The ticket lists each user, domain and source IP address with the workstation, logon type, failure status, logon process, calling process, number of occurrences and time of the most recent failure, followed by reference tables for logon types and failure codes.
- **Read-only** – The automation changes nothing on the domain controller. The only thing it writes is the last run time custom field.

### Important Caveats & Behavior

- **Only the monitored domain controller's own failed logons are counted** – Windows records event 4625 on the computer where the logon was attempted. The solution reads only the Security log of the domain controller that holds the Infrastructure Master role, so it counts failed logons to that server, such as Remote Desktop, file share access and VPN or RADIUS logons handled by that server. A domain user who mistypes a password at a workstation or member server is recorded on that computer, not as event 4625 on the domain controller. Kerberos pre-authentication failures (event 4771) and NTLM credential validation failures (event 4776) are different events and are not counted.
- **One domain controller per domain** – The compound condition runs only where [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) contains `Infrastructure Master`, which is one domain controller in each domain. Other domain controllers are not monitored.
- **Depends on Server Roles Detection** – [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) is filled in by [Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6). If that solution is not implemented, no device is monitored. When the Infrastructure Master role moves to another domain controller, monitoring follows only after Server Roles Detection runs again, and the first run on the new domain controller checks only the last 60 minutes.
- **The threshold is a total per run, not per user** – The alert is raised when the failed logons since the last run, from all users and all sources added together, are equal to or greater than the threshold. With the default threshold of `10` and the 4-hour schedule, that means 10 or more failed logons in 4 hours. If the schedule changes, review the threshold too.
- **Exclusions are applied before counting** – Excluded failures never count toward the threshold and do not appear in the ticket. Broad entries such as `*\*`, `DOMAIN\*` for the monitored domain, or the `NtLmSsp` and `User32` logon processes hide real attacks. See [Exclusion Options](#exclusion-options).
- **A lower-level custom field value replaces the inherited one** – For the exclusion fields, a value set on a location or device replaces the organization's value instead of adding to it. To keep the organization's entries on that device, include them in the device's value as well.
- **Parameters in the compound condition override the custom fields** – The automation's parameters are left empty in the compound condition so that the custom fields are used. A value entered there applies to every device in the policy and replaces the custom field value, rather than adding to it.
- **The last run time field must be writable** – [cPVAL Excessive Logon LastRunTime](/docs/1e9de0b4-cf50-419a-95b5-bd1e1fbf3599) must be a Device-level Text field with `Read/Write` automation access. If the script cannot save the time, every run checks only the last 60 minutes, so with a 4-hour schedule about 3 of every 4 hours are never checked.
- **The first run checks only the last 60 minutes** – The same applies whenever the last run time field is empty or does not hold a valid past time.
- **Manual runs move the last run time** – Running the automation by hand saves a new last run time, so the next scheduled run counts only the failures after the manual run. Failures counted by a manual run do not create a ticket, because only the compound condition creates tickets.
- **The Security log must hold at least 4 hours of events** – Failed logons that roll out of the Security log before the next run are never counted. On a busy domain controller, make sure the maximum log size is large enough to hold more than 4 hours of events.
- **A Security log read failure also creates a ticket** – If the Security log cannot be read, the script ends with `Failure: Unable to read the Security log`, which meets the compound condition, so a ticket is created. The last run time is not updated, so the next successful run covers the missed period.
- **Failed logons are listed on every run, but only the threshold creates a ticket** – Whenever any failed logons are counted, the details appear in the device's activities, even when the count stays below the threshold.
- **Auto-reset is off** – The compound condition is not set to reset on its own. Once it raises an alert on a device, it does not raise another one on that device until the alert is reset in NinjaOne. Reset the alert after the ticket has been worked. If the condition triggers again while the ticket is still open, the new output is appended to that ticket.
- **The ticket template needs a ticket type** – The [Excessive Logon Failures](/docs/87e8cc64-8a82-4d83-9a91-dcd82c63ffea) template ships with the type set to `MUST CHANGE`. Set the board, type and other values to match the partner's ConnectWise Manage before use.
- **Remove the previous condition when upgrading** – The earlier version of this solution used a script result condition named `Excessive Logon Attempts`. Remove it from every agent policy before adding the compound condition. Both would save the same last run time, so each would count only the failures since the other last ran, and the threshold would rarely be reached.
- **Nothing is blocked or locked** – The solution only reports. It does not block IP addresses, lock accounts or reset passwords.

## How It Works

1. [Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6) detects the roles on each Windows server and saves them in [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba). On the domain controller that holds the Infrastructure Master role, the field contains `Infrastructure Master`.
2. Every 4 hours, the [Monitor - Excessive Logon Attempts](/docs/e15874f0-0d01-409e-9131-b84494dadf29) compound condition in the `Windows Server Policy` checks that [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) contains `Infrastructure Master` and that [cPVAL Enable Excessive Logon Detection](/docs/57a80bea-ffac-4925-bc95-c51bf6db01f1) is not `Disable`.
3. The compound condition runs the [Excessive Logon Attempts](/docs/3b52c821-6c63-4da6-87e8-8bd5c96e78de) automation as `System`. Its parameters are empty, so the automation reads the threshold and the exclusions from the `cPVAL Excessive Logon` custom fields.
4. The automation reads the time saved in [cPVAL Excessive Logon LastRunTime](/docs/1e9de0b4-cf50-419a-95b5-bd1e1fbf3599) and collects the event ID 4625 entries from that time up to the moment the run started. If no valid time is saved, it collects the last 60 minutes.
5. It drops batch and service logons, computer accounts failing from their own workstation and every failure that matches an exclusion, and counts the rest.
6. It saves the time the run started in [cPVAL Excessive Logon LastRunTime](/docs/1e9de0b4-cf50-419a-95b5-bd1e1fbf3599), so the next run starts where this one ended.
7. If any failures were counted, it lists them in the output, grouped by user, domain and source IP address.
8. If the count is equal to or greater than the threshold, the output ends with a `Failure:` line and exit code `1`. The compound condition then triggers and creates a ConnectWise Manage ticket from the [Excessive Logon Failures](/docs/87e8cc64-8a82-4d83-9a91-dcd82c63ffea) template, with the script output in the ticket. Otherwise, the output ends with a `Success:` line and no ticket is created.

## Exclusion Options

Five custom fields control which failed logons are ignored. Use the narrowest field that covers the failure, so that the same account failing anywhere else still counts.

| | Matches | Best for | Example |
|---|---|---|---|
| [cPVAL Excessive Logon ExcludeUsers](/docs/655756eb-8031-443a-8483-9509009523a1) | The username, in every domain and from every computer | Accounts that fail harmlessly everywhere, such as a scanner account | `scanner; svc_*` |
| [cPVAL Excessive Logon ExcludeByComputer](/docs/ab58f702-6829-4c77-b155-9da7e916d24b) | An account whose domain or source workstation is the named computer | A local account that is only expected to fail on or from one PC | `FRONTDESK-01\reception` |
| [cPVAL Excessive Logon ExcludeByDomain](/docs/a0bac62e-ca7d-47e4-9b40-0ef534b99260) | An account that belongs to the named domain | One domain's account, while the same name in another domain still alerts, or a whole domain that does not need monitoring | `CONTOSO\svc_scan` |
| [cPVAL Excessive Logon ExcludeByWorkstation](/docs/75819933-6303-4b48-b3e6-c0c26e125142) | An account failing from the named workstation | A device known to send bad logons, such as a copier or a laptop with an old saved password | `COPIER-2F\scan2folder` |
| [cPVAL Excessive Logon ExcludeLogonProcess](/docs/5e936fa9-8345-47e2-826d-7a74144c1787) | A kind of logon, whatever the account | Failures monitored elsewhere, such as VPN or RADIUS logons | `CHAP` |

**How to choose:**

- Pick **ExcludeUsers** only when the account is harmless wherever it fails.
- Pick **ExcludeByComputer**, **ExcludeByDomain** or **ExcludeByWorkstation** when the failures are expected from one place only.
- Pick **ExcludeLogonProcess** only for a whole kind of logon, and never for `NtLmSsp` or `User32`, which carry most password-guessing attacks.
- Prefer naming a specific account over `COMPUTER\*` or `WORKSTATION\*`. The workstation name is reported by the computer making the attempt, so an attacker's computer can report a name that matches an entry.

Separate entries with commas, semicolons or line breaks. Matching is not case-sensitive. The `ExcludeBy` fields take `SCOPE\account` pairs, and a forward slash also works.

## Prerequisites

- [Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6) implemented, with its automation scheduled to run daily so [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) stays current
- The ConnectWise Manage app enabled and connected in NinjaOne
- Logon failure auditing enabled on the domain controllers, so Windows records event ID 4625. Windows Server enables it by default, but a Group Policy can turn it off. Running `auditpol /get /subcategory:"Logon"` on the domain controller should show `Failure` or `Success and Failure`.
- PowerShell 5.1 on the domain controllers
- A Security log large enough to hold more than 4 hours of events

## Associated Content

### Custom Fields: Enablement and Threshold

| Name | Level | Type | Purpose |
|---|---|---|---|
| [cPVAL Enable Excessive Logon Detection](/docs/57a80bea-ffac-4925-bc95-c51bf6db01f1) | Organization, Location, Device | Drop-down | Turns monitoring on or off. `Disable` stops the compound condition from running on the device. Empty works like `Enable`. |
| [cPVAL Excessive Logon Threshold](/docs/59804ada-96af-48b6-ab50-e975b531351e) | Organization, Location, Device | Text | Number of failed logons since the last run that raises the alert. Empty, `0`, a negative number or text uses `10`. |

### Custom Fields: Exclusions

| Name | Level | Type | Purpose |
|---|---|---|---|
| [cPVAL Excessive Logon ExcludeUsers](/docs/655756eb-8031-443a-8483-9509009523a1) | Organization, Location, Device | Multi-line | Usernames to ignore everywhere. |
| [cPVAL Excessive Logon ExcludeByComputer](/docs/ab58f702-6829-4c77-b155-9da7e916d24b) | Organization, Location, Device | Multi-line | `COMPUTER\account` entries to ignore on or from one computer. |
| [cPVAL Excessive Logon ExcludeByDomain](/docs/a0bac62e-ca7d-47e4-9b40-0ef534b99260) | Organization, Location, Device | Multi-line | `DOMAIN\account` entries to ignore in one domain. |
| [cPVAL Excessive Logon ExcludeByWorkstation](/docs/75819933-6303-4b48-b3e6-c0c26e125142) | Organization, Location, Device | Multi-line | `WORKSTATION\account` entries to ignore from one workstation. |
| [cPVAL Excessive Logon ExcludeLogonProcess](/docs/5e936fa9-8345-47e2-826d-7a74144c1787) | Organization, Location, Device | Text | Logon process names to ignore everywhere. |

### Custom Field: State

| Name | Level | Type | Purpose |
|---|---|---|---|
| [cPVAL Excessive Logon LastRunTime](/docs/1e9de0b4-cf50-419a-95b5-bd1e1fbf3599) | Device | Text | Time the automation last ran. Read and written by the automation on every run. Does not need to be filled in manually. |

### Automation

| Name | Purpose |
|---|---|
| [Excessive Logon Attempts](/docs/3b52c821-6c63-4da6-87e8-8bd5c96e78de) | Counts the failed logons recorded since the last run, applies the exclusions, lists the failures and ends with `Failure:` when the count reaches the threshold. |

### Compound Condition

| Name | Type | Purpose |
|---|---|---|
| [Monitor - Excessive Logon Attempts](/docs/e15874f0-0d01-409e-9131-b84494dadf29) | Compound Condition | Runs the automation every 4 hours on the domain controller holding the Infrastructure Master role, unless monitoring is set to `Disable`, and creates a ConnectWise Manage ticket when the threshold is reached. |

### Ticket Template

| Name | Purpose |
|---|---|
| [Excessive Logon Failures](/docs/87e8cc64-8a82-4d83-9a91-dcd82c63ffea) | Sets the board, priority and title of the ConnectWise Manage ticket created by the compound condition. |

### Dependencies

| Name | Type | Purpose |
|---|---|---|
| [Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6) | Solution | Fills in [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba), which the compound condition uses to find the Infrastructure Master. |

## Implementation

### Step 1: Implement Server Roles Detection

Implement [Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6) if it is not already in place. Confirm that [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) contains `Infrastructure Master` on the domain controller that holds the role.

- [Solution: Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6)

### Step 2: Create the Custom Fields

Create all nine custom fields. Give [cPVAL Excessive Logon LastRunTime](/docs/1e9de0b4-cf50-419a-95b5-bd1e1fbf3599) `Read/Write` automation access, as the automation saves the last run time in it.

- [Custom Field: cPVAL Enable Excessive Logon Detection](/docs/57a80bea-ffac-4925-bc95-c51bf6db01f1)
- [Custom Field: cPVAL Excessive Logon Threshold](/docs/59804ada-96af-48b6-ab50-e975b531351e)
- [Custom Field: cPVAL Excessive Logon ExcludeUsers](/docs/655756eb-8031-443a-8483-9509009523a1)
- [Custom Field: cPVAL Excessive Logon ExcludeByComputer](/docs/ab58f702-6829-4c77-b155-9da7e916d24b)
- [Custom Field: cPVAL Excessive Logon ExcludeByDomain](/docs/a0bac62e-ca7d-47e4-9b40-0ef534b99260)
- [Custom Field: cPVAL Excessive Logon ExcludeByWorkstation](/docs/75819933-6303-4b48-b3e6-c0c26e125142)
- [Custom Field: cPVAL Excessive Logon ExcludeLogonProcess](/docs/5e936fa9-8345-47e2-826d-7a74144c1787)
- [Custom Field: cPVAL Excessive Logon LastRunTime](/docs/1e9de0b4-cf50-419a-95b5-bd1e1fbf3599)

### Step 3: Create or Update the Automation

Create the automation and set it to run as `System`. When upgrading, replace the existing automation. The `Minutes` parameter has been removed, `Threshold` is now optional, and five exclusion parameters have been added.

- [Automation: Excessive Logon Attempts](/docs/3b52c821-6c63-4da6-87e8-8bd5c96e78de)

### Step 4: Create the Ticket Template

Create the ticket template, then set the board, type, team and other values to match the partner's ConnectWise Manage. The type is shipped as `MUST CHANGE` and must be replaced.

- [CW Manage Ticket Template: Excessive Logon Failures](/docs/87e8cc64-8a82-4d83-9a91-dcd82c63ffea)

### Step 5: Create the Compound Condition

Create the compound condition in the `Windows Server Policy`, or in the policy the domain controllers use. Leave every automation parameter empty so the custom fields are used.

- [Compound Condition: Monitor - Excessive Logon Attempts](/docs/e15874f0-0d01-409e-9131-b84494dadf29)

### Step 6: Remove the Previous Condition (Upgrades Only)

If the earlier version of this solution was implemented, remove the `Excessive Logon Attempts` script result condition from every agent policy that has it, such as `Windows Server [Default]`. Leaving it in place splits the last run time between two conditions and can create duplicate tickets.

### Step 7: Set the Threshold and Exclusions (Optional)

Leave [cPVAL Excessive Logon Threshold](/docs/59804ada-96af-48b6-ab50-e975b531351e) empty to use the default of `10`, or set a higher value for a busy domain controller. Add exclusions only for failures that have been investigated and confirmed harmless. To turn monitoring off for a client, location or domain controller, set [cPVAL Enable Excessive Logon Detection](/docs/57a80bea-ffac-4925-bc95-c51bf6db01f1) to `Disable` at that level.

You'll know it worked when, within 4 hours of saving the policy, [cPVAL Excessive Logon LastRunTime](/docs/1e9de0b4-cf50-419a-95b5-bd1e1fbf3599) on the Infrastructure Master shows a time such as `2026-11-11 10:21:03 -05:00`, and the device's activities show the automation output ending in a `Success:` or `Failure:` line with the period it checked.

## Troubleshooting

### No Ticket Is Created

- Review the automation output in the device's activities. A `Success:` line means the count stayed below the threshold. The line shows how many failures were counted, the period checked and the threshold used.
- Confirm [cPVAL Enable Excessive Logon Detection](/docs/57a80bea-ffac-4925-bc95-c51bf6db01f1) is not `Disable` at the organization, location or device level.
- Confirm [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) contains `Infrastructure Master` on the device. If the role has moved, run Server Roles Detection again.
- Confirm the compound condition is in the agent policy assigned to the domain controller.
- Confirm the ConnectWise Manage app is connected, and that the [Excessive Logon Failures](/docs/87e8cc64-8a82-4d83-9a91-dcd82c63ffea) template has a valid board and type.
- Check whether an earlier alert from the compound condition is still active on the device. Until it is reset, the condition does not raise a new alert.
- Check that the exclusions are not too broad, including values set at the location and device levels.
- Check whether the previous `Excessive Logon Attempts` condition is still in a policy. It moves the last run time, so the compound condition counts only a few minutes of failures.
- Confirm Windows is recording the events. On the domain controller, `auditpol /get /subcategory:"Logon"` should show `Failure`, and `Get-WinEvent -FilterHashtable @{ LogName = 'Security'; Id = 4625 } -MaxEvents 20` should return recent failures.
- Confirm the Security log keeps more than 4 hours of events. If its oldest event is less than 4 hours old, increase the maximum log size.
- If the activity shows the automation stopped at the timeout, the last run time was not saved and the next run covers the same period again. Increase the timeout in the compound condition.

### Investigating an Alert

#### Reading the Alert

Each row in the alert is one combination of user, domain and source IP address. The details come from the most recent failure in that group.

| Field | What it shows |
|---|---|
| `UserName` / `Domain` | The account that failed. For a local account, `Domain` is the computer the account belongs to. |
| `LogonType` | How the logon was attempted: `2` Interactive, `3` Network, `7` Unlock, `8` NetworkCleartext, `9` NewCredentials, `10` RemoteInteractive (Remote Desktop), `11` CachedInteractive. |
| `WorkstationName` | The computer the attempt came from, as reported by that computer. It can be empty or `-`. |
| `SourceIpAddress` | The IP address the attempt came from. `-` or a loopback address means the attempt started on the domain controller itself. |
| `FailureStatus` / `FailureSubStatus` | Why the logon failed. Compare `FailureSubStatus`, or `FailureStatus` when there is no sub-status, with the [error code table](#3-error-codes). |
| `CallerProcessName` / `CallerProcessStatus` | The process on the domain controller that requested the logon, and whether it is still running. |
| `LogonProcess` / `AuthenticationPackage` | The Windows component and protocol that handled the attempt, such as `NtLmSsp` and `NTLM`, or `CHAP` for VPN and RADIUS. |
| `Occurrences` / `MostRecentDetection` | How many failures the group had in the period, and when the newest one happened. |

#### Common Patterns

| What the alert shows | Likely cause |
|---|---|
| Many different usernames from one source IP address, often with `0xC0000064` | Account enumeration or password spraying |
| One account with many occurrences and `0xC000006A` from one source | An old saved password on a device, mapped drive, phone or service, or a brute-force attack on that account |
| `LogonType` `3` or `10` from a public IP address | File sharing or Remote Desktop exposed to the internet |
| `LogonProcess` `CHAP` | VPN or RADIUS users entering a wrong password |
| `SourceIpAddress` `-` or loopback with an application as `CallerProcessName` | An application or service on the domain controller using wrong credentials |

#### 1. Identify the Account Type

- `Domain Account:` Check in Active Directory Users and Computers (ADUC).
- `Local Account:` Use Computer Management > Local Users and Groups.
- `Service Account:` Check the services, scheduled tasks and applications that use the account.
- `Unknown Account:` Investigate for potential brute-force or enumeration attacks.

#### 2. Review the Event Logs

Look for event ID `4625` in the Security log of the domain controller, and pay attention to:

- Status and SubStatus codes
- Logon type
- Source IP address and workstation
- Target account name

#### 3. Error Codes

| Error Code | Meaning | Action Steps |
|---|---|---|
| 0xC000006A | Bad password | <ol><li>Check if the password was recently changed.</li><li>Reset the password if needed.</li><li>Investigate repeated attempts (possible brute-force or excessive logon attempts).</li></ol> |
| 0xC000006D | Bad username or authentication information | <ol><li>Check FailureSubStatus for the specific reason.</li><li>Verify the username.</li><li>Check for typos or outdated credentials.</li><li>Investigate the source of repeated failures.</li></ol> |
| 0xC0000064 | Bad or misspelled username | <ol><li>Confirm the account exists.</li><li>Investigate for enumeration attempts.</li></ol> |
| 0xC000005E | No logon servers available | <ol><li>Check domain controller availability.</li><li>Ensure network connectivity.</li><li>Restart the Netlogon service.</li></ol> |
| 0xC000006F | Logon outside authorized hours | <ol><li>Review account restrictions in AD.</li><li>Adjust allowed logon hours if needed.</li></ol> |
| 0xC0000070 | Unauthorized workstation | <ol><li>Check workstation restrictions in AD.</li><li>Update allowed workstations.</li></ol> |
| 0xC0000071 | Expired password | <ol><li>Have the user change the password.</li><li>Update the password everywhere it is saved.</li></ol> |
| 0xC0000072 | Account disabled | <ol><li>Investigate why the account was disabled.</li><li>Enable the account in AD if it should be in use, or remove the saved credentials.</li></ol> |
| 0xC0000133 | Clock out of sync with the domain controller | <ol><li>Check the time on the source computer and the domain controller.</li><li>Fix time synchronization.</li></ol> |
| 0xC000015B | Logon type not granted | <ol><li>Check Group Policy or Local Security Policy.</li><li>Grant appropriate logon rights.</li></ol> |
| 0xC0000192 | Netlogon service not started | <ol><li>Start the Netlogon service.</li><li>Set it to automatic.</li></ol> |
| 0xC0000193 | Expired account | <ol><li>Extend or renew the account expiration date.</li></ol> |
| 0xC0000224 | Password must be changed at next logon | <ol><li>Have the user sign in interactively and change the password.</li></ol> |
| 0xC0000234 | Account locked out | <ol><li>Find the source of the failures before unlocking.</li><li>Unlock the account once the source is fixed.</li></ol> |
| 0xC0000413 | Authentication firewall restriction | <ol><li>Review firewall or security policies.</li><li>Allow the account to authenticate.</li></ol> |

For the full list, see Microsoft's [event 4625 reference](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/auditing/event-4625).

#### 4. Service Account Checks

Run these on the computer the failures come from, shown in `WorkstationName` or `SourceIpAddress`:

- Services: `Get-CimInstance -ClassName Win32_Service | Where-Object { $_.StartName -like '*accountname*' } | Select-Object Name, StartName, State`
- Scheduled tasks: `Get-ScheduledTask | Where-Object { $_.Principal.UserId -like '*accountname*' } | Select-Object TaskName, TaskPath`

Then change the password in AD and update it in every service, scheduled task and application that uses it.

#### 5. Unknown or Suspicious Accounts

- `Investigate the source IP address:` Use firewall logs or SIEM tools.
- `Check for patterns:` Repeated failures from the same IP address, or failures targeting many accounts.
- `Block the IP address or account:` If the activity is malicious, take immediate action.
- `Enable account lockout policies:` To limit brute-force attempts.

## FAQ

### Q: The device's activities list failed logons, but no ticket was created. Why?

> The automation lists the failures on every run that counts any, but a ticket is created only when the count is equal to or greater than the threshold. The last line of the output shows the count, the period checked and the threshold.

### Q: How do I change the threshold?

> Set [cPVAL Excessive Logon Threshold](/docs/59804ada-96af-48b6-ab50-e975b531351e) at the organization, location or device level. The value is a total across all users for the period since the last run, which is 4 hours on the default schedule. A good way to pick a value is to review the failures listed in the device's activities for a week and set the threshold above the normal level.

### Q: How do I turn monitoring off for a client, a location or one domain controller?

> Set [cPVAL Enable Excessive Logon Detection](/docs/57a80bea-ffac-4925-bc95-c51bf6db01f1) to `Disable` at that level. A value set at a lower level overrides the inherited one, so a single domain controller can be excluded while the rest of the client stays monitored.

### Q: Which exclusion field should I use?

> Use the narrowest one that covers the failure. See [Exclusion Options](#exclusion-options) for a comparison.

### Q: I excluded an account at the organization level, but it still appears in alerts for one domain controller. Why?

> The exclusion field has a value at the location or device level, which replaces the organization's value instead of adding to it. Add the organization's entries to the lower-level value as well, or clear the lower-level value.

### Q: A user locked themselves out at their workstation. Why was there no alert?

> Windows records event 4625 on the computer where the logon was attempted, which was the workstation. The domain controller records that failure as event 4771 or 4776, which this solution does not count. The solution counts only failed logons to the domain controller that holds the Infrastructure Master role.

### Q: Why is only one domain controller monitored?

> The compound condition runs only where [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) contains `Infrastructure Master`. There is one Infrastructure Master in each domain, so one domain controller per domain is monitored.

### Q: Can I run the automation manually?

> Yes, but a manual run saves a new last run time. The next scheduled run then counts only the failures after the manual run, and the failures the manual run counted do not create a ticket.

### Q: Why did the first run check only the last 60 minutes?

> [cPVAL Excessive Logon LastRunTime](/docs/1e9de0b4-cf50-419a-95b5-bd1e1fbf3599) was empty. From the second run onward, each run covers the time since the previous run.

### Q: Can I run the check more or less often than every 4 hours?

> Yes. Change the `Run every` interval of the compound condition. Each run still covers the time since the previous run, so nothing is missed or counted twice. Review the threshold at the same time, as it applies to the period between runs.

### Q: What happened to the Minutes parameter?

> It was removed. The automation now counts the failures since its last run, saved in [cPVAL Excessive Logon LastRunTime](/docs/1e9de0b4-cf50-419a-95b5-bd1e1fbf3599), instead of a fixed number of minutes.

### Q: I received a ticket that says "Unable to read the Security log". What does it mean?

> The automation could not read the Security log, so it ended with a `Failure:` line and the compound condition created a ticket. The reason is shown after the message. Check that the Windows Event Log service is running and that the Security log is not damaged. The last run time was not updated, so the next successful run covers the missed period.

### Q: The output shows "[WARNING] Unable to save ... as the last run time". What should I do?

> Make sure [cPVAL Excessive Logon LastRunTime](/docs/1e9de0b4-cf50-419a-95b5-bd1e1fbf3599) exists as a Device-level Text field with `Read/Write` automation access. Until the time can be saved, each run checks only the last 60 minutes.

### Q: Why is the total of the Occurrences column lower than the count in the Failure line?

> Failures that have no username are counted toward the threshold but are not listed in the details.

### Q: Why don't failures from services, scheduled tasks or computer accounts appear?

> Batch logons (logon type 4, used by scheduled tasks), service logons (logon type 5) and a computer account failing from its own workstation are never counted.

### Q: Does the solution block the attacker or lock the account?

> No. It only reports. Blocking IP addresses, locking accounts and resetting passwords are left to the technician working the ticket.

### Q: I implemented the previous version of this solution. What do I need to change?

> - Create the custom fields.
> - Replace the automation with the current version.
> - Update the ticket template to [Excessive Logon Failures](/docs/87e8cc64-8a82-4d83-9a91-dcd82c63ffea).
> - Add the [Monitor - Excessive Logon Attempts](/docs/e15874f0-0d01-409e-9131-b84494dadf29) compound condition.
> - Remove the old `Excessive Logon Attempts` condition from every agent policy.
> - Move any `Threshold` value set in the old condition into [cPVAL Excessive Logon Threshold](/docs/59804ada-96af-48b6-ab50-e975b531351e).

## Changelog

### 2026-11-11

- Rewrote the document to the current solution template, adding Key Capabilities, Important Caveats & Behavior, How It Works, Exclusion Options, Prerequisites, step-by-step Implementation, FAQ and expanded Troubleshooting.
- Replaced the `Excessive Logon Attempts` condition with the [Monitor - Excessive Logon Attempts](/docs/e15874f0-0d01-409e-9131-b84494dadf29) compound condition, which runs every 4 hours on the domain controller holding the Infrastructure Master role.
- Added the enablement, threshold, exclusion and last run time custom fields.
- Updated the automation to count the failures since its last run instead of a fixed `Minutes` window, and to apply the new exclusions.
- Renamed the ticket template to `Excessive Logon Failures`.

### 2025-07-09

- Initial version of the document
