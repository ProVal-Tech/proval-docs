---
id: '7637a958-9383-46af-99f9-4146ea097bf0'
slug: /7637a958-9383-46af-99f9-4146ea097bf0
title: 'Cisco Secure Client - CW RMM'
title_meta: 'Cisco Secure Client - CW RMM'
keywords: ['cisco', 'secure-client', 'anyconnect', 'umbrella', 'vpn', 'install', 'uninstall', 'file-sharing', 'cw-rmm']
description: 'Installs, updates and removes Cisco Secure Client modules on Windows endpoints in CW RMM, using install options stored per company and a package hosted in CW RMM File Sharing or at a download URL.'
tags: ['solution', 'cisco', 'deployment', 'installation', 'uninstallation', 'networking', 'security', 'software', 'vpn', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-18
---

## Purpose

The **Cisco Secure Client - CW RMM** solution installs, updates and removes Cisco Secure Client on Windows endpoints managed in ConnectWise RMM. You choose the modules once per company, host the Cisco installation package in one place, and run a task to install them. No one has to install or configure the client by hand.

The [Cisco Secure Client Parameter](/docs/0dc22f98-f39e-4d02-9716-19087ff35e03) custom field holds each company's install options. The [Cisco Secure Client Package Installation (Windows)](/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4) task reads those options and installs or updates the modules. The [Cisco Secure Client - Package Uninstallation [Windows]](/docs/b2f98721-b82c-48ad-9bf9-83f0d82c5204) task removes all modules, or only the ones you choose.

**Platform:** `ConnectWise RMM`

### Key Capabilities

- **Install Options per Company** – Set the modules and options once in a company-level custom field. Every endpoint in that company gets the same install.
- **Two Ways to Host the Package** – Store the Cisco package in CW RMM File Sharing, or host it at a download URL. With File Sharing, no external hosting is needed.
- **Choose Your Modules** – Install the full suite or only the modules you need: Core VPN, Start Before Login, DART, Network Access Manager, Network Visibility, VPN Posture (HostScan), ISE Posture and Umbrella.
- **Umbrella Ready** – When Umbrella is installed, the task creates the Umbrella configuration file from the UserID, Fingerprint and OrgID in the custom field.
- **Updates Existing Installs** – Running the task on an endpoint that already has the requested modules updates them to the version in the package, including older Cisco AnyConnect installs.
- **Targeted Removal** – The uninstallation task removes all modules, all except Core VPN, or only the modules you check. Modules that aren't installed are skipped.

### Important Caveats & Behavior

- **No Automatic Deployment** – The solution has no group or monitor that installs the client by itself. Run the installation task on demand, or schedule it against the endpoints that need it.
- **Company Level Only** – The custom field exists only at the company level, so every endpoint in a company receives the same modules and options.
- **Use One Package Location** – Leave `-DownloadURL` out of the custom field when the package is in CW RMM File Sharing. Add it only when the package is hosted at a download URL.
- **File Sharing Row Fails by Design** – When the package isn't in File Sharing, the task's File Sharing row fails and the task continues. This is expected. `Continue on Failure` must be checked on that row, or the task stops before the installation.
- **Exact File and Folder Names** – With File Sharing, the folder must be named `Cisco Secure Client` and the file `cisco_secure_client.zip`. Any other name makes the copy fail.
- **Umbrella Needs Core VPN** – Umbrella can't be installed without Core VPN. Installing Umbrella, or using `-All`, also requires the UserID, Fingerprint and OrgID.
- **Umbrella IDs Stored in Plain Text** – The Umbrella UserID, Fingerprint and OrgID are stored in the custom field in plain text, visible to anyone who can view the company's custom fields.
- **Core VPN Hidden by Default** – Core VPN doesn't appear in the system tray unless the custom field includes `-ShowVPN`.
- **Removing Core VPN** – Uninstalling Core VPN removes every other module except DART, which must be removed separately. Don't remove Core VPN from remote users who rely on the VPN unless you mean to remove the client completely.

## How It Works

1. A technician runs or schedules the [Cisco Secure Client Package Installation (Windows)](/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4) task on Windows endpoints.
2. The task reads the [Cisco Secure Client Parameter](/docs/0dc22f98-f39e-4d02-9716-19087ff35e03) custom field of the endpoint's company.
3. If `cisco_secure_client.zip` is stored in CW RMM File Sharing, the task copies it to the endpoint. If it isn't, that row fails and the task continues.
4. The task runs the [Install-CiscoSecureClient](/docs/fc6bcac9-770a-46dc-902c-7176cb1d73ea) script with the custom field value. The script uses the copied package, or downloads it from `-DownloadURL`, and installs or updates the requested modules.
5. The result, including any installation errors, is written to the task's script log.



Removal is separate. When you run the [Cisco Secure Client - Package Uninstallation [Windows]](/docs/b2f98721-b82c-48ad-9bf9-83f0d82c5204) task, you check which modules to remove. The task finds the installed Cisco Secure Client modules and removes the checked ones with the [Remove-Application](/docs/8230693f-cf73-479d-8279-d2ff54c4296e) script.

## Package Hosting Options

| | CW RMM File Sharing | Download URL |
|---|---|---|
| **Where the package lives** | `SETTINGS` ➞ `File Sharing`, in a folder named `Cisco Secure Client`, as `cisco_secure_client.zip` | Any web location the endpoints can download from |
| **Custom field value** | Module switches only, for example `-Core -Dart` | `-DownloadURL` and the URL in single quotes, then the module switches, for example `-DownloadURL 'https://downloadpath/CiscoSecureClient.zip' -Core -Dart` |
| **How endpoints get it** | The task copies it from File Sharing before the installation | The script downloads it during the installation |
| **Packages per environment** | One package for every company | A different package per company, if needed |
| **Updating the version** | Replace the file in File Sharing and keep its name | Replace the file at the URL, or change the URL in each company's custom field |
| **Best for** | Partners with no external file hosting | Partners who already host installers, or need different versions for different companies |

**How to choose:**

- Pick **CW RMM File Sharing** if you want to keep the package inside CW RMM and every company uses the same version.
- Pick **Download URL** if you already host installers elsewhere, or some companies need a different package version.

## Prerequisites

- A Cisco portal login, to download the `Cisco Secure Client Pre-Deployment Package (Windows) - includes individual MSI files` zip file.
- Access to CW RMM File Sharing, or a web location the endpoints can download from.
- Windows endpoints with PowerShell 5.1 and internet access to `contentrepo.net` and the PowerShell Gallery.
- For Umbrella: the UserID, Fingerprint and OrgID of the client's Cisco Umbrella organization.

## Associated Content

### Custom Field

| Name | Level | Type | Purpose |
|---|---|---|---|
| [Cisco Secure Client Parameter](/docs/0dc22f98-f39e-4d02-9716-19087ff35e03) | Company | Text Box | Holds the company's install options: the module switches, the Umbrella IDs when Umbrella is installed, and `-DownloadURL` when the package is hosted at a download URL. |

### Tasks

| Name | Purpose |
|---|---|
| [Cisco Secure Client Package Installation (Windows)](/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4) | Copies the package from File Sharing when it's stored there, then installs or updates the modules set in the custom field. Run it on demand or on a schedule. |
| [Cisco Secure Client - Package Uninstallation [Windows]](/docs/b2f98721-b82c-48ad-9bf9-83f0d82c5204) | Removes all modules, all except Core VPN, or only the modules you check when you run it. |

### Scripts

The tasks download and run these scripts. You don't need to create anything for them.

| Name | Purpose |
|---|---|
| [Install-CiscoSecureClient](/docs/fc6bcac9-770a-46dc-902c-7176cb1d73ea) | Installs or updates the requested modules. Lists every switch the custom field accepts. |
| [Remove-Application](/docs/8230693f-cf73-479d-8279-d2ff54c4296e) | Silently removes the modules checked in the uninstallation task. |

## Implementation

Follow these steps in order. Steps 1 to 5 are done once per CW RMM environment. Step 6 is done once for each company.

### Step 1: Download the Cisco Secure Client Package

Download the `Cisco Secure Client Pre-Deployment Package (Windows) - includes individual MSI files` zip file from Cisco, as described in [Download the Package](/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4#download-the-package). Download the latest stable version.

### Step 2: Host the Package

Choose a hosting option from [Package Hosting Options](#package-hosting-options).

- **CW RMM File Sharing:** Create a folder named `Cisco Secure Client` in `SETTINGS` ➞ `File Sharing` and upload the zip file into it as `cisco_secure_client.zip`, as described in [Upload the Package to File Sharing](/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4#upload-the-package-to-file-sharing).
- **Download URL:** Upload the zip file to a web location the endpoints can download from, and note the full URL.

### Step 3: Create the Custom Field

Create the company-level custom field before you create the installation task. The task reads it in its first row.

- [Custom Field: Cisco Secure Client Parameter](/docs/0dc22f98-f39e-4d02-9716-19087ff35e03)

### Step 4: Create the Installation Task

Create the task with all four rows. Check `Continue on Failure` on Row 2 (ConnectWise File Sharing), even if you host the package at a download URL.

- [Task: Cisco Secure Client Package Installation (Windows)](/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4)

### Step 5: Create the Uninstallation Task (Optional)

Create this task if you'll need to remove Cisco Secure Client or individual modules from endpoints.

- [Task: Cisco Secure Client - Package Uninstallation [Windows]](/docs/b2f98721-b82c-48ad-9bf9-83f0d82c5204)

### Step 6: Set the Install Options for Each Company

Set the [Cisco Secure Client Parameter](/docs/0dc22f98-f39e-4d02-9716-19087ff35e03) custom field for each company that needs the client. The value must include at least one module switch.

| Use case | Example value |
|---|---|
| Package in CW RMM File Sharing | `-Core -Dart` |
| Package at a download URL | `-DownloadURL 'https://downloadpath/CiscoSecureClient.zip' -Core -Dart` |
| Core VPN visible in the system tray | `-Core -ShowVPN -Dart` |
| Umbrella | `-Core -Umbrella -UserID <UserID> -Fingerprint <Fingerprint> -OrgId <OrgID>` |

Add `-DownloadURL` and its URL to any of these values when the package is hosted at a download URL. See [Cisco Secure Client Parameter](/docs/0dc22f98-f39e-4d02-9716-19087ff35e03) for more sample values and every available switch.

### Step 7: Run or Schedule the Installation Task

Run the [Cisco Secure Client Package Installation (Windows)](/docs/ab05999e-28bb-45af-adac-ba7bf32fd3a4) task on the target Windows endpoints, or schedule it against them.

You'll know it worked when the task's script log lists the requested modules as installed and shows no installation errors. The full logs are in `C:\ProgramData\_Automation\Script\Install-CiscoSecureClient` on the endpoint.

## FAQ

### Q: Where do I get the Cisco Secure Client package?

> From [Cisco Software Download](https://software.cisco.com/download/home/286330811/type/282364313/release/5.0.03076). Download the `Cisco Secure Client Pre-Deployment Package (Windows) - includes individual MSI files` zip file. You need a Cisco portal login, so create one and confirm your access before you download.

### Q: Should I store the package in File Sharing or at a download URL?

> Use File Sharing if you don't have external file hosting and every company uses the same package version. Use a download URL if you already host installers or some companies need a different version. See [Package Hosting Options](#package-hosting-options).

### Q: Why does the File Sharing row fail in the task history?

> The row fails when `cisco_secure_client.zip` isn't stored in CW RMM File Sharing, which is expected when you host the package at a download URL. The task continues because `Continue on Failure` is checked on that row, and the script downloads the package from `-DownloadURL` instead.

### Q: The task ran, but nothing was installed. What should I check?

> Work through this list:
>
> 1. The company's [Cisco Secure Client Parameter](/docs/0dc22f98-f39e-4d02-9716-19087ff35e03) is set and includes at least one module switch.
> 2. With File Sharing: the folder is named `Cisco Secure Client`, the file is named `cisco_secure_client.zip`, and `-DownloadURL` isn't in the custom field.
> 3. With a download URL: the URL is in single quotes and the endpoint can reach it.
> 4. `Continue on Failure` is checked on Row 2 of the installation task.
> 5. For Umbrella: `-Core` is included, and the UserID, Fingerprint and OrgID are all set.
> 6. The endpoint can reach `contentrepo.net` and the PowerShell Gallery.
> 7. The logs in `C:\ProgramData\_Automation\Script\Install-CiscoSecureClient` on the endpoint show the error.

### Q: Will the task update an older Cisco AnyConnect or Secure Client install?

> Yes. Every module requested in the custom field is updated to the version in the package. Modules that aren't requested aren't updated.

### Q: How do I update endpoints to a newer Cisco Secure Client version?

> Download the new package from Cisco and put it where the old one was. With File Sharing, replace the file and keep the name `cisco_secure_client.zip`. With a download URL, replace the file at the URL, or update the URL in each company's custom field. Then run the installation task again.

### Q: Can endpoints in the same company get different modules?

> No. The custom field is company-level only, so every endpoint in the company gets the same modules and options.

### Q: Why can't users see the VPN in the system tray?

> Core VPN is hidden from the system tray by default. Add `-ShowVPN` to the custom field and run the installation task again.

### Q: How do I remove only some modules?

> Run the [Cisco Secure Client - Package Uninstallation [Windows]](/docs/b2f98721-b82c-48ad-9bf9-83f0d82c5204) task and check only the modules to remove. Check `All Except Core VPN` to keep VPN connectivity, or `All` to remove everything.

### Q: Does uninstalling Core VPN remove everything?

> It removes every other module except DART. Check `DART` as well, or use `All`, to remove the client completely.

## Changelog

### 2026-11-18

- Initial version of the document
