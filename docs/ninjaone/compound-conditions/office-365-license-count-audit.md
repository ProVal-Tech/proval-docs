---
id: 'b2abd519-eaea-4741-8ba1-25a0de5ae234'
slug: /b2abd519-eaea-4741-8ba1-25a0de5ae234
title: 'Office 365 License Count Audit'
title_meta: 'Office 365 License Count Audit'
keywords: ['office365','license','count']
description: 'Runs the auditing script daily against the client''s primary domain controller for all environments where auditing is enabled.'
tags:  ['office365','update','windows','software']
draft: false
unlisted: false
---

## Summary

Runs the [auditing script](/docs/2caca618-6249-4f67-8bee-94538f69dae3) daily against the client's primary domain controller for all environments where auditing is enabled.

## Details

- **Name:** `Office 365 License Count`  
- **Description:** `Runs the auditing script daily against the client''s primary domain controller for all environments where auditing is enabled.`  
- **Recommended Agent Policies:** `Windows Server Policy [Default]`

## Dependencies

- [Custom Field: cPVAL Enable Office 365 License Count Audit](/docs/70be2211-ad18-44d2-9254-20cdd812f378)
- [Automation: Office 365 License Count](/docs/2caca618-6249-4f67-8bee-94538f69dae3)
- [Solution: Office 365 License Count Audit](/docs/4967b45b-e903-4176-ae5f-c4e095b5cdc5)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/office-365-license-count-audit.toml)
