---
id: '6da85c3b-f91a-4952-b69f-0345c721c6da'
slug: /6da85c3b-f91a-4952-b69f-0345c721c6da
title: 'SSL Certificate Audit'
title_meta: 'SSL Certificate Audit'
keywords: ['certificates', 'audit', 'expiration', 'status', 'thumbprint', 'issuer', 'subject', 'client', 'computer']
description: 'This Script pulls any and all certificates in the personal certificate repository on windows machines that it is run on.'
tags: ['windows','auditing','certificates']
draft: false
unlisted: false
last_update:
  date: 2026-04-08
---

## Summary

This Script pulls any and all certificates in the personal certificate repository on windows machines that it is run on. Then Creates a CSV file under the `C:\ProgramData\_automation\AgentProcedure\SSLAudit`

## Sample Run

![SampleRun1](../../../static/img/docs/6da85c3b-f91a-4952-b69f-0345c721c6da/ssl.webp)

## Requirement

Upload the powershell file rom the location `VSASharedFiles\Client Specific Powershell\Groff\Check-SSl-Certificate.ps1` into the client environment's managed files.

Map the ps1 file under the line number 11.

## Output

Script log
`C:\ProgramData\_automation\AgentProcedure\SSLAudit\.csv-file-name`

## Changelog

### 2026-04-08

- Initial version of the document