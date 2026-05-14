---
id: '48a5c637-0bb3-428d-9c33-ed76260f7da6'
slug: /48a5c637-0bb3-428d-9c33-ed76260f7da6
title: 'NTFS Audit Permissions'
title_meta: 'NTFS Audit Permissions'
keywords: ['ntfs', 'audit', 'permission']
description: 'Scans actively shared network folders on Windows endpoints and identifies folders where the NTFS access control list (ACL) contains an ALLOW entry for the "Everyone" group.'
tags: ['windows','auditing']
draft: false
unlisted: false
last_update:
  date: 2026-05-14
---

## Summary

Scans actively shared network folders on Windows endpoints and identifies folders where the NTFS access control list (ACL) contains an ALLOW entry for the "Everyone" group. This module distinguishes between NTFS permissions (folder-level security) and share permissions (network-level access), reporting only on NTFS allow entries. 

## Sample Run


## Dependencies

![Sample Run](../../../static/img/docs/48a5c637-0bb3-428d-9c33-ed76260f7da6/sample-run.webp)

## Implementation

1. Export the agent procedure from ProVal's VSA RMM instance.   
   **Name:** NTFS Audit Permissions 

   The export will download the necessary XML file.   
   
2. Import this XML file into the partner's VSA RMM instance.   

3. Export the 'Audit-EveryoneShareAccess.ps1' from the ProVal's Internal VSA. This is also placed under the below path:  
`Manage Files` > `Shared Files` > `PVAL` > `Audit-EveryoneShareAccess.ps1`  

![Sample Run](../../../static/img/docs/48a5c637-0bb3-428d-9c33-ed76260f7da6/managed-files.webp) 

4. Map the `Audit-EveryoneShareAccess.ps1` into the `12th` step of the script in the client's environment.

5. Save the agent procedure.

## Output

- Script log.
- Outbound Email

## Changelog

### 2026-05-14

- Initial version of the document