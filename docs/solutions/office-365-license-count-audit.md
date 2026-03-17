---
id: '4967b45b-e903-4176-ae5f-c4e095b5cdc5'
slug: /4967b45b-e903-4176-ae5f-c4e095b5cdc5
title: 'Office 365 License Count Audit'
title_meta: 'Office 365 License Count Audit'
keywords: ['office365','license','count']
description: 'This solution automates the daily auditing of Microsoft 365 license usage and availability. By leveraging custom fields to securely store Azure AD application credentials and execution preferences at the organization level, the solution securely connects to the Microsoft Graph API. The collected license data is then parsed and displayed as an easy-to-read HTML table within a device-level custom field on the client''s primary domain controller.'
tags:  ['office365','update','windows','software']
draft: false
unlisted: false
last_update:
  date: 2026-02-27
---

## Purpose

This solution automates the daily auditing of Microsoft 365 license usage and availability. By leveraging custom fields to securely store Azure AD application credentials and execution preferences at the organization level, the solution securely connects to the Microsoft Graph API. The collected license data is then parsed and displayed as an easy-to-read HTML table within a device-level custom field on the client's primary domain controller.

## Associated Content

### Custom Fields

| Content | Definition Scope | Required | Type | Available Options | Applicable OS | Function |
| --- | --- | --- | --- | --- | --- | --- |
| [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) | `Device` | Yes | Text | | Windows | Stores the list of roles detected on a Windows server (from [Server Roles Detection solution](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6)) |
| [cPVAL Enable Office 365 License Count Audit](/docs/70be2211-ad18-44d2-9254-20cdd812f378) | `Organization` | Yes | Checkbox | N/A | Windows | Flags to enable daily Office 365 license count audits for the client |
| [cPVAL M365 Client ID](/docs/fb548778-0877-483c-871c-5fd34c277d61) | `Organization` | Yes | Secure | N/A | Windows | Stores the Azure App Registration Client/Application ID for authentication |
| [cPVAL M365 Tenant ID](/docs/e65b4461-73f7-4125-99d8-e0bb7202481e) | `Organization` | Yes | Secure | N/A | Windows | Stores the Microsoft 365 Tenant ID |
| [cPVAL M365 Client Secret](/docs/065a5f2f-9e2b-4717-b625-bd55bedf1986) | `Organization` | Yes | Secure | N/A | Windows | Stores the Azure App Registration Client Secret for authentication |
| [cPVAL Office 365 License Count](/docs/03049086-4043-4daf-88bf-f71ba98a301e) | `Device` | No | WYSIWYG | N/A | Windows | Displays the HTML-formatted inventory of M365 licenses and current usage counts |

### Automation

| Content | Function |
| --- | --- |
| [Automation: Office 365 License Count](/docs/2caca618-6249-4f67-8bee-94538f69dae3) | Connects to the Microsoft Graph API using stored credentials, retrieves license data, and writes the results to the device-level WYSIWYG custom field |

### Compound Conditions

| Content | Function |
| --- | --- |
| [Compound Condition: Office 365 License Count Audit](/docs/b2abd519-eaea-4741-8ba1-25a0de5ae234) | Triggers the auditing script daily on the client's primary domain controller when the audit checkbox is enabled at the organization level |

## Implementation

### Step 1: Install Prerequisites

Ensure the [Server Roles Detection and Grouping for NinjaOne](/docs/56ed4b40-11ce-4f8d-b1ca-c897d2c496e6) solution is installed, as it provides the [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) custom field required by this solution.

### Step 2: Create Custom Fields

1. Create [cPVAL Enable Office 365 License Count Audit](/docs/70be2211-ad18-44d2-9254-20cdd812f378) custom field:
    * **Scope:** Organization
    * **Type:** Checkbox
    * **Description:** "Flag this checkbox to enable Office 365 license count auditing for the client."

