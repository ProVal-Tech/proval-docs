---
id: 'da45e679-b877-4bbd-8f35-174dcfd34665'
slug: /da45e679-b877-4bbd-8f35-174dcfd34665
title: 'Duo Authentication for Windows Logon Uninstallation'
title_meta: 'Duo Authentication for Windows Logon Uninstallation'
keywords: ['duo', 'authentication', 'windows', 'monitor', 'uninstall']
description: 'This internal monitor detects Windows machines where Duo deployment has been explicitly disabled, but the application or its remote monitor is still present. It triggers the uninstallation script to cleanly remove both.'
tags: ['uninstallation', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-07
---

## Summary

This internal monitor identifies computers that are no longer in scope for Duo Authentication for Windows Logon and queues them for automatic cleanup. It runs against all online Windows machines and checks the effective **DUO_Auth_Deployment** setting (Computer → Location → Client fallback). When the resolved value is **`Disable`**, it then verifies whether any remnants remain:

- The **Duo Authentication for Windows Logon** application is still installed (present in the Software tab).
- The **[Duo Authentication for Windows Logon Version Check](/docs/b75e9b1e-2035-4d68-bb4c-4d852012cace)** remote monitor still exists.

If either is present, the monitor returns **`Uninstall`**. The attached alert template **△ Custom - Execute Script - Duo Authentication for Windows Logon Uninstallation** immediately launches the [Duo Authentication for Windows Logon Uninstallation](/docs/46443094-762d-11f1-ba72-92000234cfc2) script. That script removes the application and deletes the remote monitor without opening tickets.

> **Important:** Computers where **DUO_Auth_Deployment** is not set (left empty at all levels) are **not** detected. Only an explicit `Disable` selection triggers uninstallation.

This monitor replaces the deprecated **ProVal - Production - Uninstall DUO** internal monitor.

## EDFs and Detection Logic

### EDFs Used

The monitor relies solely on the **DUO_Auth_Deployment** Extra Data Fields. All are in the **Duo_Auth** section.

| Name | Level | Type | Options | Section | Description |
|------|-------|------|---------|---------|-------------|
| DUO_Auth_Deployment | Client | Dropdown | `Workstations` · `Servers` · `Both` · `Disable` | Duo_Auth | Default deployment scope for all computers under this client. |
| DUO_Auth_Deployment | Location | Dropdown | `Workstations` · `Servers` · `Both` · `Disable` | Duo_Auth | Overrides the client setting for a specific location. |
| DUO_Auth_Deployment | Computer | Dropdown | `Workstations` · `Servers` · `Both` · `Disable` | Duo_Auth | Overrides all higher levels for a specific computer. |

### How the Decision is Made

1. **Resolve the effective deployment** – the monitor uses `COALESCE(NULLIF(…), …)` to walk the Computer → Location → Client chain, picking the first non‑empty value.  
2. **Only act on explicit `Disable`** – if the resolved value is **exactly** `'Disable'`, the machine is a candidate for cleanup. If all levels are empty (NULL), the computer is ignored.  
3. **Check for remnants** – for each candidate, the monitor checks:
   - Is **Duo Authentication for Windows Logon** still listed in the `software` table?
   - Does the **[Duo Authentication for Windows Logon Version Check](/docs/b75e9b1e-2035-4d68-bb4c-4d852012cace)** remote monitor exist in the `agents` table?
4. **Return action** – if **either** the application **or** the remote monitor exists, the computer is returned with `TestValue = 'Uninstall'`. If both are gone, the computer is already clean and is not returned.

### Example Scenarios

| Effective Deployment | App Installed? | Remote Monitor Present? | Action | Reason |
|----------------------|----------------|------------------------|--------|--------|
| `Disable` | Yes | Yes | **Uninstall** | Both remnants exist; full cleanup needed. |
| `Disable` | Yes | No | **Uninstall** | Application still present even though monitor was already removed. |
| `Disable` | No | Yes | **Uninstall** | Only the monitor remains; script will remove it. |
| `Disable` | No | No | None (skipped) | Machine is already clean – nothing to do. |
| Not set (NULL) | Yes | Yes | None (skipped) | Deployment was never configured; no uninstall should be performed. |
| `Workstations` / `Servers` / `Both` | Any | Any | None (skipped) | Deployment is still enabled; uninstall logic does not apply. |

## Dependencies

- [Script: Duo Authentication for Windows Logon Uninstallation](/docs/46443094-762d-11f1-ba72-92000234cfc2)
- [Remote Monitor: Duo Authentication for Windows Logon Version Check](/docs/b75e9b1e-2035-4d68-bb4c-4d852012cace)
- [Solution: Duo Authentication for Windows Logon Deployment](/docs/df469efc-a893-4332-91e6-7bbfcb019b4c)

## Target

Global

## Alert Template

`△ Custom - Execute Script - Duo Authentication for Windows Logon Uninstallation`

## Changelog

### 2026-07-07

- Initial version of the document.
- Replaces the deprecated **ProVal - Production - Uninstall DUO** internal monitor.
- Only triggers when deployment is explicitly `Disable` and remnants exist.
