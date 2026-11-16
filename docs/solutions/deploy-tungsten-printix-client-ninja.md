---
id: '9424b17b-b55f-417d-9d2d-a953bed8575e'
slug: /9424b17b-b55f-417d-9d2d-a953bed8575e
title: 'Deploy Tungsten Printix Client - NinjaOne'
title_meta: 'Deploy Tungsten Printix Client - NinjaOne'
keywords: ['printix', 'tungsten', 'printix-client', 'print', 'deployment', 'install', 'update', 'uninstall', 'ninjaone']
description: 'Deploy the Tungsten Printix Client to Windows workstations and servers in NinjaOne, registered to each client''s Printix tenant, and update or remove it on demand.'
tags: ['solution', 'deployment', 'installation', 'update', 'uninstallation', 'print', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-16
---

## Purpose

Deploy Tungsten Printix Client installs the Tungsten Printix Client on Windows workstations and servers managed in NinjaOne and registers it to the client's Printix tenant, so nobody has to install or configure the client by hand. You enter the client's Printix tenant once, choose which devices get the client, and two compound conditions install it on every matching device that doesn't have it.

The [Install/Update Tungsten Printix Client](/docs/0c5963fc-ac9d-44ff-8fad-8ae2fd267547) automation does the work. It downloads the tenant's installer from Printix on every run, so it always installs the latest version, and it replaces a copy that is outdated or registered to another tenant. The optional [Uninstall Tungsten Printix Client](/docs/0e415b7e-4132-45ff-a495-5320a42bf0c3) automation removes the client on demand.

**Platform:** `NinjaOne`

### Key Capabilities

- **Automatic deployment** – Choose `Windows`, `Windows Workstations` or `Windows Servers` in [cPVAL Tungsten Printix Client Deployment](/docs/d53a9981-9c39-4392-bf02-9d069b529f2f), and the compound conditions install the client on every matching device that doesn't have it. They try again every 24 hours until the client is installed.
- **Registered to the right tenant** – The installer comes from the client's own Printix tenant, so the client is registered to that tenant during the install, with no sign-in or setup on the device. The automation then checks that the device is registered to the tenant.
- **Always the latest version** – Each run downloads the current installer from Printix. A device with an older client, or with a client registered to another tenant or to no tenant, gets the client reinstalled. A device that is already up to date and registered to the tenant is left alone.
- **Genuine installer only** – The automation installs only an installer signed by Tungsten Automation. It stops without making changes if the download is damaged or isn't the Printix installer.
- **Settings per organization** – Set the tenant and the deployment option once for the organization. Override them for a location or a single device when needed.
- **Removal on demand** – Uninstall Tungsten Printix Client silently removes every installed copy of the client and confirms the removal finished.

### Important Caveats & Behavior

- **Set the tenant before you turn on deployment** – [cPVAL Tungsten PrintixClientID](/docs/ac1c2105-bc81-4dca-9786-1991d00e5155) and [cPVAL Tungsten PrintixClientDomain](/docs/4e5a88c2-1f5a-41fd-bd22-fd3d7ea2fb9b) must both be set. If either one is empty or invalid, the automation fails on every device it runs on, without making changes.
- **The compound conditions install, they don't update** – They run only on devices where `Tungsten Printix Client` is missing from the software inventory. To update devices that already have the client, or to move them to another tenant, run Install/Update Tungsten Printix Client on those devices yourself.
- **A wrong tenant means a reinstall** – When Install/Update Tungsten Printix Client finds a client registered to a different tenant, it uninstalls that client and installs one for the tenant in the custom fields. Check the tenant fields before you run it on devices that already use Printix.
- **`Disable` doesn't uninstall** – Choosing `Disable`, or clearing the field, only stops new deployments. To remove the client, run Uninstall Tungsten Printix Client. If deployment is still turned on for the device, the compound condition installs the client again within 24 hours.
- **Agent policies** – The compound conditions go in the **Windows Workstation Policy** and the **Windows Server Policy**. Devices that use other policies get the client only after you add the conditions to their policies.
- **64-bit Windows only** – The automations install and remove the 64-bit client and run as `System` in 64-bit PowerShell. In 32-bit PowerShell they can't see the installed client, so the install reinstalls it on every run.

## How It Works

1. A technician sets the tenant ID and tenant name for the client's organization, then chooses an option in cPVAL Tungsten Printix Client Deployment.
2. Once a Windows device has been online for 10 minutes, the compound condition for its type, [Deploy Tungsten Printix Client - Workstations](/docs/96795ceb-d3c7-4d36-b424-d2979140e036) or [Deploy Tungsten Printix Client - Servers](/docs/aad200d0-6423-4b95-80c8-0e8cbae219fa), checks the deployment option and whether `Tungsten Printix Client` is in the device's software inventory.
3. If the option covers the device and the client is missing, the condition runs Install/Update Tungsten Printix Client as `System`.
4. The automation downloads the tenant's installer from Printix, checks that Tungsten Automation signed it and compares it with the copy on the device:
   - **Not installed:** installs the client.
   - **Up to date and registered to the tenant:** makes no changes.
   - **Older, registered to another tenant or to no tenant:** uninstalls the client silently and installs the downloaded version.
5. After the install, the automation checks that the client is registered to the tenant and is at the downloaded version.
6. While the client is still missing, the condition runs the automation again every 24 hours. It resets as soon as the client shows up in the software inventory. The conditions send no notifications and create no tickets.

## Prerequisites

- A Printix tenant for the client, with its tenant ID and tenant name. See [Where do I find the tenant ID and tenant name?](#q-where-do-i-find-the-tenant-id-and-tenant-name)
- 64-bit Windows workstations or servers.
- Internet access from the devices to `api.printix.net`, where the installer is downloaded from.

## Associated Content

### Custom Fields

These fields appear on the **Tungsten Printix Client** tab. Set them at the organization level. A location or device value overrides the organization value.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [cPVAL Tungsten PrintixClientID](/docs/ac1c2105-bc81-4dca-9786-1991d00e5155) | Organization, Location, Device | Text | The Printix tenant ID, a GUID. Used to download the tenant's installer and to check that the client is registered to the tenant. |
| [cPVAL Tungsten PrintixClientDomain](/docs/4e5a88c2-1f5a-41fd-bd22-fd3d7ea2fb9b) | Organization, Location, Device | Text | The Printix tenant name, the part of the sign-in address before `.printix.net`. |
| [cPVAL Tungsten Printix Client Deployment](/docs/d53a9981-9c39-4392-bf02-9d069b529f2f) | Organization, Location, Device | Drop-down | Chooses the Windows devices that get the client automatically: `Disable`, `Windows`, `Windows Workstations` or `Windows Servers`. |

### Automation

| Name | Purpose |
|---|---|
| [Install/Update Tungsten Printix Client](/docs/0c5963fc-ac9d-44ff-8fad-8ae2fd267547) | Installs the latest client and registers it to the tenant, replacing an outdated or wrongly registered copy. Run by the compound conditions, or on demand to update devices that already have the client. |

### Automation (optional, run on demand)

| Name | Purpose |
|---|---|
| [Uninstall Tungsten Printix Client](/docs/0e415b7e-4132-45ff-a495-5320a42bf0c3) | Silently removes every installed copy of the client and confirms the removal finished. Makes no changes if the client isn't installed. |

### Compound Conditions

| Name | Type | Purpose |
|---|---|---|
| [Deploy Tungsten Printix Client - Workstations](/docs/96795ceb-d3c7-4d36-b424-d2979140e036) | Compound Condition | Runs Install/Update Tungsten Printix Client on Windows workstations without the client when the deployment field is `Windows` or `Windows Workstations`. Triggers after 10 minutes online and runs again every 24 hours while the client is missing. |
| [Deploy Tungsten Printix Client - Servers](/docs/aad200d0-6423-4b95-80c8-0e8cbae219fa) | Compound Condition | Runs Install/Update Tungsten Printix Client on Windows servers without the client when the deployment field is `Windows` or `Windows Servers`. Triggers after 10 minutes online and runs again every 24 hours while the client is missing. |

## Implementation

### Step 1: Create the custom fields

Create the three custom fields with the `Organization`, `Location` and `Device` scopes, and put them on a custom field tab named **Tungsten Printix Client**.

- [Custom Field: cPVAL Tungsten PrintixClientID](/docs/ac1c2105-bc81-4dca-9786-1991d00e5155)
- [Custom Field: cPVAL Tungsten PrintixClientDomain](/docs/4e5a88c2-1f5a-41fd-bd22-fd3d7ea2fb9b)
- [Custom Field: cPVAL Tungsten Printix Client Deployment](/docs/d53a9981-9c39-4392-bf02-9d069b529f2f)

### Step 2: Create the automations

Add both automations to the NinjaOne automation library and set them to run as `System`. The uninstall automation is optional and runs on demand only, so don't add it to a schedule or a condition.

- [Automation: Install/Update Tungsten Printix Client](/docs/0c5963fc-ac9d-44ff-8fad-8ae2fd267547)
- [Automation: Uninstall Tungsten Printix Client](/docs/0e415b7e-4132-45ff-a495-5320a42bf0c3) (optional)

### Step 3: Create the compound conditions

Add the workstation condition to the **Windows Workstation Policy** and the server condition to the **Windows Server Policy**. If the client's Windows devices use other policies, add the matching condition to those policies too.

- [Compound Condition: Deploy Tungsten Printix Client - Workstations](/docs/96795ceb-d3c7-4d36-b424-d2979140e036)
- [Compound Condition: Deploy Tungsten Printix Client - Servers](/docs/aad200d0-6423-4b95-80c8-0e8cbae219fa)

### Step 4: Enter the client's Printix tenant

On the client's organization, set both tenant fields. Then run Install/Update Tungsten Printix Client on one device to confirm the values are right before you deploy to every device.

- [Custom Field: cPVAL Tungsten PrintixClientID](/docs/ac1c2105-bc81-4dca-9786-1991d00e5155)
- [Custom Field: cPVAL Tungsten PrintixClientDomain](/docs/4e5a88c2-1f5a-41fd-bd22-fd3d7ea2fb9b)

### Step 5: Turn on deployment

On the client's organization, choose the devices that get the client. To leave out a location or a single device, set the field to `Disable` there.

| Option | Deploys to |
|---|---|
| `Disable` | No devices |
| `Windows` | Windows workstations and servers |
| `Windows Workstations` | Windows workstations only |
| `Windows Servers` | Windows servers only |

- [Custom Field: cPVAL Tungsten Printix Client Deployment](/docs/d53a9981-9c39-4392-bf02-9d069b529f2f)

### Step 6: Update devices that already have the client (optional)

The compound conditions skip devices that already have the client. To bring those devices to the latest version and register them to the tenant, run Install/Update Tungsten Printix Client on them. Devices that are already up to date and registered to the tenant aren't changed.

- [Automation: Install/Update Tungsten Printix Client](/docs/0c5963fc-ac9d-44ff-8fad-8ae2fd267547)


## FAQ

### Q: Where do I find the tenant ID and tenant name?

> **Tenant name:** the part of the client's Printix sign-in address before `.printix.net`. For `https://acme.printix.net`, enter `acme`. `acme.printix.net` and the full address also work.
>
> **Tenant ID:** a GUID that is part of the file name of the Printix Client installer downloaded from the tenant, in the second pair of braces: `CLIENT_{acme.printix.net}_{<tenant ID>}.EXE`. You can enter it with or without the braces.

### Q: Deployment is turned on, but a device still doesn't have the client. What should I check?

> The compound condition runs only once the device has been online for 10 minutes. Check these:
>
> 1. The device shows as online in NinjaOne.
> 2. The device's agent policy includes the right compound condition: **Deploy Tungsten Printix Client - Workstations** for workstations, **Deploy Tungsten Printix Client - Servers** for servers.
> 3. The value of **cPVAL Tungsten Printix Client Deployment** covers the device type. `Windows Workstations` doesn't cover servers, and `Windows Servers` doesn't cover workstations. A `Disable` set on the location or the device overrides the organization value.
> 4. **cPVAL Tungsten PrintixClientID** and **cPVAL Tungsten PrintixClientDomain** are both set for the device.
> 5. The activity details of Install/Update Tungsten Printix Client on the device don't show an error.
>
> After a failure, the condition tries again 24 hours later. To try sooner, run the automation on the device yourself.

### Q: The automation failed. What should I check?

> The activity details show the reason. The most common ones are:
>
> - **`PrintixClientID and PrintixClientDomain are required`** – one of the tenant fields is empty for this device.
> - **`PrintixClientID is not a valid tenant ID`** – the tenant ID isn't a GUID.
> - **`PrintixClientDomain ... is not a valid tenant domain`** – the tenant name has characters other than letters, numbers and hyphens.
> - **`Could not download the Printix Client installer`** – the device can't reach `api.printix.net`, or the tenant ID is wrong.
> - **`the client is registered to a different tenant`** – the tenant ID and the tenant name don't belong to the same Printix tenant.
> - **`The installer is still running after 15 minutes`** – the installer is waiting on a prompt nobody can see. Check the installer's log.
>
> When the install itself fails, the activity details also show the last 25 lines of the installer's log, `C:\ProgramData\_automation\script\Printix\Printix_Install.log`.

### Q: Does the solution keep the client up to date?

> Not on its own. The compound conditions run only when the client is missing. To update the client, run Install/Update Tungsten Printix Client on the devices. It installs the latest version only where the installed client is older, and leaves up-to-date clients alone. To update on a regular schedule, add the automation as a scheduled automation in the agent policy.

### Q: What happens on a device that already has the Printix Client?

> The compound conditions don't run there, because the client is in the software inventory. When you run Install/Update Tungsten Printix Client on the device yourself, it makes no changes if the client is up to date and registered to the tenant. If the client is older, or registered to another tenant or to no tenant, it uninstalls the client and installs the latest one for the tenant.

### Q: How do I move devices to a different Printix tenant?

> Change **cPVAL Tungsten PrintixClientID** and **cPVAL Tungsten PrintixClientDomain** to the new tenant, then run Install/Update Tungsten Printix Client on the devices. It finds the client registered to the old tenant, uninstalls it and installs the client for the new tenant.

### Q: How do I remove the client?

> First set **cPVAL Tungsten Printix Client Deployment** to `Disable` for the devices. Otherwise the compound condition installs the client again within 24 hours. Then run Uninstall Tungsten Printix Client on the devices. If the client isn't installed, the automation makes no changes and reports success.

### Q: The automation reinstalls the client every time it runs. Why?

> The automation is probably running in 32-bit PowerShell, which can't see the installed 64-bit client. `Install-PrintixClient.log` shows a warning about 32-bit PowerShell when this happens. Make sure the automation runs in 64-bit PowerShell.

### Q: Why do the activity details and the logs show `<PrintixClientID>` instead of the tenant ID?

> The automation hides the tenant ID in everything it writes, including errors and log files. The real value is stored in **cPVAL Tungsten PrintixClientID**.

## Changelog

### 2026-11-16

- Initial version of the document
