---
id: 'vsa-custom-fields-update'
title: 'Custom Fields Update for Kaseya VSA'
title_meta: 'Custom Fields Update for Kaseya VSA'
keywords: ['custom', 'fields', 'update', 'kaseya', 'machine']
description: 'This document outlines the process of pushing custom fields to targeted machines or endpoints from the organization’s custom field set within Kaseya VSA. It includes details on updating machine records for patching, antivirus, monitoring, and third-party fields, along with the required parameters for executing the update.'
tags: ['configuration', 'monitoring', 'update', 'security', 'software']
draft: false
unlisted: false
---
## Summary:

Will push custom field's to the machine/endpoint being targeted from our Organization custom field set.

Updates machine records for Patching, AV, Monitoring, and third party fields.

## Parameters

- **url**: required. the kaseya server URL  
- **user**: required. username to log into the kaseya server  
- **password**: required. password/PAT to log into the kaseya server  
- **monfilter**: optional. group or org names to not monitor  



