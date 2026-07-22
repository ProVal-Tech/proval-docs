---
id: 'cf5acc69-183c-4838-9484-2f3d9a247877'
slug: /cf5acc69-183c-4838-9484-2f3d9a247877
title: 'SSL Certificate Audit'
title_meta: 'SSL Certificate Audit'
keywords: ['certificates', 'audit', 'expiration', 'status', 'thumbprint', 'issuer', 'subject', 'client', 'computer']
description: 'This Script pulls any and all certificates in the personal certificate repository on windows machines that it is run on.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-22
---


## Purpose

The purpose of this solution is to audit all certificates in the **Local Machine Personal** certificate store on Windows devices and maintain an up-to-date inventory of the certificates present on each endpoint. During each audit, the solution identifies certificates that have expired or are approaching expiration based on a configurable threshold, updates the certificate inventory custom field with the audit results, and flags endpoints containing expired or soon-to-expire certificates. By default, certificates expiring within **30 days** are considered to be approaching expiration. This threshold can be customized using either using a custom field or the script parameter.

The solution also provides an optional alerting feature that uses the audit results to generate tickets only for devices where SSL certificate expiration monitoring has been enabled.

### Key Capabilities

1. **Comprehensive Certificate Auditing**  
   Audits all certificates in the Windows **Local Machine Personal** certificate store and maintains an up-to-date inventory of the certificates present on each endpoint.

2. **Configurable Expiration Threshold**  
   Configure the number of days prior to certificate expiration when a certificate should be considered as approaching expiration. The default expiration threshold is **30 days**.

3. **Certificate Inventory Reporting**  
   Updates the **[cPVAL SSL certificate Audit](/docs/350874e6-7bef-4bff-8fce-f2772acab495)** custom field with detailed information about every certificate discovered during the audit, including certificate metadata and expiration details.

4. **Optional Expiration Alerting**  
   Detects expired and soon-to-expire certificates and updates the **[cPVAL Expired SSL Certificates Detected](/docs/2c4efab3-5417-485a-b9cd-7d67ce474fd9)** custom field. The optional alerting component uses this information to generate alerts only on devices where SSL certificate expiration monitoring has been enabled.

### Important Caveats & Behavior

1. **Certificate Store Audited**  
   The solution audits certificates located only in the Windows **Local Machine Personal (My)** certificate store. Certificates stored in other certificate stores are not evaluated.

2. **Expiration Detection**  
   During each audit, certificates are evaluated against the configured expiration threshold. Certificates that have already expired or are within the configured threshold are flagged for reporting.

3. **Auditing and Alerting are Independent**  
   Certificate auditing operates independently and always updates the certificate inventory. Alerting is optional and depends on the **[cPVAL Enable SSL Cert Expiration Alerts](/docs/60d87a2b-e5ba-4aef-bbc8-35d60d101889)** custom field being enabled.

4. **Recurring Audits**  
   The audit task is designed to run on a scheduled basis to keep the certificate inventory current and ensure newly expired or soon-to-expire certificates are detected promptly.

## Associated Content

### For Auditing

| Content                      | Type                   | Function                   |
|---------------------------|-----------------------------------|------------------------------------------|
| [cPVAL SSL Certificate Audit](/docs/350874e6-7bef-4bff-8fce-f2772acab495)    | Custom Field | Stores the inventory of all certificates discovered in the Local Machine Personal certificate store. This field is populated by [Windows - Certificates (My) - Local Machine - Audit](/docs/3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5) |
| [cPVAL Expired SSL Certificates Detected](/docs/2c4efab3-5417-485a-b9cd-7d67ce474fd9)  | Custom Field | Set to `True` by [Windows - Certificates (My) - Local Machine - Audit](/docs/3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5) when one or more certificates are expired or approaching expiration based on the configured threshold. This custom field is also used by the alerting solution. |
| [cPVAL SSL Cert Expiry Threshold](/docs/304ab339-e99e-4b2d-9729-58a715df0a87) | Custom Field | Defines the number of days before certificate expiration when a certificate should be considered as approaching expiration. Certificates that have already expired or fall within the configured threshold are flagged during the audit. The default value is 30 days. This custom field is also used by the alerting solution.|
| [Windows - Certificates (My) - Local Machine - Audit](/docs/3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5) | Automation | Audits all certificates in the Local Machine Personal certificate store, updates the [Custom Field : cPVAL SSL certificate Audit](/docs/350874e6-7bef-4bff-8fce-f2772acab495) with the audit results, identifies certificates that are expired or approaching expiration based on the configured threshold, and sets the [Custom Field : cPVAL Expired SSL Certificates Detected](/docs/2c4efab3-5417-485a-b9cd-7d67ce474fd9) to `True` if any such certificates are detected. |
| [Audit Local Machine Certificates](/docs/f83dd443-cd43-45ce-8f05-a09e78b9ac0d)| Task | Executes [Script : Windows - Certificates (My) - Local Machine - Audit](/docs/3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5) once per day against  [Group : cPVAL Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256) and [Group : cPVAL Windows Workstations](/docs/6c0a75ba-68b7-47a5-acb8-17ef303f9422) to maintain an up-to-date certificate inventory and detect expired or soon-to-expire certificates. |


