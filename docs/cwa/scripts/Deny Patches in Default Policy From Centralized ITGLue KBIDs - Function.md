---
id: 'cwa-deny-patches-default-policy'
title: 'Deny Patches in Default Policy from Centralized ITGLue KBIDs'
title_meta: 'Deny Patches in Default Policy from Centralized ITGLue KBIDs'
keywords: ['patches', 'policy', 'itglue', 'kbids', 'denied']
description: 'This document outlines a function script designed to deny specific patches present in the plugin_proval_denied_patches table, as referenced in the Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset. It details the process, variables, and dependencies involved in executing this function effectively.'
tags: ['configuration', 'database', 'security', 'windows']
draft: false
unlisted: false
---
## Summary

This Function Script is called from [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142)  
It's function is to deny those patches present in [plugin_proval_denied_patches](https://proval.itglue.com/DOC-5078775-9563176) table.

## Sample Run

This is a function Script and can not be executed directly to the computers.  
![Sample Run Image](5078775/docs/9564856/images/13229498)

## Dependencies

- [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142)
- [plugin_proval_denied_patches](https://proval.itglue.com/DOC-5078775-9563176)

## Variables

| Name              | Description                                                                                                         |
|-------------------|---------------------------------------------------------------------------------------------------------------------|
| %sqlHOTFIXID%     | HotFixID passed down from [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142) script. |
| @Count@           | Number of distinct OS for %sqlHOTFIXID%.                                                                          |
| @sqlOS@           | Operating System of the %sqlHOTFIXID%.                                                                            |
| @ApprovalPolicyID@| ID of the default approval policy ID.                                                                              |

## Process

Step 1: Finds the distinct operating system for the HotFixID passed down from [Deny Patches in Default Policy From Centralized ITGLue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142) script. Fetches all the operating systems for the denied KBID that is available in the environment.  
Step 2: Runs a loop to deny that KBID for all applicable operating systems.

## Output

Denied Patches can be checked from the default approval policy.

