---
id: '1adb82ca-d3cb-4319-9319-5d22b569ed6f'
title: 'Enable or Disable SSL and TLS Protocols'
title_meta: 'Enable or Disable SSL and TLS Protocols'
keywords: ['ssl', 'tls', 'internet-explorer', 'security', 'registry']
description: 'This script allows users to enable or disable various SSL and TLS protocols based on user input. It modifies the machine-level registry settings for Internet Explorer to set the desired security protocols, providing a flexible solution for managing secure connections.'
tags: ['internet-explorer', 'security', 'configuration', 'windows', 'update']
draft: false
unlisted: false
---
## Summary

This script will enable or disable SSL 2.0, SSL 3.0, TLS 1.0, TLS 1.1 and TLS 1.2 depending upon the user's choice via providing input in the parameter.

Time Saved by Automation: 15 Minutes

## Sample Run

![Sample Run](../../../static/img/Internet-Explorer-Advanced-SSL-and-TLS-Settings/image_1.png)

## Dependencies

[Internet Explorer Advanced SSL and TLS Settings [Script]](https://proval.itglue.com/DOC-5078775-7772468)

## Variables

Permission -- User Parameter  
Various options are:

- permission = '0' THEN 'Use no secure protocols'
- permission = 'SSL2' THEN 'Only use SSL 2.0'
- permission = 'SSL3' THEN 'Only use SSL 3.0'
- permission = 'SSL23' THEN 'Use SSL 2.0 and SSL 3.0'
- permission = 'TLS0' THEN 'Only use TLS 1.0'
- permission = 'SSL2TLS0' THEN 'Use SSL 2.0 and TLS 1.0'
- permission = 'SSL3TLS0' THEN 'Use SSL 3.0 and TLS 1.0'
- permission = 'SSL23TLS0' THEN 'Use SSL 2.0 SSL 3.0 and TLS 1.0'
- permission = 'TLS1' THEN 'Only use TLS 1.1'
- permission = 'SSL2TLS1' THEN 'Use SSL 2.0 and TLS 1.1'
- permission = 'SSL3TLS1' THEN 'Use SSL 3.0 and TLS 1.1'
- permission = 'SSL23TLS1' THEN 'Use SSL 2.0 SSL 3.0 and TLS 1.1'
- permission = 'TLS01' THEN 'Use TLS 1.0 and TLS 1.1'
- permission = 'SSL2TLS01' THEN 'Use SSL 2.0 TLS 1.0 and TLS 1.1'
- permission = 'SSL3TLS01' THEN 'Use SSL 3.0 TLS 1.0 and TLS 1.1'
- permission = 'SSL23TLS01' THEN 'Use SSL 2.0 SSL 3.0 TLS 1.0 and TLS 1.1'
- permission = 'TLS2' THEN 'Only use TLS 1.2'
- permission = 'SSL2TLS2' THEN 'Use SSL 2.0 and TLS 1.2'
- permission = 'SSL3TLS2' THEN 'Use SSL 3.0 and TLS 1.2'
- permission = 'SSL23TLS2' THEN 'Use SSL 2.0 SSL 3.0 and TLS 1.2'
- permission = 'TLS02' THEN 'Use TLS 1.0 and TLS 1.2'
- permission = 'SSL2TLS02' THEN 'Use SSL 2.0 TLS 1.0 and TLS 1.2'
- permission = 'SSL3TLS02' THEN 'Use SSL 3.0 TLS 1.0 and TLS 1.2'
- permission = 'SSL23TLS02' THEN 'Use SSL 2.0 SSL 3.0 TLS 1.0 and TLS 1.2'
- permission = 'TLS12' THEN 'Use TLS 1.1 and TLS 1.2'
- permission = 'SSL2TLS12' THEN 'Use SSL 2.0 TLS 1.1 and TLS 1.2'
- permission = 'SSL3TLS12' THEN 'Use SSL 3.0 TLS 1.1 and TLS 1.2'
- permission = 'SSL23TLS12' THEN 'Use SSL 2.0 SSL 3.0 TLS 1.1 and TLS 1.2'
- permission = 'TLS012' THEN 'Use TLS 1.0 TLS 1.1 and TLS 1.2'
- permission = 'SSL2TLS012' THEN 'Use SSL 2.0 TLS 1.0 TLS 1.1 and TLS 1.2'
- permission = 'SSL3TLS012' THEN 'Use SSL 3.0 TLS 1.0 TLS 1.1 and TLS 1.2'
- permission = 'SSL23TLS012' THEN 'Use SSL 2.0 SSL 3.0 TLS 1.0 TLS 1.1 and TLS 1.2'
- ELSE permission = '' or provided any other value then status would be 'Not Detected'

#### User Parameters

| Name         | Example      | Required | Description                                                                 |
|--------------|--------------|----------|-----------------------------------------------------------------------------|
| permission   | SSL23TLS12   | True     | It will set IE Advance setting to 'Use SSL 2.0 SSL 3.0 TLS 1.1 and TLS 1.2'|

#### Script States

| Name                    | Example                     | Description                                                               |
|-------------------------|-----------------------------|---------------------------------------------------------------------------|
| InternetExplorerSecurity | Store @permission@ Value    | This stores information of computerid and value provided by user where script ran.|

## Process

- This script executes the PowerShell query to set the TLS and SSL setting. The PowerShell changes the machine level registry settings for the Internet Explorer.
- The logic of abbreviations are: If you want to set SSL2.0 and TLS1.0, TLS 1.1 enabled, then you have right as SSL2TLS01. SSL should be written first and write number which you want to enable, same for TLS write the number which you want to enable.
- The other value list are shown in variables column.
- Write Permission value without '' (quotation) for example permission = SSL2, SSL23, TLS1, SSL2TLS12 ....etc

## Output

- Script log
- Script state
- Dataview







