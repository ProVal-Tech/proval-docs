---
id: '13b4df99-df9b-4a57-bc0f-8675c68be028'
slug: /13b4df99-df9b-4a57-bc0f-8675c68be028
title: 'Lock Stolen System'
title_meta: 'Lock Stolen System'
keywords: ['Lock','Stolen','System']
description: 'TThe purpose of this solution is to track and lock down stolen systems.'
tags: ['connectwise']
draft: False
unlisted: false
---

## Purpose

The purpose of this solution is to track and lock down stolen systems.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Custom Field - cPVAL Mark System as Stolen](/docs/20a99ff3-a63d-4f73-bd48-3bb8d66626e6)  | Custom Field | Mark this Custom Field to mark a Computer as stolen. Selecting this, will enable `Lock Stolen System solution` on the machine.|
| [Custom Field - cPVAL System Lockdown ](/docs/4b18c9bf-8aea-41a5-8242-77dfcfd0042a)  | Custom Field | Mark this to lock down the machine once it comes online. 'Lock Stolen System' solution will not enable BitLocker and shut down the computer if this is not flagged. |
| [Custom Field - cPVAL Current Location and IP Details](/docs/85cb62ba-6e5f-4235-9964-975af04658d0)  | Custom Field | It stores the Current IP address of the machine. Current city, Current state and Current coordinates of the machine according to the IP address. This custom field is populated by `Lock Stolen System` solution. |
| [Automation - Lock Stolen System ](/docs/0f78be64-557a-4c0e-b7cf-e2ba41e71374)  | Automation | This script is used to track and lock down stolen systems. If Custom Field `cPVAL System Lockdown` is marked, it will enable BitLocker and shut down the computer. |
| [Compound Condition - Lock Stolen System ](/docs/705b400b-28fc-4c01-95a6-edbf43960122)  | Compound Condition | This condition triggers the `Lock Stolen Systems` script on Windows machines where `cPVAL Mark System as Stolen` is selected. |
| [Ticket Template - Lock Stolen System ](/docs/be59a0a6-33da-4ef2-8baf-848d47ba2ac0)  | Ticket Template | his ticket template configures how a ConnectWise Manage ticket will be generated in response to the `Lock Stolen Systems` condition. |

## Implementation

- Create the below Custom Fields using the implementation instruction provided in the documents.
    - [Custom Field - cPVAL Mark System as Stolen](/docs/20a99ff3-a63d-4f73-bd48-3bb8d66626e6)
    - [Custom Field - cPVAL System Lockdown ](/docs/4b18c9bf-8aea-41a5-8242-77dfcfd0042a) 
    - [Custom Field - cPVAL Current Location and IP Details](/docs/85cb62ba-6e5f-4235-9964-975af04658d0)
- Create the below automations as per the implementation instruction provided in the documents.
    - [Automation - Lock Stolen System ](/docs/0f78be64-557a-4c0e-b7cf-e2ba41e71374)
- Create the [Ticket Template - Lock Stolen System ](/docs/be59a0a6-33da-4ef2-8baf-848d47ba2ac0) as per the implementation instruction provided in the document.
- Create the [Compound Condition - Lock Stolen System ](/docs/705b400b-28fc-4c01-95a6-edbf43960122) as per the implementation instruction provided in the document.
