---
id: '8de9befe-2917-47b3-97e6-23d737a05dfa'
title: 'OneDrive User Folder Redirection Notification'
title_meta: 'OneDrive User Folder Redirection Notification'
keywords: ['onedrive', 'notifications', 'folder', 'redirection', 'endpoint']
description: 'This document outlines the importance of enabling folder redirection notifications for OneDrive on endpoints, ensuring users are aware of any issues with their OneDrive not redirecting properly. It includes detection settings and applicable operating systems.'
tags: ['software', 'windows']
draft: false
unlisted: false
---

## Summary

This document determines whether folder redirection notifications are enabled for OneDrive on an endpoint. Ideally, for machines using OneDrive, the folder redirection notification should be enabled so users are aware if their OneDrive is not redirecting properly.

## Settings

| Detection String                                      | Comparator | Result | Applicable OS |
|------------------------------------------------------|------------|--------|----------------|
| `{%-HKLM/SOFTWARE/Policies/Microsoft/OneDrive:KFMSilentOptInWithNotification-%}` | Equals     | 1      | Windows OS     |



