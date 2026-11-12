---
id: '13b4df99-df9b-4a57-bc0f-8675c68be028'
slug: /13b4df99-df9b-4a57-bc0f-8675c68be028
title: 'Lock Stolen System'
title_meta: 'Lock Stolen System'
keywords: ['lock', 'stolen', 'lost', 'device', 'tracking', 'lockdown', 'bitlocker', 'filevault', 'windows', 'mac']
description: 'Track lost or stolen Windows computers and Macs in NinjaOne, and lock them down remotely so nobody can use them.'
tags: ['solution', 'security', 'data-theft', 'incident-response', 'bitlocker', 'windows', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-11-12
---

## Purpose

Lock Stolen System helps you respond when a Windows computer or Mac managed in NinjaOne is lost or stolen. Once you mark the device as stolen, the solution records where it connects from every time it comes online: its public IP address, internet provider, approximate location, network settings and the devices around it on the local network.

When you also turn on System Lockdown, the solution locks the device so nobody can use it, then shuts it down. On Windows, it locks the system drive with a BitLocker password that only you know. On a Mac, it changes the password of every user account to that same password and disables the accounts, keeping one IT admin account available for recovery. If the device is recovered, or was locked by mistake, the optional unlock automations put it back to normal.

**Platform:** `NinjaOne`

### Key Capabilities

- **Location tracking** – Each time a stolen device is online, the solution records its public IP address, internet provider, approximate city, region and coordinates, network settings and up to 30 nearby network devices. Without lockdown, the device stays online and the details refresh every 30 minutes.
- **Windows lockdown** – Locks the system drive with your lockdown password, so Windows asks for it at every startup, and shows your message on the BitLocker recovery screen. If BitLocker is off, the lockdown turns it on.
- **Mac lockdown** – Sets your lockdown password on every local user account except the IT admin account, disables those accounts, signs out the current user and shows your message on the login window and the FileVault screen.
- **Automatic response** – Compound conditions run the right automation for Windows computers and Macs once a stolen device has been online for 10 minutes, and open a ConnectWise Manage ticket so your team knows the device is back online. Later runs are added to the same ticket until your team closes it.
- **Unlock on demand** – Separate unlock automations reverse the lockdown on a recovered device or on one that was locked by mistake.

### Important Caveats & Behavior

- **The device must come online** – Nothing happens until the stolen device connects to the internet with the NinjaOne agent running. A device that stays offline can't be tracked or locked.
- **Lockdown ends tracking** – A locked device shuts down one minute after the lockdown and stays offline until someone gets past its startup password. To keep following a device, start with tracking only and turn on lockdown later.
- **Keep the lockdown password safe** – On Windows, it's the only way to start a locked computer. The lockdown also removes the BitLocker recovery password saved before the computer was stolen, so that recovery password no longer works.
- **Mac data protection depends on FileVault** – The solution reports whether FileVault is on but doesn't turn it on. Without FileVault, someone with physical access to the Mac can still read its disk.
- **Mac lockdown needs an IT admin account** – Each Mac needs a local admin account with a Secure Token. You enter the account and its password on the Mac when you lock it. This account is never locked, so use a dedicated IT account rather than the end user's own account.
- **Location is approximate** – Location based on an IP address usually points to the internet provider's city or region, not the device's exact address. Recent macOS versions may also hide the Wi-Fi network name.
- **Unlocking changes passwords** – After an unlock, a Windows computer has a new BitLocker recovery password to back up, and Mac users sign in with the lockdown password and then choose a new one.

## How It Works

1. A technician checks [cPVAL Mark System as Stolen](/docs/20a99ff3-a63d-4f73-bd48-3bb8d66626e6) on the device. To lock the device as well, they set the lockdown password, and on a Mac the IT admin account and its password, then check [cPVAL System Lockdown](/docs/4b18c9bf-8aea-41a5-8242-77dfcfd0042a).
2. Once the device has been online for 10 minutes, the [Lock Stolen Systems [Windows]](/docs/705b400b-28fc-4c01-95a6-edbf43960122) or [Lock Stolen Systems [Macintosh]](/docs/e2669c99-0a79-4456-9923-b63345bf9a3c) compound condition runs the matching Lock Stolen System automation and opens a ConnectWise Manage ticket. Each later run is added to the same ticket while it's open.
3. With tracking only, the automation saves the device's location, IP and network details to its custom fields. The device stays online, and the compound condition runs the automation again every 30 minutes.
4. With lockdown, the automation locks the device first, then saves the same details, sets [cPVAL Lock Status](/docs/e734bed4-a878-4574-b456-1e1ed59ee6bc) to `Locked` and shuts the device down one minute later.
5. When the device is recovered, the technician unchecks [cPVAL Mark System as Stolen](/docs/20a99ff3-a63d-4f73-bd48-3bb8d66626e6), starts the device, runs the unlock automation for its platform if the device was locked, and closes the ConnectWise Manage ticket.

## Response Options

| | Track only | Track and lock down |
|---|---|---|
| **Fields to check** | cPVAL Mark System as Stolen | cPVAL Mark System as Stolen and cPVAL System Lockdown |
| **What it records** | Location, IP and network details | The same details, collected right after the lockdown |
| **Device afterwards** | Stays online and usable | Locked and shut down |
| **Updates** | Every 30 minutes while the device is online | Once, and again only if someone starts the device |
| **Best for** | A device that might be misplaced, or one you want to locate first | A device that's confirmed stolen or holds sensitive data |

**How to choose:**

- Pick **Track only** if the device might just be misplaced, or you want location details over time before acting.
- Pick **Track and lock down** if the device is confirmed stolen, or protecting its data matters more than tracking it further.

You can start with tracking only and check cPVAL System Lockdown at any time. The device is locked the next time the automation runs.

## Prerequisites

- Windows computers running Windows 10 or Windows 11 Pro, Enterprise or Education, which include BitLocker.
- For Mac lockdown, a local admin account with a Secure Token on every Mac. FileVault should be on.
- Internet access from the devices to `ipinfo.io`, which provides the public IP address and location.
- ConnectWise Manage connected to NinjaOne, if you want a ticket when a stolen device comes online.

## Associated Content

### Custom Fields

These fields appear on the **Lock Stolen System [Windows]** tab of Windows devices and the **Lock Stolen System [Macintosh]** tab of Macs. The two Mac admin fields are on Macs only.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [cPVAL Mark System as Stolen](/docs/20a99ff3-a63d-4f73-bd48-3bb8d66626e6) | Device | Checkbox | Marks the device as stolen and starts tracking. |
| [cPVAL System Lockdown](/docs/4b18c9bf-8aea-41a5-8242-77dfcfd0042a) | Device | Checkbox | Locks and shuts down the stolen device. |
| [cPVAL Stolen System BitLocker Password](/docs/92779b41-3331-480c-a72d-402c0f328af3) | Device | Secure | The lockdown password: the BitLocker password on Windows, and the new password of the locked user accounts on a Mac. |
| [cPVAL Stolen System BitLocker Message](/docs/04443686-5a42-41d4-b936-b62145597107) | Device | Text | The message shown on the locked device. |
| [cPVAL Stolen System Mac Admin User](/docs/35966a9e-1a07-45c8-99e0-e51961543784) | Device | Text | The Mac IT admin account that performs the lockdown and is never locked. |
| [cPVAL Stolen System Mac Admin Password](/docs/d527c77e-88b5-48f0-8ae8-364e909da96f) | Device | Secure | The password of the Mac IT admin account. |
| [cPVAL Current Location and IP Details](/docs/85cb62ba-6e5f-4235-9964-975af04658d0) | Device | Multi-line | The device's public IP address, internet provider, approximate location and network settings. |
| [cPVAL Network Neighbours](/docs/150e0b6d-db7e-4b7b-8879-bd36b1e11771) | Device | WYSIWYG | Up to 30 devices found on the stolen device's local network. |
| [cPVAL Lock Status](/docs/e734bed4-a878-4574-b456-1e1ed59ee6bc) | Device | Text | Whether the device is `Locked`, `Partially Locked` or `Unlocked`. |

### Automations

| Name | Purpose |
|---|---|
| [Lock Stolen System [Windows]](/docs/0f78be64-557a-4c0e-b7cf-e2ba41e71374) | Tracks a stolen Windows computer and, with lockdown, locks its system drive with the BitLocker password and shuts it down. Run by its compound condition. |
| [Lock Stolen System [Macintosh]](/docs/08b38e83-0836-49de-b185-dbfc97a0f249) | Tracks a stolen Mac and, with lockdown, locks every user account except the IT admin account and shuts it down. Run by its compound condition. |

### Automations (optional, run on demand)

| Name | Purpose |
|---|---|
| [Unlock Stolen System [Windows]](/docs/0ced6b64-58a6-4a7f-bfea-a40724f6b554) | Reverses the lockdown on a recovered Windows computer, or one locked by mistake, so it starts without the lockdown password again. |
| [Unlock Stolen System [Macintosh]](/docs/ef4a9833-6094-4e6e-ad99-12ae267db316) | Reverses the lockdown on a recovered Mac, or one locked by mistake, so its users can sign in again. |

### Ticket Template

| Name | Purpose |
|---|---|
| [Lock Stolen System](/docs/be59a0a6-33da-4ef2-8baf-848d47ba2ac0) | Opens a ConnectWise Manage ticket when a stolen device comes online and adds each later run to the same ticket. |

### Monitors

| Name | Type | Purpose |
|---|---|---|
| [Lock Stolen Systems [Windows]](/docs/705b400b-28fc-4c01-95a6-edbf43960122) | Compound Condition | Runs Lock Stolen System [Windows] on Windows computers marked as stolen, once they've been online for 10 minutes and every 30 minutes after that, and opens a ticket. |
| [Lock Stolen Systems [Macintosh]](/docs/e2669c99-0a79-4456-9923-b63345bf9a3c) | Compound Condition | Runs Lock Stolen System [Macintosh] on Macs marked as stolen, once they've been online for 10 minutes and every 30 minutes after that, and opens a ticket. |

## Implementation

### Step 1: Create the custom fields

Create the custom fields. Add them to the **Lock Stolen System [Windows]** tab of the **Windows Desktops and Laptops** role and to the **Lock Stolen System [Macintosh]** tab of the **Mac Desktops and Laptops** role. The two Mac admin fields go on the Mac role only.

- [Custom Field: cPVAL Mark System as Stolen](/docs/20a99ff3-a63d-4f73-bd48-3bb8d66626e6)
- [Custom Field: cPVAL System Lockdown](/docs/4b18c9bf-8aea-41a5-8242-77dfcfd0042a)
- [Custom Field: cPVAL Stolen System BitLocker Password](/docs/92779b41-3331-480c-a72d-402c0f328af3)
- [Custom Field: cPVAL Stolen System BitLocker Message](/docs/04443686-5a42-41d4-b936-b62145597107)
- [Custom Field: cPVAL Stolen System Mac Admin User](/docs/35966a9e-1a07-45c8-99e0-e51961543784)
- [Custom Field: cPVAL Stolen System Mac Admin Password](/docs/d527c77e-88b5-48f0-8ae8-364e909da96f)
- [Custom Field: cPVAL Current Location and IP Details](/docs/85cb62ba-6e5f-4235-9964-975af04658d0)
- [Custom Field: cPVAL Network Neighbours](/docs/150e0b6d-db7e-4b7b-8879-bd36b1e11771)
- [Custom Field: cPVAL Lock Status](/docs/e734bed4-a878-4574-b456-1e1ed59ee6bc)

### Step 2: Create the automations

Add the two Lock Stolen System automations to the NinjaOne automation library. Add the two Unlock Stolen System automations as well, so they're ready when you need them, but don't schedule them or add them to a condition. They're optional and run on demand only.

- [Automation: Lock Stolen System [Windows]](/docs/0f78be64-557a-4c0e-b7cf-e2ba41e71374)
- [Automation: Lock Stolen System [Macintosh]](/docs/08b38e83-0836-49de-b185-dbfc97a0f249)
- [Automation: Unlock Stolen System [Windows]](/docs/0ced6b64-58a6-4a7f-bfea-a40724f6b554) (optional)
- [Automation: Unlock Stolen System [Macintosh]](/docs/ef4a9833-6094-4e6e-ad99-12ae267db316) (optional)

### Step 3: Create the ticket template

If you use ConnectWise Manage, create the ticket template so a ticket opens when a stolen device comes online. The ticket stays open until your team closes it. Set the board, type and other ticket settings to match your ConnectWise Manage setup.

- [Ticket Template: Lock Stolen System](/docs/be59a0a6-33da-4ef2-8baf-848d47ba2ac0)

### Step 4: Create the compound conditions

Add the Windows compound condition to the agent policy your Windows workstations use, such as **Windows Workstation Policy**, and the Mac compound condition to the policy your Macs use, such as **Mac Policy**.

- [Compound Condition: Lock Stolen Systems [Windows]](/docs/705b400b-28fc-4c01-95a6-edbf43960122)
- [Compound Condition: Lock Stolen Systems [Macintosh]](/docs/e2669c99-0a79-4456-9923-b63345bf9a3c)

You'll know it worked when Windows devices show the **Lock Stolen System [Windows]** tab and Macs show the **Lock Stolen System [Macintosh]** tab. To test, check cPVAL Mark System as Stolen on a spare device without lockdown. Once the device has been online for 10 minutes, cPVAL Current Location and IP Details and cPVAL Network Neighbours fill in and a ticket opens. Uncheck the field and close the ticket when you're done. Test lockdown only on a spare device you can recover.

## FAQ

### Q: How do I report a device as lost or stolen?

> Open the device in NinjaOne, go to the **Lock Stolen System [Windows]** or **Lock Stolen System [Macintosh]** tab and check **cPVAL Mark System as Stolen**. That alone starts tracking. To lock the device as well, first set **cPVAL Stolen System BitLocker Password** and, if you want, **cPVAL Stolen System BitLocker Message**. On a Mac, also set **cPVAL Stolen System Mac Admin User** and **cPVAL Stolen System Mac Admin Password**. Then check **cPVAL System Lockdown**. The solution acts once the device has been online for 10 minutes.

### Q: Should I lock the device right away?

> Lock it right away if it's confirmed stolen or holds sensitive data. A locked device shuts down and stops reporting its location, so if it might just be misplaced, track it first. You can check cPVAL System Lockdown later, and the device is locked the next time the automation runs.

### Q: Where do I see where the device is?

> On the device's **Lock Stolen System [Windows]** or **Lock Stolen System [Macintosh]** tab. **cPVAL Current Location and IP Details** shows the public IP address, internet provider, approximate location and network settings, and **cPVAL Network Neighbours** lists the devices seen on the same network. Both show when the details were collected, in UTC. The ConnectWise Manage ticket shows each time the device came online.

### Q: How accurate is the location?

> It's based on the device's public IP address, so it usually points to the internet provider's city or region rather than a street address. The public IP address, the internet provider and the collection time are the details law enforcement can use to ask the provider who was connected.

### Q: What does someone holding a locked device see?

> A Windows computer asks for the BitLocker password at startup, and your message appears on the BitLocker recovery screen. A Mac shows your message on the FileVault screen and the login window, and its users' old passwords no longer work. Without a message, the device shows `Your device has been locked due to suspicious activity.`

### Q: Does the lockdown erase anything?

> No. The solution doesn't delete files or wipe the device. It blocks access by changing the startup and sign-in passwords. On Windows, BitLocker keeps the drive encrypted. On a Mac, data on the disk is protected only if FileVault is on.

### Q: The device is marked as stolen, but nothing has happened. Why?

> The device must be online with the NinjaOne agent running for at least 10 minutes before the compound condition runs. Check these:
>
> 1. The device shows as online in NinjaOne.
> 2. Its agent policy includes **Lock Stolen Systems [Windows]** or **Lock Stolen Systems [Macintosh]**.
> 3. **cPVAL Mark System as Stolen** is checked on the device itself.
> 4. The automation's activity details on the device don't show an error.

### Q: The lockdown failed. What should I check?

> The automation's activity details name the step that failed. The most common causes are:
>
> - **cPVAL Stolen System BitLocker Password** is empty. Nothing is locked; set the password and the next run locks the device.
> - On a Mac, **cPVAL Stolen System Mac Admin User** or **cPVAL Stolen System Mac Admin Password** is missing or wrong, or the account has no Secure Token. Nothing is locked until it's fixed.
> - On a Mac, **cPVAL Lock Status** shows `Partially Locked` when one or more user accounts couldn't be locked, for example because the lockdown password doesn't meet the Mac's password rules. The Mac still shuts down.
>
> When nothing could be locked, the device stays online and keeps reporting its location, so you can fix the setting and let the next run lock it.

### Q: How do I check that the Mac admin account has a Secure Token?

> Run `sysadminctl -secureTokenStatus <account name>` in Terminal on the Mac, or from a NinjaOne remote terminal. The result should say the Secure Token is `ENABLED`. The first admin account created on a Mac usually has one.

### Q: The device has been recovered. How do I return it to normal?

> First uncheck **cPVAL Mark System as Stolen** and **cPVAL System Lockdown**. Otherwise the device is locked again the next time it's online. If the device was locked, also unlock it:
>
> - **Windows:** start the computer and enter the lockdown password at the BitLocker screen. Once it's online in NinjaOne, run **Unlock Stolen System [Windows]**. The computer then starts without a password again. Back up the new BitLocker recovery password it creates, the same way you back up other recovery passwords.
> - **Mac:** start the Mac and unlock the FileVault screen with the IT admin account. Once it's online in NinjaOne, run **Unlock Stolen System [Macintosh]**. Users then sign in with the lockdown password and should change it right away.
>
> Then close the ConnectWise Manage ticket. The solution doesn't close it for you.

### Q: A device was locked by mistake. Can I undo it?

> Yes. Follow the same steps as for a recovered device. This is what the unlock automations are for.

### Q: Do the unlock automations need to run on a schedule?

> No. They're optional and run on demand only, on a recovered device or one locked by mistake. Don't add them to a schedule or a condition. They also refuse to run while the device is still marked as stolen, so they can't undo the lockdown of a device that's still missing.

### Q: Will Mac users lose their saved passwords after the unlock?

> No, as long as they remember their previous password. At the first sign-in after the unlock, macOS asks to update the login keychain, and entering the previous password keeps everything. If they can't remember it, macOS can create a new keychain, and the passwords saved in the old one are no longer available.

### Q: Does a Windows computer stay encrypted after the unlock?

> Yes. BitLocker stays on. The unlock only changes how the drive opens at startup: the computer's TPM unlocks it again instead of the lockdown password.

### Q: Can I use the same lockdown password on every device?

> You can, but a different password on each device is safer. Users of a recovered Mac sign in with the lockdown password, and a password that's known on one device shouldn't open another.

## Changelog

### 2026-11-12

- Added Mac support with the Lock Stolen System [Macintosh] automation, the Lock Stolen Systems [Macintosh] compound condition, and the cPVAL Stolen System Mac Admin User and cPVAL Stolen System Mac Admin Password custom fields.
- Added the optional Unlock Stolen System [Windows] and Unlock Stolen System [Macintosh] automations.
- Renamed the Windows automation and compound condition to Lock Stolen System [Windows] and Lock Stolen Systems [Windows].
- Devices without System Lockdown now stay online so tracking continues. Only locked devices shut down.
- The custom fields are now on the Lock Stolen System [Windows] tab of Windows devices and the Lock Stolen System [Macintosh] tab of Macs.
- Rewrote the document in the current solution format and added an FAQ.

### 2026-03-03

- Introduced "cpval Network Neighbours", "cPVAL Lock Status", "cpval Stolen System Bitlocker Message" and "cpval Stolen System Bitlocker Password" custom fields. Updated "cPVAL Current Location and IP Details" to display Ipconfig result along with Ip address and location. Updated Compound condition to use trigger time to make sure it runs only on Online machines.

### 2026-02-11

- Initial version of the document
