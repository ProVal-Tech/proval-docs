---
id: 3c7cb0d9-ed0a-482f-8cfe-7072c87fd990
slug: /3c7cb0d9-ed0a-482f-8cfe-7072c87fd990
title: 'Create a PowerShell-based Role'
title_meta: 'Create a PowerShell-based Role'
keywords: ['powershell', 'role', 'windows', 'detection']
description: 'This document outlines the steps to create a PowerShell-based role for detecting specific conditions on Windows machines. It includes a detection string, comparator, and applicable operating systems for effective implementation.'
tags: ['windows', 'powershell', 'detection']
draft: false
unlisted: false
---

## Summary

This document outlines the process of creating roles in ConnectWise Automate using PowerShell.

## Process

1. Navigate to `System` > `Configuration` > `Dashboard`

![image](/static/img/3c7cb0d9-ed0a-482f-8cfe-7072c87fd990/image1.png)

2. Navigate to `Config` > `Configurations` > `Role Definitions` in `System Dashboard`.

![image](/static/img/3c7cb0d9-ed0a-482f-8cfe-7072c87fd990/image2.png)

3. Create a simple PowerShell command that you want to use.

    **Example**
    
    ```powershell
    (Get-NetAdapterBinding -Name '*' -ComponentID 'ms_tcpip6').Enabled
    ```
    **Possible Output**

    `0 | 1`

4. Fill the appropriate information in role definition. 

    **Role**: Name of the Role
    **Type**: Type of the Role. 
    **Sub-Type**: Sub-Type of the Role if any.
    **Applicable OS**: Operating System where the role definition applies.
    
    **Example**

    **Role**: IPv6 Enabled
    **Type**: PowerShell
    **Sub-Type**: Role
    **Applicable OS**: Windows

    ![image](/static/img/3c7cb0d9-ed0a-482f-8cfe-7072c87fd990/image3.png)

5. Convert the PowerShell string into the Detection string to be used.
    
    Format: `{%@C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "<Command>"@%}`

    Example: `{%@C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "(Get-NetAdapterBinding -Name '*' -ComponentID 'ms_tcpip6').enabled"@%}`

6. Paste the command in the `Detection` field. 
    Set the appropriate operator and comparator. 

    **Example** 

    **Detection**: `{%@C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "(Get-NetAdapterBinding -Name  '*' -ComponentID 'ms_tcpip6').enabled"@%}`
    **Operator**: `Equals`
    **Comparator**: `1`

    ![image](/static/img/3c7cb0d9-ed0a-482f-8cfe-7072c87fd990/image4.png)

7. Click the `Add` button to create the role.

    ![image](/static/img/3c7cb0d9-ed0a-482f-8cfe-7072c87fd990/image5.png)

8. Reload the system cache.

    ![image](/static/img/3c7cb0d9-ed0a-482f-8cfe-7072c87fd990/image6.png)

9. The role will take two to three hours to be detected on the computers. 