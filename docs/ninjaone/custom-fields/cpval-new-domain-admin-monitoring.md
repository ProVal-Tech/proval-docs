---
id: '28f66783-6f12-4091-abe0-6aa41f7cfd9a'
slug: /28f66783-6f12-4091-abe0-6aa41f7cfd9a
title: 'cPVAL New Domain Admin Monitoring'
title_meta: 'cPVAL New Domain Admin Monitoring'
keywords: ['domain', 'administrators', 'windows', 'alerts']
description: 'Select Enable to enable New Domain Admin monitoring. Disable can be selected at Computer or Location level for excluding them.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false

---
## Summary

Select Enable to enable New Domain Admin monitoring. Disable can be selected at Computer or Location level for excluding them.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Organization Level Custom Field Tab | Location Level Custom Field Tab | Device Level Custom Field Tab |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- |----------- |----------- |----------- |
|cPVAL New Domain Admin Monitoring| cpvalNewDomainAdminMonitoring | Device,Organization,Location | Dropdown | No | Enable,Disable | Read Only | Read_Write | Read_Write | Select Enable to enable New Domain Admin monitoring. Disable can be selected at Computer or Location level for excluding them. | Select Enable to enable New Domain Admin monitoring. Disable can be selected at Computer or Location level for excluding them. | | New Domain Admin Monitoring | New Domain Admin Monitoring | New Domain Admin Monitoring Device  |

## Dependencies

- [Script : New Domain Admin Detected](/docs/a818ac38-9841-4049-9fda-1b87fa1bd19a)
- [Condition : New Domain Admin Detected](/docs/b300f17d-63ee-4c31-b29b-a9fb92a69a89)
- [Ticket Template : New Domain Admin Detected](/docs/355a03b6-61f8-45c4-92f9-43f13b5dd7ac)
- [Solution : New Domain Admin Detected](/docs/ffbbe3fe-f579-4521-a95a-1eb772d93ac7)


## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-new-domain-admin-monitoring.toml)


## Sample Screenshot

![SampleRun1](../../../static/img/docs/28f66783-6f12-4091-abe0-6aa41f7cfd9a/image1.webp)