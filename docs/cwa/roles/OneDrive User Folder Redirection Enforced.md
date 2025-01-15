---
id: 'd96b3af4-f2c4-4bc9-a014-0d63833330c9'
title: 'OneDrive Folder Redirection Detection'
title_meta: 'OneDrive Folder Redirection Detection'
keywords: ['onedrive', 'folder', 'redirection', 'detection', 'policy']
description: 'This document outlines the detection of a role on an agent where OneDrive folder redirection is enabled at a system policy level, including the necessary settings and detection strings.'
tags: ['configuration', 'windows', 'security']
draft: false
unlisted: false
---
## Summary

This role will be detected on an agent where OneDrive folder redirection is enabled at a system policy level.

## Settings

| Detection String                                                                                   | Comparator | Result           | Applicable OS |
|----------------------------------------------------------------------------------------------------|------------|------------------|---------------|
| {%@reg query "HKLM/SOFTWARE/Policies/Microsoft/OneDrive" /v KFMSilentOptIn | find "KFMSilentOptIn"@%} | Contains   | KFMSilentOptIn | Windows       |