### For Alerting

| Content               | Type                   | Function                                               |
|-------|-----------------------------------------------------------|-----------------------------|
| [cPVAL Enable SSL Cert Expiration Alerts](/docs/60d87a2b-e5ba-4aef-bbc8-35d60d101889)  | Custom Field | Enables or disables SSL certificate expiration monitoring for the selected operating systems. When enabled, alerts are generated for expired or soon-to-expire certificates based on the configured expiration threshold. |
| [SSL Cert Expiration Alerts](/docs/1333942f-f022-4795-956b-ae86f815a636) | Ticket Template |Defines how ConnectWise Manage tickets are created when [Compound Condition : Monitor SSL Cert Expiration - Workstations](/docs/8c096a91-90f6-4c25-a5dc-745598b19e11) or [Compound Condition : Monitor SSL Cert Expiration - Servers](/docs/79d5020a-7487-42ad-9dc3-1cfd7d675be5) detects expired or soon-to-expire certificates. |
| [SSL Certificate Expiration Monitoring](/docs/4b6c5595-4336-4e14-a119-c6c7e2c31443)  | Automation | Processes the audit results and generates alerts for expired or soon-to-expire certificates that have not already been reported. The default certificate expiration threshold is 30 days. |
| [Monitor SSL Cert Expiration - Workstations](/docs/8c096a91-90f6-4c25-a5dc-745598b19e11)   | Compound Condition | Executes [Script : SSL Certificate Expiration Monitoring](/docs/4b6c5595-4336-4e14-a119-c6c7e2c31443) on Windows workstations where [Custom Field : cPVAL Enable SSL Cert Expiration Alerts](/docs/60d87a2b-e5ba-4aef-bbc8-35d60d101889) is enabled and [Custom Field : cPVAL Expired SSL Certificates Detected](/docs/2c4efab3-5417-485a-b9cd-7d67ce474fd9) is set to True. Tickets are generated only for expired or soon-to-expire certificates that have not already been alerted on. |
| [Monitor SSL Cert Expiration - Servers](/docs/79d5020a-7487-42ad-9dc3-1cfd7d675be5) | Compound Condition | Executes [Script : SSL Certificate Expiration Monitoring](/docs/4b6c5595-4336-4e14-a119-c6c7e2c31443) on Windows Servers where [Custom Field : cPVAL Enable SSL Cert Expiration Alerts](/docs/60d87a2b-e5ba-4aef-bbc8-35d60d101889) is enabled and [Custom Field : cPVAL Expired SSL Certificates Detected](/docs/2c4efab3-5417-485a-b9cd-7d67ce474fd9) is set to True. Tickets are generated only for expired or soon-to-expire certificates that have not already been alerted on. |

## Implementation

### Step 1: Create the Following Custom Fields

Create all the custom fields listed below. These custom fields are required for the auditing and optional alerting components to function correctly.

- [Custom Field : cPVAL SSL certificate Audit](/docs/350874e6-7bef-4bff-8fce-f2772acab495)
- [Custom Field : cPVAL Expired SSL Certificates Detected](/docs/2c4efab3-5417-485a-b9cd-7d67ce474fd9)
- [Custom Field : cPVAL SSL Cert Expiry Threshold](/docs/304ab339-e99e-4b2d-9729-58a715df0a87)
- [Custom Field : cPVAL Enable SSL Cert Expiration Alerts](/docs/60d87a2b-e5ba-4aef-bbc8-35d60d101889)

### Step 2: Create the Following Scripts

Create the automation scripts listed below.

- [Script : Windows - Certificates (My) - Local Machine - Audit](/docs/3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5)
- [Script : SSL Certificate Expiration Monitoring](/docs/4b6c5595-4336-4e14-a119-c6c7e2c31443)

### Step 3: Create the Ticket Template

Create the following ticket template to define how alerts are converted into ConnectWise Manage tickets.

- [Ticket Template : SSL Cert Expiration Alerts](/docs/1333942f-f022-4795-956b-ae86f815a636)

### Step 4: Create the Audit Task

Create the following task to execute the certificate audit on managed Windows devices.

- [Task : Audit Local Machine Certificates](/docs/f83dd443-cd43-45ce-8f05-a09e78b9ac0d)

Schedule the [Task : Audit Local Machine Certificates](/docs/f83dd443-cd43-45ce-8f05-a09e78b9ac0d) to run once per day against [Group : cPVAL Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256) and [Group : cPVAL Windows Workstations](/docs/6c0a75ba-68b7-47a5-acb8-17ef303f9422) to maintain an up-to-date certificate inventory.

### Step 5: Create the Alerting Compound Conditions

Create the following compound conditions to enable SSL certificate expiration monitoring.

