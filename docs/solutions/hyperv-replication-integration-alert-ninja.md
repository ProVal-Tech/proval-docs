---
id: '4deaf362-a762-4a05-9118-326edc7ff523'
slug: /4deaf362-a762-4a05-9118-326edc7ff523
title: 'Hyper-V Replication Integration Alert'
title_meta: 'Hyper-V Replication Integration Alert'
keywords: ['hyper-v', 'backup', 'integration', 'replication']
description: 'This solution is built to audit and alert for the Hyper-V Integration and Replication failure.'
tags: ['hyper-v', 'backup']
draft: false
unlisted: false
last_update:
  date: 2026-05-11
---

## Purpose

This solution is built to audit and alert for the Hyper-V Integration and Replication failure.
It also helps to create an audit result by storing the Integration and Replication state.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL Hyper-V Integration Service Status](/docs/577db7ae-37bc-42f7-84e3-5346a6089972)      | Custom field | This custom field stores the Hyper-V integration service status fetched by the [Script - Hyper-V Integration Service Audit](/docs/1c8cf2c3-d470-4616-bc27-35e69f274202). |
| [cPVAL Hyper-V Replication Status](/docs/f71f62c5-0cb9-48fc-9c47-85e8df9f252a) | Custom field | This custom field stores the Hyper-V replication status detail fetched from the [Script - Hyper-V Replication Audit](/docs/d3e74048-d274-4fe7-8501-c826822707b2). | 
| [Hyper-V Integration Service Audit](/docs/1c8cf2c3-d470-4616-bc27-35e69f274202) | Script | This script queries all Hyper-V virtual machines and looks for any VM where the IntegrationServicesState is `Update required`. If any such VM is found, the script stores the VM details in the NinjaOne custom field `cpvalHyperVIntegrationServiceStatus` and exits with code 1. If no VMs require Integration Services updates, the script stores `UpToDate` and exits successfully with code 0. | 
| [Hyper-V Replication Audit](/docs/d3e74048-d274-4fe7-8501-c826822707b2) | Script | This script validates that it is running on a Hyper-V host using the vmms service. If not a Hyper-V host, it exits cleanly. If Hyper-V is present, it checks replication health and flags `Critical` or `Warning` states. |
| [Hyper-V Integration Service Status Alert](/docs/cb29253d-d6da-40c9-981a-d2568ddab859) | Compound Condition | This compound condition is built to create the ticket if the Hyper-V Integration service state is out of date. | 
| [Hyper-V Replication State Alert](/docs/b45bf0c6-d41b-474a-bea9-8e8f020fcf02) | Compound Condition | This compound condition is built to create the ticket if the Hyper-V replicate state is unhealthy. |

## Implementation

- Create the [Custom field - cPVAL Hyper-V Integration Service Status](/docs/577db7ae-37bc-42f7-84e3-5346a6089972)
- Create the [Custom field - cPVAL Hyper-V Replication Status](/docs/f71f62c5-0cb9-48fc-9c47-85e8df9f252a)
- Create the [Script - Hyper-V Integration Service Audit](/docs/1c8cf2c3-d470-4616-bc27-35e69f274202)
- Create the [Script - Hyper-V Replication Audit](/docs/d3e74048-d274-4fe7-8501-c826822707b2)
- Create the [Compound Condition - Hyper-V Integration Service Status Alert](/docs/cb29253d-d6da-40c9-981a-d2568ddab859)
- Create the [Compound Condition - Hyper-V Replication State Alert](/docs/b45bf0c6-d41b-474a-bea9-8e8f020fcf02)
  

## Changelog

### 2026-05-11

- Initial version of the document