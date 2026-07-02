---
id: 'df469efc-a893-4332-91e6-7bbfcb019b4c'
slug: /df469efc-a893-4332-91e6-7bbfcb019b4c
title: 'Duo Authentication for Windows Logon Deployment'
title_meta: 'Duo Authentication for Windows Logon Deployment'
keywords: ['duo', 'authentication', 'windows', 'deployment', 'update', 'monitor']
description: 'This solution automates the installation, update, and optional removal of Duo Authentication for Windows Logon on Windows computers, with version monitoring and ticketless cleanup.'
tags: ['installation', 'update', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-07-02
---

## Purpose

The Duo Authentication for Windows Logon Deployment solution keeps Duo Authentication for Windows Logon installed and up to date on your Windows computers. It uses Extra Data Fields (EDFs) to control exactly which machines receive Duo and which configuration options are applied.

Key features:

- **Automated deployment** – New or existing computers that are in scope get Duo installed automatically.
- **Continuous version compliance** – A remote monitor checks hourly whether the installed Duo version matches the latest release and triggers an update if needed.
- **Clean uninstallation** – When a computer or location is excluded, the solution can automatically remove the application and its monitoring components.
- **Ticket‑based failure alerting** – If an automated install/update fails, a ticket is created and kept updated until the issue is resolved. Uninstalls do not generate tickets.

All configuration is driven by EDFs placed at the client, location, and computer level, giving you fine‑grained control over deployments.

> **Note:** *[Duo Authentication for Windows Logon Silent Installation Command-Line Reference](https://help.duo.com/s/article/1090?language=en_US)*

## Associated Content

### Deployment (core)

| Content | Type | Function |
|---------|------|----------|
| [Duo Authentication for Windows Logon Deployment](/docs/3ccff739-75fe-11f1-ba72-92000234cfc2) | Script | Installs or updates Duo using the configuration defined in the Duo_Auth EDFs. Also creates the version‑check remote monitor when triggered by the internal monitor. Creates tickets on failure. |
| [Duo Authentication for Windows Logon Deployment](/docs/01a557b0-e14a-4c87-885d-7ad2e79bf74e) | Internal Monitor | Detects Windows computers where deployment is enabled but the application or the remote monitor is missing. Triggers the deployment script. |
| [Duo Authentication for Windows Logon Version Check](/docs/b75e9b1e-2035-4d68-bb4c-4d852012cace) | Remote Monitor | Runs hourly on each managed computer, checks if Duo is installed and current, and if not, triggers the deployment script to repair it. |
| △ Custom - Execute Script - Duo Authentication for Windows Logon Deployment | Alert Template | Used by both the deployment internal monitor and the version‑check remote monitor to run the deployment script. |

### Optional – Uninstallation

Import this content only if you want computers that are explicitly set to `Disable` in the deployment EDFs to have Duo automatically removed.

| Content | Type | Function |
|---------|------|----------|
| [Duo Authentication for Windows Logon Uninstallation](/docs/46443094-762d-11f1-ba72-92000234cfc2) | Script | Uninstalls Duo and deletes the version‑check remote monitor. Does not create tickets. |
| [Duo Authentication for Windows Logon Uninstallation](/docs/da45e679-b877-4bbd-8f35-174dcfd34665) | Internal Monitor | Detects computers where deployment is explicitly `Disable` but Duo or the remote monitor still exists, and triggers the uninstall script. |
| △ Custom - Execute Script - Duo Authentication for Windows Logon Uninstallation | Alert Template | Launches the uninstall script when the uninstall internal monitor fires. |

## Implementation

1. **Import the deployment content** using the ProSync Plugin:
   - [Duo Authentication for Windows Logon Deployment](/docs/3ccff739-75fe-11f1-ba72-92000234cfc2) (script)
   - [Duo Authentication for Windows Logon Deployment](/docs/01a557b0-e14a-4c87-885d-7ad2e79bf74e) (internal monitor)
   - Alert Template `△ Custom - Execute Script - Duo Authentication for Windows Logon Deployment`

2. **(Optional) Import the uninstallation content**:
   - [Duo Authentication for Windows Logon Uninstallation](/docs/46443094-762d-11f1-ba72-92000234cfc2) (script)
   - [Duo Authentication for Windows Logon Uninstallation](/docs/da45e679-b877-4bbd-8f35-174dcfd34665) (internal monitor)
   - Alert Template `△ Custom - Execute Script - Duo Authentication for Windows Logon Uninstallation`

3. **Reload the system cache (Ctrl + R)** 

4. **Run the deployment script with `Set_Environment = 1`** against any online Windows machine. This step:
   - Creates all EDFs in the **Duo_Auth** section (client, location, computer).
   - Copies existing values from the old DUO EDFs into the new EDFs, so your previous configuration is preserved.  
   ![Set_Environment run](../../static/img/docs/3ccff739-75fe-11f1-ba72-92000234cfc2/image1.webp)

5. **Configure the deployment internal monitor**:
   - Navigate to Automation → Monitors in the CWA Control Center.
   - Open the internal monitor **Duo Authentication for Windows Logon Deployment**.
   - Assign the alert template `△ Custom - Execute Script - Duo Authentication for Windows Logon Deployment`.
   - Right‑click and select **Run Now** to start the monitor.

6. **(Optional) Configure the uninstallation internal monitor**:
   - Open the internal monitor **Duo Authentication for Windows Logon Uninstallation**.
   - Assign the alert template `△ Custom - Execute Script - Duo Authentication for Windows Logon Uninstallation`.
   - Right‑click and select **Run Now** to start it.

The remote monitor **Duo Authentication for Windows Logon Version Check** is automatically created on each computer the first time the deployment script runs via the internal monitor. No manual setup is required for that monitor.

## Usage and Configuration Guide

All settings are managed through Extra Data Fields (EDFs) in the **Duo_Auth** section. The EDFs exist at three levels:

- **Client** – sets the default behaviour for all computers under that client.
- **Location** – overrides the client settings for a specific location.
- **Computer** – overrides all higher levels for a single machine.

### Enabling Duo deployment

The master switch is the **DUO_Auth_Deployment** dropdown. It replaces the old `Duo Enabled Client` and `DUO Agent Exclusion` checkboxes.

| Value | Effect |
|-------|--------|
| `Disable` | No Duo deployment on this client/location/computer. If the uninstallation option is in use and a machine is explicitly set to `Disable` at any level, Duo will be automatically removed. |
| `Workstations` | Deploy Duo only to Windows workstations (non‑server OS). Servers are left untouched. |
| `Servers` | Deploy Duo only to Windows servers. Workstations are not affected. |
| `Both` | Deploy Duo to all Windows computers, both workstations and servers. |

**How the effective value is decided** – The script and monitors check the computer first, then the location, then the client. The first non‑empty value found is used. If no value is set at any level, the machine is treated as if `Disable` was selected.

### Duo application settings (mandatory fields)

These three text fields **must** be set for the deployment to work. They contain the credentials for your Duo integration.

| Name | Type | Description |
|------|------|-------------|
| DUO_Auth_IKEY | Text | Your Duo integration key (from the Duo Admin Panel). Replaces the old `DUO IKEY` EDF. |
| DUO_Auth_SKEY | Text | Your Duo secret key. Replaces the old `DUO SKEY` EDF. |
| DUO_Auth_HOST | Text | Your Duo API hostname (e.g., `api-xxxxxxxx.duosecurity.com`). Replaces the old `DUO HOST` EDF. |

### All Duo_Auth EDFs (Client & Location)

At the client and location levels, each optional parameter has two variants – one for servers (`_Svr`) and one for workstations (`_Wks`). This lets you apply different policies to servers and workstations without needing separate locations or clients.

| Name | Type | Options | Description |
|------|------|---------|-------------|
| DUO_Auth_Deployment | Dropdown | `Workstations` · `Servers` · `Both` · `Disable` | Controls whether Duo is deployed and to which OS types. |
| DUO_Auth_IKEY | Text | – | Integration key. Mandatory. |
| DUO_Auth_SKEY | Text | – | Secret key. Mandatory. |
| DUO_Auth_HOST | Text | – | API hostname. Mandatory. |
| AUTOPUSH_Svr / AUTOPUSH_Wks | Dropdown | `0` · `1` | `1` = automatically send a push notification to the user’s device; `0` = user must manually request a push. |
| ENABLECERTPINNING_Svr / ENABLECERTPINNING_Wks | Dropdown | `0` · `1` | `1` = enable certificate pinning (recommended). Helps prevent man‑in‑the‑middle attacks. |
| ENABLEOFFLINE_Svr / ENABLEOFFLINE_Wks | Dropdown | `0` · `1` | `1` = allow offline authentication if Duo’s service is unreachable; `0` = block access. |
| FAILOPEN_Svr / FAILOPEN_Wks | Dropdown | `0` · `1` | `1` = if Duo is unreachable, allow login (fail open); `0` = deny login (fail closed). |
| LOGFILE_MAXCOUNT_Svr / LOGFILE_MAXCOUNT_Wks | Text | – | Maximum number of rotated Duo log files to keep. When exceeded, the oldest file is deleted. |
| LOGFILE_MAXSIZEMB_Svr / LOGFILE_MAXSIZEMB_Wks | Text | – | Maximum size (MB) of each rotated log file before a new one is started. |
| PROXYHOST_Svr / PROXYHOST_Wks | Text | – | Hostname or IP of an HTTP proxy that Duo should use for API calls. Leave blank if no proxy is needed. |
| PROXYPORT_Svr / PROXYPORT_Wks | Text | – | TCP port of the HTTP proxy (used only if the corresponding PROXYHOST is set). |
| RDPONLY_Svr / RDPONLY_Wks | Dropdown | `0` · `1` | `1` = require Duo only for remote (RDP) logons; `0` = require it for both console and RDP logons. |
| SMARTCARD_Svr / SMARTCARD_Wks | Dropdown | `0` · `1` | `1` = allow smart card login as an alternative to Duo; `0` = disable the Windows smart card provider. |
| UAC_OFFLINE_Svr / UAC_OFFLINE_Wks | Dropdown | `0` · `1` | `1` = allow offline Duo authentication during UAC elevation prompts. |
| UAC_OFFLINE_ENROLL_Svr / UAC_OFFLINE_ENROLL_Wks | Dropdown | `0` · `1` | `1` = allow a user to enroll for offline access during a UAC elevation prompt. |
| UAC_PROTECTMODE_Svr / UAC_PROTECTMODE_Wks | Dropdown | `0` · `1` · `2` | `0` = respect existing Duo logon rules, `1` = disable Duo at Windows logon and only require it during UAC elevation, `2` = enforce Duo at both logon and elevation. |
| USERNAMEFORMAT_Svr / USERNAMEFORMAT_Wks | Dropdown | `0` · `1` · `2` | `0` = sAMAccountName (short name), `1` = NTLM format (domain\username), `2` = userPrincipalName (email‑style). |
| WRAPSMARTCARD_Svr / WRAPSMARTCARD_Wks | Dropdown | `0` · `1` | When `SMARTCARD` is `1`, `1` = require Duo after smart card login, `0` = skip Duo. |

### Computer‑Level EDFs

Computer overrides use the same names as the client EDFs, but without the `_Svr` or `_Wks` suffix. The script automatically chooses the correct server‑ or workstation‑level setting based on the computer’s operating system when a suffix is needed at the client or location level.

| Name | Type | Options | Description |
|------|------|---------|-------------|
| DUO_Auth_Deployment | Dropdown | `Workstations` · `Servers` · `Both` · `Disable` | Overrides the deployment decision for this specific computer. |
| DUO_Auth_IKEY | Text | – | Overrides the integration key. |
| DUO_Auth_SKEY | Text | – | Overrides the secret key. |
| DUO_Auth_HOST | Text | – | Overrides the API hostname. |
| AUTOPUSH | Dropdown | `0` · `1` | Overrides automatic push. |
| ENABLECERTPINNING | Dropdown | `0` · `1` | Overrides certificate pinning. |
| ENABLEOFFLINE | Dropdown | `0` · `1` | Overrides offline access. |
| FAILOPEN | Dropdown | `0` · `1` | Overrides fail‑open behaviour. |
| LOGFILE_MAXCOUNT | Text | – | Overrides the log file rotation count. |
| LOGFILE_MAXSIZEMB | Text | – | Overrides the log file maximum size. |
| PROXYHOST | Text | – | Overrides the proxy hostname. |
| PROXYPORT | Text | – | Overrides the proxy port. |
| RDPONLY | Dropdown | `0` · `1` | Overrides RDP‑only protection. |
| SMARTCARD | Dropdown | `0` · `1` | Overrides smart card alternative. |
| UAC_OFFLINE | Dropdown | `0` · `1` | Overrides offline access for UAC elevation. |
| UAC_OFFLINE_ENROLL | Dropdown | `0` · `1` | Overrides offline enrollment during UAC elevation. |
| UAC_PROTECTMODE | Dropdown | `0` · `1` · `2` | Overrides UAC protection mode. |
| USERNAMEFORMAT | Dropdown | `0` · `1` · `2` | Overrides username format. |
| WRAPSMARTCARD | Dropdown | `0` · `1` | Overrides smart card + Duo requirement. |

All EDFs are located in the **Duo_Auth** section. When you open the Extra Data Fields tab, you will see them grouped together.

## Deprecated Content

The following content from the previous Duo solution has been replaced by the new solution and should no longer be used. All references to these items should be removed from your environment once the new solution is fully deployed.

| Old Content | Type | Replaced By |
|-------------|------|--------------|
| DUO Install & Upgrade - Latest Version | Script | [Duo Authentication for Windows Logon Deployment](/docs/3ccff739-75fe-11f1-ba72-92000234cfc2) |
| Uninstall DUO | Script | [Duo Authentication for Windows Logon Uninstallation](/docs/46443094-762d-11f1-ba72-92000234cfc2) |
| ProVal - Production - DUO Authentication - Latest Version Detection | Internal Monitor | *(merged into the new deployment monitor)* |
| ProVal - Production - DUO Authentication - Install/Update | Internal Monitor | [Duo Authentication for Windows Logon Deployment](/docs/01a557b0-e14a-4c87-885d-7ad2e79bf74e) |
| ProVal - Production - Uninstall DUO | Internal Monitor | [Duo Authentication for Windows Logon Uninstallation](/docs/da45e679-b877-4bbd-8f35-174dcfd34665) |
| △ Custom - Execute Script - DUO Install & Upgrade - Latest Version | Alert Template | △ Custom - Execute Script - Duo Authentication for Windows Logon Deployment |
| △ Custom - Execute Script - Uninstall DUO | Alert Template | △ Custom - Execute Script - Duo Authentication for Windows Logon Uninstallation |
| Duo Enabled Client (Client) | EDF | DUO_Auth_Deployment (Client) |
| DUO HOST | EDF | DUO_Auth_HOST |
| DUO IKEY | EDF | DUO_Auth_IKEY |
| DUO SKEY | EDF | DUO_Auth_SKEY |
| DUO - AUTOPUSH - Server / Workstation | EDF | AUTOPUSH_Svr / AUTOPUSH_Wks |
| DUO - FAILOPEN - Server / Workstation | EDF | FAILOPEN_Svr / FAILOPEN_Wks |
| DUO - RDPONLY - Server / Workstation | EDF | RDPONLY_Svr / RDPONLY_Wks |
| DUO - SMARTCARD - Server / Workstation | EDF | SMARTCARD_Svr / SMARTCARD_Wks |
| DUO - ENABLEOFFLINE - Server / Workstation | EDF | ENABLEOFFLINE_Svr / ENABLEOFFLINE_Wks |
| DUO Agent Exclusion (Location) | EDF | DUO_Auth_Deployment (Location) |
| DUO Agent Exclusion (Computer) | EDF | DUO_Auth_Deployment (Computer) |
| Duo Agent Exclusion (Client) | EDF | DUO_Auth_Deployment (Client) – this old checkbox is also replaced. |
| DUO - AUTOPUSH / FAILOPEN / RDPONLY / SMARTCARD / ENABLEOFFLINE (Computer) | EDF | Respective computer‑level EDFs (e.g., AUTOPUSH, FAILOPEN, etc.) |
| Duo Authentication Version (Computer) | EDF | No direct replacement. The new remote monitor tracks version automatically. |

## Frequently Asked Questions

### How do I move my settings from the old DUO EDFs to the new ones?

> Run the deployment script once with `Set_Environment = 1`.  
> It creates all the new EDFs in the **Duo_Auth** section and automatically copies the values from the old DUO fields – no manual transfer is needed.

### Does the `Set_Environment` run delete the old EDFs?

> No. The old EDFs are left untouched. They are no longer used by the new solution, but they remain in place until you delete them yourself.

### Can I safely remove the old EDFs after migration?

> Yes, if you are absolutely sure that no other script, monitor, or solution references them.  
> When in doubt, audit their usage first. Deleting them afterwards keeps your EDF list clean.

### What happens if the mandatory fields – IKEY, SKEY, or HOST – are left empty?

> The deployment script checks for these before installing. If any of them is missing at all levels, the script returns a message indicating which key is missing, and no installation is attempted.

### How does the fallback work when DUO_Auth_Deployment is set at multiple levels?

> The effective value is decided by checking **Computer → Location → Client** in order.  
> The first non‑empty value found wins. If no level has a value, the machine is treated as `Disable`.

### When I set DUO_Auth_Deployment to `Disable`, does Duo get uninstalled automatically?

> Only if you have imported the optional uninstall components.  
> Without them, `Disable` simply prevents new installations. The optional uninstall monitor detects the `Disable` state and triggers the uninstall script to remove the application and the remote monitor.

### Does the uninstall process create tickets?

> No. The uninstall script does not create any tickets, whether it succeeds or fails.  
> Only the deployment script creates tickets, and only when triggered by a monitor.

### Can I run the deployment script manually on any machine?

> Yes. You can run it manually against any computer, regardless of EDF settings.  
> Manual runs install or update Duo but do **not** create the remote monitor and do **not** generate tickets.

### How does the remote monitor keep Duo updated?

> The version‑check remote monitor runs every hour and detects if the application is missing or out of date.  
> If so, it triggers the deployment script, which installs or updates Duo and then clears the alert.

### I want to disable Duo on a specific computer but not on others at the same location. How?

> Set the **computer‑level** `DUO_Auth_Deployment` to `Disable`.  
> That overrides any higher‑level setting and will cause the uninstall monitor (if imported) to remove Duo from that machine only.

### What are the default values for the optional parameters like AUTOPUSH or FAILOPEN?

> If you leave an EDF empty, the script does not pass that argument, and the Duo installer uses its own defaults:
>
> | Parameter | Default |
> |-----------|---------|
> | AUTOPUSH | 1 (auto‑push) |
> | FAILOPEN | 0 (fail closed) |
> | RDPONLY | 0 (protect console + RDP) |
> | SMARTCARD | 0 (disabled) |
> | ENABLEOFFLINE | 1 (enabled) |
> | USERNAMEFORMAT | 1 (NTLM domain\username) |
> | UAC_PROTECTMODE | 0 (respect existing logon rules) |
> | UAC_OFFLINE | 1 (enabled) |
> | UAC_OFFLINE_ENROLL | 1 (enabled) |
> | ENABLECERTPINNING | 1 (enabled) |
> | WRAPSMARTCARD | 0 (no Duo after smart card) |

### What if my network requires a proxy for internet access?

> Set the `PROXYHOST` and `PROXYPORT` EDFs at the appropriate level. These are passed to the Duo installer for its own traffic.  
> The script’s download of the installer uses the system proxy settings.

### How can I see which version of Duo is installed on a machine?

> The remote monitor reports the installed version in failure messages (e.g., `Failure: Outdated (Installed: 7.2.0, Latest: 7.3.0)`).  
> You can also check the Software tab in Automate.

### What happens if the download of the Duo installer fails?

> The script fails and, if triggered by a monitor, a ticket is created.  
> The remote monitor will still detect the issue and retry the deployment script every hour until it succeeds.

### Is the solution compatible with existing Duo installations?

> Yes. The script compares the installed version with the latest. If current, nothing happens; if older, it upgrades in place.

### How do I know if an automated installation/update failed?

> A ticket is created with the subject `DUO Authentication for Windows Logon Install/Update Failed on %ComputerName% at %ClientName%`.  
> Consecutive failures add comments to the same ticket. When a later attempt succeeds, the ticket closes automatically.

### Can I stop the remote monitor from being created on certain machines?

> The remote monitor is only created when the deployment script is triggered by the internal monitor.  
> Manual executions do not create it. If you want a machine to be part of automated deployment but without the monitor, the design does not support that – the monitor is essential for continuous version compliance.

### What should I do if the Duo Authentication installer fails with a specific error?

> Check the logs saved next to the script:  
> `Install-DuoAuthForWinLogon-log.txt` and `Install-DuoAuthForWinLogon-error.txt`  
> They contain detailed information about the installation arguments, hash verification, and msiexec exit codes.

## Changelog

### 2025-07-02

- Initial version of the solution.
- Replaces the previous **Duo Authentication for Windows - UpdateDeployUninstall** solution.
- Introduced new EDF structure in **Duo_Auth** section with server/workstation split.
- Added automatic migration of settings from old EDFs to new EDFs via `Set_Environment`.
- Deployment now creates a remote monitor for continuous version compliance.
- Uninstallation is offered as an optional component that removes the application and the monitor when a machine is set to `Disable`.
