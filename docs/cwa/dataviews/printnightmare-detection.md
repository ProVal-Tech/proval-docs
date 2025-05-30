---
id: 'f016ea11-da3b-4834-a5f0-3a55e3e3ad53'
slug: /f016ea11-da3b-4834-a5f0-3a55e3e3ad53
title: 'PrintNightMare Detection'
title_meta: 'PrintNightMare Detection'
keywords: ['printnightmare', 'vulnerability', 'cve-2021-1675', 'mitigation', 'status']
description: 'This document provides a comprehensive overview of the PrintNightMare vulnerability, detailing its dependencies, relevant CVEs, and a dataview that summarizes key information about affected clients and systems.'
tags: ['networking', 'print', 'security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview will collectively show all required information about the PrintNightMare vulnerability.

## Dependencies

- [CVE-2021-1675 - Set Folder ACL (PrintNightmare)](/docs/158a1816-be64-428f-b5fa-f0c6b8b6c1fb)
- [CVE-2021-1675 - Restore Folder ACL Permission](/docs/cb79f759-a6a8-41ca-bb55-619cb48d635f)
- [Point and Print Nightmare Check](/docs/d65da81c-76ee-429a-a007-9ef788f2ee51)

## Columns

| Column                     | Description                             |
|---------------------------|-----------------------------------------|
| Client Name               | Client Name                             |
| Location Name             | Location Name                           |
| Computer Name             | Computer Name                           |
| Operating System          | OS Info of Computer                    |
| Last Contact              | Last contact of agent with RMM         |
| Point And Print Status    | Point and Print Registry check         |
| CVE-2021-34527 Patch      | CVE patch install status               |
| Mitigation Status         | Confirms whether mitigation was applied or not. |