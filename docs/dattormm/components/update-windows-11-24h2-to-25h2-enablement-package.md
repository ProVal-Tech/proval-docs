---
id: '6d8cd9ca-027d-4eef-9ab4-40b48f6bd7db'
slug: /6d8cd9ca-027d-4eef-9ab4-40b48f6bd7db
title: 'Update Windows 11 24H2 To 25H2 [Enablement Package]'
title_meta: 'Update Windows 11 24H2 To 25H2 [Enablement Package]'
keywords: ['windows-11', '25h2', '24h2', 'feature-update', 'enablement-package', 'kb5054156', 'upgrade', 'safeguard-hold']
description: 'Upgrades eligible Windows 11 version 24H2 devices to version 25H2 with the KB5054156 enablement package and a single restart. Datto RMM implementation of the Update-Windows11To25H2 script.'
tags: ['update', 'windows', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-10-06
---

## Summary

Upgrades Windows 11 version 24H2 devices to version 25H2 with a single restart. Apps, files, and settings stay in place.

The upgrade uses Microsoft's enablement package (KB5054156), a small update that switches on 25H2 features already delivered to the device by monthly updates. To learn how it works, see [KB5054156: Feature update to Windows 11, version 25H2 by using an enablement package](https://support.microsoft.com/en-us/topic/kb5054156-feature-update-to-windows-11-version-25h2-by-using-an-enablement-package-4d307e2d-3028-4323-bb46-552cff491643).

It works by running the [Update-Windows11To25H2](/docs/aa9612e1-f474-47b8-b71f-7d0e803beb36) script. Devices that do not qualify are left unchanged and reported as failures.

:::warning  
`NoReboot` does not guarantee that the device stays up. It only stops this component from restarting the device. Windows Update can still restart it on its own schedule, for example to finish installing other updates, and patch policies or users can restart it too. Any restart completes the upgrade, so run this component inside a maintenance window if restart timing matters.  
:::

:::note  
Devices need Windows 11 version 24H2 with the August 29, 2025 update (KB5064081) or any later monthly update.  
:::

## Dependencies

- [PowerShell: Update-Windows11To25H2](/docs/aa9612e1-f474-47b8-b71f-7d0e803beb36)

## Implementation

1. Download the component [Update Windows 11 24H2 to 25H2](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/update-windows-11-24h2-to-25h2-enablement-package.cpt) from the attachments.  
2. After downloading the file, click on the `Import` button in the Datto RMM interface.  
3. Select the component just downloaded and add it to the Datto RMM interface.  
  ![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  
4. After Importing the component to the Datto RMM, make sure to add the component to the `PVAL` Group always.  
    - Steps to Add the component under `PVAL` Group.  
    i. Click on `Drop Down Icon`.  
    ii. Click on `Add to Group`.  
    ![Image 4](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/Image1.webp)  
    iii. Select the group as `PVAL`  
    ![Image1](../../../static/img/docs/6d8cd9ca-027d-4eef-9ab4-40b48f6bd7db/image1.webp)

For detailed instructions on importing a Datto component, see [Workflow for Implementing Engineers](https://github.com/ProVal-Tech/datto-rmm#-workflow-for-implementing-engineers).

## Sample Run

![Image2](../../../static/img/docs/6d8cd9ca-027d-4eef-9ab4-40b48f6bd7db/image2.webp)

## Datto Variables

| Variable Name | Default | Type | Description |
| --- | --- | --- | --- |
| `NoReboot` | `False` | Boolean | Installs the upgrade without restarting the device. The upgrade completes on the next restart from any source. See the warning in the Summary. |
| `RebootDelaySeconds` | `300` | String | Seconds to wait before restarting, from 60 to 86400. Signed-in users see a restart warning during this time. Any other value stops the script before it makes changes. Ignored when `NoReboot` is set. |
| `IgnoreSafeguardHold` | `False` | Boolean | Installs the upgrade even when Microsoft has placed a safeguard hold on the device. Use only on tested devices. |

## Results by Device

| Device | Result |
|--------|--------|
| Windows 11 24H2, all requirements met | Upgraded to 25H2. Restarts after the delay unless `NoReboot` is set. |
| Windows 11 25H2 or newer | Success. No changes. |
| Windows 11 24H2 without the required update | Failure. No changes. Install the latest monthly update and run again. |
| Windows 11 23H2 or earlier, or Windows 10 | Failure. No changes. These versions need a full feature update instead. |
| Windows 11 LTSC edition or Windows Server | Failure. No changes. Not eligible for this upgrade. |
| Device under a safeguard hold | Failure. No changes, unless `IgnoreSafeguardHold` is set. |

:::note  
A safeguard hold is Microsoft blocking an update on devices with a known problem, such as an incompatible driver. The failure message includes the safeguard ID, which you can look up on the [Windows 11, version 25H2 known issues](https://learn.microsoft.com/en-us/windows/release-health/status-windows-11-25h2) page.  
:::

## Output

- Activity Log
- Script logs on the device:
  - `C:\ProgramData\_Automation\Script\Update-Windows11To25H2\Update-Windows11To25H2-log.txt`
  - `C:\ProgramData\_Automation\Script\Update-Windows11To25H2\Update-Windows11To25H2-error.txt`

## Attachments

- [Update Windows 11 24H2 to 25H2](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/update-windows-11-24h2-to-25h2-enablement-package.cpt)

## Changelog

### 2026-10-06

- Initial version of the document.
