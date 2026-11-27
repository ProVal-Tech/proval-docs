---
id: '762539d7-6380-4703-b3c7-5daccb53de7f'
slug: /762539d7-6380-4703-b3c7-5daccb53de7f
title: 'Deploy ConnectSecure Agent [Windows]'
title_meta: 'Deploy ConnectSecure Agent [Windows]'
keywords: ['connectsecure', 'cybercns', 'dynamic-group', 'deployment']
description: 'Windows devices where ConnectSecure agent deployment is turned on through the CS_Deployment custom fields. The Deploy ConnectSecure Agent [Windows] monitor targets this group.'
tags: ['deployment', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The **Deploy ConnectSecure Agent [Windows]** group holds the Windows devices where ConnectSecure agent deployment is turned on through the CS_Deployment custom fields. The [Deploy ConnectSecure Agent [Windows]](/docs/1478e5e2-97a5-435e-aba4-970f33ef598b) monitor targets it, and runs the [Deploy ConnectSecure Agent [Windows]](/docs/f525e770-2d55-4de5-af7e-0a95e8a825ce) task on its devices that don't have the agent.

Servers and workstations are matched separately, so a company or site can cover one type, the other, or both. The most specific level that holds a value wins: endpoint, then site, then company.

## Dependencies

- [Custom Field: CS_Deployment](/docs/a3fa2309-9ab8-476e-a684-25c17e7b0c0b)
- [Custom Field: CS_Deployment_Site](/docs/0b020b21-1a7b-4bb2-9e33-00549b632986)
- [Custom Field: CS_Deployment_Endpoint](/docs/63282970-5875-48da-bf3f-60639eb3006b)
- [Monitor: Deploy ConnectSecure Agent [Windows]](/docs/1478e5e2-97a5-435e-aba4-970f33ef598b)
- [Solution: Deploy ConnectSecure Agent [Windows]](/docs/6772bca3-be64-4114-8fc7-10cbee463bcb)

## Group Setup Location

- **Group Path:** `ENDPOINTS` ➞ `Groups`
- **Group Type:** `Dynamic Group`

## Group Summary

- **Group Name:** `Deploy ConnectSecure Agent [Windows]`
- **Category:** `Application`
- **Description:** `Windows devices where ConnectSecure agent deployment is turned on through the CS_Deployment custom fields. The Deploy ConnectSecure Agent [Windows] monitor targets this group.`

![Image1](../../../static/img/docs/762539d7-6380-4703-b3c7-5daccb53de7f/image1.webp)

## Criteria

The group is defined by the following **criteria blocks**, joined by an **OR**. Each block uses **AND** logic between its conditions.

| Block | Criteria Name | Operator | Value(s) |
|-------|---------------|----------|----------|
| 1 | CS_Deployment | Contains any of | `Windows Workstations and Servers`, `Windows Servers Only` |
| 1 | CS_Deployment_Site | Does Not Contain any of | `Windows Workstations Only`, `Disabled` |
| 1 | CS_Deployment_Endpoint | Does Not Contain any of | `Disabled` |
| 1 | OS Type | Contains any of | `Windows` |
| 1 | Endpoint Type | Contains any of | `Server` |
| 2 | CS_Deployment_Site | Contains any of | `Windows Workstations and Servers`, `Windows Servers Only` |
| 2 | CS_Deployment_Endpoint | Does Not Contain any of | `Disabled` |
| 2 | OS Type | Contains any of | `Windows` |
| 2 | Endpoint Type | Contains any of | `Server` |
| 3 | CS_Deployment_Endpoint | Contains any of | `Enabled` |
| 3 | OS Type | Contains any of | `Windows` |
| 4 | CS_Deployment_Site | Contains any of | `Windows Workstations and Servers`, `Windows Workstations Only` |
| 4 | CS_Deployment_Endpoint | Does Not Contain any of | `Disabled` |
| 4 | OS Type | Contains any of | `Windows` |
| 4 | Endpoint Type | Does Not Contain any of | `Server` |
| 5 | CS_Deployment | Contains any of | `Windows Workstations and Servers`, `Windows Workstations Only` |
| 5 | CS_Deployment_Site | Does Not Contain any of | `Windows Servers Only`, `Disabled` |
| 5 | CS_Deployment_Endpoint | Does Not Contain any of | `Disabled` |
| 5 | OS Type | Contains any of | `Windows` |
| 5 | Endpoint Type | Does Not Contain any of | `Server` |

- **Block 1:** Windows servers whose company scope (**CS_Deployment**) covers servers, unless the site scope (**CS_Deployment_Site**) leaves servers out or the device is excluded (**CS_Deployment_Endpoint**).
- **Block 2:** Windows servers whose site scope (**CS_Deployment_Site**) covers servers, unless the device is excluded (**CS_Deployment_Endpoint**).
- **Block 3:** Any Windows device included directly with **CS_Deployment_Endpoint** set to `Enabled`, whatever its site and company say.
- **Block 4:** Windows workstations whose site scope (**CS_Deployment_Site**) covers workstations, unless the device is excluded (**CS_Deployment_Endpoint**).
- **Block 5:** Windows workstations whose company scope (**CS_Deployment**) covers workstations, unless the site scope (**CS_Deployment_Site**) leaves workstations out or the device is excluded (**CS_Deployment_Endpoint**).

**Logic:**  
A device matches the group if it meets **ALL** criteria in **Block 1**, **OR** **ALL** criteria in **Block 2**, **OR** **ALL** criteria in **Block 3**, **OR** **ALL** criteria in **Block 4**, **OR** **ALL** criteria in **Block 5**.

![Image2](../../../static/img/docs/762539d7-6380-4703-b3c7-5daccb53de7f/image2.webp)

## Completed Group

![Image3](../../../static/img/docs/762539d7-6380-4703-b3c7-5daccb53de7f/image3.webp)

## Implementation

Install the group from the `ProVal - Content` Community, selecting the **Groups** repository. Install the three CS_Deployment custom fields first, because the criteria use them.

![Image4](../../../static/img/docs/762539d7-6380-4703-b3c7-5daccb53de7f/image4.webp)

## Changelog

### 2026-11-27

- Initial version of the document
