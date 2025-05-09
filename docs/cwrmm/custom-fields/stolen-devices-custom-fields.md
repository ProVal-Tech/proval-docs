---
id: 'ff056937-ea5b-48f4-b76d-74566b981da8'
slug: /ff056937-ea5b-48f4-b76d-74566b981da8
title: 'Stolen Devices Custom Fields'
title_meta: 'Stolen Devices Custom Fields'
keywords: ['Lock','Stolen','System']
description: 'This document provides detailed information about the custom fields associated with the Lock Stolen System solution, including their types, levels, default values, and descriptions.'
tags: ['connectwise']
draft: False
unlisted: false
---

## Summary
This document provides detailed information about the custom fields associated with the [Lock Stolen System](/docs/e9b29e34-d570-481f-99db-1a428763c5da), including their types, levels, default values, and descriptions.

## Details

| Field Name               | Level    | Type | Default Value | Description                                             | Editable |
|--------------------------|----------|------|---------------|---------------------------------------------------------|----------|
| Mark System As Stolen  | Endpoint | Flag |     No          | Primary Custom Field to enable 'Lock Stolen System' solution. Flag this Custom Field to mark a Computer as stolen | Yes      |
|System Lockdown  | Endpoint | Flag |     Yes         | Flag it to lock down the machine once it comes online. 'Lock Stolen System' task will not enable BitLocker and shut down the computer if this is not flagged | Yes      |
| Current Location and IP Details | Endpoint | Text |      | It stores the Current IP address of the machine. Current city, Current state and Current coordinates of the machine according to the IP address. This custom field is populated by `Lock Stolen System` task. | Yes      |


## Screenshots
![Image1](<../../../static/img/docs/ff056937-ea5b-48f4-b76d-74566b981da8/image1.webp>)

![Image2](<../../../static/img/docs/ff056937-ea5b-48f4-b76d-74566b981da8/image2.webp>)

![Image3](<../../../static/img/docs/ff056937-ea5b-48f4-b76d-74566b981da8/image3.webp>)