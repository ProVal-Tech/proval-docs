---
id: 'c9cac2f1-7647-41fb-bf13-13f23244ae37'
title: 'Deny Patches in Default Policy From Centralized ITGLue KBIDs - Function'
title_meta: 'Deny Patches in Default Policy From Centralized ITGLue KBIDs - Function'
keywords: ['patches', 'policy', 'itglue', 'kbids', 'denied']
description: 'This document outlines a function script designed to deny specific patches present in the plugin_proval_denied_patches table, as referenced in the Deny Patches in Default Policy From Centralized ITGlue KBIDs - Flexible Asset. It details the process, variables, and dependencies involved in executing this function effectively.'
tags: ['database', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This function script is called from [Deny Patches in Default Policy From Centralized ITGlue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142).  
Its function is to deny those patches present in the [plugin_proval_denied_patches](<../tables/plugin_proval_denied_patches.md>) table.

## Sample Run

This is a function script and cannot be executed directly on the computers.  
![Sample Run Image](../../../static/img/Deny-Patches-in-Default-Policy-From-Centralized-ITGlue-KBIDs---Function/image_1.png)

## Dependencies

- [Deny Patches in Default Policy From Centralized ITGlue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142)
- [plugin_proval_denied_patches](<../tables/plugin_proval_denied_patches.md>)

## Variables

| Name               | Description                                                                                                         |
|--------------------|---------------------------------------------------------------------------------------------------------------------|
| %sqlHOTFIXID%      | HotFixID passed down from [Deny Patches in Default Policy From Centralized ITGlue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142) script. |
| @Count@            | Number of distinct OS for %sqlHOTFIXID%.                                                                          |
| @sqlOS@            | Operating System of the %sqlHOTFIXID%.                                                                            |
| @ApprovalPolicyID@ | ID of the default approval policy.                                                                                 |

## Process

Step 1: Finds the distinct operating systems for the HotFixID passed down from [Deny Patches in Default Policy From Centralized ITGlue KBIDs - Flexible Asset](https://proval.itglue.com/5078775/docs/9563142) script. Fetches all the operating systems for the denied KBID that is available in the environment.  
Step 2: Runs a loop to deny that KBID for all applicable operating systems.

## Output

Denied patches can be checked from the default approval policy.



