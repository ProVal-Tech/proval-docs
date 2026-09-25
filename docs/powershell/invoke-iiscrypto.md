---
id: '71437aaf-ed94-4950-a746-02b6bf6eb867'
slug: /71437aaf-ed94-4950-a746-02b6bf6eb867
title: 'Invoke-IISCrypto'
title_meta: 'Invoke-IISCrypto'
keywords: ['cipher','ssl','tls']
description: 'Retrieves current settings or applies an IIS Crypto template on the system'
tags: ['auditing','iis','networking','security']
draft: false
unlisted: false
last_update:
  date: 2025-09-25
---

## Description

Checks or updates the Windows settings that control secure connections, using IIS Crypto templates.

You can:

- View the current settings. Nothing is changed.
- Apply a template from a web URL, a network share, or a local file.
- Apply a template and view the results in a single run.

A setting that shows a value of null has not been changed. Windows is still using its default for that setting.

## Requirements

To apply a template, provide one of the following locations:

- A download URL starting with http:// or https://
- A network share, for example \\fileserver\share\template.ictpl
- A local file path, for example C:\Temp\template.ictpl

Prebuilt and custom templates are described in the Custom Templates section of this page: https://www.nartac.com/Products/IISCrypto

Applying a template may require a restart. Use AllowReboot to restart automatically, or restart the computer yourself afterwards.

## Usage

View the current IISCrypto configuration:

```powershell
.\Invoke-IISCrypto.ps1 -Audit
```

Apply a template from a URL:

```powershell
.\Invoke-IISCrypto.ps1 -ApplyTemplate -TemplateSource 'https://templateurl.com/template.ictpl'
```

Apply a template from a network share and allow an automatic restart:

```powershell
.\Invoke-IISCrypto.ps1 -ApplyTemplate -TemplateSource '\\fileserver\share\template.ictpl' -AllowReboot
```

Apply a local template, choose the backup location, then view the new settings:

```powershell
.\Invoke-IISCrypto.ps1 -ApplyTemplate -TemplateSource 'C:\Temp\template.ictpl' -Audit -RegistryBackupPath 'C:\Temp\backup.reg'
```

Existing calls that use -TemplateURL keep working. No changes are needed.

## Parameters

| Parameter            | Alias         | Required                 | Default                     | Type   | Description                                                            |
| -------------------- | ------------- | ------------------------ | --------------------------- | ------ | ---------------------------------------------------------------------- |
| `Audit`              |               | False                    |                             | Switch | Shows the current settings without changing anything                  |
| `ApplyTemplate`      |               | False                    |                             | Switch | Applies the template given by TemplateSource                           |
| `TemplateSource`     | `TemplateURL` | Only with ApplyTemplate  |                             | String | Location of the template: a URL, network share, or local file          |
| `AllowReboot`        |               | False                    |                             | Switch | Restarts the computer automatically after a template is applied        |
| `RegistryBackupPath` |               | False                    | `backup.reg` (next to the script) | String | Where to save the copy of settings made before applying a template |

## Output

Where to find results, logs, and errors:

- Settings: shown when Audit is used. Each setting appears with a name and value.
- Logs: `.\Invoke-IISCrypto-log.txt`
- Errors: `.\Invoke-IISCrypto-error.txt`
- Backup: a copy of the previous settings, saved as `backup.reg` next to the script unless RegistryBackupPath is set.

## Changelog

### 2025-09-25

- Renamed TemplateURL to TemplateSource. The old parameter name still works.
- Templates can now come from a URL, a network share, or a local file.
- Added AllowReboot to allow an automatic restart after applying a template.
- Added RegistryBackupPath to choose where the settings backup is saved.
- When Audit and ApplyTemplate are used together, the template is applied first and the new settings are then shown.

### 2025-05-20

- Initial version of the document
