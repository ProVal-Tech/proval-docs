---
id: 'e6f8548f-1459-4f72-9d77-be33dc4d89a6'
slug: /e6f8548f-1459-4f72-9d77-be33dc4d89a6
title: 'Configure BgInfo'
title_meta: 'Configure BgInfo'
keywords:  ['bginfo', 'configuration', 'download', 'tool', 'script']
description: 'Triggers the scripts to Configure BGInfo'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2026-09-22
---

## Purpose

The BGInfo Configuration solution is designed to automate the deployment and configuration of Microsoft Sysinternals BGInfo on supported Windows endpoints through ninja. It transfers the required BGInfo configuration file, downloads and configures BGInfo, and creates a scheduled task that automatically runs BGInfo when any user logs on to the endpoint.

The solution uses centralized configuration through the Ninja **cPVAL Configure BGInfo** custom field to control which Windows operating systems should receive the BGInfo configuration.

### Key Capabilities

1. **Automated BGInfo Deployment**

   Transfers the required `.BGI` or `.ZIP` configuration file to the endpoint and uses the BGInfo configuration automation to complete the deployment.

2. **Centralized BGInfo Configuration**

   Uses the **cPVAL Configure BGInfo** custom field to control which Windows operating systems should receive the BGInfo configuration.

3. **BGI and ZIP File Support**

   Supports both `.BGI` configuration files and `.ZIP` packages containing the required BGInfo configuration.

4. **Automated BGInfo Configuration**

   Downloads and configures Microsoft Sysinternals BGInfo and applies the specified `.BGI` configuration file to the endpoint.

5. **Automatic User Logon Execution**

   Creates a scheduled task configured with a logon trigger for any user so that BGInfo runs automatically when a user logs on.

6. **Scheduled Task Verification**

   Verifies that the BGInfo scheduled task exists and is configured with the required logon trigger before considering the deployment complete.

7. **Conditional Workstation and Server Deployment**

   Uses separate compound conditions to target Windows workstations and Windows servers based on the configured **cPVAL Configure BGInfo** custom field.

8. **Windows Platform Support**

   Supports BGInfo deployment on Windows workstations and servers targeted through the solution's associated conditions.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Custom Field - cPVAL Configure BGInfo](/docs/4055f1a8-0faa-47f6-b476-e50973bc5a25)  | Custom Field | Custom Field to select the operating system(s) on which BGInfo should be configured. |
| [File Transfer - BGI File](/docs/3201c4cc-a76e-4df9-8195-8663a320964d) |  File Transfer | The purpose of this file transfer is to place the BGI file or BGI ZIP file at `C:\ProgramData\_automation\app\BGInfo`, so it can be used by [Automation - Configure BGInfo](/docs/408cc622-de6a-4913-9150-267dcb4685e3). Both `.zip` and `.bgi` files are supported by the automation. |
| [Automation - Configure BGInfo](/docs/408cc622-de6a-4913-9150-267dcb4685e3) |   Automation   | Downloads and configures Microsoft Sysinternals BGInfo, applies the specified .BGI configuration file, and creates a scheduled task to run BGInfo automatically at user logon. |
| [Automation - BGInfo - Verify Scheduled Task](/docs/012a3d2e-4524-4fd3-9705-81a2ef0ca253) | Automation | Checks whether the "BGInfo scheduled task" exists and is configured with a "logon trigger for any user". |
| [Compound Condition - Configure BgInfo - Workstations](/docs/8cc5ecd5-036e-4fb2-b07d-14e738289f8f) | Compound Condition | Triggers the [File Transfer - BGI File](/docs/3201c4cc-a76e-4df9-8195-8663a320964d) and [Automation - Configure BGInfo](/docs/408cc622-de6a-4913-9150-267dcb4685e3) on Windows workstations where BGInfo deployment is enabled through the [Custom Field - cPVAL Configure BGInfo](/docs/4055f1a8-0faa-47f6-b476-e50973bc5a25).The condition also verifies that the "BGInfo scheduled task" has not already been created. This is validated using [Automation - BGInfo - Verify Scheduled Task](/docs/012a3d2e-4524-4fd3-9705-81a2ef0ca253) |
| [Compound Condition - Configure BgInfo - Servers](/docs/cebee064-7fcf-43ea-8792-e48a9d755ddd)  |  Compound Condition | Triggers the [File Transfer - BGI File](/docs/3201c4cc-a76e-4df9-8195-8663a320964d) and [Automation - Configure BGInfo](/docs/408cc622-de6a-4913-9150-267dcb4685e3) on Windows Servers where BGInfo deployment is enabled through the [Custom Field - cPVAL Configure BGInfo](/docs/4055f1a8-0faa-47f6-b476-e50973bc5a25). The condition also verifies that the "BGInfo scheduled task" has not already been created. This is validated using [Automation - BGInfo - Verify Scheduled Task](/docs/012a3d2e-4524-4fd3-9705-81a2ef0ca253) |

