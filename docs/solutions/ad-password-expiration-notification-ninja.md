---
id: 'd4cea30e-2724-4a28-870e-91eb349ad028'
slug: /d4cea30e-2724-4a28-870e-91eb349ad028
title: 'AD Password Expiration Notification'
title_meta: 'AD Password Expiration Notification'
keywords: ['access-management', 'user-management', 'active-directory', 'ad', 'password-expiration', 'notification']
description: 'This solution provides the AD Password Expiration notification method to email to the users using Microsoft Graph and also adds an option to run it as ReportOnly without emailing.'
tags: ['active-directory', 'access-management']
draft: false
unlisted: false
last_update:
  date: 2026-11-11
---

## Purpose

### How it works

1. The scheduled automation runs on every DC in the policy. Only the DC that holds the **PDC Emulator** role does the work. Other DCs clear their output fields and exit successfully, so each domain is processed once.
2. It reads every enabled user and gets the expiry date from `msDS-UserPasswordExpiryTimeComputed`.
3. For each user expiring within the window that isn't excluded:
   - **Has an email address:** the user gets the email.
   - **No email address:** the HelpDesk address gets an email (if one is set). Otherwise the user is counted as an issue.
4. It writes a report to `cpvalAdPasswordExpiryReport` and a count of problems to `cpvalAdPasswordExpiryIssues`. A condition alerts when the count is above 0.
5. A local state file (`%ProgramData%\_Automation\Script\AD-PasswordExpirationNotification\NotificationState.json`) remembers who was emailed. Each user gets **one email per password cycle**, as the Automate monitor did. Optional extra reminders can be set with `cpvalAdPasswordExpiryReminderDays`, e.g. `3,1`.

**Platform:** `NinjaOne`

### Key Capabilities

- **Email User** – This automation helps to email AD users whose password is about to expire.

## Associated Content

### Script

| Name | Purpose |
|---|---|
| [AD - Password Expiration Notification](/docs/41b5da34-65d2-43df-a207-8c252c91b327) | For every enabled user whose password expires within N days (default 7) the script will send email to them. It should be scheduled daily at 6 AM to the target group `Is Primary Domain Controller` (Built-in group). |

### Custom Fields

