---
id: '147ab797-98c3-410d-ab22-e29627e7582a'
title: 'Get SQL Data and Send as Report'
title_meta: 'Get SQL Data and Send as Report'
keywords: ['sql', 'report', 'email', 'csv', 'server']
description: 'This document provides a detailed overview of how to retrieve SQL data and send it as a report via email. It outlines the necessary parameters, including credential types, SQL server details, and email configurations required for successful execution.'
tags: ['database', 'email', 'report', 'windows']
draft: false
unlisted: false
---
## Summery

Get SQL Data and Send as Report  

## Parameter:

- **credtype**: Required. [sql] or [windows]  
- **sqlserver**: Required. The name or IP of the SQL server  
- **sqlfile**: Required. The path to query file to run. Example: `c://kworking//sqlquery.sql`  
- **msgto**: Required. The target email address  
- **msgsubject**: Required. The email subject line  
- **filename**: Required. The filename of the csv  
- **sqluser**: Required if sql credtype. The username to logon to the SQL server  
- **sqlpassword**: Required if sql credtype. The password to logon to the SQL server  












