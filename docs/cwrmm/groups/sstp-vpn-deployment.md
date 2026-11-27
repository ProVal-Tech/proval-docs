---
id: '9848ce15-c56b-4ccd-a80f-95b21e5a4f75'
slug: /9848ce15-c56b-4ccd-a80f-95b21e5a4f75
title: 'SSTP VPN Deployment'
title_meta: 'SSTP VPN Deployment'
keywords: ['sstp', 'vpn', 'dynamic-group', 'deployment']
description: 'Windows devices where SSTP VPN deployment is turned on through the SSTP_Enable custom fields. The SSTP VPN Deployment task runs against this group.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The **SSTP VPN Deployment** group holds the Windows devices where SSTP VPN deployment is turned on through the SSTP_Enable custom fields. The [SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7) task is scheduled against it.

Servers and workstations are matched separately, so a company or site can cover one type, the other, or both. The most specific level that holds a value wins: endpoint, then site, then company.

## Dependencies

- [Custom Field: SSTP_Enable](/docs/57f97be2-e027-413f-919e-b6984ce6fba1)
- [Custom Field: SSTP_Enable_Site](/docs/48e518b7-2a64-42a1-9d00-8e46136a86d2)
- [Custom Field: SSTP_Enable_Endpoint](/docs/2e5a736d-431a-46ba-a157-e6f7e6740843)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)

## Group Setup Location

- **Group Path:** `ENDPOINTS` ➞ `Groups`
- **Group Type:** `Dynamic Group`

## Group Summary

- **Group Name:** `SSTP VPN Deployment`
- **Category:** `Security`
- **Description:** `Windows devices where SSTP VPN deployment is turned on through the SSTP_Enable custom fields. The SSTP VPN Deployment task runs against this group.`

![Image1](../../../static/img/docs/9848ce15-c56b-4ccd-a80f-95b21e5a4f75/image1.webp)

## Criteria

The group is defined by the following **criteria blocks**, joined by an **OR**. Each block uses **AND** logic between its conditions.

| Block | Criteria Name | Operator | Value(s) |
|-------|---------------|----------|----------|
| 1 | SSTP_Enable | Contains any of | `Windows Workstations and Servers`, `Windows Servers Only` |
| 1 | SSTP_Enable_Site | Does Not Contain any of | `Windows Workstations Only`, `Disabled` |
| 1 | SSTP_Enable_Endpoint | Does Not Contain any of | `Disabled` |
| 1 | OS Type | Contains any of | `Windows` |
| 1 | Endpoint Type | Contains any of | `Server` |
| 2 | SSTP_Enable_Site | Contains any of | `Windows Workstations and Servers`, `Windows Servers Only` |
| 2 | SSTP_Enable_Endpoint | Does Not Contain any of | `Disabled` |
| 2 | OS Type | Contains any of | `Windows` |
| 2 | Endpoint Type | Contains any of | `Server` |
| 3 | SSTP_Enable_Endpoint | Contains any of | `Enabled` |
| 3 | OS Type | Contains any of | `Windows` |
| 4 | SSTP_Enable_Site | Contains any of | `Windows Workstations and Servers`, `Windows Workstations Only` |
| 4 | SSTP_Enable_Endpoint | Does Not Contain any of | `Disabled` |
| 4 | OS Type | Contains any of | `Windows` |
| 4 | Endpoint Type | Does Not Contain any of | `Server` |
| 5 | SSTP_Enable | Contains any of | `Windows Workstations and Servers`, `Windows Workstations Only` |
| 5 | SSTP_Enable_Site | Does Not Contain any of | `Windows Servers Only`, `Disabled` |
| 5 | SSTP_Enable_Endpoint | Does Not Contain any of | `Disabled` |
| 5 | OS Type | Contains any of | `Windows` |
| 5 | Endpoint Type | Does Not Contain any of | `Server` |

- **Block 1:** Windows servers whose company scope (**SSTP_Enable**) covers servers, unless the site scope (**SSTP_Enable_Site**) leaves servers out or the device is excluded (**SSTP_Enable_Endpoint**).
- **Block 2:** Windows servers whose site scope (**SSTP_Enable_Site**) covers servers, unless the device is excluded (**SSTP_Enable_Endpoint**).
- **Block 3:** Any Windows device included directly with **SSTP_Enable_Endpoint** set to `Enabled`, whatever its site and company say.
- **Block 4:** Windows workstations whose site scope (**SSTP_Enable_Site**) covers workstations, unless the device is excluded (**SSTP_Enable_Endpoint**).
- **Block 5:** Windows workstations whose company scope (**SSTP_Enable**) covers workstations, unless the site scope (**SSTP_Enable_Site**) leaves workstations out or the device is excluded (**SSTP_Enable_Endpoint**).

**Logic:**  
A device matches the group if it meets **ALL** criteria in **Block 1**, **OR** **ALL** criteria in **Block 2**, **OR** **ALL** criteria in **Block 3**, **OR** **ALL** criteria in **Block 4**, **OR** **ALL** criteria in **Block 5**.

![Image2](../../../static/img/docs/9848ce15-c56b-4ccd-a80f-95b21e5a4f75/image2.webp)

## Completed Group

![Image3](../../../static/img/docs/9848ce15-c56b-4ccd-a80f-95b21e5a4f75/image3.webp)

## Implementation

Install the group from the `ProVal - Content` Community, selecting the **Groups** repository. Install the three SSTP_Enable custom fields first, because the criteria use them.

![Image4](../../../static/img/docs/9848ce15-c56b-4ccd-a80f-95b21e5a4f75/image4.webp)

## Changelog

### 2026-11-27

- Initial version of the document
