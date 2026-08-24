---
id: 'dc48efed-0e7d-44d4-8d1a-27e2bf91b028'
slug: /dc48efed-0e7d-44d4-8d1a-27e2bf91b028
title: 'Certificate Expiration 30 Days'
title_meta: 'Certificate Expiration 30 Days'
keywords: ['certificate', 'expiration', 'alerts', 'security', 'local-certs', 'ssl']
description: 'This monitor looks for any SSL certificates that have an expiration date of less than 30 days. This solution is effective for catching machines that may have been missed and do not have active reminders in place for certificate renewals. Additionally, the difference between the certification addition and expiration should be at least 30 days to trigger an alert.'
tags: ['windows', 'alerting', 'security', 'certificates']
draft: false
unlisted: false
last_update:
  date: 2026-08-24
---

## Summary

This monitor looks for any SSL certificates that have an expiration date of less than 30 days. This solution is effective for catching machines that may have been missed and do not have active reminders in place for certificate renewals. Additionally, the difference between the certification addition and expiration should be at least 30 days to trigger an alert.

## Dependencies

- [Custom Field: Certificate Expiration Alert](/docs/41d685b3-0e7c-41b6-802d-2d1a9b25593c)
- [Custom Field: Disable Cert Expiration Alerts](/docs/9fa7d829-75c9-455d-9908-d695e0ae0a96)
- [Custom Field: Disable Cert Expiration Alert](/docs/f329bc75-50a0-497a-bfa9-4d54a281101c)
- [Group: Certificate Expiration Monitoring](/docs/0cf27d9a-8aeb-4555-92a2-45e993e1bd87)
- [Solution: Certificate Expiration Monitoring](/docs/4712590e-18e7-47f7-a038-ab704f5859c2)

## Monitor Setup Location

**Monitors Path:** `ENDPOINTS` ➞ `Alerts` ➞ `Monitors`  

## Monitor Summary

- **Name:** `Certificate Expiration 30 Days`  
- **Description:** `This monitor looks for any SSL certificates that have an expiration date of less than 30 days. This solution is effective for catching machines that may have been missed and do not have active reminders in place for certificate renewals. Additionally, the difference between the certification addition and expiration should be at least 30 days to trigger an alert.`  
- **Type:** `Script`  
- **Severity:** `Critical Impact Alerts`  
- **Family:** `Security`

![Image1](../../../static/img/docs/dc48efed-0e7d-44d4-8d1a-27e2bf91b028/image1.webp)

## Targeted Resources

- **Target Type:**  `Device Groups`  
- **Group Name:** `Certificate Expiration Monitoring`

![Image2](../../../static/img/docs/dc48efed-0e7d-44d4-8d1a-27e2bf91b028/image2.webp)

## Conditions

- **Run Script on:** `Schedule`  
- **Repeat every:** `1` `Hours`  
- **Script Language:** `PowerShell`  
- **Use Generative AI Assist for script creation:** `False`  
- **PowerShell Script Editor:**  

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/monitors/certificate-expiration-30-days/script.ps1)

- **Criteria:**  `Contains`  
- **Operator:** `AND`  
- **Script Output:**  `The following certificates are expiring within`  
- **Escalate ticket on script failure:** `False`  
- **Add Automation:**  ` `

![Image3](../../../static/img/docs/dc48efed-0e7d-44d4-8d1a-27e2bf91b028/image3.webp)

## Ticket Resolution

**Automatically resolve:** `False`

![Image4](../../../static/img/docs/dc48efed-0e7d-44d4-8d1a-27e2bf91b028/image4.webp)

## Monitor Output

**Output:** `Generate Ticket`

![Image5](../../../static/img/docs/dc48efed-0e7d-44d4-8d1a-27e2bf91b028/image5.webp)

## Completed Monitor

![Image6](../../../static/img/docs/dc48efed-0e7d-44d4-8d1a-27e2bf91b028/image6.webp)

## Changelog

### 2026-08-24

- Updated the Strapper module import method.
- Excluded certificates whose friendly name contains "TenantEncryptionCert".

### 2026-02-19

- Initial version of the document
