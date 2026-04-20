---
id: 'f9976787-b457-4661-b325-5a12a5ebb9b4'
slug: /f9976787-b457-4661-b325-5a12a5ebb9b4
title: 'Initialize-HPBiosConfigUtility'
title_meta: 'Initialize-HPBiosConfigUtility'
keywords: ['hp', 'hp-bcu', 'hp-bios-config', 'bios', 'bios-configuration']
description: 'This script automates downloading/extracting the BCU package, verifying the BCU executable, running BCU to read or apply BIOS settings, and interpreting BCU exit codes into human-readable messages.'
tags: ['application', 'installation', 'hp', 'bios']
draft: false
unlisted: false
last_update:
  date: 2026-04-20
---

## Summary

This script automates downloading/extracting the BCU package, verifying the BCU executable, running BCU to read or apply BIOS settings, and interpreting BCU exit codes into human-readable messages.

For complete documentation on supported arguments, refer to: See [HP Documentation](https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/BIOS_Configuration_Utility_User_Guide.pdf) for supported parameters.

## Sample Run

![SampleRun1](../../../static/img/docs/f9976787-b457-4661-b325-5a12a5ebb9b4/21.webp)

## Dependencies

[Initialize-HPBiosConfigUtility](/docs/b5d53223-2755-48da-b4f5-a1cd5fa9f58f)

## Parameters

| Parameter  | Required | Type   | Details                                                                                                                                                                                                                                    | Description                                                |
| ---------- | -------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| `Argument` | False    | String | Arguments to execute. See [HP Documentation](https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/BIOS_Configuration_Utility_User_Guide.pdf) for supported parameters. | Follow the documentation for more details about the parameters. |        |

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.

![Export](../../../static/img/docs/f9976787-b457-4661-b325-5a12a5ebb9b4/22.webp)
The export will download the necessary XML file.

2. Import this XML file into the partner's VSA RMM instance.

![Export](../../../static/img/docs/f9976787-b457-4661-b325-5a12a5ebb9b4/23.webp)

## Examples

1. Execute it on the machine where its required with the parameter(setvalue:"After Power Loss","Power On").It will enable the Power on setting automatically after outage only on the HP Machines.

![Execute with Parameter](../../../static/img/docs/f9976787-b457-4661-b325-5a12a5ebb9b4/24.webp)

2. Execute it without parameters, defaults to showing help that displays the full list of BCU command-line switches.:
![Export](../../../static/img/docs/f9976787-b457-4661-b325-5a12a5ebb9b4/25.webp)

3. Execute it on the machine where its required with the parameter(/setvalue:"Fast Boot","Enable").It will enable the Fast boot on the HP Machines.

![Execute with Parameter](../../../static/img/docs/f9976787-b457-4661-b325-5a12a5ebb9b4/26.webp)


## Output

- Script Logs

-`C:\ProgramData\_automation\AgentProcedure\HPBiosConfigUtility\Initialize-HPBiosConfigUtility-log.txt`

-`C:\ProgramData\_automation\AgentProcedure\HPBiosConfigUtility\Initialize-HPBiosConfigUtility-error.txt`

## Changelog

### 2026-04-20

- Initial version of the document