---
id: 'dee76265-9071-47bb-9262-d656dd8b5c6d'
slug: /dee76265-9071-47bb-9262-d656dd8b5c6d
title: 'Get-UserProfiles'
title_meta: 'Get-UserProfiles'
keywords: ['user-profiles', 'local-users', 'local-admin', 'last-logon', 'profile-size', 'entra-id', 'audit']
description: 'Audits the user profiles and local user accounts on a Windows device, including local administrator rights, last sign-in, and profile size.'
tags: ['security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-22
---

## What It Does

Audits every user profile and local user account on a Windows device. For each user, it reports the username, whether it's a local account, whether it has local administrator rights, when it last signed in, how much disk space its profile uses, and whether the account is enabled.

The script only reads information. Nothing on the device is changed.

It runs the same way from CW RMM, NinjaOne, Datto RMM, or any other RMM platform. Each platform decides how the results are stored, for example in a custom field.

---

## When to Use It

- You want to know who has local administrator rights on your devices, including rights granted through nested groups.
- You need to find stale profiles of users who haven't signed in for a long time.
- You want to see which profiles use the most disk space before a cleanup.
- You want to find enabled local accounts, such as an active built-in Administrator account.

---

## What You Need

- Windows 10, Windows 11, or Windows Server 2016 or later
- The script running as SYSTEM or a local administrator through your RMM platform
- Internet access to `contentrepo.net` and the PowerShell Gallery
- On domain-joined devices, a connection to a domain controller, so domain usernames and nested domain groups can be looked up

Domain controllers and Windows versions older than Windows 10 and Windows Server 2016 are not supported. See [Results by Device](#results-by-device).

---

## How the Audit Works

1. **Checks the device.** Confirms the device runs a supported Windows version and isn't a domain controller. Unsupported devices stop here before anything is downloaded.
2. **Finds every user profile.** Reads the list of profiles Windows keeps for local, domain, and Microsoft Entra ID accounts. Built-in system profiles are skipped.
3. **Identifies each user.** Looks up the account name for each profile. If the account no longer exists or the domain can't be reached, the name is taken from the profile folder and marked `(Inferred)`.
4. **Checks administrator rights.** Looks for the user in the local Administrators group and in every group nested inside it. This also works on non-English versions of Windows.
5. **Finds the last sign-in.** Uses the newest sign-in recorded in the Windows Security log. If none is found, it uses the last sign-in time Windows stores for the account.
6. **Measures the profile size.** Adds up all files in the profile folder, including hidden files. Linked folders and OneDrive Files On-Demand files aren't counted.
7. **Adds local accounts without a profile.** Accounts that have never signed in, such as the built-in Administrator and Guest accounts, are included with a profile size of 0.

---

## What It Reports

Each user is returned with the following information:

| Field | What it shows |
|-------|---------------|
| `SID` | The account's security identifier. |
| `Path` | The profile folder, such as `C:\Users\jdoe`. Empty for local accounts without a profile. |
| `Username` | The account name, such as `CONTOSO\jdoe`. Names taken from the profile folder end with `(Inferred)`. |
| `IsLocalUser` | `True` for accounts created on the device itself. |
| `IsAdmin` | `True` for accounts with local administrator rights, directly or through a nested group. |
| `LastLogon` | The last sign-in time. Empty when no sign-in was found. |
| `ProfileSize` | The profile size in MB, rounded to two decimal places. |
| `Enabled` | `True` or `False` for local accounts. `Remote` for domain and Entra ID accounts, whose status is managed outside the device. |

---

## Parameters

This script has no parameters.

---

## Results by Device

| Device | Result |
|--------|--------|
| Windows 10, Windows 11, or Windows Server 2016 or later | Returns one entry per user profile and local account. No changes. |
| Domain controller, including read-only domain controllers | Stops with an error. No data is collected. |
| Windows 8.1, Windows Server 2012 R2, or earlier | Stops with an error. No data is collected. |
| Local user accounts can't be read | Stops with an error. Details are written to the error log. |

Failures stop the script with an error, so your RMM platform reports the run as failed.

---

## Usage Examples

### Example 1: Audit all users

```powershell
.\Get-UserProfiles.ps1
```

**What happens:**

- Every user profile and local account on the device is returned.
- Nothing on the device is changed.

### Example 2: List only local administrators

```powershell
.\Get-UserProfiles.ps1 | Where-Object -FilterScript { $_.IsAdmin }
```

**What happens:**

- Only accounts with local administrator rights are returned, including those that get the rights through a nested group.

### Example 3: Find the largest profiles

```powershell
.\Get-UserProfiles.ps1 | Sort-Object -Property ProfileSize -Descending
```

**What happens:**

- All users are returned, largest profile first.

> **Note:** Measuring profile sizes reads every file in every profile. On devices with many or large profiles, a run can take several minutes, so allow enough time before your RMM platform times out.

---

## Troubleshooting

| Problem | Cause | Solution |
|---------|-------|----------|
| The run fails before any log file is created | The device is a domain controller or runs an unsupported Windows version, or `contentrepo.net` or the PowerShell Gallery is blocked. | Check the error in your RMM output. Allow HTTPS to both sites if the download is blocked. |
| A username ends with `(Inferred)` | The account was deleted, or the device couldn't reach a domain controller. | Check whether the account still exists. For domain accounts, run again while the device is connected to the domain network or VPN. |
| `LastLogon` is empty | The account has no sign-in in the Security log, which keeps a limited history. | This is expected for accounts that haven't signed in recently. Increase the Security log size if you need a longer history. |
| A user with admin rights shows `IsAdmin` as `False` | The rights come from a Microsoft Entra ID role, such as Global Administrator, which the device can't look inside. | Check the user's Entra ID roles in the Microsoft Entra admin center. |
| The log shows a group that couldn't be read | The group belongs to a domain or Entra ID that the device couldn't reach. | Run again while the device is connected to the domain network or VPN. |
| A profile is smaller than expected | OneDrive Files On-Demand files and linked folders aren't counted. | This is expected. Check OneDrive storage separately. |
| The run times out | Large profiles take time to measure. | Increase the script timeout in your RMM platform. |

---

## Files and Logs

| File | Location |
|------|----------|
| Script log | `.\Get-UserProfiles-log.txt` |
| Error log | `.\Get-UserProfiles-error.txt` (created only when the script stops on an error after logging starts) |

---

## Changelog

### 2026-10-22

- The script now stops on domain controllers and on Windows versions older than Windows 10 and Windows Server 2016.
- Fixed the last sign-in time, which was never filled in when the Security log had no sign-in for the user.
- Fixed administrator detection on non-English versions of Windows and for usernames with special characters.
- Groups that can't be read are now logged as warnings instead of causing errors.
- Profiles whose folder no longer exists now report a size of 0.
- Rewrote the document.

### 2025-04-10

- Initial version of the document