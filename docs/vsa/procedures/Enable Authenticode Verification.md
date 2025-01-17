---
id: '847585fe-5c51-4479-9562-9524ab687330'
title: 'Enable Authenticode Verification on Windows'
title_meta: 'Enable Authenticode Verification on Windows'
keywords: ['authenticode', 'verification', 'windows', 'script', 'reboot']
description: 'This document provides a detailed guide on enabling Authenticode Verification on Windows machines. It includes an example agent procedure log that demonstrates the successful execution of the script and the necessary reboot to apply changes.'
tags: ['recovery', 'security', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

This script is used to Enable the Authenticode Verification on the Windows machines, a reboot required for the changes to take effect.

## Example Agent Procedure Log

| Time                     | Action                                      | Result                                                                                       | User          |
|--------------------------|---------------------------------------------|----------------------------------------------------------------------------------------------|---------------|
| 10:36:25 am 23-Dec-24   | Enable Authenticode Verification             | Success ELSE                                                                                | kunal.kumar   |
| 10:36:25 am 23-Dec-24   | Execute Powershell Command                   | Success THEN                                                                                | kunal.kumar   |
| 10:36:24 am 23-Dec-24   | Execute Powershell Command-0012              | Results returned to global variable #global:psresult# and saved in Documents tab of server. | kunal.kumar   |
| 10:36:24 am 23-Dec-24   | Execute Powershell Command-0012              | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/160248129727106/GetFiles/../docs/psoutput.txt with the new contents from c:/kworking/psoutput.txt in THEN step 2. | kunal.kumar   |
| 10:36:24 am 23-Dec-24   | Execute Powershell Command-0011              | Powershell command completed!                                                                | kunal.kumar   |
| 10:36:22 am 23-Dec-24   | Execute Powershell Command-0011              | Executing powershell "" -Command "New-Item -Path "HKLM:/Software/Wow6432Node/Microsoft/Cryptography/Wintrust/Config" -Force | Out-Null; Set-ItemProperty -Path "HKLM:/Software/Wow6432Node/Microsoft/Cryptography/Wintrust/Config" -Name "EnableCertPaddingCheck" -Value 1 -Type DWord -Force" >"c:/kworking/psoutput.txt" | kunal.kumar   |
| 10:36:22 am 23-Dec-24   | Execute Powershell Command-0010              | Sending output to global variable.                                                           | kunal.kumar   |
| 10:36:22 am 23-Dec-24   | Execute Powershell Command-0008              | New command variable is: -Command "New-Item -Path "HKLM:/Software/Wow6432Node/Microsoft/Cryptography/Wintrust/Config" -Force | Out-Null; Set-ItemProperty -Path "HKLM:/Software/Wow6432Node/Microsoft/Cryptography/Wintrust/Config" -Name "EnableCertPaddingCheck" -Value 1 -Type DWord -Force" | kunal.kumar   |
| 10:36:22 am 23-Dec-24   | Execute Powershell Command-0008              | Custom commands detected as New-Item -Path "HKLM:/Software/Wow6432Node/Microsoft/Cryptography/Wintrust/Config" -Force | Out-Null; Set-ItemProperty -Path "HKLM:/Software/Wow6432Node/Microsoft/Cryptography/Wintrust/Config" -Name "EnableCertPaddingCheck" -Value 1 -Type DWord -Force | kunal.kumar   |
| 10:36:16 am 23-Dec-24   | Execute Powershell Command-0002              | Powershell is present.                                                                       | kunal.kumar   |
| 10:36:15 am 23-Dec-24   | Execute Powershell Command                   | Success THEN                                                                                | kunal.kumar   |
| 10:36:15 am 23-Dec-24   | Execute Powershell Command-0012              | Results returned to global variable #global:psresult# and saved in Documents tab of server. | kunal.kumar   |
| 10:36:15 am 23-Dec-24   | Execute Powershell Command-0012              | Informational: GetFile command overwrote the server file C:/Kaseya/UserProfiles/160248129727106/GetFiles/../docs/psoutput.txt with the new contents from c:/kworking/psoutput.txt in THEN step 2. | kunal.kumar   |
| 10:36:14 am 23-Dec-24   | Execute Powershell Command-0011              | Powershell command completed!                                                                | kunal.kumar   |
| 10:36:12 am 23-Dec-24   | Execute Powershell Command-0011              | Executing powershell "" -Command "New-Item -Path "HKLM:/Software/Microsoft/Cryptography/Wintrust/Config" -Force | Out-Null; Set-ItemProperty -Path "HKLM:/Software/Microsoft/Cryptography/Wintrust/Config" -Name "EnableCertPaddingCheck" -Value 1 -Type DWord -Force" >"c:/kworking/psoutput.txt" | kunal.kumar   |
| 10:36:12 am 23-Dec-24   | Execute Powershell Command-0010              | Sending output to global variable.                                                           | kunal.kumar   |
| 10:36:12 am 23-Dec-24   | Execute Powershell Command-0008              | New command variable is: -Command "New-Item -Path "HKLM:/Software/Microsoft/Cryptography/Wintrust/Config" -Force | Out-Null; Set-ItemProperty -Path "HKLM:/Software/Microsoft/Cryptography/Wintrust/Config" -Name "EnableCertPaddingCheck" -Value 1 -Type DWord -Force" | kunal.kumar   |
| 10:36:12 am 23-Dec-24   | Execute Powershell Command-0008              | Custom commands detected as New-Item -Path "HKLM:/Software/Microsoft/Cryptography/Wintrust/Config" -Force | Out-Null; Set-ItemProperty -Path "HKLM:/Software/Microsoft/Cryptography/Wintrust/Config" -Name "EnableCertPaddingCheck" -Value 1 -Type DWord -Force | kunal.kumar   |
| 10:36:06 am 23-Dec-24   | Execute Powershell Command-0002              | Powershell is present.                                                                       | kunal.kumar   |
| 10:36:05 am 23-Dec-24   | Windows - 32 or 64 bit OS                    | Success THEN                                                                                | kunal.kumar   |
| 10:36:05 am 23-Dec-24   | Windows - 32 or 64 bit OS-0011               | Windows OS is 64-bit.                                                                        | kunal.kumar   |
| 10:35:57 am 23-Dec-24   | Run Now - Enable Authenticode Verification    | Admin kunal.kumar scheduled procedure Run Now - Enable Authenticode Verification to run at Dec 23 2024 10:35AM | kunal.kum     |

## Output

Agent procedure log.











