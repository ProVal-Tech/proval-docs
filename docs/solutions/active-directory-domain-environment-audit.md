---
id: 'dd914cae-33e3-4ac2-8904-c9ef1f4814a3'
slug: /dd914cae-33e3-4ac2-8904-c9ef1f4814a3
title: 'Active Directory & Domain Environment Audit'
title_meta: 'Active Directory & Domain Environment Audit'
keywords: ['active-directory', 'monitoring', 'implementation', 'alerts', 'reports']
description: 'This document provides a comprehensive guide on implementing monitoring solutions for Active Directory environments. It details various internal and remote monitors, scripts, dataviews, and reports that can be utilized to ensure effective monitoring and management of Active Directory, along with step-by-step implementation instructions.'
tags: ['active-directory']
draft: false
unlisted: false
---

## Purpose

This solution document delineates the contents applicable for monitoring the Active Directory Domain environment. Please review the implementation steps meticulously as a significant portion of the content relies on the **`Active Directory`** plugin.

This article encompasses multiple components and contents. Please import and implement only the required components.

## Associated Content

#### Internal Monitor

| Content                                                                                                                           | Type             | Function                                                                                                                                                                                                                       |
| --------------------------------------------------------------------------------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [CWM - Automate - Internal Monitor - Active Directory - Sync Out of Date](/docs/18432358-9550-4ab9-959e-255196b0ebcf)             | Internal Monitor | This monitor looks for the AD server that has been onboarded for more than 30 days and is experiencing a credential issue in the Active Directory Plugin.                                                                      |
| [RSM - Active Directory - Monitor - Active Directory - New User Account Created](/docs/e04e673a-5340-47af-9536-28788ffd37ae)      | Internal Monitor | This monitor looks for new domain user accounts that have a creation date within the past day. A ticket is created for each new account discovered.                                                                            |
| [RSM - Active Directory - Monitor - Password Expires This Week [G]](/docs/d002ff1b-cb8c-45db-af82-096e7912db2b)                   | Internal Monitor | Detects the domain users whose password is going to expire within a week.                                                                                                                                                      |
| [RSM - Active Directory - Monitor - Active Directory - Enabled Test Accounts](/docs/f1bc732b-7469-4689-aa3e-d0af5161ecc5)         | Internal Monitor | This monitor will look for any account with the name **`Test`** in the account name and will flag that account if it is enabled on the domain.                                                                                 |
| [RSM - Active Directory - Monitor - Account Disabled](/docs/b357e9c8-3b17-47ec-a508-0cfe345c0c41)                                 | Internal Monitor | This monitor looks for the disabled accounts on Active Directory servers through the Active Directory plugin and creates a ticket for each one found.                                                                          |
| [RSM - Active Directory - Monitor - Active Directory - User Last Logon > X Days](/docs/2a260035-6023-4b23-ad58-4dbc38d9c819)      | Internal Monitor | This monitor will check for users who have not logged in for more than X days and are not administrator accounts.                                                                                                              |
| [CWM - Automate - Internal Monitor - Active Computers in AD with No Agent](/docs/29eeae8f-d854-4234-82c5-28b1bbee0fc7)            | Internal Monitor | The monitor set generates a client-level ticket containing details of domain-joined computers active within the domain, which have been joined to the domain for at least 7 days but do not have the Automate agent installed. |
| [CWM - Automate - Internal Monitor - Active Directory - ADPluginUser - Create/Update](/docs/49c050b4-5319-4ffe-929a-d59429bdd3ba) | Internal Monitor | The purpose of this monitor set is to create an 'ADPluginUser' account for the domain controllers detected in AD Plugin.                                                                                                       |
| [RSM - Active Directory - Monitor - GPO Modified](/docs/25040f3b-ef1d-4ebb-af45-e0df3d12ebae)                                     | Internal Monitor | This Custom RAWSQL monitor shows GPO modified time on the computer if the GPO was modified in the last day.                                                                                                                    |

