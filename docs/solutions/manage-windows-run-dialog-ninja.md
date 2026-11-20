---
id: '8668290e-01bb-4501-be78-f2c2b626f3b7'
slug: /8668290e-01bb-4501-be78-f2c2b626f3b7
title: 'Manage Windows Run Dialog'
title_meta: 'Manage Windows Run Dialog'
keywords: ['run-dialog', 'win+r', 'norun', 'run-command', 'start-menu', 'user-profiles', 'lockdown', 'ninjaone']
description: 'Enable or disable the Windows Run dialog (Win+R) for every user on Windows workstations and servers in NinjaOne from one custom field, with per-user exclusions.'
tags: ['solution', 'security', 'registry', 'configuration', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-20
---

## Purpose

Manage Windows Run Dialog controls whether users can open the Windows Run dialog (Windows key + R) on Windows workstations and servers managed in NinjaOne. Blocking the Run dialog takes away a quick way for users to launch tools and commands, which is useful on kiosks, shared computers and locked-down desktops.

You choose `Enable` or `Disable` once in a custom field, and two compound conditions apply it to every user on every matching device. The [Manage Windows Run Dialog](/docs/b88497c1-454b-42e7-ba9f-32e61dd4b858) automation does the work. A second custom field lists users, such as IT accounts, whose profiles are left unchanged.

**Platform:** `NinjaOne`

### Key Capabilities

- **One setting for the whole client** – Set [cPVAL Windows_Run_Dialog Action](/docs/689ce4ff-e5ed-4f07-b9a8-3e1dd3738795) on the organization, and every Windows workstation and server gets it. Override it for a location or a single device when needed.
- **Every user, signed in or not** – The automation updates every user profile on the device, not just the user who is signed in.
- **New users included** – The Default User profile is updated too, so users who sign in for the first time get the same setting.
- **Exclusions** – List users in [cPVAL Windows_Run_Dialog Exclude Users](/docs/6f5d07d7-7f29-45b8-ab1c-eab34a1dbe86), such as IT or administrator accounts, to leave their profiles unchanged.
- **Kept in place** – While the field is set, the compound conditions apply the setting again every 24 hours, so a profile that was changed by hand is put back.
- **No Group Policy needed** – Works for local, domain and Microsoft Entra ID accounts, on domain-joined and standalone devices alike.

### Important Caveats & Behavior

- **Users must sign in again** – The change takes effect at the next sign-in. Users who are signed in when the automation runs keep their current setting until they sign out and back in, or the device restarts.
- **Administrators are included** – Every user profile on the device is changed, including administrator accounts. Add the accounts that need the Run dialog to cPVAL Windows_Run_Dialog Exclude Users before you choose `Disable`.
- **Excluded users signing in for the first time** – New profiles are copied from the Default User profile, which is always updated and can't be excluded. An excluded user who signs in to a device for the first time after `Disable` starts with the Run dialog blocked, and the automation leaves that profile alone. Have excluded users sign in to the device once before you disable the Run dialog.
- **`Not Set` doesn't turn it back on** – `Not Set`, or an empty field, only stops the compound conditions from running. Devices keep their current setting. To give users the Run dialog back, choose `Enable`.
- **Group Policy can override it** – If a domain Group Policy configures **Remove Run menu from Start Menu**, it can overwrite this solution's setting. If the Run dialog is also blocked for the whole computer, `Enable` can't undo that, and the automation reports a warning.
- **Not a full lockdown** – Blocking the Run dialog doesn't stop users from starting programs in other ways, such as from the Start menu or File Explorer.

## How It Works

1. A technician sets cPVAL Windows_Run_Dialog Action to `Enable` or `Disable` for the client's organization, and lists any users to leave out in cPVAL Windows_Run_Dialog Exclude Users.
2. Once a Windows device has been online for 10 minutes, the compound condition for its type, [Manage Windows Run Dialog - Workstations](/docs/0e2876ac-75e1-498b-a163-2a5d26fe2c1c) or [Manage Windows Run Dialog - Servers](/docs/b181197e-2971-4df6-b485-e5d8818978d8), checks the field.
3. If the field is `Enable` or `Disable`, the condition runs [Manage Windows Run Dialog](/docs/b88497c1-454b-42e7-ba9f-32e61dd4b858) as `System`.
4. The automation updates every user profile on the device and the Default User profile, skipping excluded users. It lists each profile and its result in the activity details.
5. Each user gets the change the next time they sign in.
6. While the field stays set, the condition runs the automation again every 24 hours. The conditions send no notifications and create no tickets.

## Associated Content

### Custom Fields

These fields appear on the **Manage Windows Run dialog (Win+R)** tab. Set them at the organization level. A location or device value overrides the organization value.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [cPVAL Windows_Run_Dialog Action](/docs/689ce4ff-e5ed-4f07-b9a8-3e1dd3738795) | Organization, Location, Device | Drop-down | Chooses what happens to the Run dialog: `Disable`, `Enable` or `Not Set` (not managed). |
| [cPVAL Windows_Run_Dialog Exclude Users](/docs/6f5d07d7-7f29-45b8-ab1c-eab34a1dbe86) | Organization, Location, Device | Text | Users whose profiles are left unchanged, separated by commas. |

### Automation

| Name | Purpose |
|---|---|
| [Manage Windows Run Dialog](/docs/b88497c1-454b-42e7-ba9f-32e61dd4b858) | Enables or disables the Run dialog for every user profile on the device and for new users, skipping excluded users. Run by the compound conditions, or on demand. |

### Compound Conditions

| Name | Type | Purpose |
|---|---|---|
| [Manage Windows Run Dialog - Workstations](/docs/0e2876ac-75e1-498b-a163-2a5d26fe2c1c) | Compound Condition | Runs Manage Windows Run Dialog on Windows workstations when the action field is `Enable` or `Disable`. Triggers after 10 minutes online and runs again every 24 hours while the field is set. |
| [Manage Windows Run Dialog - Servers](/docs/b181197e-2971-4df6-b485-e5d8818978d8) | Compound Condition | Runs Manage Windows Run Dialog on Windows servers when the action field is `Enable` or `Disable`. Triggers after 10 minutes online and runs again every 24 hours while the field is set. |

## Implementation

### Step 1: Create the custom fields

Create both custom fields with the `Organization`, `Location` and `Device` scopes, and put them on a custom field tab named **Manage Windows Run dialog (Win+R)**.

- [Custom Field: cPVAL Windows_Run_Dialog Action](/docs/689ce4ff-e5ed-4f07-b9a8-3e1dd3738795)
- [Custom Field: cPVAL Windows_Run_Dialog Exclude Users](/docs/6f5d07d7-7f29-45b8-ab1c-eab34a1dbe86)

### Step 2: Create the automation

Add the automation to the NinjaOne automation library and set it to run as `System`. Give it two script variables: **Action**, a drop-down with `Enable` and `Disable`, and **Exclude Users**, a text field.

- [Automation: Manage Windows Run Dialog](/docs/b88497c1-454b-42e7-ba9f-32e61dd4b858)

### Step 3: Create the compound conditions

Add the workstation condition to the **Windows Workstation Policy** and the server condition to the **Windows Server Policy**. Leave the automation's **Action** and **Exclude Users** parameters empty in both conditions, so it reads the custom fields. If the client's Windows devices use other policies, add the matching condition to those policies too.

- [Compound Condition: Manage Windows Run Dialog - Workstations](/docs/0e2876ac-75e1-498b-a163-2a5d26fe2c1c)
- [Compound Condition: Manage Windows Run Dialog - Servers](/docs/b181197e-2971-4df6-b485-e5d8818978d8)

### Step 4: List the users to exclude (optional)

On the client's organization, enter the users who must keep the Run dialog, such as IT or administrator accounts. Excluded users who have never signed in to a device start with the Run dialog blocked there. See [Important Caveats & Behavior](#important-caveats--behavior).

- [Custom Field: cPVAL Windows_Run_Dialog Exclude Users](/docs/6f5d07d7-7f29-45b8-ab1c-eab34a1dbe86)

### Step 6: Choose the action

On the client's organization, set the action. To leave a location or a single device unmanaged, set the field to `Not Set` there.

| Option | Result |
|---|---|
| `Disable` | Blocks the Run dialog for every user except excluded users |
| `Enable` | Makes the Run dialog available for every user except excluded users |
| `Not Set` | Not managed. Devices keep their current setting. |

- [Custom Field: cPVAL Windows_Run_Dialog Action](/docs/689ce4ff-e5ed-4f07-b9a8-3e1dd3738795)

You'll know it worked when the activity details of Manage Windows Run Dialog on a device show an `[OK]` line for each profile, and users get the new setting after they sign out and back in.

## FAQ

### Q: I set the field, but a user can still open the Run dialog. What should I check?

> 1. The user has signed out and back in, or the device has restarted, since the automation ran.
> 2. The device has been online for at least 10 minutes, and its agent policy includes the right compound condition: **Manage Windows Run Dialog - Workstations** for workstations, **Manage Windows Run Dialog - Servers** for servers.
> 3. **cPVAL Windows_Run_Dialog Action** is `Disable` for the device. A `Not Set` or `Enable` on the location or the device overrides the organization value.
> 4. The user isn't listed in **cPVAL Windows_Run_Dialog Exclude Users**.
> 5. The activity details of Manage Windows Run Dialog on the device show an `[OK]` line for the user's profile.
> 6. No domain Group Policy configures **Remove Run menu from Start Menu** for the user.

### Q: How do I turn the Run dialog back on?

> Set **cPVAL Windows_Run_Dialog Action** to `Enable`, then have users sign out and back in. Choosing `Not Set` or clearing the field doesn't turn it back on. It only stops the solution from managing the device.
>
> If the activity details show `NoRun is also set machine-wide (HKLM)`, the Run dialog is also blocked for the whole computer, usually by Group Policy. The solution doesn't remove that setting. Remove it where it was set.

### Q: An excluded user has the Run dialog blocked. Why?

> Most likely, the user signed in to the device for the first time after the Run dialog was disabled. New profiles are copied from the Default User profile, which the automation always updates, and the automation then leaves the excluded profile alone. The automation can't turn the Run dialog back on for one user only. To avoid this, have excluded users sign in to a device before you choose `Disable`.
>
> Also check that the entry matches the user. If the profile folder name differs from the user name, for example `C:\Users\jdoe.CONTOSO`, add the folder name to the field too.

### Q: Does it affect users who haven't signed in to the device yet?

> Yes. The automation also updates the Default User profile, which new profiles are copied from, so new users get the same setting when they first sign in.

### Q: The automation failed. What should I check?

> The `[Error]` lines in the activity details show the reason. The most common ones are:
>
> - **`Action must be 'Enable' or 'Disable'`** – the **Action** parameter was empty, and **cPVAL Windows_Run_Dialog Action** is `Not Set` or empty for the device. No changes were made.
> - **`Profile hive not found`** – Windows lists a user profile whose files are no longer on the device, usually left over from a profile that was deleted by hand. The other profiles were still updated. Remove the leftover profile from the device to clear the error.
> - **`Could not load the profile hive`** – another program had the user's profile files open. The other profiles were still updated, and the compound condition tries again 24 hours later.
> - **`This script must run as SYSTEM or as an administrator`** – set the automation to run as `System`.

## Changelog

### 2026-11-20

- Initial version of the document
