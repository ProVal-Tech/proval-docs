---
id: '0163e7d2-d72d-4b31-b0fe-294df333d125'
title: 'Install-AutomateAgentGPO'
title_meta: 'Install-AutomateAgentGPO'
keywords: ['install', 'automate', 'agent', 'gpo']
description: 'Documentation for the Install-AutomateAgentGPO command to create a ConnectWise Automate Agent Deployment group policy object.'
tags: ['active-directory', 'setup', 'windows']
draft: false
unlisted: false
---

## Description
This script creates a ConnectWise Automate Agent Deployment group policy object that will create a startup script (or a Scheduled Task) policy and apply that policy to the root forest in group policy management.

## Requirements
- PowerShell v5+
- Internet access
- Target domain controller
- Active Directory
- Group Policy management set up properly

## Usage
1. **Set Up the Environment:**
   - Sets the security protocol.
   - Installs or updates the Strapper module.

2. **Create the PowerShell Script:**
   - The New-ScriptFile function generates a PowerShell script for Automate deployment.
   - This script:
     - Configures execution policy.
     - Defines functions to install and uninstall the Automate agent.
     - Checks the connection and status of the existing Automate agent.
     - Installs or repairs the agent based on its status and server address.

3. **Create Scheduled Task XML (if required):**
   - The New-ScheduledTaskXml function generates an XML file for a scheduled task.
   - The scheduled task runs the PowerShell script to deploy or repair the Automate agent.

4. **Apply the Group Policy Object:**
   - Checks if the GPO already exists.
   - If it does not exist:
     - Creates the GPO.
     - Links the GPO to the domain.
     - Copies the necessary files to the SYSVOL folder.
     - If the ScheduledTaskGPO switch is used, creates the scheduled task XML and sets up the task.
     - Otherwise, sets up a startup script.
   - If the GPO already exists:
     - Checks if the token matches.
     - If the token does not match, updates the script and GPO with the new token.

```powershell
.\Install-AutomateAgent-GPO.ps1 -Server https://something/somewhere -Token 78907gfdg890879fd7g98 -LocationID 2
```
Creates a Group Policy Object to run a script that installs the Automate agent if it is missing or repairs it if it is malfunctioning.

```powershell
.\Install-AutomateAgent-GPO.ps1 -Server https://something/somewhere -Token 78907gfdg890879fd7g98 -ScheduledTaskGPO -LocationID 2
```
Creates a Group Policy Object to run a scheduled task that will immediately run a script that installs the Automate agent if it is missing or repairs it if it is malfunctioning.

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `Server`          |       | True      |           | String    | The web address for the Automate instance. |
| `Token`           |       | True      |           | String    | The token assigned for the download of the agent installer. |
| `LocationID`      |       | True      |           | Int       | The location to assign the computers to when installing. |
| `ScheduledTaskGPO`|       | False     |           | Switch    | Switch to indicate whether the GPO should create a scheduled task instead of a startup script. |

## Output
- .\Install-AutomateAgentGPO-log.txt
- C:\ProgramData\_automation\Automate-Deploy\Automate-Deploy.ps1
- Group Policy ('Automate-Deploy' or 'Automate-Deploy Scheduled Task')

#### FAQ

**1. What GPO settings are applied with this policy?**
- **Startup Script:**  
  Windows Settings\Scripts\Startup - value: `Automate-Deploy.ps1`
- **Logon Script Delay:**  
  Administrative Settings\System\Group Policy\Configure Logon Script Delay - values: Enabled, set to 5 minutes.

**2. What is the process for the installation of the agent on a domain-joined computer?**
- **If the Automate registry value exists, and the last success state is current, and the server name matches the provided value:**  
  No changes are made, and the script exits.
- **If the Automate registry value exists, and the last success state is current, but the server name does not match the provided value:**  
  The current Automate agent is uninstalled, and the agent is reinstalled with the proper settings.
- **If the Automate registry value exists, and the last success state is not current:**  
  The current Automate agent is uninstalled, and the agent is reinstalled with the proper settings.
- **If the registry value for Automate does not exist:**  
  The agent is installed with the provided settings.

**3. What is the process when running this script recurrently on a domain controller?**
- **If the Automate-Deploy GPO exists and the token in the deployment script matches the token provided:**  
  No changes are made, and the script exits.
- **If the Automate-Deploy GPO exists, but the provided token does not match the token in the deployment script:**  
  The deployment script is rewritten with the new token.
- **If the Automate-Deploy GPO does not exist:**  
  The GPO is created, all GPO properties are applied, and the GPO is linked to the root forest.

**4. The Automate-Deployment startup script was removed from the SYSVOL folder; is there a copy anywhere else?**
- Yes, a copy of the SYSVOL-written startup script can be found at `C:\ProgramData\_automation\Automate-Deploy\Automate-Deploy.ps1`.

**5. What new feature has been added regarding ScheduledTaskGPO?**
- A new parameter, `-ScheduledTaskGPO`, has been added to the script. This feature allows the creation of a scheduled task to run the `Automate-Deploy` script. When this parameter is specified:
  - An XML file for the scheduled task is created.
  - The XML file and deployment script are copied to the appropriate locations in the SYSVOL folder.
  - The GPO is configured to use the scheduled task instead of a startup script.

**6. What GPO settings are applied with the ScheduledTaskGPO feature?**
- **Scheduled Task:**  
  The GPO will execute the deployment script (`Automate-Deploy.ps1`) immediately on the end machines with the help of a scheduled task.
- **Deployment Script:**  
  The deployment script is placed in the NETLOGON folder.



