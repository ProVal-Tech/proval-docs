---
id: '1c950fdd-99f2-4943-9617-a1d13a4b87ec'
slug: /1c950fdd-99f2-4943-9617-a1d13a4b87ec
title: 'Unknown User Profiles Detection'
title_meta: 'Unknown User Profiles Detection'
keywords: ['user','profile','unknown','inferred']
description: 'The group manages the supported computers for companies that have enabled the Unknown User Profiles Detection custom field.'
tags: ['security', 'setup']
draft: false
unlisted: false
---

## Summary

The group manages the supported computers for companies that have enabled the [Unknown User Profiles Detection](../custom-fields/unknown-user-profiles-detection.md) custom field.

## Dependencies

[Unknown User Profiles Detection](../custom-fields/unknown-user-profiles-detection.md)

## Details

| Name | Type  | Description |
| ------ | ------ | ----------- |
| Unknown User Profiles Detection | Dynamic  | The group manages the supported computers for companies that have enabled the Unknown User Profiles Detection custom field. |

## Group Creation

### Step 1

Navigate to `Endpoints` > `Groups`

![Image1](../../../static/img/cwrmm-group-unknown-user-profiles-detection/Image1.png)

### Step 2

Click the `Add` button and select the `Dynamic Group` option.

![Image2](../../../static/img/cwrmm-group-unknown-user-profiles-detection/Image2.png)

The following screen will appear:

![Image3](../../../static/img/cwrmm-group-unknown-user-profiles-detection/Image3.png)

### Step 3

#### Summary

Fill in the summary as follows:

**Group Name:** `Unknown User Profiles Detection`

**Description:** `The group manages the supported computers for companies that have enabled the Unknown User Profiles Detection custom field.`

![Image4](../../../static/img/cwrmm-group-unknown-user-profiles-detection/Image4.png)

### Step 4

#### Criteria

**Condition 1:**

- Click the `+ Add Criteria` button.
- Search and select the `Unknown User Profiles Detection` custom field.
- Select the `Contains any of` operator.
- Select the `Enabled`, and `Workstations Only` options from the dropdown menu.

![Image5](../../../static/img/cwrmm-group-unknown-user-profiles-detection/Image5.png)

<span style={{color: 'green'}}> **Condition:** `Unknown User Profiles Detection` `Contains any of` `Enabled`, `Workstations Only` </span>

**Condition 2:**

- Click the `+ Add Criteria` button.
- Search and select the `OS` condition.
- Select the `Contains any of` operator.
- Select `Microsoft Windows` <span style={{color: 'yellow'}}>**>>**</span> `10`, and `11` from the dropdown menu.

![Image6](../../../static/img/cwrmm-group-unknown-user-profiles-detection/Image6.png)

<span style={{color: 'green'}}> **Condition:** `OS` `Contains any of` `Microsoft Windows 10`, `Microsoft Windows 11` </span>

**Condition 3:**

- Click the `Add Outer Block` button.
- Change the comparator to `OR`.

![Image7](../../../static/img/cwrmm-group-unknown-user-profiles-detection/Image7.png)

**Condition 4:**

- Click the `+ Add Criteria` button inside the outer block.
- Search and select the `Unknown User Profiles Detection` custom field.
- Select the `Contains any of` operator.
- Select the `Enabled` option from the dropdown menu.

![Image8](../../../static/img/cwrmm-group-unknown-user-profiles-detection/Image8.png)

<span style={{color: 'green'}}> **Condition:** `Unknown User Profiles Detection` `Contains any of` `Enabled` </span>

**Condition 5:**

- Click the `+ Add Criteria` button inside the outer block.
- Search and select the `OS` condition.
- Select the `Contains any of` operator.
- Select `Microsoft Windows` <span style={{color: 'yellow'}}>**>>**</span> `Server` <span style={{color: 'yellow'}}>**>>**</span> `2016`, `2019`, and `2022` from the dropdown menu.
- Select `2016` and newer servers.

![Image9](../../../static/img/cwrmm-group-unknown-user-profiles-detection/Image9.png)

<span style={{color: 'green'}}> **Condition:** `OS` `Contains any of` `Microsoft Windows Server 2016`, `Microsoft Windows Server 2019`, `Microsoft Windows Server 2022`</span>

### Step 5

Review the `Criteria` section. This is how the completed criteria section will look: 

![Image10](../../../static/img/cwrmm-group-unknown-user-profiles-detection/Image10.png)

### Step 6

Click the `Save` button to save the group.

![Image11](../../../static/img/cwrmm-group-unknown-user-profiles-detection/Image11.png)

## Completed Group

![Image12](../../../static/img/cwrmm-group-unknown-user-profiles-detection/Image12.png)

![Image13](../../../static/img/cwrmm-group-unknown-user-profiles-detection/Image13.png)