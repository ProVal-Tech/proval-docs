---
id: 'ea7ef637-8620-499a-a982-a805a11e14c7'
title: 'Update FileZilla'
title_meta: 'Update FileZilla'
keywords: ['filezilla', 'latest-version', 'update' ]
description: 'The internal monitor identifies Windows machines with an outdated version of FileZilla installed.'
tags: ['application', 'update']
draft: false
unlisted: false
---

## Summary

The internal monitor detects Windows machines running an outdated version of FileZilla but excludes those where the [FileZilla - Install/Update](../scripts/filezilla-install-update.md) script has been executed twice within the past week.

## Details

**Suggested "Limit to"**: `Global`  
**Suggested Alert Style**: `Once Per Day`  
**Suggested Alert Template**: `△ Custom - Execute Script - FileZilla - Install/Update`

## Dependencies

- [FileZilla - Fetch Latest Version](../scripts/filezilla-fetch-latest-version.md)
- [FileZilla - Install/Update](../scripts/filezilla-install-update.md)
