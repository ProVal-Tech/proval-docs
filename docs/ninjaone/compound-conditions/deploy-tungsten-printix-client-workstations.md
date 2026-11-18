---
id: '96795ceb-d3c7-4d36-b424-d2979140e036'
slug: /96795ceb-d3c7-4d36-b424-d2979140e036
title: 'Deploy Tungsten Printix Client - Workstations'
title_meta: 'Deploy Tungsten Printix Client - Workstations'
keywords: ['printix', 'tungsten', 'printix-client', 'deployment', 'compound condition', 'workstations']
description: 'Installs the Tungsten Printix Client on Windows workstations that do not have it, when cPVAL Tungsten Printix Client Deployment is set to Windows or Windows Workstations.'
tags: ['deployment', 'installation', 'print', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-16
---

## Summary

This compound condition runs the [Install/Update Tungsten Printix Client](/docs/0c5963fc-ac9d-44ff-8fad-8ae2fd267547) automation as `System` on Windows workstations that meet both of these conditions:

- [cPVAL Tungsten Printix Client Deployment](/docs/d53a9981-9c39-4392-bf02-9d069b529f2f) is set to `Windows` or `Windows Workstations`.
- `Tungsten Printix Client` isn't in the device's software inventory.

The automation registers the client to the tenant in [cPVAL Tungsten PrintixClientID](/docs/ac1c2105-bc81-4dca-9786-1991d00e5155) and [cPVAL Tungsten PrintixClientDomain](/docs/4e5a88c2-1f5a-41fd-bd22-fd3d7ea2fb9b), so set both fields before you turn on deployment.

The condition triggers once the device has been online for 10 minutes. While the client is still missing, the automation runs again every 24 hours. The condition resets after 12 hours, or as soon as the client shows up in the software inventory. It sends no notifications and creates no tickets.

## Details

- **Name:** `Deploy Tungsten Printix Client - Workstations`
- **Description:** `Installs the Tungsten Printix Client on Windows workstations that don't have it, when cPVAL Tungsten Printix Client Deployment is set to Windows or Windows Workstations.`
- **Recommended Agent Policies:** `Windows Workstation Policy`

## Dependencies

- [Custom Field: cPVAL Tungsten Printix Client Deployment](/docs/d53a9981-9c39-4392-bf02-9d069b529f2f)
- [Custom Field: cPVAL Tungsten PrintixClientID](/docs/ac1c2105-bc81-4dca-9786-1991d00e5155)
- [Custom Field: cPVAL Tungsten PrintixClientDomain](/docs/4e5a88c2-1f5a-41fd-bd22-fd3d7ea2fb9b)
- [Automation: Install/Update Tungsten Printix Client](/docs/0c5963fc-ac9d-44ff-8fad-8ae2fd267547)
- [Solution: Deploy Tungsten Printix Client - NinjaOne](/docs/9424b17b-b55f-417d-9d2d-a953bed8575e)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/deploy-tungsten-printix-client-workstations.toml)

## Changelog

### 2026-11-16

- Initial version of the document
