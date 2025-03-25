---
id: '264d107c-e4be-4915-8df1-7be61f8e6f07'
slug: /264d107c-e4be-4915-8df1-7be61f8e6f07
title: 'FTP - Download File'
title_meta: 'FTP - Download File'
keywords: ['ftp', 'download', 'file', 'script', 'automation']
description: 'This document provides a comprehensive overview of a script designed to download files from a specified FTP server. It includes details on user parameters, process flow, and output logging to ensure successful execution and error handling.'
tags: ['ftp', 'windows']
draft: false
unlisted: false
---

## Summary

This script will download a file from the target FTP server.

**Time Saved by Automation:** 10-20 Minutes

## Sample Run

![Sample Run](../../../static/img/FTP---Download-File/image_1.png)

## Variables

| Variable      | Description                                                                                       |
|---------------|---------------------------------------------------------------------------------------------------|
| PS_Results    | This stores the PowerShell script output, indicating whether the file was successfully downloaded from the provided FTP server or not. |

### User Parameters

| Name               | Example                                 | Required | Description                                                  |
|--------------------|-----------------------------------------|----------|--------------------------------------------------------------|
| FTP_Server_Path    | [https://ftp.server/download](https://ftp.server/download) | True     | The FTP server path where the file is stored.               |
| FTP_Username       | test_user                               | True     | The FTP username to access the FTP site.                    |
| FTP_Password       | testing@123                             | True     | The FTP password to access the FTP site.                    |
| FTP_Filename       | Filename.zip                            | True     | The filename with extension to download from the FTP site.  |
| Download_to_Path   | C:/Windows/Temp/Folder                  | True     | The local destination path on the agent.                     |

## Process

- This script will attempt to download the file from the FTP site.
- It will first check whether all user parameters are provided; if not, the script will exit. If all parameters are provided, it will attempt to download the file from the FTP site as per the provided details.
- It will log the output in the script indicating whether the download was successful or not.

## Output

- Script log


