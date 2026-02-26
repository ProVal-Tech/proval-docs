---
id: '2caca618-6249-4f67-8bee-94538f69dae3'
slug: /2caca618-6249-4f67-8bee-94538f69dae3
title: 'Office 365 License Count'
title_meta: 'Office 365 License Count'
keywords: ['office365','license','count']
description: 'Authenticates to MS Graph via an App Registration to audit M365 license availability, outputting an HTML report to a NinjaRMM custom field.'
tags:  ['office365','update','windows','software']
draft: false
unlisted: false
---

## Overview

Retrieves Microsoft 365 license usage and availability through the Microsoft Graph API and writes the results as an HTML table into a WYSIWYG custom field on the device where the script runs.

The script employs the [Microsoft.Graph](https://github.com/microsoftgraph/msgraph-sdk-powershell) PowerShell module to establish a connection with the Office 365 portal and generate the report. As there is no provision for a silent or remote connection to the Office 365 portal using Office 365 credentials, the script utilizes the [Using PSCredential object](https://github.com/microsoftgraph/msgraph-sdk-powershell/blob/dev/docs/authentication.md#client-credential-via-client-secret) method for this purpose.

To effectively use this script, it is imperative to have the Office 365 ClientID, TenantID, and Client Secret. This information can be stored in the client-level custom fields as detailed in the article below.

Please note that this script is designed for professional use and requires a certain level of technical expertise for successful execution. It is recommended to thoroughly understand the script and its requirements before running it.

> **Note of Caution**: `Its functionality is not guaranteed on any computer running a version of PowerShell older than 5. Please ensure your systems are updated to at least PowerShell version 5 for optimal performance.`

## How to create Office 365 ClientID, TenantID, and Client Secret?

### Step 1: Register an Application in Azure AD

- Go to the  Azure Portal → Azure Active Directory → App registrations → New registration.
- Name the app (e.g., "LicenseReportApp").
- Select account type (usually "Accounts in this organizational directory only").
- Click Register.

### Step 2: Generate Client Secret

- Go to Certificates & secrets → New client secret.
- Add a description and choose expiry → Click Add.
- Copy the secret value (you won't see it again).

### Step 3: Assign API Permissions

- Go to API permissions → Add a permission → Microsoft Graph → Application permissions.
- Search for Organization.Read.All → Select it → Add permissions.
- Click Grant admin consent (requires Global Admin).

### Step 4: Note Credentials

- Application (Client) ID: Found on the app's overview page.
- Tenant ID: Found under Azure AD overview.
- Client Secret: From Step 2.

## Sample Run
  
![Image1](../../../static/img/docs/2caca618-6249-4f67-8bee-94538f69dae3/Image1.webp)

## Dependencies

- [Custom Field: cPVAL M365 Client ID](/docs/fb548778-0877-483c-871c-5fd34c277d61)
- [Custom Field: cPVAL M365 Tenant ID](/docs/e65b4461-73f7-4125-99d8-e0bb7202481e)
- [Custom Field: cPVAL M365 Client Secret](/docs/065a5f2f-9e2b-4717-b625-bd55bedf1986)
- [Custom Field: cPVAL Office 365 License Count](/docs/03049086-4043-4daf-88bf-f71ba98a301e)
- [Solution: Office 365 License Count Audit](/docs/4967b45b-e903-4176-ae5f-c4e095b5cdc5)

## Custom Fields

| Field Label                    | Accepted Values          | Scope                                         | Required | Description |
|-------------------------------|---------------------------|----------------------------------------|---------------|-------------|
| [cPVAL M365 Client ID](/docs/fb548778-0877-483c-871c-5fd34c277d61)          | Secure Text (Azure App Registration Client/Application ID) | Organization      | True         | The Client ID for the Azure AD App Registration used for MS Graph authentication. |
| [cPVAL M365 Tenant ID](/docs/e65b4461-73f7-4125-99d8-e0bb7202481e)           | Secure Text (Azure AD Tenant ID)                         | Organization       | True         | The Tenant ID of the Microsoft 365 environment. |
| [cPVAL M365 Client Secret](/docs/065a5f2f-9e2b-4717-b625-bd55bedf1986)      | Secure Text (Azure App Registration Client Secret)        |  Organization      |  True         | The Client Secret generated for the Azure AD App Registration. |
| [cPVAL Office 365 License Count](/docs/03049086-4043-4daf-88bf-f71ba98a301e)  | **WYSIWYG** (HTML String)                               | Device         | False         | Stores the HTML-formatted inventory of M365 licenses and their current usage counts. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/office-365-license-count.ps1)

## Output

- Activity Details  
- Custom Field