## Implementation

### Step 1: Create the Custom Field

Create the following custom field in ninja. This field is required to control which operating systems should receive the BGInfo configuration.

* [Custom Field - cPVAL Configure BGInfo](/docs/4055f1a8-0faa-47f6-b476-e50973bc5a25)

Configure the custom field with the appropriate operating system selection for the client, location or endpoint.

### Step 2: Upload the BGI File

Configure the [File Transfer - BGI File](/docs/3201c4cc-a76e-4df9-8195-8663a320964d) component with the required BGInfo `.BGI` or `.ZIP` file.

The file is transferred to:

`C:\ProgramData\_automation\app\BGInfo`

The [Automation - Configure BGInfo](/docs/408cc622-de6a-4913-9150-267dcb4685e3) automation uses the transferred file during deployment.

### Step 3: Configure the BGInfo Automation

Create [Automation - Configure BGInfo](/docs/408cc622-de6a-4913-9150-267dcb4685e3) automation to download and configure Microsoft Sysinternals BGInfo.

The automation applies the specified `.BGI` configuration and creates the BGInfo scheduled task with a logon trigger for any user.

### Step 4: Create the Scheduled Task Verification

Create [Automation - BGInfo - Verify Scheduled Task](/docs/012a3d2e-4524-4fd3-9705-81a2ef0ca253) automation to verify that the BGInfo scheduled task has been successfully created.

The verification checks that the scheduled task exists and has the required **logon trigger for any user**.

### Step 5: Create the Workstation Compound Condition

Create and configure the following compound condition:

* [Compound Condition - Configure BgInfo - Workstations](/docs/8cc5ecd5-036e-4fb2-b07d-14e738289f8f)

The condition targets eligible Windows workstations where BGInfo deployment is enabled through the **cPVAL Configure BGInfo** custom field.

It also verifies that the BGInfo scheduled task has not already been created before triggering the BGInfo deployment components.

### Step 6: Create the Server Compound Condition

Create and configure the following compound condition:

* [Compound Condition - Configure BgInfo - Servers](/docs/cebee064-7fcf-43ea-8792-e48a9d755ddd)

The condition targets eligible Windows servers where BGInfo deployment is enabled through the **cPVAL Configure BGInfo** custom field.

It also verifies that the BGInfo scheduled task has not already been created before triggering the BGInfo deployment components.

## FAQ

### Q: How does the BGInfo Configuration solution work?

> The solution evaluates the cPVAL Configure BGInfo custom field to determine whether BGInfo should be deployed to the endpoint. When the endpoint meets the applicable workstation or server criteria, the BGI file is transferred and the Automation - Configure BGInfo automation configures BGInfo and creates the required scheduled task.

### Q: Which operating systems are supported?

> The solution supports Windows workstations and Windows servers that meet the criteria configured in the associated compound conditions and are selected through the cPVAL Configure BGInfo custom field.

### Q: What file formats are supported?

> The solution supports both `.BGI` files and `.ZIP` files containing the required BGInfo configuration.

### Q: Where is the BGI file stored on the endpoint?

> The BGI or BGI ZIP file is transferred to `C:\ProgramData\_automation\app\BGInfo`.

### Q: How does BGInfo run automatically?

> The Automation - Configure BGInfo automation creates a scheduled task configured with a logon trigger for any user. BGInfo runs automatically when a user logs on to the endpoint.

### Q: How is the BGInfo scheduled task verified?

> The Automation - BGInfo - Verify Scheduled Task automation checks whether the BGInfo scheduled task exists and confirms that it has a logon trigger configured for any user.

### Q: Will the solution create the scheduled task multiple times?

> No. The workstation and server compound conditions verify whether the BGInfo scheduled task already exists before triggering the deployment automation.

### Q: What happens if BGInfo is already configured?

> If the BGInfo scheduled task already exists and meets the required configuration, the verification prevents the deployment components from being triggered unnecessarily.

### Q: How can I control which operating systems receive BGInfo?

> Use the cPVAL Configure BGInfo custom field to select the operating system(s) on which BGInfo should be configured.

### Q: What happens if the BGI file is missing?

> The BGInfo configuration automation requires the BGI or BGI ZIP file to be available through the associated file transfer. If the required configuration file is unavailable, the BGInfo configuration may not complete successfully.

### Q: What happens if the scheduled task does not have a logon trigger?

> The Automation - BGInfo - Verify Scheduled Task component identifies whether the required logon trigger is present. The scheduled task must have a logon trigger configured for any user for the BGInfo deployment to be considered correctly configured.

## Changelog

### 2026-09-22

- Initial version of the document
