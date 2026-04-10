---
id: '593be8f7-970f-4b6a-80b0-7cf0ff3396a6'
slug: /593be8f7-970f-4b6a-80b0-7cf0ff3396a6
title: 'HP iLO Health Check'
title_meta: 'HP iLO Health Check'
keywords: ['ilo', 'health', 'report', 'script', 'monitor', 'automation']
description: 'Gathers information and monitor the health status of HP iLO devices.'
tags: ['networking', 'security', 'software', 'update', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-04-09
---

## Purpose

Gathers information and monitors the health status of HP iLO devices.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL Enable HP ILO Solution](/docs/586ace95-93c6-4b89-938b-57115ec672b3) | Custom Field | This enables the HP iLO solution by selecting an option from the dropdown menu.  |
| [cPVAL HP iLO Health Status](/docs/76c2e00a-79ec-4e61-ae78-78ac8432da63) | Custom Field | Stores the health status information of HP ILO. |
| [cPVAL HP iLO Health Report](/docs/959a414f-014c-4012-923e-93e8808d93b8) | Custom Field | Stores health information about HP iLO devices. |
| [cPVAL HP iLO Address](/docs/0182fb99-ef92-45b9-a030-5c07ebdc2428) | Custom Field | IP address of the HP iLO device. Port number must be added if a custom port is being used. |
| [cPVAL HP iLO Username](/docs/8bd67235-7e2d-4c30-a3b5-d6417f9721ea) | Custom Field | Admin username to connect with the HP iLO device. |
| [cPVAL HP iLO Password](/docs/ca9eb915-443d-442d-866f-a653736bd9c3) | Custom Field | Stores password for the HP iLO admin user.|
| [HP iLO - Health Report - Check](/docs/f8af5d3a-b506-49c8-aba7-cfb2f1f2f3b1) | Script | Script to check and return the overall health status of HP iLO devices. It also determines whether each iLO device is operating normally or reporting warnings or critical issues. This allows for proactive monitoring and quick identification of potential hardware or management interface problems. |
| [Execute - HP iLO - Health Report - Check](/docs/715b6e84-a73d-4b8b-aef3-3ba1e214a479) | Compound Condition | Triggers the `HP iLO – Health Report – Check` script on machines where the HP iLO solution is enabled. |
| [HP iLO - Health - Check](/docs/4104e6d3-5ecb-4739-9ee3-e70b6d378983) | Compound Condition | Validates and identifies any bad or degraded HP iLO health status. |
| [Ticket Template - HP iLO Health Check](/docs/37018679-316a-4483-9738-6ca679485ef5) | Ticket Template | This ticket template configures how a ConnectWise Manage ticket will be generated in response to the [Compound Condition - HP iLO - Health - Check](/docs/4104e6d3-5ecb-4739-9ee3-e70b6d378983) condition. |


## Implementation

- Create the below Custom Fields using the implementation instruction provided in the documents.
    - [cPVAL Enable HP iLO Solution](/docs/586ace95-93c6-4b89-938b-57115ec672b3)
    - [cPVAL HP iLO Health Status](/docs/76c2e00a-79ec-4e61-ae78-78ac8432da63)
    - [cPVAL HP iLO Health Report](/docs/959a414f-014c-4012-923e-93e8808d93b8) 
    - [cPVAL HP iLO Address](/docs/0182fb99-ef92-45b9-a030-5c07ebdc2428) 
    - [cPVAL HP iLO Password](/docs/ca9eb915-443d-442d-866f-a653736bd9c3)
    - [cPVAL HP iLO Username](/docs/8bd67235-7e2d-4c30-a3b5-d6417f9721ea)
- Create the [Script - HP iLO - Health Report - Check](/docs/f8af5d3a-b506-49c8-aba7-cfb2f1f2f3b1) using the implementation instruction provided in the document.
- Create the below Compound Conditions using the implementation instruction provided in the documents.
    - [Execute - HP iLO - Health Report - Check](/docs/715b6e84-a73d-4b8b-aef3-3ba1e214a479)
    - [HP iLO - Health - Check](/docs/4104e6d3-5ecb-4739-9ee3-e70b6d378983)
- Create the [Ticket Template - HP iLO Health Check](/docs/37018679-316a-4483-9738-6ca679485ef5) using the implementation instruction provided in the document.

## Changelog

### 2026-04-09

- Initial version of the document