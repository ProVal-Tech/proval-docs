---
id: '13b4df99-df9b-4a57-bc0f-8675c68be028'
slug: /13b4df99-df9b-4a57-bc0f-8675c68be028
title: 'Lock Stolen System'
title_meta: 'Lock Stolen System'
keywords: ['Lock','Stolen','System']
description: 'TThe purpose of this solution is to track and lock down stolen systems.'
tags: ['connectwise']
draft: false
unlisted: false
---

## Purpose

The purpose of this NinjaOne solution is to track and lock down stolen systems.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL Mark System as Stolen](/docs/20a99ff3-a63d-4f73-bd48-3bb8d66626e6)  | Custom Field | Mark this Custom Field to mark a Computer as stolen. Selecting this, will enable `Lock Stolen System solution` on the machine.|
| [cPVAL System Lockdown ](/docs/4b18c9bf-8aea-41a5-8242-77dfcfd0042a)  | Custom Field | Mark this to lock down the machine once it comes online. 'Lock Stolen System' solution will not enable BitLocker and shut down the computer if this is not flagged. |
| [cPVAL Current Location and IP Details](/docs/85cb62ba-6e5f-4235-9964-975af04658d0)  | Custom Field | It stores the Current IP address of the machine. Current city, Current state and Current coordinates of the machine according to the IP address.  |
| [cPVAL Network Neighbours](/docs/150e0b6d-db7e-4b7b-8879-bd36b1e11771)  | Custom Field | Details all the Network Neighbours of the machine.|
| [cPVAL Stolen System Bitlocker Message](/docs/04443686-5a42-41d4-b936-b62145597107)  | Custom Field | The message to be displayed on the BitLocker lock screen.  |
| [cPVAL Stolen System Bitlocker Password](/docs/92779b41-3331-480c-a72d-402c0f328af3)  | Custom Field | The password to use to enable BitLocker on the target machine.|
| [cPVAL Lock Status](/docs/e734bed4-a878-4574-b456-1e1ed59ee6bc)  | Custom Field | This Custom Field is used by `Lock Stolen System` to mark Machine is successfully Locked and Bitlocker is enabled on the machine. |
| [ Lock Stolen System ](/docs/0f78be64-557a-4c0e-b7cf-e2ba41e71374)  | Automation | This script is used to track and lock down stolen systems. If Custom Field `cPVAL System Lockdown` is marked, it will enable BitLocker and shut down the computer. |
| [Lock Stolen System ](/docs/705b400b-28fc-4c01-95a6-edbf43960122)  | Compound Condition | This condition triggers the `Lock Stolen Systems` script on Windows machines where `cPVAL Mark System as Stolen` is selected. |
| [Lock Stolen System ](/docs/be59a0a6-33da-4ef2-8baf-848d47ba2ac0)  | Ticket Template | This ticket template configures how a ConnectWise Manage ticket will be generated in response to the `Lock Stolen Systems` condition. |

## Implementation

- Create the below Custom Fields using the implementation instruction provided in the documents.
    - [cPVAL Mark System as Stolen](/docs/20a99ff3-a63d-4f73-bd48-3bb8d66626e6)
    - [cPVAL System Lockdown ](/docs/4b18c9bf-8aea-41a5-8242-77dfcfd0042a) 
    - [cPVAL Current Location and IP Details](/docs/85cb62ba-6e5f-4235-9964-975af04658d0)
    - [cPVAL Network Neighbours](/docs/150e0b6d-db7e-4b7b-8879-bd36b1e11771)
    - [cPVAL Stolen System Bitlocker Message](/docs/04443686-5a42-41d4-b936-b62145597107) 
    - [cPVAL Stolen System Bitlocker Password](/docs/92779b41-3331-480c-a72d-402c0f328af3) 
    - [cPVAL Lock Status](/docs/e734bed4-a878-4574-b456-1e1ed59ee6bc)
- Create the below automations as per the implementation instruction provided in the documents.
    - [Automation - Lock Stolen System ](/docs/0f78be64-557a-4c0e-b7cf-e2ba41e71374)
- Create the [Ticket Template - Lock Stolen System ](/docs/be59a0a6-33da-4ef2-8baf-848d47ba2ac0) as per the implementation instruction provided in the document.
- Create the [Compound Condition - Lock Stolen System ](/docs/705b400b-28fc-4c01-95a6-edbf43960122) as per the implementation instruction provided in the document.
