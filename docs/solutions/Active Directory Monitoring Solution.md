---
id: 'cwa-active-directory-monitoring'
title: 'Active Directory Monitoring Solutions'
title_meta: 'Active Directory Monitoring Solutions'
keywords: ['active-directory', 'monitoring', 'automate', 'plugin', 'reports']
description: 'This document provides a comprehensive overview of monitoring solutions for Active Directory environments, including implementation steps, associated content, and reporting solutions. It outlines various internal and remote monitors, scripts, and dataviews necessary for effective Active Directory management.'
tags: ['monitoring', 'plugin', 'reports', 'automation', 'configuration']
draft: false
unlisted: false
---
## Purpose

The solution document delineates the contents applicable for monitoring the Active Directory Domain environment. Please review the implementation steps meticulously as a significant portion of the content relies on the **`Active Directory`** plugin.

This article encompasses multiple components and contents. Please import and implement only the required components.

## Associated Content

### Content

| Content                                                                                                         | Type            | Function                                                                                                                                                                                                 |
|-----------------------------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Internal Monitor - Active Directory - Sync Out of Date](https://proval.itglue.com/DOC-5078775-10093123)     | Internal Monitor | This monitor looks for the AD server that has been onboarded for more than 30 days and is experiencing a credential issue in the Active Directory Plugin.                                              |
| [Internal Monitor - Active Directory - Enabled Test Accounts](https://proval.itglue.com/DOC-5078775-7936283) | Internal Monitor | This monitor will look for any account with the name **`Test`** in the account name and will flag that account if it is enabled on the domain.                                                         |
| [Internal Monitor - Active Computers in AD with No Agent](https://proval.itglue.com/DOC-5078775-15186683)    | Internal Monitor | The monitor set generates a client-level ticket containing details of domain-joined computers active within the domain, which have been joined to the domain for at least 7 days but do not have the Automate agent installed. |
| [Internal Monitor - Active Directory - ADPluginUser - Create/Update](https://proval.itglue.com/DOC-5078775-11420016) | Internal Monitor | The purpose of this monitor set is to create an 'ADPluginUser' account for the domain controllers detected in AD Plugin.                                                                                 |
| [Remote Monitor - Active Directory Replication Anomaly Monitoring](https://proval.itglue.com/DOC-5078775-14646049) | Remote Monitor   | The monitor set operates on a cluster of Primary Domain Controllers (Infrastructure Masters) for each domain, triggering a failure alert upon detecting any Active Directory Replication Failure.          |
| [Script - New Domain Admin Monitor - Create](https://proval.itglue.com/DOC-5078775-16548733)                 | Client Script    | Creates remote monitors to ticket when a new domain admin is added and has not been excluded.                                                                                                         |
| [Active Directory Reporting Solution](https://proval.itglue.com/DOC-5078775-9331097)                         | Reporting Solution | Full Reporting solution that pulls from the Active Directory Plugin                                                                                                                                     |
| [Remote Monitor - Domain Admin Account Lockout](https://proval.itglue.com/5078775/docs/16951465)              | Remote Monitor   | This remote monitor is configured to detect when the domain admin account is locked. It checks every 15 minutes and creates a ticket for the partner to review, providing complete details.               |

## Non-Stack Content

| Content                                                                                                         | Type            | Function                                                                                                                                                                                                 |
|-----------------------------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Internal Monitor - Active Directory - User Last Logon > X Days](https://proval.itglue.com/DOC-5078775-10813367) | Internal Monitor | This monitor will check for users who have not logged in for more than X days and are not administrator accounts.                                                                                      |
| [Internal Monitor - Active Computers in AD with No Agent](https://proval.itglue.com/DOC-5078775-15186683)    | Internal Monitor | The monitor set generates a client-level ticket containing details of domain-joined computers active within the domain, which have been joined to the domain for at least 7 days but do not have the Automate agent installed. |
| [GPO Audit](https://proval.itglue.com/5078775/docs/15193954)                                               | Audit Script     | This audit script is designed to populate some dataviews outlining the currently installed GPOs in the Active Directory Environment.                                                                     |
| [Script - AD - Enable AD Recycle Bin](https://proval.itglue.com/5078775/docs/7937042)                      | Script           | This script is designed to enable the AD recycle bin on a Domain Controller.                                                                                                                            |

### Script

| Content                                                                                                         | Type            | Function                                                                                                                                                                                                 |
|-----------------------------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - AD - Enable AD Recycle Bin](https://proval.itglue.com/DOC-5078775-7937042)                        | Script           | This script enables the AD Recycle Bin. [Microsoft TechNet Article](https://techcommunity.microsoft.com/t5/ask-the-directory-services-team/the-ad-recycle-bin-understanding-implementing-best-practices-and/ba-p/396944) |
| [Script - Weak Passwords - AD Test](https://proval.itglue.com/DOC-5078775-9590761)                          | Script           | The script tests the hashed credentials in AD against a known compromised or weak list.                                                                                                               |
| [Script - Active Directory - Plugin User Account - Create/Update](https://proval.itglue.com/DOC-5078775-11419940) | Script           | This script will create/update a domain admin account to be used with the AD plugin with a random password.                                                                                           |
| [Script - Group Policy - Audit](https://proval.itglue.com/DOC-5078775-15193954)                            | Script           | This process will execute PowerShell to gather GPO data.                                                                                                                                              |
| [AD - Create Views/Table/Schedule for AD Reporting Solution](https://proval.itglue.com/DOC-5078775-9492882) | Script           | This creates all the needed items in the Database to ensure the [Active Directory Reporting Solution](https://proval.itglue.com/DOC-5078775-9331097) functions correctly.                              |
| [Script - ScreenConnect - RMM+ Autofix - AD Plugin - Sync Out of Date [Ticket]](https://proval.itglue.com/DOC-5078775-10093113) | Script           | This script is intended to be used as an auto fix for the [CWM - Automate - Internal Monitor - Active Directory - Sync Out of Date](https://proval.itglue.com/DOC-5078775-10093123) monitor. This script will not function if run manually. |

### Dataview

| Content                                                                                                         | Type            | Function                                                                                                                                                                                                 |
|-----------------------------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Dataview - Active Directory - AD Users](https://proval.itglue.com/DOC-5078775-7988138)                      | Dataview        | This dataview displays all users associated with a domain and general information about all the users.                                                                                               |
| [Dataview - Active Directory - Domain Groups and Members](https://proval.itglue.com/DOC-5078775-8013556)    | Dataview        | This dataview shows you all domains and their respective groups and a corresponding list of members.                                                                                                  |
| [Dataview - Windows - Group Policy Objects](https://proval.itglue.com/DOC-5078775-7964597)                  | Dataview        | This dataview shows information about GPO's, their applied policies, where they are linked to, and to what trustees they are applied to.                                                               |
| [Dataview - Windows - Group Policy Settings](https://proval.itglue.com/DOC-5078775-8225111)                  | Dataview        | This dataview shows information about GPO's, their applied policies, and settings.                                                                                                                    |
| [Dataview - Windows - Group Policy Object Links](https://proval.itglue.com/DOC-5078775-8218975)              | Dataview        | This dataview shows information about GPO's, their applied policies, and where they are linked to.                                                                                                     |
| [Dataview - Windows - Group Policy Object Security Filtering](https://proval.itglue.com/DOC-5078775-8213726) | Dataview        | This dataview displays information related to Group Policy Objects in Active Directory, specifically related to security policies.                                                                       |

### Reports

| Content                                                                                                         | Type            | Function                                                                                                                                                                                                 |
|-----------------------------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Report - Active Directory User Assessment](https://proval.itglue.com/DOC-5078775-9493611)                   | Report          | Displays an overall health view of the Client's Active Directory along with a full user report.                                                                                                      |
| [Report - Active Directory User Groups - Detail](https://proval.itglue.com/DOC-5078775-9570449)               | Report          | Displays a complete user list with all groups that each user is in, along with an overall view of what groups are used the most.                                                                      |
| [Report - Computers in Active Directory - No Agent](https://proval.itglue.com/DOC-5078775-9570676)            | Report          | Displays a list of all computers that are in Active Directory but not in Automate. Can be used to clean up Client Active Directories.                                                                  |
| SubPageHeaderLandscape                                                                                         | Subreport       | Used as the template for the page header on these reports.                                                                                                                                           |

## Deprecated Content

| Content                                                                                                         | Type            | Function                                                                                                                                                                                                 |
|-----------------------------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Internal Monitor - Active Directory - New User Account Created](https://proval.itglue.com/DOC-5078775-7936290) | Internal Monitor | This monitor looks for new domain user accounts that have a creation date within the past day. A ticket is created for each new account discovered.                                                 |
| [Internal Monitor - Password Expires This Week [G]](https://proval.itglue.com/DOC-5078775-8041377)            | Internal Monitor | Detects the domain users whose password is going to expire within a week.                                                                                                                             |
| [Internal Monitor - Account Disabled](https://proval.itglue.com/DOC-5078775-7980035)                           | Internal Monitor | This Monitor looks for the disabled accounts on Active Directory servers through the Active Directory plugin and creates a ticket for each one found.                                                  |
| [Remote Monitor - Reset AD Users Password Age](https://proval.itglue.com/DOC-5078775-13664978)                | Remote Monitor   | This remote monitor checks AD user's login password age to see if the age is set to unlimited, and if so it will change the user password from never expire to expire and will also change the default domain policy password age to 90 days. |
| [Remote Monitor - AD Account Lockout Detection](https://proval.itglue.com/DOC-5078775-14952698)               | Remote Monitor   | This remote monitor will detect when any AD account is flagged as being locked out. This can be noisy, so it has been deprecated.                                                                      |
| [Script - Active Directory - Alerting - Password Expires This Week [Global,Autofix]*](https://proval.itglue.com/DOC-6075716-11713518) | Script           | This script sends an email to the user whose password is expiring within 1 week. This already happens through Windows, so it's been deprecated.                                                       |

## Implementation (Plugin)

1. The solutions presented in this section rely on the functionality provided by the **`Active Directory`** plugin. Therefore, it is imperative to verify that both the **`Active Directory`** and **`Active Directory Remote`** plugins are correctly installed and operational within the environment.
   ![Image 1](5078775/docs/17248608/images/26306733)
   ![Image 2](5078775/docs/17248608/images/26306734)

2. Ensure that the RMM+ Plugin is correctly configured and operational within the environment, as this solution relies on the proper configuration of the [CWM - Automate - RMM+ Plugin Configuration](https://proval.itglue.com/DOC-5078775-9770217).

3. Ensure the following content is imported to the environment as it is used in multiple solutions for ticketing:
   - [Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338)
   - [Script - Ticket Creation - Client](https://proval.itglue.com/DOC-5078775-14282558)
   - [Script - Ticket Creation - Failures Only](https://proval.itglue.com/5078775/docs/13459854)
   - [Dataview - Active Directory - AD Users](https://proval.itglue.com/DOC-5078775-7988138)
   - [Dataview - Active Directory - Domain Groups and Members](https://proval.itglue.com/DOC-5078775-8013556)
   - Alert Template - **`△ Custom - Ticket Creation - Client`**
   - Alert Template - **`△ Custom - Ticket Creation Computer - Failures Only`**
   - Alert Template - **`△ Custom - Ticket Creation - Computer`**

   OR - **_If the partner does not have PSA Integration_**, the Email Creation Alert Templates can be used in place of the Ticket Creation ones:
   - [Script - Email Creation - Computer](https://proval.itglue.com/5078775/docs/12321863)
   - [Script - Email Creation - Failures Only](https://proval.itglue.com/5078775/docs/10390936)
   - [Dataview - Active Directory - AD Users](https://proval.itglue.com/DOC-5078775-7988138)
   - [Dataview - Active Directory - Domain Groups and Members](https://proval.itglue.com/DOC-5078775-8013556)
   - Alert Template - **`△ Custom - Email Creation Computer - Failures Only`**
   - Alert Template - **`△ Custom - Email Creation - Computer`**

   After importing, ensure the system property **`_sysTicketDefaultEmail`** is filled out with the email address specified by the consultant.

   *Note: There is not currently an 'Email Creation - Client' script/alert template. If this is required, then a development ticket will need to be generated to get it created.*

### Reporting Solution

1. Import the following content from the ProSync Plugin:
   - [Script - Weak Passwords - AD Test](https://proval.itglue.com/DOC-5078775-9590761)
   - [AD - Create Views/Table/Schedule for AD Reporting Solution](https://proval.itglue.com/DOC-5078775-9492882)

2. Run the [AD - Create Views/Table/Schedule for AD Reporting Solution](https://proval.itglue.com/DOC-5078775-9492882) script once on any random machine to create the framework needed for the solution.
   - **Delete the script afterward.**

3. Download the attached SQL file named 'Import_All_AD_Reports.sql'. Refer to the below doc for the attachment:
   - [Active Directory Reporting SQL Import Attachment](https://proval.itglue.com/DOC-5078775-15079008)

4. Import the file using System → General → Import → SQL File (The SQL file is too large for a remote monitor).
   ![Image](5078775/docs/17248608/images/27760707)
   - Doing this will configure the following reports:
     - [Report - Active Directory User Assessment](https://proval.itglue.com/DOC-5078775-9493611)
     - [Report - Active Directory User Groups - Detail](https://proval.itglue.com/DOC-5078775-9570449)
     - [Report - Computers in Active Directory - No Agent](https://proval.itglue.com/DOC-5078775-9570676)
     - SubPageHeaderLandscape

### Sync Out of Date

1. Import the following content using the ProSync plugin:
   - [Internal Monitor - Active Directory - Sync Out of Date](https://proval.itglue.com/DOC-5078775-10093123)
   - [Script - ScreenConnect - RMM+ Autofix - AD Plugin - Sync Out of Date [Ticket]](https://proval.itglue.com/DOC-5078775-10093113)
   - Alert Template - **`△ Custom - Autofix - AD Plugin Sync Out of Date`**

2. Reload the system cache.
   ![Image](5078775/docs/17248608/images/27674819)

3. Navigate to Automation → Monitors → Internal Monitors and configure the following:
   - Find the [Internal Monitor - Active Directory - Sync Out of Date](https://proval.itglue.com/DOC-5078775-10093123).
     - Assign the **`△ Custom - Autofix - AD Plugin Sync Out of Date`** alert template.

### Enabled Test Accounts

1. Import the following using the ProSync Plugin:
   - [Internal Monitor - Active Directory - Enabled Test Accounts](https://proval.itglue.com/DOC-5078775-7936283)

2. Reload the System Cache:
   ![Image](5078775/docs/17248608/images/27675022)

3. Navigate to Automation → Monitors → Internal Monitors and configure the following:
   - Find the [Internal Monitor - Active Directory - Enabled Test Accounts](https://proval.itglue.com/DOC-5078775-7936283).
     - Assign the **`△ Custom - Ticket Creation - Computer`** alert template.
     - OR
     - Assign the **`△ Custom - Email Creation - Computer`** alert template.

### PC Missing Automate

1. Import the following content from the ProSync Plugin:
   - [Internal Monitor - Domain Computers Missing Automate Agent](https://proval.itglue.com/DOC-5078775-15186683)

2. Reload the System Cache:
   ![Image](5078775/docs/17248608/images/27675022)

3. Navigate to Automation → Monitors → Internal Monitors and configure the following:
   - Find the [Internal Monitor - Domain Computers Missing Automate Agent](https://proval.itglue.com/DOC-5078775-15186683).
     - Assign the **`△ Custom - Ticket Creation - Client`** alert template.
     - If the partner requires an Email Creation - Client alert template, this will need to get built by development.

   ![Image](5078775/docs/17248608/images/26306744)

### ADPluginUser - Create

1. Import the following content using the ProSync Plugin:
   - [Internal Monitor - Active Directory - ADPluginUser - Create/Update](https://proval.itglue.com/DOC-5078775-11420016)
   - [Script - Active Directory - Plugin User Account - Create/Update](https://proval.itglue.com/DOC-5078775-11419940)
   - Alert Template - **`△ Custom - Autofix - AD Plugin User - Create/Update`**

2. Run the script against any online computer with **`Set Environment`** parameter set to **`1`**.
   - Set the required values for the rest of the user parameters. (This should be specified by the consultant).
   ![Image](5078775/docs/17248608/images/27758498)
   - *Note: There are default values for all the main parameters (Shown Below).*
   ![Image](5078775/docs/17248608/images/27758486)

3. Validate the system property values within the System Dashboard.

### Last Login > X Days

1. Import the following monitor using the ProSync Plugin:
   - [Internal Monitor - Active Directory - User Last Logon > X Days](https://proval.itglue.com/DOC-5078775-10813367)

2. Reload the System Cache:
   ![Image](5078775/docs/17248608/images/27675022)

3. Edit the monitor with the last login value specified by the consultant; if this has not been specified then reach out to the consultant to clarify:
   ![Image](5078775/docs/17248608/images/27820911)

4. Navigate to Automation → Monitors → Internal Monitors and configure the following:
   - Find the [Internal Monitor - Active Directory - User Last Logon > X Days](https://proval.itglue.com/DOC-5078775-10813367).
     - Assign the **`△ Custom - Ticket Creation - Computer`** alert template.
     - OR
     - Assign the **`△ Custom - Email Creation - Computer`** alert template.
   ![Image](5078775/docs/17248608/images/26306743)

## Implementation (No Plugin)

The solutions presented in this section do not rely on any plugin.

### Group Policy Audit

1. Import the following content from the ProSync Plugin:
   - [Script - Group Policy - Audit](https://proval.itglue.com/DOC-5078775-15193954)
   - [Dataview - Windows - Group Policy Objects](https://proval.itglue.com/DOC-5078775-7964597)
   - [Dataview - Windows - Group Policy Settings](https://proval.itglue.com/DOC-5078775-8225111)
   - [Dataview - Windows - Group Policy Object Links](https://proval.itglue.com/DOC-5078775-8218975)
   - [Dataview - Windows - Group Policy Object Security Filtering](https://proval.itglue.com/DOC-5078775-8213726)
   - [Internal Monitor - GPO Modified](https://proval.itglue.com/DOC-5078775-8041380)
     - *Note: This is optional. Only import this if specifically requested.*

2. Reload the System Cache:
   ![Image](5078775/docs/17248608/images/27675022)

3. Schedule the [Script - Group Policy - Audit](https://proval.itglue.com/DOC-5078775-15193954) to run once per day against the domain controllers group.
   ![Image](5078775/docs/17248608/images/27820822)
   ![Image](5078775/docs/17248608/images/27820839)

4. **Only perform this step if requested by the consultant:**
   - Navigate to Automation → Monitors → Internal Monitors and configure the following:
     - Find the [Internal Monitor - GPO Modified](https://proval.itglue.com/DOC-5078775-8041380).
       - Assign the **`△ Custom - Ticket Creation - Computer`** alert template.
       - OR
       - Assign the **`△ Custom - Email Creation - Computer`** alert template.
   ![Image](5078775/docs/17248608/images/26306746)

### Enable AD Recycle Bin

1. Import the following content from the ProSync Plugin:
   - [Script - AD - Enable AD Recycle Bin](https://proval.itglue.com/DOC-5078775-7937042)
   - Alert Template - **`△ Custom - Execute Script - AD - Enable AD Recycle Bin`**

2. Import the [Role - AD Domain Recycle Bin Feature](https://proval.itglue.com/DOC-5078775-8012918).

3. Import the [CWM - Automate - Remote Monitor - AD Recycle Bin State Check](https://proval.itglue.com/DOC-5078775-7815146) using the following instructions outlined here: [Import - Remote Monitor - AD Recycle Bin State Check](https://proval.itglue.com/DOC-5078775-14764163).

4. Reload the System Cache:
   ![Image](5078775/docs/17248608/images/27675022)

5. Locate the [EPM - User Management - Remote Monitor - Reset AD Users Password Age](https://proval.itglue.com/DOC-5078775-13664978) remote monitor.
   - By opening the **`Domain Controllers`** group.
     - Apply the **`△ Custom - Execute Script - AD - Enable AD Recycle Bin`** alert template to the group monitor.

### Replication Anomaly

1. Import the [Remote Monitor - Active Directory Replication Anomaly Monitoring](https://proval.itglue.com/DOC-5078775-14646049) using the following instructions outlined here: [Implement - Remote Monitor - Active Directory Replication Anomaly Monitoring](https://proval.itglue.com/DOC-5078775-14646252).

2. Reload the System Cache:
   ![Image](5078775/docs/17248608/images/27675022)

3. Locate the [RSM - Active Directory - Remote Monitor - Active Directory Replication Anomaly Monitoring](https://proval.itglue.com/DOC-5078775-14646049) remote monitor.
   - By opening the **`Domain Controllers`** group.
     - Apply the **`△ Custom - Ticket Creation Computer - Failures Only`** alert template to the group monitor.
     - OR
     - Apply the **`△ Custom - Email Creation Computer - Failures Only`** alert template to the group monitor.

### New Domain Admin

1. Remove the existing **`ProVal - Production - New Domain Admin`** monitor set from the groups it's already applied to.
   - Execute this SQL query from a RAWSQL monitor set to get rid of the existing monitors:
     ```sql
     Delete From Groupagents where `Name` = 'ProVal - Production - New Domain Admin'
     ```

2. Open the **`Server Status`** tool by navigating to **`Help`** → **`Server Status`**.
   ![Image](5078775/docs/17248608/images/27821112)

3. Click the **`Do Group Refresh`** button to refresh and apply the changes made.
   ![Image](5078775/docs/17248608/images/27821115)

4. Click **`OK`** to the popup message and wait for a minute to allow the changes to take effect.
   ![Image](5078775/docs/17248608/images/27821117)

5. Import the following script from the ProSync Plugin:
   - [Script - New Domain Admin Monitor - Create](https://proval.itglue.com/5078775/docs/16548733)

6. **Run/Debug the Script**
   - Execute or debug the script against a single client, with the **`Set_Environment`** parameter set to **`1`**. This action will generate the necessary system properties and Extra Data Fields (EDFs) for managing the remote monitors.
   ![Image](5078775/docs/17248608/images/27821123)
   ![Image](5078775/docs/17248608/images/27821124)

7. Reload System Cache.
   ![Image](5078775/docs/17248608/images/27821127)

8. Configure System Properties and EDFs.
   - Navigate to the **System Dashboard → Config → Configurations → Properties**.
   - Find the properties beginning with **`NDA_Monitoring`**.
   ![Image](5078775/docs/17248608/images/27821130)
     - The consultant should have provided you with any customizations that are required. Please read through the detailed System Properties and EDF explanations to understand how to configure any customizations. You can find that [here](https://proval.itglue.com/5078775/docs/16548733).

9. Schedule the Script.
   - Schedule the script to run once per day, preferably around midnight, from the dashboard for optimal results.
   ![Image](5078775/docs/17248608/images/27821134)

### Domain Admin Lockout

1. Import the [Remote Monitor - Domain Admin Account Lockout](https://proval.itglue.com/5078775/docs/16951465) using the following implementation instructions:
   - [Implement - Remote Monitor - Domain Admin Account Lockout](https://proval.itglue.com/DOC-5078775-16951789).

2. **_If the partner does not have any PSA integration_**, then navigate to the Domain Controllers group:
   ![Image](5078775/docs/17248608/images/27821649)
   - Then adjust the alert template for this monitor to be:
     - Alert Template - **`△ Custom - Email Creation Computer - Failures Only`**
   - Otherwise, ensure the alert template is set to the following:
     - Alert Template - **`△ Custom - Ticket Creation Computer - Failures Only`**

