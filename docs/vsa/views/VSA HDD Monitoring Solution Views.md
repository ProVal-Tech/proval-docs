---
id: '958933a9-35b8-4c70-b5fa-8c858f481b39'
title: 'xPVAL Drive Letter Views'
title_meta: 'xPVAL Drive Letter Views for Endpoint Monitoring'
keywords: ['drive', 'monitoring', 'filter', 'views', 'endpoints', 'servers']
description: 'This document provides an overview of xPVAL Drive Letter views, detailing filters applied to monitor endpoints based on specific drive letters. It includes 24 individual views for each drive letter, focusing on configuration and management settings for effective monitoring.'
tags: []
draft: false
unlisted: false
---
# Summary

xPVAL Drive Letter {X} Where X displays endpoints with a particular drive. i.e C:  
This document covers 24 individual views, one for each Drive Letter.

# View Filters

List all filters applied to this view

| Filter Name                             | Advanced Filter? | Filter Value                                                                                           |
|-----------------------------------------|------------------|--------------------------------------------------------------------------------------------------------|
| OS Type                                 | N                | All Servers (This can be changed as needed for workstation monitoring by removing this filter.)        |
| [xPVAL Drive List](https://proval.itglue.com/DOC-5078775-10793262) | Y                | *C:*Each view contains its independent drive letter in its advanced filter.                       |
| xPVAL Monitoring Managed                | Y                | *Managed*                                                                                            |
| xPVAL Exclude from Monitoring           | Y                | NOT *1* AND NOT *yes*                                                                                |












