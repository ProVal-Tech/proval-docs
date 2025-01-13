---
id: 'cwa-active-directory-monitoring-implementation'
title: 'Active Directory Monitoring Implementation'
title_meta: 'Active Directory Monitoring Implementation'
keywords: ['active-directory', 'monitoring', 'implementation', 'alerts', 'reports']
description: 'This document provides a comprehensive guide on implementing monitoring solutions for Active Directory environments. It details various internal and remote monitors, scripts, dataviews, and reports that can be utilized to ensure effective monitoring and management of Active Directory, along with step-by-step implementation instructions.'
tags: ['active-directory', 'monitoring', 'implementation', 'alerts', 'reports', 'script', 'dataview']
draft: false
unlisted: false
---
## Purpose

The solution document delineates the contents applicable for monitoring the Active Directory Domain environment. Please review the implementation steps meticulously as a significant portion of the content relies on the **`Active Directory`** plugin.

This article encompasses multiple components and contents. Please import and implement only the required components.

## Associated Content

#### Internal Monitor

| Content                                                                                                                                      | Type            | Function                                                                                                                                                                            |
|---------------------------------------------------------------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Internal Monitor - Active Directory - Sync Out of Date](https://proval.itglue.com/DOC-5078775-10093123)                   | Internal Monitor | This monitor looks for the AD server that has been onboarded for more than 30 days and is experiencing a credential issue in the Active Directory Plugin.                         |
| [RSM - Active Directory - Monitor - Active Directory - New User Account Created](https://proval.itglue.com/DOC-5078775-7936290)             | Internal Monitor | This monitor looks for new domain user accounts that have a creation date within the past day. A ticket is created for each new account discovered.                                |
| [RSM - Active Directory - Monitor - Password Expires This Week [G]](https://proval.itglue.com/DOC-5078775-8041377)                          | Internal Monitor | Detects the domain users whose password is going to expire within a week.                                                                                                         |
| [RSM - Active Directory - Monitor - Active Directory - Enabled Test Accounts](https://proval.itglue.com/DOC-5078775-7936283)                | Internal Monitor | This monitor will look for any account with the name **`Test`** in the account name and will flag that account if it is enabled on the domain.                                     |
| [RSM - Active Directory - Monitor - Account Disabled](https://proval.itglue.com/DOC-5078775-7980035)                                       | Internal Monitor | This Monitor looks for the disabled accounts on Active Directory servers through the Active Directory plugin and creates a ticket for each one found.                               |
| [RSM - Active Directory - Monitor - Active Directory - User Last Logon > X Days](https://proval.itglue.com/DOC-5078775-10813367)            | Internal Monitor | This monitor will check for users who have not logged in for more than X days and are not administrator accounts.                                                                  |
| [CWM - Automate - Internal Monitor - Active Computers in AD with No Agent](https://proval.itglue.com/DOC-5078775-15186683)                  | Internal Monitor | The monitor set generates a client-level ticket containing details of domain-joined computers active within the domain, which have been joined to the domain for at least 7 days but do not have the Automate agent installed. |
| [CWM - Automate - Internal Monitor - Active Directory - ADPluginUser - Create/Update](https://proval.itglue.com/DOC-5078775-11420016)       | Internal Monitor | The purpose of this monitor set is to create an 'ADPluginUser' account for the domain controllers detected in AD Plugin.                                                           |
| [RSM - Active Directory - Monitor - GPO Modified](https://proval.itglue.com/DOC-5078775-8041380)                                          | Internal Monitor | This Custom RAWSQL monitor shows GPO modified time on the computer if the GPO was modified in the last 1 day.                                                                    |

#### Remote Monitor

| Content                                                                                                                                      | Type            | Function                                                                                                                                                                            |
|---------------------------------------------------------------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [EPM - User Management - Remote Monitor - Reset AD Users Password Age](https://proval.itglue.com/DOC-5078775-13664978)                     | Remote Monitor   | This remote monitor checks AD user's login password age to see if the age is set to unlimited, and if so it will change the user password from never Expire to expire and will also change the Default domain policy password age to 90 days. |
| [RSM - Active Directory - Remote Monitor - New Domain Admin](https://proval.itglue.com/DOC-5078775-13459830)                               | Remote Monitor   | The purpose of the remote monitor is to detect the newly created/promoted domain admins and create a ticket.                                                                         |
| [CWM - Automate - Remote Monitor - AD Recycle Bin State Check](https://proval.itglue.com/DOC-5078775-7815146)                             | Remote Monitor   | This is a remote PowerShell monitor which detects whether the AD Recycle Bin is enabled or disabled on Windows Active Directory servers.                                             |
| [RSM - Active Directory - Remote Monitor - AD Account Lockout Detection](https://proval.itglue.com/DOC-5078775-14952698)                   | Remote Monitor   | The monitoring system is set up to gather data on event ID 4740 that occurred within the last 15 minutes and to generate an alert with the relevant information.                     |
| [RSM - Active Directory - Remote Monitor - Active Directory Replication Anomaly Monitoring](https://proval.itglue.com/DOC-5078775-14646049) | Remote Monitor   | The monitor set operates on a cluster of Primary Domain Controllers (Infrastructure Masters) for each domain, triggering a failure alert upon detecting any Active Directory Replication Failure. |

#### Script

| Content                                                                                                                                      | Type            | Function                                                                                                                                                                            |
|---------------------------------------------------------------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Script - AD - Enable AD Recycle Bin](https://proval.itglue.com/DOC-5078775-7937042)                                   | Script          | This script enables the AD Recycle Bin. [Microsoft TechNet Article](https://techcommunity.microsoft.com/t5/ask-the-directory-services-team/the-ad-recycle-bin-understanding-implementing-best-practices-and/ba-p/396944) |
| [RSM - Active Directory - Script - Weak Passwords - AD Test](https://proval.itglue.com/DOC-5078775-9590761)                               | Script          | The script tests the hashed credentials in AD against a known compromised or weak list.                                                                                             |
| [CWM - Automate - Script - Active Directory - Plugin User Account - Create/Update](https://proval.itglue.com/DOC-5078775-11419940)        | Script          | This script will create/update a domain admin account to be used with the AD plugin with a random password.                                                                          |
| [RSM - Active Directory - Script - Group Policy - Audit](https://proval.itglue.com/DOC-5078775-15193954)                                   | Script          | This process will execute PowerShell to gather GPO data.                                                                                                                            |
| [AD - Create Views/Table/Schedule for AD Reporting Solution](https://proval.itglue.com/DOC-5078775-9492882)                               | Script          | This creates all of the needed items in the Database to ensure the [Active Directory Reporting Solution](https://proval.itglue.com/DOC-5078775-9331097) functions correctly.       |
| [CWM - Automate - Script - ScreenConnect - RMM+ Autofix - AD Plugin - Sync Out of Date [Ticket]*](https://proval.itglue.com/DOC-5078775-10093113) | Script          | This script is intended to be used as an auto fix for the [CWM - Automate - Internal Monitor - Active Directory - Sync Out of Date](https://proval.itglue.com/DOC-5078775-10093123) monitor. This script will not function if run manually. |
| [CWM - Automate - Script - Active Directory - Alerting - Password Expires This Week [Global,Autofix]*](https://proval.itglue.com/DOC-6075716-11713518) | Script          | The script covers the alerting section of the [RSM - Active Directory - Monitor - Password Expires This Week [G]](https://proval.itglue.com/DOC-5078775-8041377) monitor set. |

#### Dataview

| Content                                                                                                                                      | Type            | Function                                                                                                                                                                            |
|---------------------------------------------------------------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [RSM - Active Directory - Dataview - Active Directory - AD Users](https://proval.itglue.com/DOC-5078775-7988138)                           | Dataview        | This dataview displays all users associated with a domain and general information about all the users.                                                                                |
| [RSM - Active Directory - Dataview - Active Directory - Domain Groups and Members](https://proval.itglue.com/DOC-5078775-8013556)          | Dataview        | This dataview shows you all domains and their respective groups and a corresponding list of members.                                                                                 |
| [RSM - Active Directory - Dataview - Windows - Group Policy Objects](https://proval.itglue.com/DOC-5078775-7964597)                       | Dataview        | This dataview shows information about GPOs, their applied policies, where they are linked to, and to what trustees they are applied to.                                             |
| [RSM - Active Directory - Dataview - Windows - Group Policy Settings](https://proval.itglue.com/DOC-5078775-8225111)                       | Dataview        | This dataview shows information about GPOs, their applied policies, and settings.                                                                                                   |
| [RSM - Active Directory - Dataview - Windows - Group Policy Object Links](https://proval.itglue.com/DOC-5078775-8218975)                  | Dataview        | This dataview shows information about GPOs, their applied policies, and where they are linked to.                                                                                   |
| [RSM - Active Directory - Dataview - Windows - Group Policy Object Security Filtering](https://proval.itglue.com/DOC-5078775-8213726)     | Dataview        | This dataview displays information related to Group Policy Objects in Active Directory, specifically related to security policies.                                                   |

#### Report

| Content                                                                                                                                      | Type            | Function                                                                                                                                                                            |
|---------------------------------------------------------------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Report - Active Directory User Assessment](https://proval.itglue.com/DOC-5078775-9493611)                                               | Report          | Displays an overall health view of the Clients Active Directory along with a full user report.                                                                                     |
| [Report - Active Directory User Groups - Detail](https://proval.itglue.com/DOC-5078775-9570449)                                          | Report          | Displays a complete user list with all groups that each user is in, along with an overall view of what groups are used the most.                                                  |
| [Report - Computers in Active Directory - No Agent](https://proval.itglue.com/DOC-5078775-9570676)                                      | Report          | Displays a list of all computers that are in Active Directory but not in Automate. Can be used to clean up Client Active Directories.                                              |
| SubPageHeaderLandscape                                                                                                                    | Subreport       | Used as the template for the page header on these reports.                                                                                                                          |

## Implementation (Active Directory Plugin Dependent Solutions)

1. The solutions presented in this section rely on the functionality provided by the **`Active Directory`** plugin. Therefore, it is imperative to verify that both the **`Active Directory`** and **`Active Directory Remote`** plugins are correctly installed and operational within the environment.

   ![](..\..\static\img\Active-Directory-&-Domain-Environment-Audit\image_1.png)
   ![](..\..\static\img\Active-Directory-&-Domain-Environment-Audit\image_2.png)

2. ### Active Directory Reporting Solution

   Follow the Steps outlined in the [EPM - Accounts - Report - Active Directory Reporting Solution](https://proval.itglue.com/DOC-5078775-9331097) document to import and configure the following reports:

   - [Report - Active Directory User Assessment](https://proval.itglue.com/DOC-5078775-9493611)
   - [Report - Active Directory User Groups - Detail](https://proval.itglue.com/DOC-5078775-9570449)
   - [Report - Computers in Active Directory - No Agent](https://proval.itglue.com/DOC-5078775-9570676)
   - SubPageHeaderLandscape

3. ### Active Directory - Sync Out of Date

   - Import the [CWM - Automate - Internal Monitor - Active Directory - Sync Out of Date](https://proval.itglue.com/DOC-5078775-10093123) internal monitor set from the `ProSync` plugin.
   - Import the [CWM - Automate - Script - ScreenConnect - RMM+ Autofix - AD Plugin - Sync Out of Date [Ticket]*](https://proval.itglue.com/DOC-5078775-10093113) script from the `ProSync` plugin.
   - Import the **`△ Custom - Autofix - AD Plugin Sync Out of Date`** alert template from the `ProSync` plugin.
   - Reload the system cache.
   - Ensure that the RMM+ Plugin is correctly configured and operational within the environment, as this solution relies on the proper configuration of the [CWM - Automate - RMM+ Plugin Configuration](https://proval.itglue.com/DOC-5078775-9770217).
   - Assign the **`△ Custom - Autofix - AD Plugin Sync Out of Date`** alert template to the [CWM - Automate - Internal Monitor - Active Directory - Sync Out of Date](https://proval.itglue.com/DOC-5078775-10093123) monitor set.

   ![](..\..\static\img\Active-Directory-&-Domain-Environment-Audit\image_3.png)

4. ### Active Directory - New User Account

   - Import the [RSM - Active Directory - Monitor - Active Directory - New User Account Created](https://proval.itglue.com/DOC-5078775-7936290) internal monitor from the `ProSync` plugin.
   - Import the **`△ Custom - Ticket Creation - Computer`** alert template from the `ProSync` plugin, if it's already not present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338) script from the `ProSync` plugin, if it's already not present in the environment.
   - Reload the System Cache.
   - Assign the **`△ Custom - Ticket Creation - Computer`** alert template to the [RSM - Active Directory - Monitor - Active Directory - New User Account Created](https://proval.itglue.com/DOC-5078775-7936290) monitor set.

   ![](..\..\static\img\Active-Directory-&-Domain-Environment-Audit\image_4.png)

5. ### Active Directory - Password Expires This Week

   - Import the [RSM - Active Directory - Monitor - Password Expires This Week [G]](https://proval.itglue.com/DOC-5078775-8041377) internal monitor from the `ProSync` plugin.
   - Import the [CWM - Automate - Script - Active Directory - Alerting - Password Expires This Week [Global,Autofix]*](https://proval.itglue.com/DOC-6075716-11713518) script from the `ProSync` plugin.
   - Import the **`△ Custom - Password Expiration Notification`** alert template from the `ProSync` plugin.
   - Reload the System Cache.
   - Go through the [script's](https://proval.itglue.com/DOC-6075716-11713518) document and perform the customization if necessary.
   - Assign the **`△ Custom - Password Expiration Notification`** alert template to the [RSM - Active Directory - Monitor - Password Expires This Week [G]](https://proval.itglue.com/DOC-5078775-8041377) monitor set.

   ![](..\..\static\img\Active-Directory-&-Domain-Environment-Audit\image_5.png)

6. ### Active Directory - Enabled Test Accounts

   - Import the [RSM - Active Directory - Monitor - Active Directory - Enabled Test Accounts](https://proval.itglue.com/DOC-5078775-7936283) internal monitor from the `ProSync` plugin.
   - Import the **`△ Custom - Ticket Creation - Computer`** alert template from the `ProSync` plugin, if it's already not present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338) script from the `ProSync` plugin, if it's already not present in the environment.
   - Reload the System Cache.
   - Assign the **`△ Custom - Ticket Creation - Computer`** alert template to the [RSM - Active Directory - Monitor - Active Directory - Enabled Test Accounts](https://proval.itglue.com/DOC-5078775-7936283) monitor set.

   ![](..\..\static\img\Active-Directory-&-Domain-Environment-Audit\image_6.png)

7. ### Active Directory - Account Disabled

   - Import the [RSM - Active Directory - Monitor - Account Disabled](https://proval.itglue.com/DOC-5078775-7980035) internal monitor from the `ProSync` plugin.
   - Import the **`△ Custom - Ticket Creation - Computer`** alert template from the `ProSync` plugin, if it's already not present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338) script from the `ProSync` plugin, if it's already not present in the environment.
   - Reload the System Cache.
   - Assign the **`△ Custom - Ticket Creation - Computer`** alert template to the [RSM - Active Directory - Monitor - Account Disabled](https://proval.itglue.com/DOC-5078775-7980035) monitor set.

   ![](..\..\static\img\Active-Directory-&-Domain-Environment-Audit\image_7.png)

8. ### Active Directory - User Last Logon > X Days

   - Import the [RSM - Active Directory - Monitor - Active Directory - User Last Logon > X Days](https://proval.itglue.com/DOC-5078775-10813367) internal monitor from the `ProSync` plugin.
   - Import the **`△ Custom - Ticket Creation - Computer`** alert template from the `ProSync` plugin, if it's already not present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338) script from the `ProSync` plugin, if it's already not present in the environment.
   - Reload the System Cache.
   - Assign the **`△ Custom - Ticket Creation - Computer`** alert template to the [RSM - Active Directory - Monitor - Active Directory - User Last Logon > X Days](https://proval.itglue.com/DOC-5078775-10813367) monitor set.

   ![](..\..\static\img\Active-Directory-&-Domain-Environment-Audit\image_8.png)

9. ### Active Directory - Domain Computers Missing Automate Agent

   - Import the [CWM - Automate - Internal Monitor - Domain Computers Missing Automate Agent](https://proval.itglue.com/DOC-5078775-15186683) internal monitor from the `ProSync` plugin.
   - Import the **`△ Custom - Ticket Creation - Client`** alert template from the `ProSync` plugin, if it's already not present in the environment.
   - Import the [CWM - Automate - Ticket Creation - Client](https://proval.itglue.com/DOC-5078775-14282558) script from the `ProSync` plugin, if it's already not present in the environment.
   - Reload the System Cache.
   - Assign the **`△ Custom - Ticket Creation - Client`** alert template to the [CWM - Automate - Internal Monitor - Domain Computers Missing Automate Agent](https://proval.itglue.com/DOC-5078775-15186683) monitor set.

   ![](..\..\static\img\Active-Directory-&-Domain-Environment-Audit\image_9.png)

10. ### Active Directory - ADPluginUser - Create/Update

    - Import the [CWM - Automate - Internal Monitor - Active Directory - ADPluginUser - Create/Update](https://proval.itglue.com/DOC-5078775-11420016) monitor set from the `ProSync` plugin.
    - Import and implement the [CWM - Automate - Script - Active Directory - Plugin User Account - Create/Update](https://proval.itglue.com/DOC-5078775-11419940) script as instructed in the **`Implementation`** section of the [script's](https://proval.itglue.com/DOC-5078775-11419940) document.
    - Import the **`△ Custom - Autofix - AD Plugin User - Create/Update`** alert template from the `ProSync` plugin, if it's already not present in the environment.
    - Assign the **`△ Custom - Autofix - AD Plugin User - Create/Update`** alert template to the [CWM - Automate - Internal Monitor - Active Directory - ADPluginUser - Create/Update](https://proval.itglue.com/DOC-5078775-11420016) monitor set.

    ![](..\..\static\img\Active-Directory-&-Domain-Environment-Audit\image_10.png)

11. ### Active Directory - AD Users

    - Import the [RSM - Active Directory - Dataview - Active Directory - AD Users](https://proval.itglue.com/DOC-5078775-7988138) dataview from the `ProSync` plugin.

12. ### Active Directory - Domain Group and Members

    - Import the [RSM - Active Directory - Dataview - Active Directory - Domain Groups and Members](https://proval.itglue.com/DOC-5078775-8013556) dataview from the `ProSync` plugin.

## Implementation (Independent Solutions)

1. The solutions presented in this section do not rely on any plugin.

2. ### Group Policy Audit

   - Import the [RSM - Active Directory - Script - Group Policy - Audit](https://proval.itglue.com/DOC-5078775-15193954) script from the `ProSync` plugin.
   - Import the following dataviews from the `ProSync` plugin:
     - [RSM - Active Directory - Dataview - Windows - Group Policy Objects](https://proval.itglue.com/DOC-5078775-7964597)
     - [RSM - Active Directory - Dataview - Windows - Group Policy Settings](https://proval.itglue.com/DOC-5078775-8225111)
     - [RSM - Active Directory - Dataview - Windows - Group Policy Object Links](https://proval.itglue.com/DOC-5078775-8218975)
     - [RSM - Active Directory - Dataview - Windows - Group Policy Object Security Filtering](https://proval.itglue.com/DOC-5078775-8213726)
   - Schedule the [RSM - Active Directory - Script - Group Policy - Audit](https://proval.itglue.com/DOC-5078775-15193954) script to run once per day against the domain controllers group.
   - Import the [RSM - Active Directory - Monitor - GPO Modified](https://proval.itglue.com/DOC-5078775-8041380) internal monitor from the `ProSync` plugin.
   - Implement the monitor set as explained in the **`Implementation`** section of the [monitor's](https://proval.itglue.com/DOC-5078775-8041380) document.
   - Import the **`△ Custom - Ticket Creation - Computer`** alert template from the `ProSync` plugin, if it's already not present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338) script from the `ProSync` plugin, if it's already not present in the environment.
   - Reload the System Cache.
   - Assign the **`△ Custom - Ticket Creation - Computer`** alert template to the [RSM - Active Directory - Script - Group Policy - Audit](https://proval.itglue.com/DOC-5078775-15193954) monitor set.

   ![](..\..\static\img\Active-Directory-&-Domain-Environment-Audit\image_11.png)

3. ### Reset AD Users Password Age

   - Import the **`△ Custom - Ticket Creation - Computer`** alert template from the `ProSync` plugin, if it's already not present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338) script from the `ProSync` plugin, if it's already not present in the environment.
   - Import the [EPM - User Management - Remote Monitor - Reset AD Users Password Age](https://proval.itglue.com/DOC-5078775-13664978) remote monitor by following the instructions outlined in the [Import - Remote Monitor - Reset AD Users Password Age](https://proval.itglue.com/DOC-5078775-13667960) document.
   - Reload the System Cache.
   - Locate the [EPM - User Management - Remote Monitor - Reset AD Users Password Age](https://proval.itglue.com/DOC-5078775-13664978) remote monitor by opening the relevant group(s) and apply the **`△ Custom - Ticket Creation - Computer`** alert template to the group monitor.

4. ### New Domain Admin

   - Import the **`△ Custom - Ticket Creation Computer - Failures Only`** alert template from the `ProSync` plugin, if it's already not present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer [Failures Only]*](https://proval.itglue.com/DOC-5078775-13459854) script from the `ProSync` plugin, if it's already not present in the environment.
   - Import the [RSM - Active Directory - Remote Monitor - New Domain Admin](https://proval.itglue.com/DOC-5078775-13459830) remote monitor by following the instructions outlined in the [Implement - Remote Monitor - New Domain Admin](https://proval.itglue.com/DOC-5078775-13460543) document.
   - Reload the System Cache.
   - Locate the [RSM - Active Directory - Remote Monitor - New Domain Admin](https://proval.itglue.com/DOC-5078775-13459830) remote monitor by opening the **`Domain Controllers`** group.

5. ### Enable AD Recycle Bin

   - Import the [CWM - Automate - Script - AD - Enable AD Recycle Bin](https://proval.itglue.com/DOC-5078775-7937042) script from the `ProSync` plugin.
   - Import the **`△ Custom - Execute Script - AD - Enable AD Recycle Bin`** alert template from the `ProSync` plugin.
   - Import the [RSM - Active Directory - Role - AD Domain Recycle Bin Feature](https://proval.itglue.com/DOC-5078775-8012918) role and the [CWM - Automate - Remote Monitor - AD Recycle Bin State Check](https://proval.itglue.com/DOC-5078775-7815146) remote monitor by following the instructions outlined in the [Import - Remote Monitor - AD Recycle Bin State Check](https://proval.itglue.com/DOC-5078775-14764163) document.
   - Reload the System Cache.
   - Locate the [EPM - User Management - Remote Monitor - Reset AD Users Password Age](https://proval.itglue.com/DOC-5078775-13664978) remote monitor by opening the **`Domain Controllers`** group and apply the **`△ Custom - Execute Script - AD - Enable AD Recycle Bin`** alert template to the group monitor.

6. ### AD Account Lockout Detection 

   - Import the **`△ Custom - Ticket Creation Computer - Failures Only`** alert template from the `ProSync` plugin, if it's already not present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer [Failures Only]*](https://proval.itglue.com/DOC-5078775-13459854) script from the `ProSync` plugin, if it's already not present in the environment.
   - Import the [RSM - Active Directory - Remote Monitor - AD Account Lockout Detection](https://proval.itglue.com/DOC-5078775-14952698) remote monitor by following the instructions outlined in the [Implement - Remote Monitor - AD Account LockOut Detection](https://proval.itglue.com/DOC-5078775-14952901) document.
   - Reload the System Cache.
   - Locate the [RSM - Active Directory - Remote Monitor - AD Account Lockout Detection](https://proval.itglue.com/DOC-5078775-14952698) remote monitor by opening the **`Domain Controllers`** group and apply the **`△ Custom - Ticket Creation Computer - Failures Only`** alert template to the group monitor.

7. ### Active Directory Replication Anomaly Monitoring

   - Import the **`△ Custom - Ticket Creation - Computer`** alert template from the `ProSync` plugin, if it's already not present in the environment.
   - Import the [CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338) script from the `ProSync` plugin, if it's already not present in the environment.
   - Import the [RSM - Active Directory - Remote Monitor - Active Directory Replication Anomaly Monitoring](https://proval.itglue.com/DOC-5078775-14646049) remote monitor by following the instructions outlined in the [Implement - Remote Monitor - Active Directory Replication Anomaly Monitoring](https://proval.itglue.com/DOC-5078775-14646252) document.
   - Reload the System Cache.
   - Locate the [RSM - Active Directory - Remote Monitor - Active Directory Replication Anomaly Monitoring](https://proval.itglue.com/DOC-5078775-14646049) remote monitor by opening the **`Domain Controllers`** group and apply the **`△ Custom - Ticket Creation - Computer`** alert template to the group monitor.


