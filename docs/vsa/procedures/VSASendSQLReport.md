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

## Summary

Get SQL Data and Send as Report  

## Parameters:

- **credtype**: Required. Can be either `[sql]` or `[windows]`.  
- **sqlserver**: Required. The name or IP address of the SQL server.  
- **sqlfile**: Required. The path to the query file to run. Example: `c://kworking//sqlquery.sql`.  
- **msgto**: Required. The target email address.  
- **msgsubject**: Required. The email subject line.  
- **filename**: Required. The filename of the CSV.  
- **sqluser**: Required if using SQL credtype. The username to log in to the SQL server.  
- **sqlpassword**: Required if using SQL credtype. The password to log in to the SQL server.  

