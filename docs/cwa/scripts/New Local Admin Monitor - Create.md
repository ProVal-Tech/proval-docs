---
id: 'c3e994ea-ed6d-4ae8-a4dc-0200d87208d5'
title: 'Creating Remote Monitors for Local Administrators on Windows Machines'
title_meta: 'Creating Remote Monitors for Local Administrators on Windows Machines'
keywords: ['remote', 'monitor', 'local', 'administrators', 'windows', 'alerts', 'exclusions']
description: 'This document outlines the process for creating remote monitors that identify new or elevated local administrators on Windows machines, including system properties and Extra Data Fields (EDFs) for customization and alert management.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This document describes the process for creating remote monitors to identify new or elevated local administrators on Windows machines. The creation of these remote monitors is based on system properties, as well as client-level, location-level, and computer-level Extra Data Fields (EDFs), which are further explained in this document.

The script generates remote monitors that trigger an alert when a user or group of users is promoted as local administrators on the endpoint machine. By default, it excludes the `Domain Admins` ($Env:DOMAIN/Domain Admins) group from generating tickets, as well as local administrators created by the [Windows Local Admin Process](<../../solutions/Windows Local Admin Process.md>) solution. Additionally, the system properties, detailed further in the document, can be used to exclude specific users if necessary.

The generated remote monitor `ProVal - Production - New Local Admin` will use the [Get-NewLocalAdmin](<../../powershell/Get-NewLocalAdmin.md>) agnostic script to perform the monitoring.

**File Path:** `C:/ProgramData/_Automation/Script/Get-NewLocalAdmin/Get-NewLocalAdmin.ps1`

**File Hash:** `D841B4464A5CE301454990B53896118EC57427935335AEDD116024559BA89FFC`

**Note of Caution:** The remote monitors created by this script use PowerShell for monitoring. Therefore, their functionality is not guaranteed on computers running a version of PowerShell older than 5. Please ensure that your systems are updated to at least PowerShell version 5 for optimal performance.

**Exclusion Tips:**

- The word `Domain` can be used to define a domain user or group in the exclusion.  
  Example: If the exclusion is "Domain/Domain Users," then the script will intelligently exclude the "Domain Users" group for all domain-joined computers.
- Adding "Domain/Batman, Batman" to the exclusion system property will exclude both local and domain user "Batman" from generating alerts.

## Important Note

