---
id: 'f68fc157-ae00-4c3f-bb05-b53cefab28ac'
slug: /f68fc157-ae00-4c3f-bb05-b53cefab28ac
title: 'CyberCNS Agent Solution'
title_meta: 'CyberCNS Agent Solution'
keywords: ['cybercns', 'agent', 'installation', 'uninstallation', 'client', 'edf']
description: 'The goal of this solution to provide the install and uninstall feature for the CyberCNS Agent through CWA platform.'
tags: ['uninstallation', 'installation', 'software']
draft: false
unlisted: false
---

## Purpose

The goal of this solution to provide the install and uninstall feature for the CyberCNS Agent through CWA platform.

## Associated Deployment Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [CyberCNS Agent Installation](/docs/15ecac3c-fe43-4d04-9e6c-82099bfa356b)      | Script | This document provides a comprehensive guide on installing the CyberCNS agent on a computer, detailing the requirements, EDFs, and the process involved in the installation. |
| [CyberCNS Agent Deployment](/docs/53d5de1f-d5b5-47a3-80a0-17603d673b72) | Monitor | This monitor detects the online Automate agent where the CyberCNS Company ID is provided, and attempts to deploy the CyberCNS agent on it. |
| `△ Custom - Execute Script - CyberCNS Agent Install` | Alert Template | This alert template is applied with the monitor [CyberCNS Agent Deployment](/docs/53d5de1f-d5b5-47a3-80a0-17603d673b72) to run the script [CyberCNS Agent Installation](/docs/15ecac3c-fe43-4d04-9e6c-82099bfa356b) for the CyberCNS deployment on the detected agents. |


## Associated Uninstall Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [CyberCNS Agent Uninstallation](/docs/d4e3e9b3-bdf1-404a-9db0-2c4be4468a5d)     | Script | This script will assist in uninstalling the ConnectSecure Vulnerability Scan Agent, otherwise known as the CyberCNS agent. |
| [CyberCNS Agent Uninstall](/docs/e27e56f2-f080-4233-ae07-4097ae721dbe) | Monitor | This monitor detects the online Automate agent where the CyberCNS Agent is installed, and attempts to uninstall the CyberCNS agent from it. |
| `△ Custom - Execute Script - CyberCNS Agent Uninstall` | Alert Template | This alert template is applied with the monitor [CyberCNS Agent Uninstall](/docs/e27e56f2-f080-4233-ae07-4097ae721dbe) to run the script [Cybercns Agent Uninstallation](/docs/d4e3e9b3-bdf1-404a-9db0-2c4be4468a5d) for the cybercns uninstall from the detected agents. |

## Implementation

- Import the [Script - CyberCNS Agent Installation](/docs/15ecac3c-fe43-4d04-9e6c-82099bfa356b)
- Import the [Internal Monitor - CyberCNS Agent Deployment](/docs/53d5de1f-d5b5-47a3-80a0-17603d673b72)
- Import the alert template `△ Custom - Execute Script - CyberCNS Agent Install`
- Apply the alert template to the [Internal Monitor - CyberCNS Agent Deployment](/docs/53d5de1f-d5b5-47a3-80a0-17603d673b72).
- Right click the monitor and click on run now reset
  
## Optional Uninstall Implementation

- Import the [Script - CyberCNS Agent Uninstallation](/docs/d4e3e9b3-bdf1-404a-9db0-2c4be4468a5d)
- Import the [Internal Monitor - CyberCNS Agent Uninstall](/docs/e27e56f2-f080-4233-ae07-4097ae721dbe) 
- Import the alert template `△ Custom - Execute Script - CyberCNS Agent Uninstall`
- Apply the alert template to the [Internal Monitor - CyberCNS Agent Uninstall](/docs/e27e56f2-f080-4233-ae07-4097ae721dbe).
- Right click the monitor and click on run now reset

## FAQ

**Q. How to set ticketing for the failed installation attempt of the CyberCNS Agent?**
  
  Please refer to the [Internal Monitor - CyberCNS Agent Deployment](/docs/53d5de1f-d5b5-47a3-80a0-17603d673b72) documentation.
  It is just required to set the `TicketCategory` option in the Alerting section of the monitor.