| Name | Level | Type | Purpose |
|---|---|---|---|
| [cPVAL AD Password Expiry Days](/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad) | `Organization`, `Location`, `Device` | Integer | This custom field is set to determine the Notification window in days.|
| [cPVAL AD Password Expiry Email Method](/docs/546c3075-2c22-4886-b9a6-224055c744e7) | `Organization`, `Location`, `Device` | Drop-down | This custom field is set to register the email method for users whose passwords are about to expire within a specified number of days. |
| [cPVAL AD Password Expiry Exclusions](/docs/2715ef45-6fba-4ff9-9e67-c6f65bc88615) | `Organization`, `Location`, `Device` | Multi-line | Provide sAMAccountNames separated by commas or newlines to be excluded from the password expiration notification. * wildcard allowed, e.g., svc_*. |
| [cPVAL AD Password Expiry Notification](/docs/8cc47fa6-a3d3-42d4-8708-9e924ef88479) | `Organization`, `Location`, `Device` |  Drop-Down | This custom field is required to be set to enable the AD Password Expiry Notification alerting. |
| [cPVAL AD Password Expiry Reminder Days](/docs/089f83dd-2b05-4dcd-9cee-f60fd0267b82) | `Organization`, `Location`, `Device` |  Text | Optional extra reminders, e.g. 3,1. Blank means one email per cycle. |
| [cPVAL AD Password Expiry Fallback Email](/docs/955e220f-aaab-486c-8097-a55d8a882a97) | `Organization`, `Location`, `Device` |  Text | Optional. Helpdesk/PSA mailbox(es) for users without an email address, separated by semicolons (;). |
| [cPVAL AD Password Expiry Graph Client Secret](/docs/00940bdb-ec6b-470b-8327-bcc57bc2f907) | `Organization`, `Location`, `Device` | Secure | This is used in the Graph only. Secure fields are readable by automations only, up to 500 characters. |
| [cPVAL AD Password Expiry Graph Client ID](/docs/0a76e567-5a78-4bcb-92ce-5973fcedf73c) | `Organization`, `Location`, `Device` | Text | This custom field is required to set the ClientId for the Ninja organization in O365 so the Graph integration can send emails to AD users. |
| [cPVAL AD Password Expiry Sender](/docs/8f2cf825-4bd9-47f8-8fbd-a8e31fe656f9) | `Organization`, `Location`, `Device` | Text | Required. Sending mailbox. SMTP also accepts IT Support email. |
| [cPVAL AD Password Expiry Graph Tenant ID](/docs/31b1786b-2865-4101-bafa-8bc446ce8600) | `Organization`, `Location`, `Device` | Text | This custom field is required to be set with the O365 tenant ID when the Graph option is set in the custom field 'cpvalAdPasswordExpiryEmailMethod'. |
| [cPVAL AD Password Expiry SMTP Password](/docs/c224f8bc-ca97-4e91-9c30-1c8f987e1fdd) | `Organization`, `Location`, `Device` | Secure | This custom field is required to pass the SMTP password for the SMTP emailing method. |
| [cPVAL AD Password Expiry SMTP Port](/docs/879879ec-21c4-4c8d-9301-43b14ffbe830) | `Organization`, `Location`, `Device` | Text | This custom field is required to be set only when the custom field 'cpvalAdPasswordExpiryEmailMethod' is set to the SMTP option. STARTTLS. Port 465 (implicit TLS) is not supported. |
| [cPVAL AD Password Expiry SMTP Server](/docs/28ee82b3-6bd6-4f45-86f6-57822228c81f) | `Organization`, `Location`, `Device` | Text | This custom field is required to be set only when the custom field 'cpvalAdPasswordExpiryEmailMethod' is set to the SMTP option. STARTTLS. Port 465 (implicit TLS) is not supported. |
| [cPVAL AD Password Expiry SMTP Username](/docs/c31a9bfa-2b08-47b5-b148-777b6adf3d54) | `Organization`, `Location`, `Device` | Text | This custom field is required to provide the SMTP server details only when the custom field 'cpvalAdPasswordExpiryEmailMethod' is set to the SMTP option. |
| [cPVAL AD Password Expiry Issues](/docs/9116ea7c-c6ef-4b49-a906-4a9e0e148b64) | `Device` | Integer | Users who couldn't be notified + failed emails + script errors. 0 = healthy. |
| [cPVAL AD Password Expiry Report](/docs/77924cf6-6e06-43a8-bf1e-e0ae55867b46) |  `Device` | WYSIWYG | This custom field stores the last-run summary, expiring user list, including their status in the html data (tabular format). |

### Group

| Name | Type | Purpose |
|---|---|---|
| `Is Primary Domain Controller` | Built-in group | This contains the Primary Domain Controller Windows server. |

### Task

| Name | Type | Purpose |
|---|---|---|
| [AD Password Expiration Notification](/docs/8f778daf-45e8-476a-bd0d-d61928e84987) | Task | This task is scheduled to run on the Windows Server Domain Controller (specifically to DC with Infrastructure role) to perform the AD user expiration alerting. |

### Audit Report

| Name | Type | Purpose |
|---|---|---|
| [AD Password Expiration Notification](/docs/82ba2eb4-6323-4480-920d-439ff41da0e0) | Knowledge Article | This knowledge article shows the AD users information about the user password expiry and the email sent to them or not. |

### Compound Condition

| Name | Condition Type | Purpose |
|---|---|---|
| [AD Password Expiration Notification](/docs/9b845ec8-372f-4afc-bbe4-bba532cdd08f) | Custom field Condition | This compound condition is built to create ticket if the AD user password expiration email sent failed. |

## Implementation

### Step 1:  Create the Custom Fields

Create the below custom fields:

