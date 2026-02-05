---
id: 'a7e4073e-1f09-4772-aa5e-ee44cf9bf9e7'
slug: /a7e4073e-1f09-4772-aa5e-ee44cf9bf9e7
title: 'Windows 10 ESU Licensing and Auditing'
title_meta: 'Windows 10 ESU Licensing and Auditing'
keywords: ['esu', 'license', 'extended', 'windows-10', 'windows-2012', '22h2']
description: 'This solution provides automated auditing of Windows 10 Extended Security Updates (ESU) license status across Windows 10 22H2 machines. It includes functionality to track activation status and optionally deploy ESU licenses when needed.'
tags: ['licensing', 'windows', 'extensions']
draft: false
unlisted: false
---

## Purpose

This solution provides automated auditing of Windows 10 Extended Security Updates (ESU) license status across Windows 10 22H2 machines. It includes functionality to track activation status and optionally deploy ESU licenses when needed.

## Associated Content

| Content             | Type                  | Function                   |
|------------------|------------------------------|----------------------|
| [Custom Field : ESU Status](/docs/90f075dc-5997-4abe-8a89-c46c6d566de0)   | Script | Stores the result from the ESU Audit script. |
| [Task : ESU License Activation Detection](/docs/fad37673-34ab-46e9-8797-b87058f79faa)   | Task | Performs the checks for the ESU license activation detection. |
| [Task : Windows 10 ESU License Upgrade](/docs/69b669a7-e440-4f37-a4d5-1e4d8d4b1c4b)   | Task |  Applies Extended Security Updates (ESU) license for Windows 10 22H2 systems. |
| [Group : Win 10 ESU Activated](/docs/198ac207-0426-4c7f-afeb-7fa84b599b6c)   | Group | Contains the list of Windows 10 devices where the ESU is activated. |
| [Group : Win10 ESU Not Activated](/docs/4673c9d2-881d-43a1-b455-5d3b3cf0ae4d)   | Group | Contains the list of machines where the script detects that the ESU license was not activated.|
| [Group : Win 10 ESU Auditing Failed](/docs/a3f30225-91ac-46f7-b616-cb42aedb49d8)   | Group | Contains the list of machines where the ESU license detection script failed. |
| [Group : Win 10 ESU Audit Not Performed](/docs/afcaeb5a-d0e5-4f5e-b24f-c0aeaec22f3e)   | Group | Contains the list of Windows 10 22H2 machines where the auditing script hasn't yet executed. |
| [Group : Windows 10 22H2](/docs/558a6a3d-b543-4267-96fc-76f0c9a13e68)   | Group |Group of Windows 10 22H2 machines. |


## Implementation

- Create the [Custom Field : ESU Status](/docs/90f075dc-5997-4abe-8a89-c46c6d566de0) using the implementation instruction provided in the document.
- Create the [Task : ESU License Activation Detection](/docs/fad37673-34ab-46e9-8797-b87058f79faa)  using the implementation instruction provided in the document.
- Create the [Group : Win 10 ESU Activated](/docs/198ac207-0426-4c7f-afeb-7fa84b599b6c) using the implementation instruction provided in the document.
- Create the [Group : Win10 ESU Not Activated](/docs/4673c9d2-881d-43a1-b455-5d3b3cf0ae4d) using the implementation instruction provided in the document.
- Create the [Group : Win 10 ESU Auditing Failed](/docs/a3f30225-91ac-46f7-b616-cb42aedb49d8) using the implementation instruction provided in the document.
- Create the [Group : Win 10 ESU Audit Not Performed](/docs/afcaeb5a-d0e5-4f5e-b24f-c0aeaec22f3e)  using the implementation instruction provided in the document.
- Create the [Group : Windows 10 22H2](/docs/558a6a3d-b543-4267-96fc-76f0c9a13e68)  using the implementation instruction provided in the document.