---
id: 'cwa-cve-2021-1675-dataview'
title: 'CVE-2021-1675 Dataview'
title_meta: 'CVE-2021-1675 Dataview'
keywords: ['cve', 'dataview', 'script', 'results', 'vulnerability']
description: 'This document provides a summary of the dataview that displays results from the CWA Script related to the CVE-2021-1675 vulnerability, including dependencies and a detailed description of the columns presented in the dataview.'
tags: ['cve', 'script', 'results', 'database', 'report', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview will display the results from the [CWA Script - CVE-2021-1675 - Set folder ACL](https://proval.itglue.com/DOC-5078775-7798632) script running against machines related to the CVE-2021-1675 vulnerability.

## Dependencies

The script [CWA Script - CVE-2021-1675 - Set folder ACL](https://proval.itglue.com/DOC-5078775-7798632) must be running in the environment for this dataview to display the appropriate data.

The script should be imported via the ProVal plugin to ensure the GUID does not change on import. The GUID for the script is hardcoded into the SQL.

## Columns

| Column     | Description                                                                 |
|------------|-----------------------------------------------------------------------------|
| Client     | The name of the client associated with the machine                          |
| Location   | The name of the location associated with the machine                        |
| Computer   | The computer associated with the results of the script                      |
| Status     | This is the Script State "Result" column from the script                   |
| Last Run   | This is the most recent date that the script was run against the target device |



