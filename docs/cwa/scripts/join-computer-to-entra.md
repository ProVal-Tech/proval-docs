---
id: '8ed2f666-9a24-48ad-a160-6c5ac537aee5'
slug: /8ed2f666-9a24-48ad-a160-6c5ac537aee5
title: 'Join Computer to Entra'
title_meta: 'Join Computer to Entra'
keywords: ['entra', 'entra-join', 'azure-ad', 'provisioning-package', 'ppkg', 'bulk-enrollment', 'dsregcmd', 'bitlocker', 'recovery-key']
description: 'Joins a workstation to Microsoft Entra ID with an Entra ID bulk enrollment provisioning package and backs up its BitLocker recovery keys to Entra ID.'
tags: ['azure', 'bitlocker', 'identity', 'provisioning', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-23
---

## Summary

This script joins a Windows workstation to Microsoft Entra ID by applying an Entra ID bulk enrollment provisioning package (`.ppkg`) created with Windows Configuration Designer. Run it after the computer has been removed from its Active Directory domain, renamed if needed, and restarted.

The script applies the package, confirms the join with `dsregcmd`, and backs up the BitLocker recovery keys to Entra ID, because the copies stored in Active Directory are lost along with the domain controllers. It then deletes its copy of the package, because the package contains the bulk enrollment token.

On a computer that's already Entra joined, the join is skipped and only the BitLocker backup runs, so the script is safe to run again.

Once users have signed in with their Entra ID accounts, run `Copy-DomainProfileToEntra` to bring their files across from their domain profiles.

:::note  
The script doesn't restart the computer. After a new join, restart it before users sign in with their Entra ID accounts. Nothing is changed until every pre-flight check passes, and the script log shows a failure when a check or the join fails.  
:::

## Requirements

- Windows 10 or Windows 11 Pro, Enterprise, or Education workstation. Servers and Home editions aren't supported.
- PowerShell 5.1
- Not joined to an Active Directory domain, and restarted since it was removed from the domain
- No computer rename waiting on a restart, because Entra ID registers the device under its current name
- Access on TCP port 443 to `login.microsoftonline.com` and `enterpriseregistration.windows.net`
- An Entra ID bulk enrollment provisioning package with a bulk token that hasn't expired, reachable from the computer. It isn't needed when the computer is already Entra joined.

To create the package, follow [Step 2: Create the Provisioning Package](/docs/7264fd6b-4957-473f-9d3e-75471c0fce73#step-2-create-the-provisioning-package) of the Domain to Entra ID and Intune Migration solution. The package and the Entra ID and Intune settings it needs are the same for ConnectWise Automate.

## Dependencies

- [Script: Local Machine - Domain - Remove](/docs/4bd0cdb9-f90e-4ffb-b880-52e4ff1c28c1)
- [Script: Intune Enrollment for Entra Joined Devices](/docs/9ea6eea1-814c-4642-bcad-fa34b361eb42)

## Sample Run

Run the script with `ProvisioningPackage` set to the path or URL of the provisioning package.

![Sample Run 1](../../../static/img/docs/8ed2f666-9a24-48ad-a160-6c5ac537aee5/image1.webp)

## User Parameters

| Name | Required | Example | Description |
| ---- | -------- | ------- | ----------- |
| ProvisioningPackage | False | `C:\ProgramData\_automation\script\Entra\EntraBulkEnrollment.ppkg` | Local path, UNC path, or HTTP(S) URL of the Entra ID bulk enrollment provisioning package (`.ppkg`). Required unless the computer is already Entra joined. Any query string on a URL, such as a SAS token, is left out of the script log. |

:::note  
The script runs as `System`. On a computer that has left the domain, it opens a UNC share without domain credentials, so a UNC path often fails. Use a local path or an HTTPS URL.  
:::

## Scenarios

- **Not Entra joined yet:** the script copies or downloads the package to the `TEMP` folder, checks that it can be read, applies it, and waits up to 5 minutes for the join. It then backs up the BitLocker recovery keys to Entra ID, reports the tenant, and asks for a restart.
- **Already Entra joined:** the join is skipped and only the BitLocker backup runs. No package is needed.
- **A pre-flight check fails:** for example, the computer is still joined to the domain, a rename is waiting on a restart, `ProvisioningPackage` is empty, or the Entra ID endpoints can't be reached. Nothing is changed and the script log shows the reason.
- **The join doesn't finish within 5 minutes:** the script reports a failure. Check that the bulk token hasn't expired and that the package account is allowed to join devices. The failure message gives the path of the provisioning logs.
- **The staged package can't be deleted:** the script reports a failure and gives the path of the file. Delete it by hand, because it contains the bulk enrollment token.

## Output

- Script log, ending with a line that starts with `Success:` or `Failure:`
- The computer joined to Microsoft Entra ID
- BitLocker recovery keys backed up to Entra ID

## Changelog

### 2026-11-23

- Initial version of the document
