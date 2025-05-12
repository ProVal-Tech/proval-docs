---
id: '322cb1d2-e61e-4bee-ba33-6196639335b6'
slug: /322cb1d2-e61e-4bee-ba33-6196639335b6
title: 'VSAOrgCFieldToMach'
title_meta: 'VSAOrgCFieldToMach'
keywords: ['custom', 'fields', 'update', 'kaseya', 'machine']
description: 'This document outlines the process of pushing custom fields to targeted machines or endpoints from the organization’s custom field set within Kaseya VSA. It includes details on updating machine records for patching, antivirus, monitoring, and third-party fields, along with the required parameters for executing the update.'
tags: ['security', 'software', 'update']
draft: false
unlisted: false
---

## Summary

This document will push custom fields to the targeted machine or endpoint from our organization's custom field set.

It updates machine records for patching, antivirus, monitoring, and third-party fields.

## Parameters

- **url**: required. The Kaseya server URL.  
- **user**: required. Username to log into the Kaseya server.  
- **password**: required. Password/PAT to log into the Kaseya server.  
- **monfilter**: optional. Group or organization names to exclude from monitoring.  