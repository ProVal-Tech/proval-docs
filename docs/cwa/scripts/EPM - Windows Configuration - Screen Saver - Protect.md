---
id: '952db509-c813-4225-a53f-7423d174ef24'
title: 'Enforce Screen Saver Settings'
title_meta: 'Enforce Screen Saver Settings'
keywords: ['screen', 'saver', 'timeout', 'ticketing', 'domain', 'configuration']
description: 'This document outlines the process to ensure that the screen saver settings are enabled and configured to a specified timeout. It includes sample runs, dependencies, global and user parameters, and expected output files.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document ensures that the screen saver settings are enabled and set to the specified timeout.

## Sample Run

![Sample Run](../../../static/img/EPM---Windows-Configuration---Screen-Saver---Protect/image_1.png)

## Dependencies

[Protect-ScreenLock](<../../powershell/Protect-ScreenLock.md>)

## Variables

`@FileAttachUser@` - Dynamic UserID for attaching files to a ticket.

### Global Parameters

| Name             | Example | Required | Description                                                                                              |
|------------------|---------|----------|----------------------------------------------------------------------------------------------------------|
| EnableTicketing  | 1       | True     | Set to 1 to enable ticketing when a domain exception is in place and the settings are not set properly. |

### User Parameters

| Name             | Example | Required | Description                                                                                              |
|------------------|---------|----------|----------------------------------------------------------------------------------------------------------|
| Timeout          | 900     | True     | The timeout in seconds to set for the screen saver.                                                     |
| DomainException   | 1       | False    | Set to 1 to run a GPRESULT instead of making configuration changes when a machine is part of a domain. |

## Process

See [Protect-ScreenLock](<../../powershell/Protect-ScreenLock.md>)

## Output

```
./Protect-ScreenLock-log.txt
./Protect-ScreenLock-data.txt
./Protect-ScreenLock-error.txt
./gpresult_computer.html
./gpresult_user.html
```

