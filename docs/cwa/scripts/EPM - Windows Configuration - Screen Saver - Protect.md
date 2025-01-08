---
id: 'cwa-enforce-screen-saver-settings'
title: 'Enforce Screen Saver Settings'
title_meta: 'Enforce Screen Saver Settings'
keywords: ['screen', 'saver', 'timeout', 'ticketing', 'domain', 'configuration']
description: 'This document outlines the process to ensure that the screen saver settings are enabled and configured to a specified timeout. It includes sample runs, dependencies, global and user parameters, and expected output files.'
tags: ['configuration', 'security', 'windows', 'setup']
draft: false
unlisted: false
---
## Summary

Ensures that the screen saver settings are enabled and set to the specified timeout.

## Sample Run

![Sample Run](5078775/docs/8384885/images/11690298)

## Dependencies

[Protect-ScreenLock](https://proval.itglue.com/DOC-5078775-8381648)

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

See [Protect-ScreenLock](https://proval.itglue.com/DOC-5078775-8381648)

## Output

```
.\Protect-ScreenLock-log.txt
.\Protect-ScreenLock-data.txt
.\Protect-ScreenLock-error.txt
.\gpresult_computer.html
.\gpresult_user.html
```


