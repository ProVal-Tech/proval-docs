---
id: 'b210a5c3-0c35-4a40-9c04-51fbadd59e8a'
slug: /b210a5c3-0c35-4a40-9c04-51fbadd59e8a
title: 'Azure AD Status'
title_meta: 'Azure AD Status'
keywords: ['azure', 'ad', 'view', 'machines', 'custom', 'field']
description: 'This document provides an overview of a view that displays machines that are either Azure AD joined or registered, based on a specified custom field. It outlines dependencies, view filters, and relevant documentation links.'
tags: ['azure']
draft: false
unlisted: false
---

# Summary

This view displays machines that are Azure AD joined or registered based on a custom field.

# Dependencies

This should be a list of ITGlue documents listed in the Related Items sidebar on which this view depends.

- The view relies upon the custom field and the agent procedure.  
  - Solution Doc: [https://proval.itglue.com/DOC-5078775-12540674](/docs/c852661d-3253-466e-ae17-ee2753885920)

# View Filters

List all filters applied to this view.

| Filter Name                     | Advanced Filter? | Filter Value |
|----------------------------------|------------------|--------------|
| cPVAL Azure AD Joined            | Y                | *TRUE*      |
| cPVAL Azure AD Registered        | Y                | *TRUE*      |



