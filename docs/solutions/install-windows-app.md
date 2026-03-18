---
id: '0d8c4619-b666-44ec-93b1-2d00e4632865'
slug: /0d8c4619-b666-44ec-93b1-2d00e4632865
title: 'Install Windows App'
title_meta: 'Install Windows App'
keywords: ['windows', 'application', 'windows-app']
description: 'The purpose of this solution is to identify, install, and manage Windows App deployment on Windows workstations based on client and location settings.'
tags: ['windows', 'application', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-03-17
---

## Purpose

The purpose of this solution is to identify, install, and manage `Windows App` deployment on Windows workstations based on client and location settings.

## Associated Content

| Content | Type | Function |
|---------|------|----------|
| [Script: Install Windows App](/docs/dd28b731-7fbc-4345-8d0b-6875df1d5658) | Script | Installs Windows App and creates a desktop shortcut for the logged-in user. |
| [Remote Monitor: Install Windows App](/docs/8bcee6a9-17e9-4cf8-af0f-ae92e7d60336) | Remote Monitor | Detects Windows workstations where automatic Windows App deployment is enabled and the Windows App is not installed or the desktop shortcut is missing or broken. |
| [Internal Monitor: Install Windows App](/docs/b22f954e-6a02-46f4-81d3-3f5d18d4991c) | Internal Monitor | Identifies Windows workstations where the Windows App needs to be installed based on deployment settings. Triggers the installation script. |
| [Windows App Installation Audit](/docs/33896d60-d14a-49e0-90b8-605faf96e41f) | Dataview | Displays the installation status of Windows App and desktop shortcut configuration for Windows workstations with deployment enabled. |
| △ Custom - Execute Script - Install Windows App | Alert Template | Executes the Install Windows App script against machines detected by the Monitor. |

## Implementation

1. Import the following script using the `Prosync` plugin:
   - [Script: Install Windows App](/docs/dd28b731-7fbc-4345-8d0b-6875df1d5658)

2. Import the following monitors using the `Prosync` plugin:
   - [Internal Monitor: Install Windows App](/docs/b22f954e-6a02-46f4-81d3-3f5d18d4991c)

3. Import the following Alert Template using the `Prosync` plugin:
   - `△ Custom - Execute Script - Install Windows App`

4. Import the [Dataview: Windows App Installation Audit](/docs/33896d60-d14a-49e0-90b8-605faf96e41f) dataview using the `Prosync` plugin.

5. Reload the system cache (`Ctrl + R`)

6. Create the following remote monitor as instructed in the documentation:
    - [Remote Monitor: Install Windows App](/docs/8bcee6a9-17e9-4cf8-af0f-ae92e7d60336)

7. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor: Install Windows App](/docs/b22f954e-6a02-46f4-81d3-3f5d18d4991c)
       - Alert Template: `△ Custom - Execute Script - Install Windows App`
       - Right-click and Run Now to start the monitor

## FAQ

### What is Windows App and why should I deploy it?

> Windows App is a Microsoft application that provides remote access capabilities. This solution automates the deployment of Windows App across your Windows workstations, eliminating manual installation and ensuring consistent deployment across your organization.

### How do I enable Windows App deployment for my clients?

> To enable Windows App deployment for a client, check the client-level EDF **Windows App** (Extra Data Field). Once enabled, Windows workstations under that client will be targeted for automatic deployment.

### Can I exclude specific locations from Windows App deployment?

> Yes. Check the location-level EDF **Exclude Windows App**. Workstations in that location will be excluded from automatic deployment regardless of the client-level setting.

### Can I exclude a specific workstation from Windows App deployment?

> Yes. Check the computer-level EDF **Exclude Windows App**. That specific workstation will be excluded from automatic deployment.

### What is the priority order for EDFs if I have conflicting settings?

> The exclusion settings are evaluated in this order:
>
>> 1. **Computer-level Exclude Windows App** EDF (highest priority)
>> 2. **Location-level Exclude Windows App** EDF
>> 3. **Client-level Windows App** EDF (lowest priority)
>
>A workstation will be excluded if any of its exclusion flags are set, even if the client-level deployment is enabled.

### How can I monitor the deployment status of Windows App?

> Use the [Dataview: Windows App Installation Audit](/docs/33896d60-d14a-49e0-90b8-605faf96e41f) to view:
>
>> - Whether Windows App is installed on each workstation
>> - Whether the desktop shortcut is properly configured
>> - When the data was last collected
>> - The result of the most recent script execution
>> - How long each workstation has been offline

### What should I do if Windows App fails to install on a workstation?

> Check the following:
>
>> 1. Verify the workstation is online and has network connectivity
>> 2. Check the **Dataview: Windows App Installation Audit** for the workstation's script result
>> 3. Confirm that the client-level **Windows App** EDF is enabled and the computer is not excluded
>> 4. Ensure the user is logged in to the workstation (the script requires an active user session)
>> 5. Review the script logs in Automate for detailed error information

### Can I manually trigger the installation on a specific workstation?

> Yes. Navigate to the **Computer** in Automate, and execute the [Install Windows App](/docs/dd28b731-7fbc-4345-8d0b-6875df1d5658) script directly. This will install Windows App immediately without waiting for the automated schedule.

### How often does the solution check for and install Windows App?

> The [Remote Monitor: Install Windows App](/docs/8bcee6a9-17e9-4cf8-af0f-ae92e7d60336) runs on a half-hourly schedule by default. The [Internal Monitor: Install Windows App](/docs/b22f954e-6a02-46f4-81d3-3f5d18d4991c) then detects machines that need the installation and triggers the script.

### What happens if the desktop shortcut is missing or broken?

> The solution detects when the desktop shortcut is missing or the target path is invalid. The script will recreate the shortcut during the next automated run. You can also manually trigger the script on the workstation to recreate the shortcut immediately.

### Will the script interfere with an existing Windows App installation?

> No. The script is designed to safely handle already-installed instances of Windows App. It will only create the desktop shortcut if it doesn't already exist or if it's broken.

## Changelog

### 2026-03-17

- **Script: Install Windows App** - Signed PowerShell scripts for security compliance
- **Remote Monitor: Install Windows App** - Initial release with complete implementation documentation
- **Monitor: Install Windows App** - SQL query optimization for improved performance
- **Dataview: Windows App Installation Audit** - New dataview added to track Windows App installation status and deployment audit

### 2025-12-17

- Initial version of the document