2. Create [cPVAL M365 Client ID](/docs/fb548778-0877-483c-871c-5fd34c277d61) custom field:
    * **Scope:** Organization
    * **Type:** Secure
    * **Description:** "Enter the Office 365 Client ID used to establish a secure connection with the tenant."

3. Create [cPVAL M365 Tenant ID](/docs/e65b4461-73f7-4125-99d8-e0bb7202481e) custom field:
    * **Scope:** Organization
    * **Type:** Secure
    * **Description:** "Enter the Office 365 Tenant ID associated with the client's Microsoft 365 environment."

4. Create [cPVAL M365 Client Secret](/docs/065a5f2f-9e2b-4717-b625-bd55bedf1986) custom field:
    * **Scope:** Organization  
    * **Type:** Secure  
    * **Description:** "Enter the Office 365 Client Secret associated with the application."  

5. Create [cPVAL Office 365 License Count](/docs/03049086-4043-4daf-88bf-f71ba98a301e) custom field:
    * **Scope:** Device
    * **Type:** WYSIWYG
    * **Description:** "Displays a table of Office 365 license information gathered by the auditing script."

### Step 3: Create Automation

Import the [Automation: Office 365 License Count](/docs/2caca618-6249-4f67-8bee-94538f69dae3) script that:

1. Retrieves the Azure AD App credentials (Client ID, Tenant ID, and Client Secret) from the organization-level secure fields.
2. Authenticates to the Microsoft Graph API using the `Microsoft.Graph` PowerShell module.
3. Retrieves the active license data (Total, Assigned, Available, etc.).
4. Formats the output as an HTML table and writes it to the device-level WYSIWYG custom field.

### Step 4: Configure Authentication & Credentials

1. Register an Application in the client's Azure AD portal and grant it `Organization.Read.All` Application API permissions (Admin consent required).
2. Generate a Client Secret for the registered application.
3. In NinjaOne, navigate to the organization level and populate the `cPVAL M365 Client ID`, `cPVAL M365 Tenant ID`, and `cPVAL M365 Client Secret` secure custom fields with the corresponding values.
4. Check the `cPVAL Enable Office 365 License Count Audit` box to authorize the daily run.

### Step 5: Create Compound Conditions

Create the [Compound Condition: Office 365 License Count Audit](/docs/b2abd519-eaea-4741-8ba1-25a0de5ae234):

* **Policy:** `Windows Server Policy [Default]`
* **Conditions:** - The device acts as the Primary Domain Controller.
* The `cPVAL Enable Office 365 License Count Audit` checkbox is flagged as `True` at the organization level.
* **Action:** Triggers the Office 365 License Count automation script on a daily schedule.

### FAQ

#### 1. Do we need to enable the auditing custom field just to run the script?

> No, the script can be executed independently. The `cPVAL Enable Office 365 License Count Audit` custom field is strictly used by the compound condition to enable the *automated daily run*. If you want to trigger the script manually to check licenses, you can do so without checking this box.

#### 2. Why are we running the script against Primary Domain Controllers (PDCs)?

> There is no strict technical requirement to run it on a PDC, but doing so provides a consistent tracking method. The outcome (the HTML table) is generated on the machine executing the script, meaning the WYSIWYG custom field is populated at the device level. By designating the PDC as the target for each client, we ensure the data is always stored and easily located on one unique, highly available machine per environment.

#### 3. What happens if a client does not have a Primary Domain Controller?

> If a client is serverless or uses Azure AD exclusively, the default compound condition will not trigger. In this case, you can either manually run the automation against a designated "always-on" workstation or modify the compound condition to target a different machine role for that specific organization.

#### 4. Why is the Server Roles Detection solution listed as a prerequisite?

> The Server Roles Detection solution populates the `cPVAL Roles Detected` custom field. The compound condition for this audit relies on that specific field to accurately identify which machine is acting as the client's Primary Domain Controller so it knows where to execute the script daily.

#### 5. What permissions are required for the Azure AD App Registration?