#### Remote Monitor

| Content                                                                                                                                 | Type           | Function                                                                                                                                                                                                                                      |
| --------------------------------------------------------------------------------------------------------------------------------------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [EPM - User Management - Remote Monitor - Reset AD Users Password Age](/docs/d0774dcc-9a7f-4f9a-9719-096e90309e2d)                      | Remote Monitor | This remote monitor checks AD user's login password age to see if the age is set to unlimited, and if so it will change the user password from never expire to expire and will also change the Default domain policy password age to 90 days. |
| [RSM - Active Directory - Remote Monitor - New Domain Admin](/docs/73adabc6-03cb-4979-9c62-97acc98308da)                                | Remote Monitor | The purpose of the remote monitor is to detect the newly created/promoted domain admins and create a ticket.                                                                                                                                  |
| [CWM - Automate - Remote Monitor - AD Recycle Bin State Check](/docs/5041d497-ae6c-4209-a338-60f1da396106)                              | Remote Monitor | This is a remote PowerShell monitor which detects whether the AD Recycle Bin is enabled or disabled on Windows Active Directory servers.                                                                                                      |
| [RSM - Active Directory - Remote Monitor - AD Account Lockout Detection](/docs/2549fcf6-30b5-497b-b44d-7329334bb32c)                    | Remote Monitor | The monitoring system is set up to gather data on event ID 4740 that occurred within the last 15 minutes and to generate an alert with the relevant information.                                                                              |
| [RSM - Active Directory - Remote Monitor - Active Directory Replication Anomaly Monitoring](/docs/c02b447f-36ba-4a88-b40f-a47cf08fb690) | Remote Monitor | The monitor set operates on a cluster of Primary Domain Controllers (Infrastructure Masters) for each domain, triggering a failure alert upon detecting any Active Directory Replication Failure.                                             |

#### Script

