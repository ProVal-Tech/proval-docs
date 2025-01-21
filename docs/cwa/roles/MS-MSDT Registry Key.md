---
id: '174939f4-d7d5-4c92-9813-308db2c2b0c3'
title: 'MS-MSDT Registry Key'
title_meta: 'MS-MSDT Registry Key'
keywords: ['msdt', 'cve', 'registry', 'vulnerability']
description: 'This document outlines a method to detect the presence of the HKEY_CLASSES_ROOT/ms-msdt Registry Key, which is crucial for temporarily remediating the CVE-2022-30190 MSDT vulnerability on Windows systems.'
tags: ['registry', 'security', 'vulnerability', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes a method to detect the existence of the HKEY_CLASSES_ROOT/ms-msdt Registry Key, which is essential for temporarily remediating the CVE-2022-30190 MSDT vulnerability.

## Settings

| Detection String                          | Comparator | Result  | Applicable OS |
|-------------------------------------------|------------|---------|----------------|
| \{@%Reg query "HKEY_CLASSES_ROOT/ms-msdt"@%} | Contains   | REG_SZ  | Windows        |



