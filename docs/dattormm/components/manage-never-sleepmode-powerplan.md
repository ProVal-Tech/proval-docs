---
id: '46d4d01b-9d9c-43c3-b936-9ae3116e2a3c'
slug: /46d4d01b-9d9c-43c3-b936-9ae3116e2a3c
title: 'Manage-NeverSleepModePowerPlan'
title_meta: 'Manage-NeverSleepModePowerPlan'
keywords: ['datto', 'sleep', 'sleep mode', 'power', 'power plan']
description: 'Stores the current Windows power plan, applies a “Never Sleep” power configuration on Set, and restores the original power plan on Revert.'
tags: ['windows', 'datto']
draft: false
unlisted: false
---

## Overview  
Stores the current Windows power plan, applies a “Never Sleep” power configuration on Set, and restores the original power plan on Revert.


## Implementation  

1. Download the component [Manage-NeverSleepModePowerPlan](../../../static/attachments/Manage-NeverSleepModePowerPlan.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template2.webp)  

3. Search the component `Manage-NeverSleepModePowerPlan` and click on `Select`
 ![Image 3](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template3.webp)

4. After selecting the component, below popup will be displayed.  
    i. Click on the Drop-Down to `Set` the power mode to never sleep.  
    ![Image 4](../../../static/img/docs/46d4d01b-9d9c-43c3-b936-9ae3116e2a3c/Snapshot1.webp) 
    ii. Now to revert it to previous power mode again, select the component again and select the `Revert` option through drop down.  
    ![Image 5](../../../static/img/docs/46d4d01b-9d9c-43c3-b936-9ae3116e2a3c/Snapshot2.webp)

## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
|Force | Boolean | False|When true: Overwrites the previously saved plan reference during Set.      When false or unset: If a saved plan already exists, it is preserved and not overwritten during Set.|
|Action|Selection|Set|Set: Save the current plan (unless Force overwrites an existing save), clone it, apply “Never Sleep” settings, and activate it.  Revert: Restore the previously saved plan and deactivate the “Never Sleep” plan.
|
## Output  
1. Logs when Power plan is set.  
![Image 6](../.././../static/img/docs/46d4d01b-9d9c-43c3-b936-9ae3116e2a3c/Snapshot3.webp)
2. Logs when Power plan is reverted.  
![Image 7](../../../static/img/docs/46d4d01b-9d9c-43c3-b936-9ae3116e2a3c/Snapshot4.webp)

## Attachments  
[Manage-NeverSleepModePowerPlan](../../../static/attachments/Manage-NeverSleepModePowerPlan.cpt)