---
id: 'af67ed08-40af-4899-ae8f-5e64f9bfb851'
slug: /af67ed08-40af-4899-ae8f-5e64f9bfb851
title: 'Execute Script - Winget App Audit'
title_meta: 'Execute Script - Winget App Audit'
keywords: ['winget', 'audit', 'windows', 'script', 'software']
description: 'This internal monitor executes the Winget App Audit script weekly on Windows machines where auditing is enabled. It ensures that application inventory data is collected at least once every seven days.'
tags: ['security', 'software', 'update', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-30
---

## Summary

This internal monitor executes the **[Winget App Audit](/docs/d5ea54f9-07c9-443b-acc2-411401cfbe91)** script on Windows machines where the auditing component of the Winget Auto Update solution is enabled. It detects computers that have not been audited in the past seven days and triggers the script to collect up‑to‑date application inventory data.

Auditing is considered enabled when the client‑level **Winget Auto Update** EDF is set to `Enabled for Servers and Workstations`, `Enabled for Workstations Only` (for workstations), or `Audit Only`, and the computer is not excluded at the computer, location, or client level. Computers where the audit script has failed more than twice in the last seven days are temporarily excluded to avoid repeated failures.

## Dependencies

- [Script - Winget App Audit](/docs/d5ea54f9-07c9-443b-acc2-411401cfbe91)  
- [Custom Table - pvl_winget_audit](/docs/904989a6-fe21-4e40-adb6-17d1168c830e)  
- [Solution - Winget Auto Update](/docs/92b2ccf2-534f-46b6-b1d1-dd77dea47ba8)  

## Target

Global

## Alert Template

`△ Custom - Execute Script - Winget App Audit`

## Changelog

### 2026-06-30

- Updated the monitor query to use the new **Winget Auto Update** EDF structure, including the `Audit Only` option.
- Removed the dependency on the `agentignore` table; exclusions are now fully driven by the EDFs.
- Adjusted logic to support the new single‑pass audit script that internally handles both system and user contexts.

### 2025-04-10

- Initial version of the document
