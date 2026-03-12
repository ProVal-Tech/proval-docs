---
id: 'a317100e-2fec-416d-8db6-c3daaf7cd48f'
slug: /a317100e-2fec-416d-8db6-c3daaf7cd48f
title: 'Remediation SecureBoot 2026 Compliance'
title_meta: 'Remediation SecureBoot 2026 Compliance'
keywords: ['certificates','compliance','secureboot']
description: 'This script automates the remediation of UEFI Secure Boot certificates required for Windows 2026 compliance. It ensures the system has the latest 2023 UEFI certificates (KEK and db) and configures the system for automatic Microsoft-managed UEFI certificate updates.'
tags: ['auditing','certificates','secureboot']
draft: false
unlisted: false
last_update:
  date: 2026-03-12
---

## Overview

This script automates the remediation of UEFI Secure Boot certificates required for Windows 2026 compliance. It ensures the system has the latest 2023 UEFI certificates (KEK and db) and configures the system for automatic Microsoft-managed UEFI certificate updates.

## Mandatory

Once the Component `Remediation SecureBoot 2026 Compliance` updates the certificates, the machine must be rebooted `twice`. Rebooting the system is `mandatory` for the `Secure Boot 2026 certificates` to update successfully. Without rebooting the machine, the `certificates will not be applied.`

After the system reboots, the check component [SecureBoot 2026 Compliance Check](/docs/48d5dd1c-37ef-4e43-87b8-b10fa565fef4) must run again to verify that the `certificates` were updated successfully. The check component will then update the `UDF` with the latest results.

## Dependencies

- [Agnostic Script - Remediate-SecureBootCompliance2026](/docs/062c5b72-32b5-4fdb-b48c-5f45a19af42c)


## Implementation  

1. Download the component `Remediation SecureBoot 2026 Compliance` from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/a317100e-2fec-416d-8db6-c3daaf7cd48f/import1.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `Remediation SecureBoot 2026 Compliance` component from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/a317100e-2fec-416d-8db6-c3daaf7cd48f/quick-job1.webp)  

3. Search the component `Remediation SecureBoot 2026 Compliance` and click on `Select`
 ![Image 3](../../../static/img/docs/a317100e-2fec-416d-8db6-c3daaf7cd48f/remediation.webp)

## Output

- Activity Log

![Image 4](../../../static/img/docs/a317100e-2fec-416d-8db6-c3daaf7cd48f/remediation-activity-log.webp)

## Attachments

[Remediation SecureBoot 2026 Compliance](../../../static/attachments/remediation-secureboot2026-compliance.cpt)

## Changelog

### 2026-03-12

- Initial version of the document
