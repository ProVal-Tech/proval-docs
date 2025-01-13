---
id: 'vsa-azure-ad-view'
title: 'Azure AD Joined and Registered Machines View'
title_meta: 'Azure AD Joined and Registered Machines View'
keywords: ['azure', 'ad', 'view', 'machines', 'custom', 'field']
description: 'This document provides an overview of a view that displays machines that are either Azure AD joined or registered, based on a specified custom field. It outlines dependencies, view filters, and relevant documentation links.'
tags: ['azure', 'ad', 'view', 'custom', 'filter', 'dependency']
draft: false
unlisted: false
---
# Summary

This view displays machines that are Azure AD joined or registered based on a custom field.

# Dependencies

This should be a list of ITGlue documents listed in the Related Items sidebar on which this View depends.

- The view relies upon the custom field, and the agent procedure.  
  - Solution Doc: [https://proval.itglue.com/DOC-5078775-12540674](https://proval.itglue.com/DOC-5078775-12540674)

# View Filters

List all filters applied to this view

| Filter Name                     | Advanced Filter? | Filter Value |
|----------------------------------|------------------|--------------|
| cPVAL Azure AD Joined            | Y                | *TRUE*      |
| cPVAL Azure AD Registered        | Y                | *TRUE*      |




