---
id: 'ba82a707-a466-4960-95a9-856d5b67b8ed'
slug: /ba82a707-a466-4960-95a9-856d5b67b8ed
title: 'CWM - Automate - Script -Automate Agent - InstallRepair - For GPO Globals'
title_meta: 'CWM - Automate - Script -Automate Agent - InstallRepair - For GPO Globals'
keywords: ['automate', 'gpo', 'agent', 'installation', 'deployment', 'token', 'script']
description: 'This document outlines a PowerShell script designed for creating and managing the Automate agent deployment via Group Policy Objects (GPO). It includes steps for installation, repair, and replacement of the agent, ensuring that it remains up-to-date with a new Installation Token. The guide targets Domain Controllers and provides detailed implementation steps, variable definitions, and expected outputs.'
tags: ['deployment', 'gpo', 'installation']
draft: false
unlisted: false
---

## Summary

The purpose of this script is to create a PowerShell script to be used along with the Automate agent deployment GPO. It will also keep the PowerShell script up-to-date with a new Installation Token.

The generated PowerShell script will install the agent if it is missing, attempt to repair the agent if it is broken, and rip and replace the agent if another MSP's agent is installed.

**Intended Target:** Domain Controllers with Automate agent deployment GPO

## Sample Run

![Sample Run](../../../static/img/docs/ba82a707-a466-4960-95a9-856d5b67b8ed/image_1.webp)

## Implementation

**Step 1:** Create a computer-level EDF "Automate Agent Deployment GPO Enabled."

![Step 1](../../../static/img/docs/ba82a707-a466-4960-95a9-856d5b67b8ed/image_2.webp)

**Step 2:** Create an Auto-Join Group for the machines where the EDF is checked.

**Step 3:** Schedule the script to run once per day against the group.

![Step 3](../../../static/img/docs/ba82a707-a466-4960-95a9-856d5b67b8ed/image_3.webp)

**Step 4:** Mark the EDF of the Domain Controllers where you would like to create the Agent Deployment GPO.

## Variables

| Name               | Description                                                                                     |
|--------------------|-------------------------------------------------------------------------------------------------|
| TargetLocationID   | Location ID to create the Installer Token for. Will use the location ID of the computer.      |
| ValidityPeriod     | Age limit for the Installer. 1 Day                                                             |
| InstallerTypeID    | ID of the installer type. 1 represents an .msi agent installer                                 |
| TokenReason        | Reason behind creating the installer token.                                                    |
| TokenIngredients    | Required variables/values to create the Agent token.                                          |
| VerificationKey    | Verification Key for the Agent Installer Token.                                                |
| OutCome            | Output of the PowerShell script used to write/modify the agent installation ps1 file.        |
| InstallerToken     | Installer Token generated to be used with the agent reinstall command.                        |

#### Global Parameters

| Name        | Example                                   | Required | Description                       |
|-------------|-------------------------------------------|----------|-----------------------------------|
| Directory   | C:/ProgramData/_Automation/Automate Agent | True     | Path to create the .ps1 script    |
| FileName    | Redo-Agent.ps1                           | True     | Name of the .ps1 script           |

#### Script States

| Name            | Example                                | Description                                                                                       |
|-----------------|----------------------------------------|---------------------------------------------------------------------------------------------------|
| GPO Agent Token  | f9e7246ae89145e98cd8376d93e247aa      | Used to store the currently generated agent token, so that it can be removed before generating another token |

## Process

- Remove the previously generated token for the computer from the `installertokens` table.
- Clear the 'GPO Agent Token' script state.
- Create the `@Directory@` if it does not exist.
- Generate an Agent Installer Token.
- Store the token to the Script State.
- Generate the PowerShell script on the computer.
- Verify the presence of the `@InstallerToken@` in the script.
- Log the outcome.

## Output

- Script State
- Script Log
- Local File on the computer (C:/ProgramData/_Automation/Automate Agent/Redo-Agent.ps1)

## Creating Automate Agent Deployment GPO

<iframe src="https://proval.itglue.com/attachments/10110714?preview=1" width="100%" height="900px" frameborder="0"></iframe>
## Attachments
[Automate_Agent_Deployment_GPO.pdf](<../../../static/attachments/itg/10861684/Automate_Agent_Deployment_GPO.pdf>)