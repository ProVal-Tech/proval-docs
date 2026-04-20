---
id: '38c0c930-3178-48a0-83d6-410c303b329b'
slug: /38c0c930-3178-48a0-83d6-410c303b329b
title: 'Initialize-DellCommandConfigure'
title_meta: 'Initialize-DellCommandConfigure'
keywords: ['dell', 'dcu', 'dell-command', 'dell-command-configure', 'bios-configuration', 'bios']
description: 'Automates installation, updating, and execution of Dell Command | Configure (DCC) on Dell workstations. Ensures the latest version is present and provides command-line automation for BIOS configuration operations with comprehensive error handling and logging and it will always prompt for parameters.'
tags: ['application', 'installation', 'software', 'dell', 'bios']
draft: false
unlisted: false
last_update:
  date: 2026-04-20
---

## Summary

Automates installation, updating, and execution of Dell Command | Configure (DCC) on Dell workstations. Ensures the latest version is present and provides command-line automation for BIOS configuration operations with comprehensive error handling and logging.

For complete documentation on supported arguments, refer to: See [Dell Documentation](https://www.dell.com/support/manuals/en-in/command-configure-v4.2/dcc_cli_4.2/bios-options?guid=guid-44c059be-b76d-4b2f-b8ef-655f736c40ce&lang=en-us) for supported parameters.  

## Sample Run

![SampleRun1](../../../static/img/docs/38c0c930-3178-48a0-83d6-410c303b329b/11.webp)

**Note:** `If an argument contains double quotes ("), they must be escaped by using them twice (""silent""). Otherwise, the command will not execute correctly.`

## Dependencies

[Initialize-DellCommandUpdate](/docs/aa963f3d-f149-4bfa-8fdc-30f12c21ce7f)

## Parameters

| Parameter  | Required | Type   | Details                                                                                                                                                                  | Description                                                                      |
| ---------- | -------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------- |
| `Argument` | False    | String | DCU-CLI arguments to execute. See [Dell Documentation](https://www.dell.com/support/manuals/en-in/command-configure-v4.2/dcc_cli_4.2/bios-options?guid=guid-44c059be-b76d-4b2f-b8ef-655f736c40ce&lang=en-us) for supported parameters. | Follow the documentation for more details about the parameters |

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.

![Export](../../../static/img/docs/38c0c930-3178-48a0-83d6-410c303b329b/12.webp)
The export will download the necessary XML file.

2. Import this XML file into the partner's VSA RMM instance.
![Import](../../../static/img/docs/38c0c930-3178-48a0-83d6-410c303b329b/13.webp)

## Examples

1. Execute it on the machine where its required with the parameter(--AcPwrRcvry on).It will enable the Power on setting automatically after outage only on the Dell Machines.
![Execute with Parameter](../../../static/img/docs/38c0c930-3178-48a0-83d6-410c303b329b/14.webp)

2. Execute it without parameters, defaults to showing help:
![Execute without Parameter](../../../static/img/docs/38c0c930-3178-48a0-83d6-410c303b329b/15.webp)

3. Execute it with parameters(--ActivityLed ActLed), It will Sets the Activity LED controlled by an Advanced Configuration and Power Interface (ACPI)operating system and driver.:
![Execute without Parameter](../../../static/img/docs/38c0c930-3178-48a0-83d6-410c303b329b/16.webp)

## Output

- Script Logs

- `C:\ProgramData\_automation\AgentProcedure\DellCommandConfigure\Initialize-DellCommandConfigure-log.txt`

- `C:\ProgramData\_automation\AgentProcedure\DellCommandConfigure\Initialize-DellCommandConfigure-error.txt`

### Changelog

### 2026-04-20

- Initial version of the document