- [Custom field - cPVAL AD Password Expiry Days](/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad)
- [Custom field - cPVAL AD Password Expiry Email Method](/docs/546c3075-2c22-4886-b9a6-224055c744e7)
- [Custom field - cPVAL AD Password Expiry Exclusions](/docs/2715ef45-6fba-4ff9-9e67-c6f65bc88615)
- [Custom field - cPVAL AD Password Expiry Notification](/docs/8cc47fa6-a3d3-42d4-8708-9e924ef88479)
- [Custom field - cPVAL AD Password Expiry Reminder Days](/docs/089f83dd-2b05-4dcd-9cee-f60fd0267b82)
- [Custom field - cPVAL AD Password Expiry Fallback Email](/docs/955e220f-aaab-486c-8097-a55d8a882a97)
- [Custom field - cPVAL AD Password Expiry Graph Client Secret](/docs/00940bdb-ec6b-470b-8327-bcc57bc2f907)
- [Custom field - cPVAL AD Password Expiry Graph Client ID](/docs/0a76e567-5a78-4bcb-92ce-5973fcedf73c) 
- [Custom field - cPVAL AD Password Expiry Sender](/docs/8f2cf825-4bd9-47f8-8fbd-a8e31fe656f9)
- [Custom field - cPVAL AD Password Expiry Graph Tenant ID](/docs/31b1786b-2865-4101-bafa-8bc446ce8600)
- [Custom field - cPVAL AD Password Expiry SMTP Password](/docs/c224f8bc-ca97-4e91-9c30-1c8f987e1fdd)
- [Custom field - cPVAL AD Password Expiry SMTP Port](/docs/879879ec-21c4-4c8d-9301-43b14ffbe830)
- [Custom field - cPVAL AD Password Expiry SMTP Server](/docs/28ee82b3-6bd6-4f45-86f6-57822228c81f)
- [Custom field - cPVAL AD Password Expiry SMTP Username](/docs/c31a9bfa-2b08-47b5-b148-777b6adf3d54)
- [Custom field - cPVAL AD Password Expiry Issues](/docs/9116ea7c-c6ef-4b49-a906-4a9e0e148b64)
- [Custom field - cPVAL AD Password Expiry Report](/docs/77924cf6-6e06-43a8-bf1e-e0ae55867b46) 

### Step 2: Create the Automation

Create the automation and set it to run as System.

- [Script - AD - Password Expiration Notification](/docs/41b5da34-65d2-43df-a207-8c252c91b327)

### Step 3: Create the Task 

- [Task - AD Password Expiration Notification](/docs/8f778daf-45e8-476a-bd0d-d61928e84987)

### Step 4: Create the Compound Condition

Create the compound condition and add it to the `Windows Server Policy`

- [Compound Condition - AD Password Expiration Notification](/docs/9b845ec8-372f-4afc-bbe4-bba532cdd08f)

### Step 5: Action

- Set the values of the [Custom field - cPVAL AD Password Expiry Email Method](/docs/546c3075-2c22-4886-b9a6-224055c744e7) to either `Graph` or `SMTP`. (Note: The graph method is recommended.)
- Accordingly provide the Graph client id, tenant id and the Graph Secret key [Custom field - cPVAL AD Password Expiry Graph Client Secret](/docs/00940bdb-ec6b-470b-8327-bcc57bc2f907), [Custom field - cPVAL AD Password Expiry Graph Client ID](/docs/0a76e567-5a78-4bcb-92ce-5973fcedf73c), and [Custom field - cPVAL AD Password Expiry Graph Tenant ID](/docs/31b1786b-2865-4101-bafa-8bc446ce8600).
- Enable the [Task - AD Password Expiration Notification](/docs/8f778daf-45e8-476a-bd0d-d61928e84987) by implementing it to the built-in group `Is Primary Domain Controller`.
- For ticketing on email sent failed enable the [Compound Condition - AD Password Expiration Notification](/docs/9b845ec8-372f-4afc-bbe4-bba532cdd08f).

## FAQ

**Q:** Can this automation will be set without setting the Email method?
> Yes, just check the ReportOnly method in the [Script - AD - Password Expiration Notification](/docs/41b5da34-65d2-43df-a207-8c252c91b327) variable.

## Changelog

### 2026-11-11

- Initial version of the document
