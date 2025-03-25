---
id: 'ecddbc88-fbef-4678-b02b-2cc19b219fdc'
slug: /ecddbc88-fbef-4678-b02b-2cc19b219fdc
title: 'EPM - Data Collection - Custom Field- Azure AD Status'
title_meta: 'EPM - Data Collection - Custom Field- Azure AD Status'
keywords: ['azure', 'ad', 'custom', 'field', 'machine']
description: 'This document provides details about a custom field used to indicate whether a machine is joined to Azure Active Directory (AD). It includes information on dependencies and the specific field names utilized in the configuration.'
tags: ['active-directory', 'azure']
draft: false
unlisted: false
---

## Summary

This custom field is used to display whether or not a machine is Azure AD joined.

## Dependencies

This custom field is populated by the agent procedure.  
Solution: [https://proval.itglue.com/DOC-5078775-12540674](<../../solutions/EPM - Data Collection - Solution- Azure AD Status.md>)

## Details

| Field Name                     | Type of Field (Machine or Organization) | Description                                        |
|--------------------------------|-----------------------------------------|----------------------------------------------------|
| cPVAL Azure AD Joined          | Machine                                 | Used to display whether the machine is joined to Azure AD |
| cPVAL Azure AD Registered      | Machine                                 | Used to display whether the machine is registered to Azure AD |



