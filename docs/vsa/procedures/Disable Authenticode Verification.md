---
id: 'c2cf8ecb-a36e-4180-8503-e3be4d03f9c5'
slug: /c2cf8ecb-a36e-4180-8503-e3be4d03f9c5
title: 'Disable Authenticode Verification'
title_meta: 'Disable Authenticode Verification'
keywords: ['authenticode', 'windows', 'verification', 'disable', 'reboot']
description: 'This document provides a detailed overview of a script used to disable the Authenticode verification on Windows machines. It includes an example of the agent procedure log demonstrating the execution and results of the script, along with the necessary reboot for changes to take effect.'
tags: ['recovery', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script is used to disable the Authenticode verification on Windows machines. A reboot is required for the changes to take effect.

## Example Agent Procedure Log

| Time                     | Action                                   | Result                                                                                                            | User          |
|--------------------------|------------------------------------------|-------------------------------------------------------------------------------------------------------------------|---------------|
| 10:55:04 am 23-Dec-24   | Disable Authenticode Verification        | Success                                                                                                          | kunal.kumar   |
| 10:55:04 am 23-Dec-24   | Execute Powershell Command               | Success                                                                                                          | kunal.kumar   |
| 10:55:04 am 23-Dec-24   | Execute Powershell Command-0012          | Results returned to global variable #global:psresult# and saved in Documents tab of server.                     | kunal.kumar   |
| 10:55:04 am 23-Dec-24   | Execute Powershell Command-0012          | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/160248129727106/GetFiles/../docs/psoutput.txt with the new contents from c:/kworking/psoutput.txt in THEN step 2. | kunal.kumar   |
| 10:55:04 am 23-Dec-24   | Execute Powershell Command-0011          | Powershell command completed!                                                                                   | kunal.kumar   |
| 10:55:01 am 23-Dec-24   | Execute Powershell Command-0011          | Executing powershell "" -Command "Remove-ItemProperty -Path "HKLM:/Software/Wow6432Node/Microsoft/Cryptography/Wintrust/Config" -Name "EnableCertPaddingCheck" -ErrorAction SilentlyContinue" >"c:/kworking/psoutput.txt" | kunal.kumar   |
| 10:55:01 am 23-Dec-24   | Execute Powershell Command-0010          | Sending output to global variable.                                                                                | kunal.kumar   |
| 10:55:01 am 23-Dec-24   | Execute Powershell Command-0008          | New command variable is: -Command "Remove-ItemProperty -Path "HKLM:/Software/Wow6432Node/Microsoft/Cryptography/Wintrust/Config" -Name "EnableCertPaddingCheck" -ErrorAction SilentlyContinue" | kunal.kumar   |
| 10:55:01 am 23-Dec-24   | Execute Powershell Command-0008          | Custom commands detected as Remove-ItemProperty -Path "HKLM:/Software/Wow6432Node/Microsoft/Cryptography/Wintrust/Config" -Name "EnableCertPaddingCheck" -ErrorAction SilentlyContinue | kunal.kumar   |
| 10:54:57 am 23-Dec-24   | Execute Powershell Command-0002          | Powershell is present.                                                                                           | kunal.kumar   |
| 10:54:56 am 23-Dec-24   | Execute Powershell Command                | Success                                                                                                          | kunal.kumar   |
| 10:54:55 am 23-Dec-24   | Execute Powershell Command-0012          | Results returned to global variable #global:psresult# and saved in Documents tab of server.                     | kunal.kumar   |
| 10:54:55 am 23-Dec-24   | Execute Powershell Command-0012          | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/160248129727106/GetFiles/../docs/psoutput.txt with the new contents from c:/kworking/psoutput.txt in THEN step 2. | kunal.kumar   |
| 10:54:55 am 23-Dec-24   | Execute Powershell Command-0011          | Powershell command completed!                                                                                   | kunal.kumar   |
| 10:54:53 am 23-Dec-24   | Execute Powershell Command-0011          | Executing powershell "" -Command "Remove-ItemProperty -Path "HKLM:/Software/Microsoft/Cryptography/Wintrust/Config" -Name "EnableCertPaddingCheck" -ErrorAction SilentlyContinue" >"c:/kworking/psoutput.txt" | kunal.kumar   |
| 10:54:53 am 23-Dec-24   | Execute Powershell Command-0010          | Sending output to global variable.                                                                                | kunal.kumar   |
| 10:54:53 am 23-Dec-24   | Execute Powershell Command-0008          | New command variable is: -Command "Remove-ItemProperty -Path "HKLM:/Software/Microsoft/Cryptography/Wintrust/Config" -Name "EnableCertPaddingCheck" -ErrorAction SilentlyContinue" | kunal.kumar   |
| 10:54:53 am 23-Dec-24   | Execute Powershell Command-0008          | Custom commands detected as Remove-ItemProperty -Path "HKLM:/Software/Microsoft/Cryptography/Wintrust/Config" -Name "EnableCertPaddingCheck" -ErrorAction SilentlyContinue | kunal.kumar   |
| 10:54:48 am 23-Dec-24   | Execute Powershell Command-0002          | Powershell is present.                                                                                           | kunal.kumar   |
| 10:54:46 am 23-Dec-24   | Windows - 32 or 64 bit OS                | Success                                                                                                          | kunal.kumar   |
| 10:54:46 am 23-Dec-24   | Windows - 32 or 64 bit OS-0011           | Windows OS is 64-bit.                                                                                            | kunal.kumar   |
| 10:54:38 am 23-Dec-24   | Run Now - Disable Authenticode Verification | Admin kunal.kumar scheduled procedure Run Now - Disable Authenticode Verification to run at Dec 23 2024 10:54 AM | kuna          |

## Output

Agent procedure log.


