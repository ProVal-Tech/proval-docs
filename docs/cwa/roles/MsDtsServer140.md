---
id: 'cwa-discover-ssis'
title: 'Discovers SSIS (SQL Server Integration Services)'
title_meta: 'Discovers SSIS (SQL Server Integration Services)'
keywords: ['ssis', 'sql', 'server', 'integration', 'services', 'detection', 'windows']
description: 'This document provides a summary of how to discover SQL Server Integration Services (SSIS) across various SQL Server versions. It includes a table of detection strings and their respective services for different SQL Server installations, along with applicable operating systems.'
tags: ['sql', 'service', 'windows', 'detection', 'configuration']
draft: false
unlisted: false
---
## Summary

Discovers SSIS (SQL Server Integration Services)

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
| {%@sc queryex type= service | find /i "MsDtsServer140"@%} | Contains   | MsDtsServer140   | Windows        |



