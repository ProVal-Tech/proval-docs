---
id: 'ea7ef637-8620-499a-a982-a805a11e14c7'
slug: /ea7ef637-8620-499a-a982-a805a11e14c7
title: 'Update FileZilla'
title_meta: 'Update FileZilla'
keywords: ['filezilla', 'latest-version', 'update' ]
description: 'The internal monitor identifies Windows machines with an outdated version of FileZilla installed.'
tags: ['application', 'update']
draft: false
unlisted: false
---

## Summary

The internal monitor detects Windows machines running an outdated version of FileZilla but excludes those where the [FileZilla - Install/Update](/docs/154e2b72-d73f-4693-a316-7a296e4793ec) script has been executed twice within the past week.

## Details

**Suggested "Limit to"**: `Global`  
**Suggested Alert Style**: `Once Per Day`  
**Suggested Alert Template**: `△ Custom - Execute Script - FileZilla - Install/Update`

## Dependencies

- [FileZilla - Fetch Latest Version](/docs/71141737-d88f-43d3-9e75-e3f5468f888f)
- [FileZilla - Install/Update](/docs/154e2b72-d73f-4693-a316-7a296e4793ec)