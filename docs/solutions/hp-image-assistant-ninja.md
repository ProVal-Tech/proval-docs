---
id: '4c4053fb-301c-4c77-8e7f-97ed2f00b391'
slug: /4c4053fb-301c-4c77-8e7f-97ed2f00b391
title: 'HP Image Assistant'
title_meta: 'HP Image Assistant'
keywords: ['hp','hpia','hp-image-assistant','image-assistant','drivers','firmware','driver-updates','bios']
description: 'The purpose of this solution is to deploy all updates including BIOS, firmware, and drivers to the endpoint HP workstations using HP Image Assistant.'
tags: ['hp','firmware','bios','drivers']
draft: false
unlisted: false
last_update:
  date: 2026-06-03
---

## Purpose

The purpose of this solution is to deploy all updates including BIOS, firmware, and drivers to the endpoint HP workstations using HP Image Assistant. It addresses the tedious, error-prone manual process of validating, acquiring, and installing driver, firmware, BIOS, and software updates on HP business PCs by fully automating:

- Environment and hardware validation
- Downloading and managing HP’s update tools
- Running update scans and applying updates
- Providing structured, human-readable reports

This tool is ideal for standardizing HP client environments, keeping endpoints secure, compliant, and up to date with minimal manual intervention.

For complete documentation on supported arguments, refer to: [HP Image Assistant User Guide](https://ftp.hp.com/pub/caps-softpaq/cmit/imagepal/userguide/936944-005.pdf)

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
|[Custom Field - cPVAL HPIA Update Audit](/docs/d13a9112-7ddc-4808-926d-4f24c44b7f42) | Custom Field | Custom Field to enable automatic deployment of the HP Image Assistant scanning on HP Windows machines. | 
|[Custom Field - cPVAL HPIA Arguments](/docs/cc92019d-e16e-4ca4-b8d8-1e91bb167669) | Custom Field | Custom Field to define HPIA arguments to execute |
|[Automation - Initialize HP Image Assistant](/docs/bd8ac3ee-0a20-406d-8f9a-8d24e51621b3) | Automation | Automation to deploy all updates including BIOS, firmware, and drivers to the endpoint HP workstations using HP Image Assistant (HPIA) |
|[Group - cPVAL HPIA Enabled Machines](/docs/a194d71e-2a83-46ed-8894-3137db6571d0) | Group | This group contains Hewlett Packard Windows 10 and Windows 11 devices where [Custom Field - cPVAL HPIA Update Audit](/docs/d13a9112-7ddc-4808-926d-4f24c44b7f42) is set to `Enabled`. |
|[Task - Execute HP Image Assistant ](/docs/5732428a-7410-49b6-a4e7-06fb906f424c) | Task | This task executes [Automation - Initialize HP Image Assistant](/docs/bd8ac3ee-0a20-406d-8f9a-8d24e51621b3) on [ Group - cPVAL HPIA Enabled Machines](/docs/a194d71e-2a83-46ed-8894-3137db6571d0) weekly. |

## Implementation

- Create the below custom fields:
  - [Custom Field - cPVAL HPIA Update Audit](/docs/d13a9112-7ddc-4808-926d-4f24c44b7f42)
  - [Custom Field - cPVAL HPIA Arguments](/docs/cc92019d-e16e-4ca4-b8d8-1e91bb167669)
- Create [Automation - Initialize HP Image Assistant](/docs/bd8ac3ee-0a20-406d-8f9a-8d24e51621b3) as per instructions provided in the document.
- Create [Group - cPVAL HPIA Enabled Machines](/docs/a194d71e-2a83-46ed-8894-3137db6571d0) as per instructions provided in the document.
- Create [Task - Execute HP Image Assistant ](/docs/5732428a-7410-49b6-a4e7-06fb906f424c) as per instructions provided in the document.

## Changelog

### 2026-06-03

- Initial version of the document