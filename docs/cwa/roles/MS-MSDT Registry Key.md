---
id: '174939f4-d7d5-4c92-9813-308db2c2b0c3'
title: 'Detect MSDT Vulnerability CVE-2022-30190'
title_meta: 'Detect MSDT Vulnerability CVE-2022-30190'
keywords: ['msdt', 'cve', 'registry', 'vulnerability']
description: 'This document outlines a method to detect the presence of the HKEY_CLASSES_ROOT//ms-msdt Registry Key, which is crucial for temporarily remediating the CVE-2022-30190 MSDT vulnerability on Windows systems.'
tags: ['registry', 'vulnerability', 'windows', 'security']
draft: false
unlisted: false
---
## Summary

This role detects the existence of the HKEY_CLASSES_ROOT/ms-msdt Registry Key to temporarily remediate the CVE-2022-30190 MSDT vulnerability.

## Settings

| Detection String                          | Comparator | Result  | Applicable OS |
|-------------------------------------------|------------|---------|----------------|
| {@%Reg query "HKEY_CLASSES_ROOT/ms-msdt"@%} | Contains   | REG_SZ  | Windows        |