| Content                                                                                                                                            | Type   | Function                                                                                                                                                                                                                                |
| -------------------------------------------------------------------------------------------------------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [CWM - Automate - Script - AD - Enable AD Recycle Bin](/docs/e80d5873-304e-4b12-b52c-b608a7715a9f)                                                 | Script | This script enables the AD Recycle Bin. [Microsoft TechNet Article](https://techcommunity.microsoft.com/t5/ask-the-directory-services-team/the-ad-recycle-bin-understanding-implementing-best-practices-and/ba-p/396944)                |
| [RSM - Active Directory - Script - Weak Passwords - AD Test](/docs/cf22292d-e874-47ee-9bd1-5ec79c5f3724)                                           | Script | The script tests the hashed credentials in AD against a known compromised or weak list.                                                                                                                                                 |
| [CWM - Automate - Script - Active Directory - Plugin User Account - Create/Update](/docs/ea1aca74-77ee-4387-91f2-57adb5822737)                     | Script | This script will create/update a domain admin account to be used with the AD plugin with a random password.                                                                                                                             |
| [RSM - Active Directory - Script - Group Policy - Audit](/docs/2e5f5f2b-7c81-4aec-a76a-623a465f959a)                                               | Script | This process will execute PowerShell to gather GPO data.                                                                                                                                                                                |
| [AD - Create Views/Table/Schedule for AD Reporting Solution](/docs/f0b2fe2b-8bd8-4d9a-9428-2123b332aa49)                                           | Script | This creates all of the needed items in the Database to ensure the [Active Directory Reporting Solution](/docs/ca5427f7-0efe-499d-9e80-c06698efa5d0) functions correctly.                                                               |
| [CWM - Automate - Script - ScreenConnect - RMM+ Autofix - AD Plugin - Sync Out of Date [Ticket]*](/docs/6c9ef438-835d-44a9-bf31-4a1db9253347)      | Script | This script is intended to be used as an auto fix for the [CWM - Automate - Internal Monitor - Active Directory - Sync Out of Date](/docs/18432358-9550-4ab9-959e-255196b0ebcf) monitor. This script will not function if run manually. |
| [CWM - Automate - Script - Active Directory - Alerting - Password Expires This Week [Global,Autofix]*](/docs/6ad5ccf5-0502-459c-a877-eaeafc0ad432) | Script | The script covers the alerting section of the [RSM - Active Directory - Monitor - Password Expires This Week [G]](/docs/d002ff1b-cb8c-45db-af82-096e7912db2b) monitor set.                                                              |

#### Dataview

| Content                                                                                                                            | Type     | Function                                                                                                                                |
| ---------------------------------------------------------------------------------------------------------------------------------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| [RSM - Active Directory - Dataview - Active Directory - AD Users](/docs/be838d2c-2633-4df6-94b0-0dc5d4aef7dd)                      | Dataview | This dataview displays all users associated with a domain and general information about all the users.                                  |
| [RSM - Active Directory - Dataview - Active Directory - Domain Groups and Members](/docs/becaa382-47f6-414c-8d49-57b8c67b03b5)     | Dataview | This dataview shows you all domains and their respective groups and a corresponding list of members.                                    |
| [RSM - Active Directory - Dataview - Windows - Group Policy Objects](/docs/1da4d5e9-4168-4c21-94cf-9b52fc565bf7)                   | Dataview | This dataview shows information about GPOs, their applied policies, where they are linked to, and to what trustees they are applied to. |
| [RSM - Active Directory - Dataview - Windows - Group Policy Settings](/docs/ea24f672-d2cd-41bc-8b62-2dcd20085d29)                  | Dataview | This dataview shows information about GPOs, their applied policies, and settings.                                                       |
| [RSM - Active Directory - Dataview - Windows - Group Policy Object Links](/docs/45a9f461-fac0-4e5c-9a5f-819786e8ad21)              | Dataview | This dataview shows information about GPOs, their applied policies, and where they are linked to.                                       |
| [RSM - Active Directory - Dataview - Windows - Group Policy Object Security Filtering](/docs/337526eb-1aa7-48a3-beab-ab66d2b7aea8) | Dataview | This dataview displays information related to Group Policy Objects in Active Directory, specifically related to security policies.      |

#### Report

| Content                                                                                         | Type      | Function                                                                                                                              |
| ----------------------------------------------------------------------------------------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| [Report - Active Directory User Assessment](/docs/71ade073-cc5c-4833-bf2c-2d8b13472078)         | Report    | Displays an overall health view of the Client's Active Directory along with a full user report.                                       |
| [Report - Active Directory User Groups - Detail](/docs/e76e5bf4-d80e-4a53-ab39-a116c157e008)    | Report    | Displays a complete user list with all groups that each user is in, along with an overall view of what groups are used the most.      |
| [Report - Computers in Active Directory - No Agent](/docs/f3651662-8b77-4254-a8b3-8a945e3aab51) | Report    | Displays a list of all computers that are in Active Directory but not in Automate. Can be used to clean up Client Active Directories. |
| SubPageHeaderLandscape                                                                          | Subreport | Used as the template for the page header on these reports.                                                                            |

## Implementation (Active Directory Plugin Dependent Solutions)

1. The solutions presented in this section rely on the functionality provided by the **`Active Directory`** plugin. Therefore, it is imperative to verify that both the **`Active Directory`** and **`Active Directory Remote`** plugins are correctly installed and operational within the environment.

   ![](../../static/img/Active-Directory-&-Domain-Environment-Audit/image_1.png)
   ![](../../static/img/Active-Directory-&-Domain-Environment-Audit/image_2.png)

2. ### Active Directory Reporting Solution

   Follow the steps outlined in the [EPM - Accounts - Report - Active Directory Reporting Solution](/docs/ca5427f7-0efe-499d-9e80-c06698efa5d0) document to import and configure the following reports:

   - [Report - Active Directory User Assessment](/docs/71ade073-cc5c-4833-bf2c-2d8b13472078)
   - [Report - Active Directory User Groups - Detail](/docs/e76e5bf4-d80e-4a53-ab39-a116c157e008)
   - [Report - Computers in Active Directory - No Agent](/docs/f3651662-8b77-4254-a8b3-8a945e3aab51)
   - SubPageHeaderLandscape

3. ### Active Directory - Sync Out of Date

   - Import the [CWM - Automate - Internal Monitor - Active Directory - Sync Out of Date](/docs/18432358-9550-4ab9-959e-255196b0ebcf) internal monitor set from the `ProSync` plugin.
   - Import the [CWM - Automate - Script - ScreenConnect - RMM+ Autofix - AD Plugin - Sync Out of Date [Ticket]*](/docs/6c9ef438-835d-44a9-bf31-4a1db9253347) script from the `ProSync` plugin.
   - Import the **`△ Custom - Autofix - AD Plugin Sync Out of Date`** alert template from the `ProSync` plugin.
   - Reload the system cache.
   - Ensure that the RMM+ Plugin is correctly configured and operational within the environment, as this solution relies on the proper configuration of the [CWM - Automate - RMM+ Plugin Configuration](/docs/f99ddaae-0cb3-4941-b2aa-dc93671dd246).
   - Assign the **`△ Custom - Autofix - AD Plugin Sync Out of Date`** alert template to the [CWM - Automate - Internal Monitor - Active Directory - Sync Out of Date](/docs/18432358-9550-4ab9-959e-255196b0ebcf) monitor set.

   ![](../../static/img/Active-Directory-&-Domain-Environment-Audit/image_3.png)

4. ### Active Directory - New User Account

   - Import the [RSM - Active Directory - Monitor - Active Directory - New User Account Created](/docs/e04e673a-5340-47af-9536-28788ffd37ae) internal monitor from the `ProSync` plugin.
   - Import the **`△ Custom - Ticket Creation - Computer`** alert template from the `ProSync` plugin, if it's not already present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035) script from the `ProSync` plugin, if it's not already present in the environment.
   - Reload the System Cache.
   - Assign the **`△ Custom - Ticket Creation - Computer`** alert template to the [RSM - Active Directory - Monitor - Active Directory - New User Account Created](/docs/e04e673a-5340-47af-9536-28788ffd37ae) monitor set.

   ![](../../static/img/Active-Directory-&-Domain-Environment-Audit/image_4.png)

5. ### Active Directory - Password Expires This Week

   - Import the [RSM - Active Directory - Monitor - Password Expires This Week [G]](/docs/d002ff1b-cb8c-45db-af82-096e7912db2b) internal monitor from the `ProSync` plugin.
   - Import the [CWM - Automate - Script - Active Directory - Alerting - Password Expires This Week [Global,Autofix]*](/docs/6ad5ccf5-0502-459c-a877-eaeafc0ad432) script from the `ProSync` plugin.
   - Import the **`△ Custom - Password Expiration Notification`** alert template from the `ProSync` plugin.
   - Reload the System Cache.
   - Go through the [script's](/docs/6ad5ccf5-0502-459c-a877-eaeafc0ad432) document and perform the customization if necessary.
   - Assign the **`△ Custom - Password Expiration Notification`** alert template to the [RSM - Active Directory - Monitor - Password Expires This Week [G]](/docs/d002ff1b-cb8c-45db-af82-096e7912db2b) monitor set.

   ![](../../static/img/Active-Directory-&-Domain-Environment-Audit/image_5.png)

6. ### Active Directory - Enabled Test Accounts

   - Import the [RSM - Active Directory - Monitor - Active Directory - Enabled Test Accounts](/docs/f1bc732b-7469-4689-aa3e-d0af5161ecc5) internal monitor from the `ProSync` plugin.
   - Import the **`△ Custom - Ticket Creation - Computer`** alert template from the `ProSync` plugin, if it's not already present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035) script from the `ProSync` plugin, if it's not already present in the environment.
   - Reload the System Cache.
   - Assign the **`△ Custom - Ticket Creation - Computer`** alert template to the [RSM - Active Directory - Monitor - Active Directory - Enabled Test Accounts](/docs/f1bc732b-7469-4689-aa3e-d0af5161ecc5) monitor set.

   ![](../../static/img/Active-Directory-&-Domain-Environment-Audit/image_6.png)

7. ### Active Directory - Account Disabled

   - Import the [RSM - Active Directory - Monitor - Account Disabled](/docs/b357e9c8-3b17-47ec-a508-0cfe345c0c41) internal monitor from the `ProSync` plugin.
   - Import the **`△ Custom - Ticket Creation - Computer`** alert template from the `ProSync` plugin, if it's not already present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035) script from the `ProSync` plugin, if it's not already present in the environment.
   - Reload the System Cache.
   - Assign the **`△ Custom - Ticket Creation - Computer`** alert template to the [RSM - Active Directory - Monitor - Account Disabled](/docs/b357e9c8-3b17-47ec-a508-0cfe345c0c41) monitor set.

   ![](../../static/img/Active-Directory-&-Domain-Environment-Audit/image_7.png)

8. ### Active Directory - User Last Logon > X Days

   - Import the [RSM - Active Directory - Monitor - Active Directory - User Last Logon > X Days](/docs/2a260035-6023-4b23-ad58-4dbc38d9c819) internal monitor from the `ProSync` plugin.
   - Import the **`△ Custom - Ticket Creation - Computer`** alert template from the `ProSync` plugin, if it's not already present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035) script from the `ProSync` plugin, if it's not already present in the environment.
   - Reload the System Cache.
   - Assign the **`△ Custom - Ticket Creation - Computer`** alert template to the [RSM - Active Directory - Monitor - Active Directory - User Last Logon > X Days](/docs/2a260035-6023-4b23-ad58-4dbc38d9c819) monitor set.

   ![](../../static/img/Active-Directory-&-Domain-Environment-Audit/image_8.png)

9. ### Active Directory - Domain Computers Missing Automate Agent

   - Import the [CWM - Automate - Internal Monitor - Domain Computers Missing Automate Agent](/docs/29eeae8f-d854-4234-82c5-28b1bbee0fc7) internal monitor from the `ProSync` plugin.
   - Import the **`△ Custom - Ticket Creation - Client`** alert template from the `ProSync` plugin, if it's not already present in the environment.
   - Import the [CWM - Automate - Ticket Creation - Client](/docs/eb53c8e9-ec2f-4efe-a36c-eeb3f8487981) script from the `ProSync` plugin, if it's not already present in the environment.
   - Reload the System Cache.
   - Assign the **`△ Custom - Ticket Creation - Client`** alert template to the [CWM - Automate - Internal Monitor - Domain Computers Missing Automate Agent](/docs/29eeae8f-d854-4234-82c5-28b1bbee0fc7) monitor set.

   ![](../../static/img/Active-Directory-&-Domain-Environment-Audit/image_9.png)

10. ### Active Directory - ADPluginUser - Create/Update

    - Import the [CWM - Automate - Internal Monitor - Active Directory - ADPluginUser - Create/Update](/docs/49c050b4-5319-4ffe-929a-d59429bdd3ba) monitor set from the `ProSync` plugin.
    - Import and implement the [CWM - Automate - Script - Active Directory - Plugin User Account - Create/Update](/docs/ea1aca74-77ee-4387-91f2-57adb5822737) script as instructed in the **`Implementation`** section of the [script's](/docs/ea1aca74-77ee-4387-91f2-57adb5822737) document.
    - Import the **`△ Custom - Autofix - AD Plugin User - Create/Update`** alert template from the `ProSync` plugin, if it's not already present in the environment.
    - Assign the **`△ Custom - Autofix - AD Plugin User - Create/Update`** alert template to the [CWM - Automate - Internal Monitor - Active Directory - ADPluginUser - Create/Update](/docs/49c050b4-5319-4ffe-929a-d59429bdd3ba) monitor set.

    ![](../../static/img/Active-Directory-&-Domain-Environment-Audit/image_10.png)

11. ### Active Directory - AD Users

    - Import the [RSM - Active Directory - Dataview - Active Directory - AD Users](/docs/be838d2c-2633-4df6-94b0-0dc5d4aef7dd) dataview from the `ProSync` plugin.

12. ### Active Directory - Domain Group and Members

    - Import the [RSM - Active Directory - Dataview - Active Directory - Domain Groups and Members](/docs/becaa382-47f6-414c-8d49-57b8c67b03b5) dataview from the `ProSync` plugin.

## Implementation (Independent Solutions)

1. The solutions presented in this section do not rely on any plugin.

2. ### Group Policy Audit

   - Import the [RSM - Active Directory - Script - Group Policy - Audit](/docs/2e5f5f2b-7c81-4aec-a76a-623a465f959a) script from the `ProSync` plugin.
   - Import the following dataviews from the `ProSync` plugin:
     - [RSM - Active Directory - Dataview - Windows - Group Policy Objects](/docs/1da4d5e9-4168-4c21-94cf-9b52fc565bf7)
     - [RSM - Active Directory - Dataview - Windows - Group Policy Settings](/docs/ea24f672-d2cd-41bc-8b62-2dcd20085d29)
     - [RSM - Active Directory - Dataview - Windows - Group Policy Object Links](/docs/45a9f461-fac0-4e5c-9a5f-819786e8ad21)
     - [RSM - Active Directory - Dataview - Windows - Group Policy Object Security Filtering](/docs/337526eb-1aa7-48a3-beab-ab66d2b7aea8)
   - Schedule the [RSM - Active Directory - Script - Group Policy - Audit](/docs/2e5f5f2b-7c81-4aec-a76a-623a465f959a) script to run once per day against the domain controllers group.
   - Import the [RSM - Active Directory - Monitor - GPO Modified](/docs/25040f3b-ef1d-4ebb-af45-e0df3d12ebae) internal monitor from the `ProSync` plugin.
   - Implement the monitor set as explained in the **`Implementation`** section of the [monitor's](/docs/25040f3b-ef1d-4ebb-af45-e0df3d12ebae) document.
   - Import the **`△ Custom - Ticket Creation - Computer`** alert template from the `ProSync` plugin, if it's not already present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035) script from the `ProSync` plugin, if it's not already present in the environment.
   - Reload the System Cache.
   - Assign the **`△ Custom - Ticket Creation - Computer`** alert template to the [RSM - Active Directory - Script - Group Policy - Audit](/2e5f5f2b-7c81-4aec-a76a-623a465f959a) monitor set.

   ![](../../static/img/Active-Directory-&-Domain-Environment-Audit/image_11.png)

3. ### Reset AD Users Password Age

   - Import the **`△ Custom - Ticket Creation - Computer`** alert template from the `ProSync` plugin, if it's not already present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035) script from the `ProSync` plugin, if it's not already present in the environment.
   - Import the [EPM - User Management - Remote Monitor - Reset AD Users Password Age](/docs/d0774dcc-9a7f-4f9a-9719-096e90309e2d) remote monitor by following the instructions outlined in the [Import - Remote Monitor - Reset AD Users Password Age](/docs/da1f5a89-eab2-4fae-8e49-e98c269cf103) document.
   - Reload the System Cache.
   - Locate the [EPM - User Management - Remote Monitor - Reset AD Users Password Age](/docs/d0774dcc-9a7f-4f9a-9719-096e90309e2d) remote monitor by opening the relevant group(s) and apply the **`△ Custom - Ticket Creation - Computer`** alert template to the group monitor.

4. ### New Domain Admin

   - Import the **`△ Custom - Ticket Creation Computer - Failures Only`** alert template from the `ProSync` plugin, if it's not already present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer [Failures Only]*](/docs/e14bf501-f10d-44d7-a19a-2284fd5c5cc9) script from the `ProSync` plugin, if it's not already present in the environment.
   - Import the [RSM - Active Directory - Remote Monitor - New Domain Admin](/docs/73adabc6-03cb-4979-9c62-97acc98308da) remote monitor by following the instructions outlined in the [Implement - Remote Monitor - New Domain Admin](/docs/73adabc6-03cb-4979-9c62-97acc98308da) document.
   - Reload the System Cache.
   - Locate the [RSM - Active Directory - Remote Monitor - New Domain Admin](/docs/73adabc6-03cb-4979-9c62-97acc98308da) remote monitor by opening the **`Domain Controllers`** group.

5. ### Enable AD Recycle Bin

   - Import the [CWM - Automate - Script - AD - Enable AD Recycle Bin](/docs/e80d5873-304e-4b12-b52c-b608a7715a9f) script from the `ProSync` plugin.
   - Import the **`△ Custom - Execute Script - AD - Enable AD Recycle Bin`** alert template from the `ProSync` plugin.
   - Import the [RSM - Active Directory - Role - AD Domain Recycle Bin Feature](/docs/01cb2977-8f3e-49fa-ad5b-62375c54a39c) role and the [CWM - Automate - Remote Monitor - AD Recycle Bin State Check](/docs/5041d497-ae6c-4209-a338-60f1da396106) remote monitor by following the instructions outlined in the [Import - Remote Monitor - AD Recycle Bin State Check](/docs/5041d497-ae6c-4209-a338-60f1da396106) document.
   - Reload the System Cache.
   - Locate the [EPM - User Management - Remote Monitor - Reset AD Users Password Age](/docs/d0774dcc-9a7f-4f9a-9719-096e90309e2d) remote monitor by opening the **`Domain Controllers`** group and apply the **`△ Custom - Execute Script - AD - Enable AD Recycle Bin`** alert template to the group monitor.

6. ### AD Account Lockout Detection

   - Import the **`△ Custom - Ticket Creation Computer - Failures Only`** alert template from the `ProSync` plugin, if it's not already present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer [Failures Only]*](/docs/e14bf501-f10d-44d7-a19a-2284fd5c5cc9) script from the `ProSync` plugin, if it's not already present in the environment.
   - Import the [RSM - Active Directory - Remote Monitor - AD Account Lockout Detection](/docs/2549fcf6-30b5-497b-b44d-7329334bb32c) remote monitor by following the instructions outlined in the [Implement - Remote Monitor - AD Account LockOut Detection](/docs/2549fcf6-30b5-497b-b44d-7329334bb32c) document.
   - Reload the System Cache.
   - Locate the [RSM - Active Directory - Remote Monitor - AD Account Lockout Detection](/docs/2549fcf6-30b5-497b-b44d-7329334bb32c) remote monitor by opening the **`Domain Controllers`** group and apply the **`△ Custom - Ticket Creation Computer - Failures Only`** alert template to the group monitor.

7. ### Active Directory Replication Anomaly Monitoring

   - Import the **`△ Custom - Ticket Creation - Computer`** alert template from the `ProSync` plugin, if it's not already present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035) script from the `ProSync` plugin, if it's not already present in the environment.
   - Import the [RSM - Active Directory - Remote Monitor - Active Directory Replication Anomaly Monitoring](/docs/c02b447f-36ba-4a88-b40f-a47cf08fb690) remote monitor by following the instructions outlined in the [Implement - Remote Monitor - Active Directory Replication Anomaly Monitoring](/docs/c02b447f-36ba-4a88-b40f-a47cf08fb690) document.
   - Reload the System Cache.
   - Locate the [RSM - Active Directory - Remote Monitor - Active Directory Replication Anomaly Monitoring](/docs/c02b447f-36ba-4a88-b40f-a47cf08fb690) remote monitor by opening the **`Domain Controllers`** group and apply the **`△ Custom - Ticket Creation - Computer`** alert template to the group monitor.



