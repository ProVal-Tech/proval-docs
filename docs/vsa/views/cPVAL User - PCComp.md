---
id: 'e08a4d71-9e14-49c1-9ccc-c9ca346e7869'
title: 'Machines with PCComp User Status'
title_meta: 'Machines with PCComp User Status'
keywords: ['machines', 'user', 'status', 'pccomp', 'view']
description: 'This document provides a summary of a view that displays all machines with a PCComp user present. It includes dependencies and view filters to help understand the criteria used in this view.'
tags: ['active-directory', 'report', 'windows']
draft: false
unlisted: false
---

# Summary

This document provides a view that shows all machines with a PCComp user present on the machine.

# Dependencies

Below is the link to the document for the script created to check the user status:
- [User Status Script Documentation](https://proval.itglue.com/5078775/docs/18178737)

# View Filters

The following filters are applied to this view:

| Filter Name           | Advanced Filter? | Filter Value |
|----------------------|------------------|--------------|
| cPVAL User Status    | Yes              | *present*    |
|                      |                  |              |
|                      |                  |              |

