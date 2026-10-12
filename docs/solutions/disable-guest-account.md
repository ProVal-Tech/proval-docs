---
id: '5e9750da-82c2-4f0a-a6a0-894412269e53'
slug: /5e9750da-82c2-4f0a-a6a0-894412269e53
title: 'Disable Guest Account'
title_meta: 'disable-guest-account'
keywords: ['guest', 'guest-account', 'local-user', 'disable', 'accounts', 'ninjaone']
description: 'Keeps the built-in Windows Guest account disabled on Windows workstations and servers managed by NinjaOne.'
tags: ['accounts', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-12
---

## Purpose

Keeps the built-in Windows Guest account disabled on Windows workstations and servers managed by NinjaOne. Turn it on for every client at once, or for one client at a time, with one custom field.

Use it when a security audit or policy requires the Guest account to be disabled.

## Associated Content

| Content | Type | Function |
| ------- | ---- | -------- |
| [cPVAL Disable Guest Account](/docs/b7743a14-544e-4e5c-8c20-7579dd0c5c39) | Custom Field | Turns the solution on (`Enable`) or off (`Disable`) for all clients, a client, a location, or a device. |
| [Disable Guest Accounts](/docs/89454fe4-a6b8-4e6a-8b47-a59f23128e07) | Automation | Detects the Guest account and disables it if it is enabled. |
| [Guest Account Removal Monitor](/docs/4b2a084a-e67b-4c61-801c-d5103e08b619) | Compound Condition | Checks devices daily and runs the automation when the Guest account is enabled and the custom field is set to `Enable`. |

## Implementation

1. Create the [cPVAL Disable Guest Account](/docs/b7743a14-544e-4e5c-8c20-7579dd0c5c39) custom field.
2. Import the [Disable Guest Accounts](/docs/89454fe4-a6b8-4e6a-8b47-a59f23128e07) automation.
3. Add the [Guest Account Removal Monitor](/docs/4b2a084a-e67b-4c61-801c-d5103e08b619) compound condition to the `Windows Workstation Policy [Default]` and `Windows Server Policy [Default]` agent policies.
4. Set **cPVAL Disable Guest Account** to `Enable`:
    - At the system level, to turn it on for every client.
    - At the organization level, to turn it on for one client.

You'll know it worked when the automation's activity details show `Disabled Guest account`.

## FAQ

**Q: Can I leave out a single client or device?**  
**A:** Yes. Set **cPVAL Disable Guest Account** to `Disable` on that organization or device.

**Q: Why are domain controllers skipped?**  
**A:** A domain controller's Guest account applies to the whole domain. Manage it with Group Policy instead.

**Q: Why did the Guest account turn back on?**  
**A:** A Group Policy or Intune policy may be enabling it. Set **Accounts: Guest account status** to **Disabled** in that policy.

## Changelog

### 2026-10-12

- **cPVAL Disable Guest Account** can now be set at the system level to turn the solution on for every client.
- The solution now covers Windows servers as well as workstations.
- The compound condition now checks devices daily and runs the automation only when the Guest account is enabled.

### 2026-10-08

- Initial version of the document.
