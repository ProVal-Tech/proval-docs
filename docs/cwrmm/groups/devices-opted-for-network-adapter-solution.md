---
id: '31025444-7b65-4fa5-9ca3-89d2f5b06a55'
slug: /31025444-7b65-4fa5-9ca3-89d2f5b06a55
title: 'Devices Opted for Network Adapter Solution'
title_meta: 'Devices Opted for Network Adapter Solution'
keywords: ['DHCP','windows','networking','Protocol','IPV4','IPv6','Script','Automate']
description: 'This group contains the machines where `Enable Network Adapter Solution` custom filed is opted and Action Custom field is not set to `Enable Network Adapter Solution` at client, Site or endpoint level'
tags: ['windows','networking']
draft: False
unlisted: false
---

## Summary
This group contains the machines where `Enable Network Adapter Solution` custom field is opted and `Action` Custom field is not set to `Enable Network Adapter Solution` at Client, Site or Endpoint level

## Dependencies

- [Manage - Network Adapter Solutions Custom Field](/docs/97f24a5e-9b01-4a3c-8288-0aef911bf2ad)
- [Task - Manage - Network Adapter Protocols](/docs/2dbbb9c6-8bb7-4f1a-a050-7cb9f4b2382f)
- [ Solution - Manage Network Adapter Solution](/docs/0d47f7f9-c0f9-42f1-9bc9-23b6d5cb6220)

## Details

| Field Name                 | Type of Field (Machine or Organization) | Description                                                                                                                                                                                                                                                                                                                                                                         |
|----------------------------|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Devices Opted for Network Adapter Solution    | Dynamic Group | This group contains the machines where `Enable Network Adapter Solution` custom field is opted and Action Custom field is not set to `Enable Network Adapter Solution` at client, Site or endpoint level. |

## Group Creation

### Step 1
Navigate to `ENDPOINTS` ➞ `Groups`  
![Step1](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step1.webp)

### Step 2

Create a new dynamic group by clicking the `Dynamic Group` button.  
![Step2](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step2.webp)

### Step 3

This page will appear after clicking on the `Dynamic Group` button:  
![Step3](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step3.webp)

- **Group Name:** `Devices Opted for Network Adapter Solution`  
- **Description:** This group contains the machines where "Enable Network Adapter Solution" custom field is opted and 'Action' Custom field is not set to "Enable Network Adapter Solution" at Client, Site or Endpoint level.



### Step 4

Click the `+ Add Criteria` in the `Criteria` section of the group.  
![Step4](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step4.webp)

This search box will appear:  
![Step5](../../../static/img/docs/9718a5fd-535b-4faf-abe9-86d55f37e620/step5.webp)

Add the following criteria as shown:

**Criteria:**

- `Enable Network Adapter Solution` custom field equals `True`.
- `OS` does not not contains `unsupported machines`. Select the unsupported versions one by one.
- The agent `Available` equals `True`.
- `Action(Site)` does not contain `Exclude From the Solution`
- `Action(Endpoint)` does not contain `Exclude From the Solution`

## Completed Group

![Group](../../../static/img/docs/31025444-7b65-4fa5-9ca3-89d2f5b06a55/image1.webp)