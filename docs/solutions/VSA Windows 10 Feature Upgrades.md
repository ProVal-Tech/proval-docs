---
id: '9f11d658-bcef-435c-8bfa-517b6588f84a'
slug: /9f11d658-bcef-435c-8bfa-517b6588f84a
title: 'VSA Windows 10 Feature Upgrades'
title_meta: 'VSA Windows 10 Feature Upgrades'
keywords: ['upgrade', 'windows', 'feature', 'implementation', 'agent', 'procedure', 'registry', 'status']
description: 'This document outlines the implementation of a feature upgrade for Windows 10 endpoints, including procedures for handling reboots, monitoring upgrade status, and managing failures. It provides a comprehensive guide for setting up the necessary components to ensure a smooth upgrade process.'
tags: ['reboot', 'windows']
draft: false
unlisted: false
---

# Introduction
This document is an implementation of the Agnostic content developed by Chris Calverly for ProVal Technologies, designed by Dan Hicks.

# Overview
This implementation will initiate a feature upgrade on the target endpoint and force that endpoint to reboot 30 minutes after completion. After the upgrade process is finished, the status of the upgrade will be verified, and the endpoint will be added to the relevant view. Upgrade status is stored in the registry and an event. There is an optional Agent Procedure included that will schedule the installation without a reboot. This no-reboot option will also be applied to machines in the FAILURE status by the policy.

# Included Content

| Name                                                                                                                                                       | Content Type     | Description                                                          |
|------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------|----------------------------------------------------------------------|
| [SEC - Windows Patching - Agent Procedure - Windows 10 Feature Upgrade](/docs/5756f649-47ee-4bf0-b8ef-f65eeb4453fe)                                 | Agent Procedure    | This procedure launches the upgrade process                          |
| [SEC - Windows Patching - Agent Procedure - Windows 10 Feature Upgrade (No Reboot)](/docs/0ecbf1e1-8947-417c-a3ad-952fcf218140)                     | Agent Procedure    | This procedure will fire on machines that fail the first attempt. Can also be run manually |
| [SEC - Windows Patching - Agent Procedure - Registry Check](/docs/f0d83724-e8a8-41f8-8f73-fea99d0f34de)                                             | Agent Procedure    | Fired hourly until the installation status shows success or failure. Updates the CF |
| [SEC - Windows Patching - Agnostic - Update-Windows10](/docs/7fdd2a3b-2dca-43db-8a1d-f350967f1055)                                                  | PowerShell Script  | Agnostic content to perform Windows 10 Feature Upgrades.            |
| [SEC - Windows Patching - Policy - Windows 10 Feature Upgrade Reattempt on Fail](/docs/a347ce1a-5ef9-4e07-a42e-629d7d49c620)                        | Policy             | Fires the No Reboot script on machines that failed the initial attempt |
| [SEC - Windows Patching - Event Set Monitor - xPVAL Windows Feature Upgrade Event](https://proval.itglue.com/DOC-5078775-10784805)                      | Event Set          | Monitors for the completion event and fires the registry check to force-update the CF |
| [SEC - Windows Patching - Event Set Monitor - xPVAL Windows Feature Upgrade Event](https://proval.itglue.com/DOC-5078775-10784805)                      | Machine Custom Field | Contains the upgrade status                                         |
| [SEC - Windows Patching - View - xPVAL Feature Upgrade Status [REBOOT PENDING]](/docs/5045def4-0d37-4df2-9605-43762a048fa4)                        | View               | Endpoints that have run the no-reboot script.                       |
| [SEC - Windows Patching - View - xPVAL Feature Upgrade Status [FAILURE]](/docs/32444489-190b-4dde-846c-d613cb29e409)                               | View               | Endpoints that have failed the upgrade process                      |
| [SEC - Windows Patching - View - xPVAL Feature Upgrade Status [IN PROGRESS]](/docs/11a77dbd-36c2-4756-a012-564e9bae348f)                           | View               | Endpoints currently running either AP                                  |
| [SEC - Windows Patching - View - xPVAL Feature Upgrade Status [SUCCESS]](/docs/f1bf538d-dcfb-404f-83af-d01aee765067)                               | View               | Endpoints that have successfully upgraded                            |
| [SEC - Windows Patching - View - xPVAL Feature Upgrade Status [ALL]](/docs/d85b28a8-6f55-4387-b727-2eff4e8163ed)                                   | View               | All endpoints that have run either AP.                              |

# Implementation
1. Create the Machine Custom Field: xPVAL Windows Feature Upgrade Status
2. Create Agent Procedure Folder: Shared/PVAL Stack/Tool Set/Windows/Windows 10 Feature Upgrades/
3. Import `Windows 10 Feature Upgrade.xml` and place it in `Shared/PVAL Stack/Tool Set/Windows/Windows 10 Feature Upgrades/`
4. Import `Windows 10 Feature Upgrade (No Reboot).xml` and place it in `Shared/PVAL Stack/Tool Set/Windows/Windows 10 Feature Upgrades/`
5. Import `Registry Check.xml` and place it in `Shared/PVAL Stack/Tool Set/Windows/Windows 10 Feature Upgrades/`
6. Import `xPVAL_Windows_Feature_Upgrade_Event.xml` and apply it to all workstations in the environment.
7. Import `xPVAL_Feature_Upgrade_Views.xml` and ensure the Advanced Filters are correct according to the documentation in this solution.
8. Import `Windows_10_Feature_Upgrade_Reattempt_On_Fail` and place it in the `Policies/PVAL Stack` folder. Ensure that the view and assigned AP are correct in the policy. Notify the client of implementation and availability during the next Admin Call. Be sure to mention the 30-minute forced reboot.


