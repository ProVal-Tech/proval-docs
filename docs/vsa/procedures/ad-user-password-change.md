---
id: 'b0d4e97d-d772-464d-8bde-60dde1e2e8d0'
slug: /b0d4e97d-d772-464d-8bde-60dde1e2e8d0
title: 'Password Change - AD User'
title_meta: 'Password Change - AD User'
keywords: ['passwordchange', 'aduser', 'reset']
description: 'This script generates a secure, randomized temporary password for a target Active Directory user account, resets the password via AD cmdlet, and formats the execution summary into an internal note block using email connector tags. It also enforces administrative privileges via self-elevation.'
tags: ['security', 'active-directory', 'accounts', 'email']
draft: false
unlisted: false
last_update:
  date: 2026-08-26
---

## Summary

This script generates a secure, randomized temporary password for a target Active Directory user account, resets the password via AD cmdlet, and formats the execution summary into an internal note block using email connector tags. It also enforces administrative privileges via self-elevation.

## Sample Run

![Image](../../../static/img/docs/b0d4e97d-d772-464d-8bde-60dde1e2e8d0/run-script.webp)

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.   
   **Name:** `Password Change - AD User` 

   The export will download the necessary XML file.   
   
2. Import this XML file into the partner's VSA RMM instance.   

3. Export the `ADUser-PasswordChange.ps1` from the ProVal's Internal VSA. This is also placed under the below path:  
`Manage Files` > `Shared Files` > `PVAL` > `ADUser-PasswordChange.ps1`  

  ![Image](../../../static/img/docs/b0d4e97d-d772-464d-8bde-60dde1e2e8d0/managed-files.webp)

4. Map the `ADUser-PasswordChange.ps1` into the `13th` step of the script in the client's environment.

5. Change the Email ID on step number `16th`.
   
## Output

- Script logs

## Changelog

### 2026-08-26

- Initial version of the document