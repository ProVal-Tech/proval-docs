---
id: '3f1ceeb2-1a6d-4db8-b697-8f30f6ffd3db'
slug: /3f1ceeb2-1a6d-4db8-b697-8f30f6ffd3db
title: 'MsDtsServer140'
title_meta: 'MsDtsServer140'
keywords: ['ssis', 'sql', 'server', 'integration', 'services', 'detection', 'windows']
description: 'This document provides a summary of how to discover SQL Server Integration Services (SSIS) across various SQL Server versions. It includes a table of detection strings and their respective services for different SQL Server installations, along with applicable operating systems.'
tags: ['sql', 'windows']
draft: false
unlisted: false
---

## Summary

This document discusses how to discover SQL Server Integration Services (SSIS).

```
SQL Server        Service Name
SQL 2008          MsDtsServer100
SQL 2012          MsDtsServer110
SQL 2014          MsDtsServer120
SQL 2016          MsDtsServer130
SQL 2017          MsDtsServer140
SQL 2019          MsDtsServer150
```

## Settings

| Detection String                                         | Comparator | Result           | Applicable OS |
|---------------------------------------------------------|------------|------------------|----------------|
| \{%@sc queryex type= service | find /i "MsDtsServer140"@%} | Contains   | MsDtsServer140   | Windows        |