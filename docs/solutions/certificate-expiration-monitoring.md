---
id: '4712590e-18e7-47f7-a038-ab704f5859c2'
slug: /4712590e-18e7-47f7-a038-ab704f5859c2
title: 'Certificate Expiration Monitoring'
title_meta: 'Certificate Expiration Monitoring'
keywords: ['certificate', 'expiration', 'alerts', 'security', 'local-certs', 'ssl']
description: 'This solution outlines the steps for identifying and monitoring Windows certificates that are set to expire within the next 30 days through CW RMM.'
tags: ['windows', 'alerting', 'security', 'certificates']
draft: false
unlisted: false
last_update:
  date: 2026-02-20
---

## Purpose

This solution outlines the steps for identifying and monitoring Windows certificates that are set to expire within the next 30 days through CW RMM.

## Associated Content

### Custom Fields

| Name                            | Example                    | Type     | Level    | Required | Purpose                                                                                             |
|----------------------------------|----------------------------|----------|----------|----------|-----------------------------------------------------------------------------------------------------|
| [Certificate Expiration Alert](/docs/41d685b3-0e7c-41b6-802d-2d1a9b25593c)   | `Windows Workstations` | Dropdown     | COMPANY  | Yes      | Select the operating system to enable monitoring and alerts for certificates that will expire in the next 30 days. |
| [Disable Cert Expiration Alerts](/docs/9fa7d829-75c9-455d-9908-d695e0ae0a96)   | No | Flag     | SITE  | No      | Flag this custom field to exclude location from the certification expiration monitoring. |
| [Disable Cert Expiration Alert](/docs/f329bc75-50a0-497a-bfa9-4d54a281101c)   | No | Flag     | ENDPOINT  | No      | Flag this custom field to exclude computer from the certification expiration monitoring. |

### Group

| Name                                                                                  | Purpose                                                                               |
|---------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| [Certificate Expiration Monitoring](/docs/0cf27d9a-8aeb-4555-92a2-45e993e1bd87)       | Group of machines with certificate expiration monitoring enabled. |

### Monitor

| Name                                               | Type    | Schedule      | Purpose                                                                         |
|----------------------------------------------------|---------|---------------|---------------------------------------------------------------------------------|
| [Certificate Expiration 30 Days](/docs/dc48efed-0e7d-44d4-8d1a-27e2bf91b028) | Script  | Hourly | Looks for any SSL certificates that have an expiration date of less than 30 days. This solution is effective for catching machines that may have been missed and do not have active reminders in place for certificate renewals. Additionally, the difference between the certification addition and expiration should be at least 30 days to trigger an alert. |

## Implementation

### Step 1: Create the Required Custom Fields

Create the custom fields defined above under `SETTINGS → Custom Fields` in CW RMM. See documentation page of individual custom field for configuration details.

- [Certificate Expiration Alert](/docs/41d685b3-0e7c-41b6-802d-2d1a9b25593c)
- [Disable Cert Expiration Alerts](/docs/9fa7d829-75c9-455d-9908-d695e0ae0a96)
- [Disable Cert Expiration Alert](/docs/f329bc75-50a0-497a-bfa9-4d54a281101c)

### Step 2: Create the Dynamic Group

Create the group [Certificate Expiration Monitoring](/docs/0cf27d9a-8aeb-4555-92a2-45e993e1bd87) under `ENDPOINTS → Groups` as a dynamic group.

### Step 3: Set up the Monitor

Configure the monitor [Certificate Expiration 30 Days](/docs/dc48efed-0e7d-44d4-8d1a-27e2bf91b028) under `ENDPOINTS → Alerts → Monitors` to target the monitoring enabled group, running every hour and generating a ticket for detected hosts.

## FAQ

### How often does the monitor check for expiring certificates?

> The monitor runs every hour to check for certificates expiring within 30 days. This frequent schedule ensures newly expiring certificates are detected and alerted on quickly.

### What happens if a certificate has already been alerted on?

> The monitor stores information about previously alerted certificates and will not re-alert on the same certificate. This prevents duplicate alerts for certificates that are still expiring but have already been notified.

### What types of certificates are excluded from monitoring?

> The monitor filters out:
>
>> - Self-signed certificates matching the computer name
>> - Microsoft and WMSVC-issued certificates
>> - Certificates with invalid or missing thumbprints
>> - Randomly generated certificate identifiers (UUID patterns)

### At what COMPANY level can I enable certificate expiration monitoring?

> The **Certificate Expiration Alerts** custom field is configured at the COMPANY level with options to:
>
>> - **Disabled** - Monitoring disabled
>> - **Windows** - Monitor all Windows devices (both workstations and servers)
>> - **Windows Workstations** - Monitor workstations only
>> - **Windows Servers** - Monitor servers only

### Can I exclude specific locations or computers from monitoring?

> Yes. Use the site-level custom field **Disable Cert Expiration Alerts** to exclude an entire location, or the endpoint-level custom field **Disable Cert Expiration Alert** to exclude individual computers.

### What is the minimum certificate lifetime to trigger an alert?

> Certificates must have been installed for at least 30 days before an expiration alert will be generated. This prevents alerts on newly installed certificates that will expire within 30 days before they've been in use long enough.

### What custom fields must be enabled for a computer to be monitored?

> For a computer to be monitored, ALL of the following must be true:
>
>> - The COMPANY-level **Certificate Expiration Alerts** field must be set to `Windows`, `Windows Workstations`, or `Windows Servers`
>> - Both site-level and endpoint-level **Disable Cert Expiration Alerts** fields must be set to `False` (or unchecked)
>> - The device must match the OS Type and Endpoint Type criteria

### What information is included when a certificate expiration alert is generated?

> Alerts include the certificate's:
>
>> - Friendly Name
>> - Subject and Issuer
>> - Thumbprint and Serial Number
>> - Certificate Version
>> - Installation date (NotBefore)
>> - Expiration date (NotAfter)

## Changelog

### 2026-02-19

- Initial version of the document
