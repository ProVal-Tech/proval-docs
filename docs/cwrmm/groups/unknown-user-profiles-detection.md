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

The group manages the supported computers for companies that have enabled the [Unknown User Profiles Detection](/docs/a7ba6a52-18ae-4c71-8545-5a41999fa41b) custom field.

## Dependencies

[Unknown User Profiles Detection](/docs/a7ba6a52-18ae-4c71-8545-5a41999fa41b)

## Details

| Name | Type  | Description |
| ------ | ------ | ----------- |
| Unknown User Profiles Detection | Dynamic  | The group manages the supported computers for companies that have enabled the Unknown User Profiles Detection custom field. |

## Group Creation

### Step 1

Navigate to `Endpoints` > `Groups`

![Image1](../../../static/img/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec/Image1.webp)

### Step 2

Click the `Add` button and select the `Dynamic Group` option.

![Image2](../../../static/img/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec/Image2.webp)

The following screen will appear:

![Image3](../../../static/img/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec/Image3.webp)

### Step 3

#### Summary

Fill in the summary as follows:

**Group Name:** `Unknown User Profiles Detection`

**Description:** `The group manages the supported computers for companies that have enabled the Unknown User Profiles Detection custom field.`

![Image4](../../../static/img/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec/Image4.webp)

### Step 4

#### Criteria

**Condition 1:**

- Click the `+ Add Criteria` button.
- Search and select the `Unknown User Profiles Detection` custom field.
- Select the `Contains any of` operator.
- Select the `Enabled`, and `Workstations Only` options from the dropdown menu.

![Image5](../../../static/img/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec/Image5.webp)

<span style={{color: 'green'}}> **Condition:** `Unknown User Profiles Detection` `Contains any of` `Enabled`, `Workstations Only` </span>

**Condition 2:**

- Click the `+ Add Criteria` button.
- Search and select the `OS` condition.
- Select the `Contains any of` operator.
- Select `Microsoft Windows` <span style={{color: 'yellow'}}>**>>**</span> `10`, and `11` from the dropdown menu.

![Image6](../../../static/img/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec/Image6.webp)

<span style={{color: 'green'}}> **Condition:** `OS` `Contains any of` `Microsoft Windows 10`, `Microsoft Windows 11` </span>

**Condition 3:**

- Click the `Add Outer Block` button.
- Change the comparator to `OR`.

![Image7](../../../static/img/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec/Image7.webp)

**Condition 4:**

- Click the `+ Add Criteria` button inside the outer block.
- Search and select the `Unknown User Profiles Detection` custom field.
- Select the `Contains any of` operator.
- Select the `Enabled` option from the dropdown menu.

![Image8](../../../static/img/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec/Image8.webp)

<span style={{color: 'green'}}> **Condition:** `Unknown User Profiles Detection` `Contains any of` `Enabled` </span>

**Condition 5:**

- Click the `+ Add Criteria` button inside the outer block.
- Search and select the `OS` condition.
- Select the `Contains any of` operator.
- Select `Microsoft Windows` <span style={{color: 'yellow'}}>**>>**</span> `Server` <span style={{color: 'yellow'}}>**>>**</span> `2016`, `2019`, and `2022` from the dropdown menu.
- Select `2016` and newer servers.

![Image9](../../../static/img/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec/Image9.webp)

<span style={{color: 'green'}}> **Condition:** `OS` `Contains any of` `Microsoft Windows Server 2016`, `Microsoft Windows Server 2019`, `Microsoft Windows Server 2022`</span>

### Step 5

Review the `Criteria` section. This is how the completed criteria section will look: 

![Image10](../../../static/img/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec/Image10.webp)

### Step 6

Click the `Save` button to save the group.

![Image11](../../../static/img/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec/Image11.webp)

## Completed Group

![Image12](../../../static/img/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec/Image12.webp)

![Image13](../../../static/img/docs/1c950fdd-99f2-4943-9617-a1d13a4b87ec/Image13.webp)