- [Compound Condition : Monitor SSL Cert Expiration - Workstations](/docs/8c096a91-90f6-4c25-a5dc-745598b19e11)
- [Compound Condition : Monitor SSL Cert Expiration - Servers](/docs/79d5020a-7487-42ad-9dc3-1cfd7d675be5)

### Step 6: Review and Configure the Expiration Threshold

Review the default expiration threshold and configure the [Custom Field : cPVAL SSL Cert Expiry Threshold](/docs/304ab339-e99e-4b2d-9729-58a715df0a87) as required for your environment. If no value is configured, the solution uses the default threshold of **30 days**. Alternatively, the threshold can be overridden by passing the appropriate parameter to the audit script.

### Step 7: Enable SSL Certificate Expiration Monitoring

Configure the [Custom Field : cPVAL Enable SSL Cert Expiration Alerts](/docs/60d87a2b-e5ba-4aef-bbc8-35d60d101889) for the required operating systems to enable SSL certificate expiration monitoring. Only devices with monitoring enabled will execute [Script : SSL Certificate Expiration Monitoring](/docs/4b6c5595-4336-4e14-a119-c6c7e2c31443) and generate tickets for expired or soon-to-expire certificates.


## FAQ

### Q: How does the SSL Certificate Audit solution work?

> The [Script : Windows - Certificates (My) - Local Machine - Audit](/docs/3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5) audits all certificates in the Windows **Local Machine Personal** certificate store, updates the [cPVAL SSL certificate Audit](/docs/350874e6-7bef-4bff-8fce-f2772acab495) custom field with the audit results, and identifies certificates that are expired or approaching expiration. If any such certificates are detected, the [cPVAL Expired SSL Certificates Detected](/docs/2c4efab3-5417-485a-b9cd-7d67ce474fd9) custom field is set to `True`.

### Q: Which certificate store is audited?

> The solution audits only the Windows **Local Machine Personal (My)** certificate store. Certificates stored in other certificate stores are not evaluated.

### Q: What is the default expiration threshold?

> By default, certificates expiring within **30 days** are considered to be approaching expiration. This threshold can be changed using the [Custom Field : cPVAL SSL Cert Expiry Threshold](/docs/304ab339-e99e-4b2d-9729-58a715df0a87) or by passing a threshold value as a parameter to the audit script and Alerting script.

### Q: What information is stored in the certificate audit?

> The [cPVAL SSL certificate Audit](/docs/350874e6-7bef-4bff-8fce-f2772acab495) custom field contains an inventory of all certificates discovered during the audit, including details such as the subject, issuer, thumbprint, serial number, private key status, certificate creation date, and expiration date.

### Q: Can certificate auditing be used without enabling alerting?

> Yes. The auditing component operates independently and always updates the certificate inventory and expiration status. Enabling SSL certificate expiration monitoring is only required if you want tickets for expired or soon-to-expire certificates.

### Q: How are SSL certificate expiration alerts generated?

> The [Script : SSL Certificate Expiration Monitoring](/docs/4b6c5595-4336-4e14-a119-c6c7e2c31443) processes the audit results and generates tickets only when SSL certificate expiration monitoring has been enabled and expired or soon-to-expire certificates are detected that have not already been reported.

### Q: How often should the certificate audit run?

> It is recommended to schedule the [Task : Audit Local Machine Certificates](/docs/f83dd443-cd43-45ce-8f05-a09e78b9ac0d) to run once per day to maintain an up-to-date certificate inventory and detect newly expired or soon-to-expire certificates.

### Q: What happens if there are no expired or soon-to-expire certificates?

> The audit still updates the [cPVAL SSL certificate Audit](/docs/350874e6-7bef-4bff-8fce-f2772acab495) custom field with the current certificate inventory. The [cPVAL Expired SSL Certificates Detected](/docs/2c4efab3-5417-485a-b9cd-7d67ce474fd9) custom field remains `False`, and no SSL certificate expiration alerts are generated.

### Q: Does the solution modify, renew, or remove certificates?

> No. This solution is intended for auditing and monitoring only. It does not install, renew, modify, or remove certificates from the endpoint.

## Changelog

### 2026-07-22

- Deprecated custom field `cPVAL Enable SSL Cert Audit`. Certificate auditing is no longer controlled by this custom field.
- Renamed script to [Windows - Certificates (My) - Local Machine - Audit](/docs/3c9e2ed2-f805-4da9-85fb-7fa1d1d146f5) to better reflect that the script audits all certificates in the **Local Machine Personal** certificate store rather than only SSL certificates.
- Deprecated `Compound Condition : SSL Audit - Servers` and `Compound Condition : SSL Audit - Workstations`. Certificate auditing is now performed by [Task : Audit Local Machine Certificates](/docs/f83dd443-cd43-45ce-8f05-a09e78b9ac0d), which runs the audit script on all supported Windows devices.
- Separated the solution into independent **Auditing** and **Alerting** components, allowing certificate auditing to operate independently while providing optional SSL certificate expiration monitoring.


### 2026-02-16

- Initial version of the document.