The `ProVal - Production - New Local Admin Monitor` remote monitor will not be created for the machines where the [Local Admin Group Cleanup](https://proval.itglue.com/DOC-5078775-16783557) solution is enabled. Additionally, the script will remove the existing monitor after enabling the [Local Admin Group Cleanup](https://proval.itglue.com/DOC-5078775-16783557) solution for the machine.

## Update Notice: 27-September-2024

The solution's Extra Data Fields have been modified. Update the script from the `Prosync` plugin and run/debug against any client with `Set_Environment` set to `1` to implement the changes.

![Update Notice](../../../static/img/New-Local-Admin-Monitor---Create/image_1.png)

## Implementation

**Remove Existing Monitors**

- Remove the existing `ProVal - Production - New Local Admin` monitor set from the groups it's already applied to.
  - Execute this SQL query from a RAWSQL monitor set to get rid of the existing monitors:  
    `Delete From Groupagents where Name = 'ProVal - Production - New Local Admin'`
  
- Open the 'Server Status' tool by navigating to `Help > Server Status.`  
  ![Server Status](../../../static/img/New-Local-Admin-Monitor---Create/image_2.png)

- Click the 'Do Group Refresh' button to refresh and apply the changes made.  
  ![Do Group Refresh](../../../static/img/New-Local-Admin-Monitor---Create/image_3.png)

- Click 'OK' to the popup message and wait for a minute to allow the changes to take effect.  
  ![OK Popup](../../../static/img/New-Local-Admin-Monitor---Create/image_4.png)

1. Import the `△ Custom - Ticket Creation - Computer - Failures Only` alert template from the `ProSync` plugin if it's missing in the environment.

2. Import the [New Local Admin Monitor - Create](https://proval.itglue.com/5078775/docs/16548726) script from the `ProSync` plugin.

3. **Run/Debug the Script**  
   - Execute or debug the script against a single client, with the `Set_Environment` parameter set to `1`. This action will generate the necessary system properties and Extra Data Fields (EDFs) for managing the remote monitors.  
   ![Run/Debug Script](../../../static/img/New-Local-Admin-Monitor---Create/image_5.png)  
   ![Run/Debug Script](../../../static/img/New-Local-Admin-Monitor---Create/image_1.png)

4. **Reload System Cache**  
   - Refresh the system cache to ensure all changes are updated.  
   ![Reload System Cache](../../../static/img/New-Local-Admin-Monitor---Create/image_6.png)

5. **Configure System Properties and EDFs**  
   - Navigate to the **System Dashboard -> Config -> Configurations -> Properties**.
   - Find the properties beginning with `NLA_Monitoring`.  
   ![Configure Properties](../../../static/img/New-Local-Admin-Monitor---Create/image_7.png)  
     The consultant should have provided you with any customizations that are required. Please read through the detailed System Properties and EDF explanations to understand how to configure any customizations.

6. **Schedule the Script**  
   - Schedule the script to run once per day, preferably around midnight, from the dashboard for optimal results.  
   ![Schedule Script](../../../static/img/New-Local-Admin-Monitor---Create/image_8.png)

## Dependencies

[EPM - User Management - Agnostic - Get-NewLocalAdmin](<../../powershell/Get-NewLocalAdmin.md>)

## User Parameters

| Name                | Example | Required               | Description                                                                                                                                                    |
|---------------------|---------|------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Set_Environment      | 1       | True (for first run only) | Set it to 1 during the first run of the script to generate the necessary system properties and EDFs for managing the generated remote monitors.               |

## System Properties

| Name                             | Example           | Required | Description                                                                                                                                                                                                                      |
|----------------------------------|-------------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| NLA_Monitoring_Enable            | 1                 | True     | Set this system property to `1` to enable the remote monitor creation for the partner. The default value is `0`.                                                                                                                |
| NLA_Monitoring_Group_Ids         | 2,3,855,856       | True     | The script will create remote monitors for the machines (Domain Controllers are excluded) that belong to the groups identified by the group IDs specified in this system property. The default value is ‘2,3,855,856’.            |
| NLA_Monitoring_Server_Only       | 0                 | False    | Setting this system property to '1' will limit the monitor set creation to the Windows Servers only. The default value is '0'.                                                                                               |
| NLA_Monitoring_Workstation_Only   | 0                 | False    | Setting this system property to '1' will limit the monitor set creation to the Windows Workstations only. The default value is '0'.                                                                                           |
| NLA_Monitoring_Interval          | 3600              | True     | Controls the generated Remote Monitor run time interval. The default is 3600 seconds.                                                                                                                                         |
| NLA_Monitoring_AlertTemplate     | 611               | True     | This system property stores the ID of the `Alert Template` to apply to the created remote monitors. The default value is the TemplateID of the `△ Custom - Ticket Creation - Computer - Failures Only` alert template.         |
| NLA_Monitoring_TicketCategory     | 124               | False    | This system property stores the ID of the `Ticket Category` to apply to the remote monitors created for the machines. The default value is '0', i.e., `\\<Not Specified>`.                                                        |
| NLA_Monitoring_Excluded_Users    | ClientAdmin, Admin2, User3 | True     | This system property stores the usernames to exclude from generating the new local admin-detected tickets. The default value will be `\\<blank>`.                                                                                 |

## Client-Level EDF

7. **New Local Admin Monitor**  
   - Select the appropriate option from the dropdown to manage the `New Local Admin Monitor` creation for the machines of this client. Leave it untouched or select `Enabled for Servers and Workstations` to create the monitors for all machines.  
     - Available Options:  
       - Disabled  
       - Enabled for Workstations Only  
       - Enabled for Servers Only  
       - Enabled for Servers and Workstations  
   - Default Option: Enabled for Servers and Workstations  
   - Leaving this EDF blank is equivalent to enabling for both servers and workstations.  
   ![Client-Level EDF](../../../static/img/New-Local-Admin-Monitor---Create/image_9.png)

8. **Excluded_Users**  
   - This EDF stores the usernames to exclude from generating the new local admin-detected tickets.  
   - The value stored in this EDF will be added as an additional exclusion, along with the value stored in the `NLA_Monitoring_Excluded_Users` system property.  
   - The username stored in the `1c. UserName` EDF will be excluded from the remote monitor if the [Windows Local Admin Process](<../../solutions/Windows Local Admin Process.md>) solution is enabled on the machine and it is using the username stored in the EDF.  
   ![Excluded Users EDF](../../../static/img/New-Local-Admin-Monitor---Create/image_10.png)

## Computer-Level EDF

| Name                    | Type      | Section        | Description                                                                                                                                                                                                                      |
|-------------------------|-----------|----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| NLAM_Exclude            | Check Box | Exclusions      | Selecting this Extra Data Field (EDF) will exclude the particular computer from the New Local Admin Monitoring. As a result, the script will not create any remote monitors for the computer. Furthermore, upon marking this EDF, the script will also remove any previously created remote monitor. |
| NLAM_Excluded_Users     | Check Box | Exclusions      | This EDF stores the usernames to exclude from generating the new local admin-detected tickets. By default, it will be a blank text box. The value stored in this EDF will be added as an additional exclusion, along with the value stored in the `NLA_Monitoring_Excluded_Users` system property, and the Client-Level EDF `3b. Excluded_Users`. |

## Remote Monitor Example

**Name:** `ProVal - Production - New Local Admin Monitor`

**Ticket Subject:** `New Local Admin Detected at %COMPUTERNAME%`

**Alert Message on Failure:**  
`New Local Admin(s) Detected at %COMPUTERNAME% for %CLIENTNAME%.`  
`\\<Newly Created Local Admin(s)>`

**Sample Ticket:**  
![Sample Ticket](../../../static/img/New-Local-Admin-Monitor---Create/image_11.png)  
**Automate will never close the ticket; instead, it will keep adding the new detections to the same ticket as a comment/note, unless the ticket is closed/resolved manually.**

**Sample Remote Monitor:**  
![Sample Remote Monitor](../../../static/img/New-Local-Admin-Monitor---Create/image_12.png)  
![Sample Remote Monitor](../../../static/img/New-Local-Admin-Monitor---Create/image_13.png)  
![Sample Remote Monitor](../../../static/img/New-Local-Admin-Monitor---Create/image_14.png)

## Output

- Remote Monitors

## FAQ

**Q.** The remote monitor `ProVal - Production - New Local Admin Monitor` uses a domain role check where 4,5 is excluded. What do those represent?  
**A.** The `DomainRole` property from the `Win32_ComputerSystem` class in PowerShell represents the role of the computer in a domain or workgroup. It returns a numeric value that corresponds to the system's role in the domain or workgroup. The values are as follows:

- **0:** **Standalone Workstation** — The computer is not a member of a domain and is a standalone workstation.
- **1:** **Member Workstation** — The computer is a member of a domain, but it is a client machine (workstation).
- **2:** **Standalone Server** — The computer is not a member of a domain and functions as a standalone server.
- **3:** **Member Server** — The computer is a member of a domain, but it is a server.
- **4:** **Backup Domain Controller (BDC)** — The computer is a Backup Domain Controller (BDC) in the domain. This role holds a copy of the domain database but does not handle user logins by default.
- **5:** **Primary Domain Controller (PDC)** — The computer is a Primary Domain Controller (PDC) in the domain. It handles user logins and manages the domain.

So, the monitor checks whether the `domainrole` is **not** one of 4 or 5, meaning that it continues if the machine is **not** a domain controller.

