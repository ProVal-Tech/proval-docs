---
id: '01a557b0-e14a-4c87-885d-7ad2e79bf74e'
slug: /01a557b0-e14a-4c87-885d-7ad2e79bf74e
title: 'Duo Authentication for Windows Logon Deployment'
title_meta: 'Duo Authentication for Windows Logon Deployment'
keywords: ['duo', 'authentication', 'windows', 'monitor', 'deployment']
description: 'This internal monitor triggers the Duo Authentication for Windows Logon Deployment script on Windows machines where the solution is enabled but either the application is not installed or the version check remote monitor is missing.'
tags: ['installation', 'update', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-07
---

## Summary

This internal monitor automatically executes the **[Duo Authentication for Windows Logon Deployment](/docs/3ccff739-75fe-11f1-ba72-92000234cfc2)** script on Windows computers that are within the scope of Duo deployment but are currently missing the application or the companion **[Duo Authentication for Windows Logon Version Check](/docs/b75e9b1e-2035-4d68-bb4c-4d852012cace)** remote monitor.

Deployment scope is determined by the **DUO_Auth_Deployment** Extra Data Fields (Client → Location → Computer fallback). The monitor selects online Windows computers where deployment is enabled (Both, Workstations for workstations, or Servers for servers) and checks two conditions:

- The **Duo Authentication for Windows Logon** application is **not present** in the Software tab.
- The **Duo Authentication for Windows Logon Version Check** remote monitor is **missing**.

When either condition is true, the computer is queued for execution. The alert template **△ Custom - Execute Script - Duo Authentication for Windows Logon Deployment** then runs the deployment script, which installs the latest version of Duo and creates the remote monitor (if triggered by this internal monitor).

Computers that have recently failed the script too many times are temporarily excluded to avoid repeated failures.

This internal monitor replaces the two legacy monitors:

- **DUO Authentication - Latest Version Detection**
- **DUO Authentication - Install/Update**

Both are now deprecated.

## EDFs and Detection Logic

### EDFs Used

The internal monitor relies solely on the **DUO_Auth_Deployment** EDFs, which are present at the client, location, and computer levels. All are located in the **Duo_Auth** section.

| Name | Level | Type | Options | Section | Description |
|------|-------|------|---------|---------|-------------|
| DUO_Auth_Deployment | Client | Dropdown | `Workstations` · `Servers` · `Both` · `Disable` | Duo_Auth | Replaces the old `Duo Enabled Client` checkbox. Defines the default deployment scope for all computers under this client. |
| DUO_Auth_Deployment | Location | Dropdown | `Workstations` · `Servers` · `Both` · `Disable` | Duo_Auth | Replaces the old `DUO Agent Exclusion` checkbox. Overrides the client setting for a specific location. |
| DUO_Auth_Deployment | Computer | Dropdown | `Workstations` · `Servers` · `Both` · `Disable` | Duo_Auth | Replaces the old `Duo Agent Exclusion` computer checkbox. Overrides all higher levels for a specific machine. |

### How the Decision is Made

The internal monitor evaluates each online Windows computer using the following logic:

1. **Determine the effective deployment value** – the monitor checks the computer, then location, then client **DUO_Auth_Deployment** EDF (in that order). The first non‑empty value found is used. If no value is set at any level, the machine is treated as `Disable`.
2. **Apply OS restrictions** – if the resolved value is `Workstations`, only computers with a non‑server OS are considered. If `Servers`, only servers are considered. `Both` includes all Windows machines, and `Disable` excludes the machine entirely.
3. **Check health conditions** – once a machine is within scope, the monitor verifies:
   - Is **Duo Authentication for Windows Logon** listed in the Software tab?
   - Does the **Duo Authentication for Windows Logon Version Check** remote monitor exist?
4. **Return the machine** – if **either** the application is missing **or** the remote monitor is missing, the computer is returned by the internal monitor and the deployment script will be executed. If both are present, the machine is skipped (it is already healthy).

> **Note:** Even if the application is already installed, a missing remote monitor (for example, after it was manually deleted) will cause the script to run again – it will recreate the monitor without re‑installing Duo.

### Example Scenarios

The following table illustrates how different combinations of EDFs and machine states affect the monitor’s decision.

| Computer OS | Client EDF | Location EDF | Computer EDF | Effective Deployment | App Installed? | Remote Monitor Present? | Detected by Monitor? | Reason |
|-------------|------------|--------------|--------------|----------------------|----------------|------------------------|----------------------|--------|
| Windows Server | `Both` | *(not set)* | *(not set)* | `Both` | Yes | Yes | No | Everything is healthy; no action needed. |
| Windows Server | `Both` | *(not set)* | *(not set)* | `Both` | No | Yes | **Yes** | Application is missing – install Duo. |
| Windows Server | `Both` | *(not set)* | *(not set)* | `Both` | Yes | No | **Yes** | Remote monitor is missing – recreate it. |
| Windows Workstation | `Workstations` | *(not set)* | *(not set)* | `Workstations` | No | No | **Yes** | Both missing; deployment enabled for workstations. |
| Windows Server | `Workstations` | *(not set)* | *(not set)* | `Workstations` | No | No | No | Deployment is for workstations only; server excluded. |
| Windows Workstation | `Both` | `Disable` | *(not set)* | `Disable` | No | No | No | Location override disables deployment. |
| Windows Server | `Disable` | `Both` | *(not set)* | `Both` | No | No | **Yes** | Client is disabled, but location overrides to Both; server included. |
| Windows Workstation | *(not set)* | *(not set)* | `Both` | `Both` | Yes | Yes | No | No deployment set at higher levels; computer override enables, but everything is healthy. |
| Windows Workstation | `Both` | *(not set)* | `Disable` | `Disable` | No | No | No | Computer‑level override explicitly disables this machine. |

## Dependencies

- [Script: Duo Authentication for Windows Logon Deployment](/docs/3ccff739-75fe-11f1-ba72-92000234cfc2)
- [Remote Monitor: Duo Authentication for Windows Logon Version Check](/docs/b75e9b1e-2035-4d68-bb4c-4d852012cace)
- [Solution: Duo Authentication for Windows Logon Deployment](/docs/df469efc-a893-4332-91e6-7bbfcb019b4c)

## Target

Global

## Alert Template

`△ Custom - Execute Script - Duo Authentication for Windows Logon Deployment`

## Changelog

### 2026-07-07

- Initial version of the document.
- Replaces the deprecated **DUO Authentication - Latest Version Detection** and **DUO Authentication - Install/Update** internal monitors.
- Targets only enabled machines that are missing either the application or the remote monitor.
- Excludes computers with excessive recent script failures.
