---
id: '0562cbb5-db83-486a-84ae-730abd583fab'
slug: /0562cbb5-db83-486a-84ae-730abd583fab
title: 'Install Datto RMM Agent [Windows]'
title_meta: 'Install Datto RMM Agent [Windows]'
keywords: ['datto-rmm', 'migration', 'datto']
description: 'Executes the installation script against Windows machines where the Datto RMM Agent is not installed.'
tags: ['application', 'installation']
draft: false
unlisted: false
---

## Summary

Executes the [installation script](/docs/7920577d-9a4a-48d0-9102-b01c27c2e00f) against Windows machines where the Datto RMM Agent is not installed.

## Dependencies

- [Dynamic Group: Datto RMM Agent Installation [Windows]](/docs/f2349473-6980-4336-a294-37d9cdbc7e4d)
- [Task: Install Datto RMM Agent](/docs/7920577d-9a4a-48d0-9102-b01c27c2e00f)
- [Solution : Deploy Datto RMM Agent](/docs/b646e989-5515-4bda-9728-107ac03cdc07)

## Monitor Setup Location

**Monitors Path:** `ENDPOINTS` ➞ `Alerts` ➞ `Monitors`  

## Monitor Summary

- **Name:** `Install Datto RMM Agent [Windows]`  
- **Description:** `Executes the installation script against Windows machines where the Datto RMM Agent is not installed.`  
- **Type:** `File System`  
- **Severity:** `Others`  
- **Family:** `RMM Agent`

![Image1](../../../static/img/docs/0562cbb5-db83-486a-84ae-730abd583fab/image1.webp)

## Targeted Resources

- **Target Type:**  `Device Groups`  
- **Group Name:** `Datto RMM Agent Installation [Windows]`

![Image2](../../../static/img/docs/0562cbb5-db83-486a-84ae-730abd583fab/image2.webp)

## Conditions

- **Run Script on:** `Schedule`  
- **Repeat every:** `1` `Hours`  
- **Script Language:** `PowerShell`  
- **Use Generative AI Assist for script creation:** `False`  
- **PowerShell Script Editor:**  

```PowerShell
if (Get-Service -Name 'CagService' -ErrorAction SilentlyContinue) {
    return 'Already Installed'
} else {
    return 'Not Installed'
}
```

- **Criteria:**  `Contains`  
- **Operator:** `AND`  
- **Script Output:**  `Not Installed`  
- **Escalate ticket on script failure:** `False`  
- **Add Automation:**  `Install Datto RMM Agent`

![Image3](../../../static/img/docs/0562cbb5-db83-486a-84ae-730abd583fab/image3.webp)

## Ticket Resolution

**Automatically resolve:** `False`

![Image4](../../../static/img/docs/0562cbb5-db83-486a-84ae-730abd583fab/image4.webp)

## Monitor Output

**Output:** `Do not Generate Ticket`

![Image5](../../../static/img/docs/0562cbb5-db83-486a-84ae-730abd583fab/image5.webp)

## Completed Monitor

![Image6](../../../static/img/docs/0562cbb5-db83-486a-84ae-730abd583fab/image6.webp)