> The App Registration requires the `Organization.Read.All` Application API permission under Microsoft Graph. You must also grant Admin Consent for this permission in the Azure portal, or the script will fail to authenticate.

#### 6. Is the Azure Client Secret stored securely?

> Yes. The `cPVAL M365 Client Secret` (along with the Client ID and Tenant ID) is configured as a "Secure" type custom field at the Organization level in NinjaOne, meaning it is obfuscated and cannot be viewed in plain text once saved.

#### 7. Does the script prompt for MFA or user credentials?

> No. Because the script uses an Azure AD App Registration and a Client Secret (Client Credential Flow), it is designed for unattended, silent authentication in the background. It does not require a licensed user account or MFA prompts.

#### 8. What happens when the Azure AD Client Secret expires?

> Once the Client Secret reaches its expiration date set in Azure AD, the script will fail to authenticate and throw an error. You will need to generate a new secret in the Azure portal and update the `cPVAL M365 Client Secret` custom field in NinjaOne for that organization.

#### 9. Can this script show me exactly *which* users are assigned a specific license?

> No, this solution is designed for high-level auditing and billing reconciliation. The output displays the SKUs, total purchased units, assigned units, and available units. It does not output itemized user assignment lists.

#### 10. What PowerShell version is required to run the automation?

> The system requires at least PowerShell version 5. Older versions of PowerShell do not properly support the required modules or TLS protocols.

#### 11. What if the target machine doesn't have the Microsoft Graph PowerShell module installed?

> You don't need to install it beforehand. The script checks for the `microsoft.graph` and `Microsoft.Graph.Identity.DirectoryManagement` modules. If they are missing, it will automatically attempt to install and import them.

#### 12. Does the script require specific network security protocols?

> Yes, connecting to the Microsoft Graph API requires TLS 1.2 or higher. The script includes a prerequisite check that automatically attempts to enforce TLS 1.2 or TLS 1.3 for the current session.

#### 13. What happens if the required custom fields are left blank?

> If the Client ID, Tenant ID, or Client Secret custom fields are empty at the organization level, the script will immediately throw an error ("One or more required custom fields are missing or empty") and halt execution.

#### 14. Where do I find my Microsoft 365 Tenant ID and Client ID?

> In the Azure Portal, navigate to Azure Active Directory. Your Tenant ID is located on the main Overview page. The Application (Client) ID is found on the Overview page of the specific App Registration you created for this audit.

#### 15. How often does the automated audit run?

> When the `cPVAL Enable Office 365 License Count Audit` checkbox is flagged, the compound condition is configured to trigger the script on a daily schedule.

#### 16. How do I know if the script failed to run?

> You can check the "Automation > Activity" section in NinjaOne. If the script fails, it will output the specific exception message (e.g., failed authentication, missing modules, or missing custom fields) in the activity logs.

#### 17. Why is the output custom field a WYSIWYG type?

> The script parses the raw data from Microsoft Graph and wraps it in HTML and inline CSS to create a clean, color-coded table. The WYSIWYG (What You See Is What You Get) field type in NinjaOne is required to render this HTML properly so it is easily readable by technicians.

#### 18. Can I change the columns displayed in the HTML table?

> The columns (License, Total, Assigned, Available, AppliesTo, DataCollectionTime) are hardcoded into the PowerShell script's HTML build region. Altering the columns requires directly editing the script in your NinjaOne automation library.

#### 19. Does this audit consume NinjaOne API calls?

> The script utilizes NinjaOne's internal native PowerShell commands (`Ninja-Property-Get` and `Ninja-Property-Set`) to read and write to custom fields. These execute locally via the NinjaOne agent and do not count against standard external REST API rate limits.

#### 20. Can I deploy this audit to multiple tenants at once?

> Yes. You can import the custom fields and automation script globally. Then, simply populate the unique Azure AD credentials and check the enable flag on an organization-by-organization basis. The compound condition will automatically pick up any enabled organizations and run the audit.

## Changelog

### 2026-02-26

- Initial version of the document
