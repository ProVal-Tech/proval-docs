---
id: 'cwa-deploy-dns-filter-agent'
title: 'Deploy DNS Filter Agent Automatically'
title_meta: 'Deploy DNS Filter Agent Automatically'
keywords: ['dns', 'filter', 'agent', 'deployment', 'monitor']
description: 'This document outlines the steps to automatically deploy the DNS filter agent to client machines using associated scripts and monitors in the ConnectWise Automate environment. It includes detailed instructions for setup, implementation, and ticket creation.'
tags: ['automation', 'monitoring', 'deployment', 'exclusion', 'ticket']
draft: false
unlisted: false
---
## Purpose

This solution is built to deploy the DNS filter to the agents automatically.

## Associated Content

| Content                                                                                               | Type           | Function                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|-------------------------------------------------------------------------------------------------------|----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - DNS Filter Agent - Install](https://proval.itglue.com/DOC-5078775-15683983)              | Script         | This script installs the DNS Filter agent to the machines. It is compatible with both Macintosh machines and Windows workstations, but not with Windows servers since they do not support DNS Filter Agent.                                                                                                                                                                                                                                                                                                                                                                                        |
| [Internal Monitor - Deploy DNS Filter Agent](https://proval.itglue.com/DOC-5078775-15685295)       | Internal Monitor | The internal monitor executes the `DNS Filter Agent Deploy` script hourly on online machines missing `DNS Agent` on them. This monitor excludes the Linux and Windows servers since they do not support DNS Filter Agent. It detects agents where the 'Deploy DNS Filter Agent' client-EDF is checked and the 'Exclusion of DNS Filter Agent' at the location/computer level is not checked. It also ensures the secret key at the Computer/Location/Client level should exist for the installation.                                                                                  |
| △ Custom - Execute Script - DNS Filter Agent - Install                                               | Alert Template | This alert template executes the script [CWA - Script - DNS Filter Agent - Install](https://proval.itglue.com/DOC-5078775-15683983) to run automatically to the detected agents of the monitor [CWA - Internal Monitor - Deploy DNS Filter Agent](https://proval.itglue.com/DOC-5078775-15685295) automatically.                                                                                                                                                                                                                                                                                                                             |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - DNS Filter Agent - Install](https://proval.itglue.com/DOC-5078775-15683983)
   - [Internal Monitor - Deploy DNS Filter Agent](https://proval.itglue.com/DOC-5078775-15685295)
   - Alert Template - `△ Custom - Execute Script - DNS Filter Agent - Install`

2. After importing the script please reload the system cache so the EDFs get loaded.  
   ![Image](../../static/img/DNS-Filter-Agent-Deployment/image_1.png)

3. Navigate to Automation → Monitors → Find the monitor named 'ProVal - Production - Deploy DNS Filter Agent'  
   - Apply the alert template `△ Custom - Execute Script - DNS Filter Agent - Install` to the monitor
   - Right-Click the monitor and select 'Run Now and Reset Monitor'

   *Note* - To enable the solution, it is required to check the client-EDF 'Deploy DNS Filter Agent' for the deployment of the DNS filter on the agents of the client. Running the monitor should do nothing upon initial install of this content since the EDFs should not be enabled anywhere.

   *This solution can have exclusions made using the Location and Computer level EDFs located on the Exclusions tab:*  
   - *Exclusion of DNS Filter Agent*

   One of the following EDFs must be filled out in order for the script to function as well. They are:  
   **DNSFilter Computer Key** → Computer EDF.  
   If this is set, then the deployment of the DNS Filter will be done with this key as it overrides both location/client secret keys.  
   **DNSFilter Location Key** → Location EDF.  
   If this is set, then the deployment of the DNS Filter will be done with this key as it overrides both client secret keys.  
   **DNSFilter Site Key** → Client EDF.  
   If this is set, then the deployment of the DNS Filter will be done with this key only when both location and computer EDFs are empty.

4. Once the EDFs are set the solution will automatically start deploying the DNS Filter.

5. Ticket Creation  
   For the ticket creation, it is required to set the Ticket Category at the monitor level to gather the ticket category ID and get the ticket created on the respective board via script [CWA - Script - DNS Filter Agent - Install](https://proval.itglue.com/DOC-5078775-15683983):  
   ![Image](../../static/img/DNS-Filter-Agent-Deployment/image_2.png)



