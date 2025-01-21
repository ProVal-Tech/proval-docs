---
id: 'b30fa1c5-4c3a-41f5-bebf-dcbca148b470'
title: 'Remote Domain Join Using Kaseya API'
title_meta: 'Remote Domain Join Using Kaseya API'
keywords: ['kaseya', 'domain', 'join', 'api', 'remote']
description: 'This document outlines a program pair that facilitates remote domain joining of machines without direct domain access by utilizing the Kaseya API. It details the processes involved, parameters required, and output generated during the execution of the program.'
tags: ['kaseya', 'networking', 'security', 'setup', 'windows']
draft: true
unlisted: false
---

## Overview

This program pair is used to remotely domain join a machine without direct access to the domain using the Kaseya API by running on the endpoint and the domain controller (DC).  
The endpoint requires a restart.  
This will rename the machine if specified; otherwise, the machine will use its existing computer name.

## Process

### GetDCKaseyaNameAPI.exe

This executable uses the API to get its own agent details. It uses its organization ID to retrieve the most common domain in the organization, then gets the DC for that domain.  
The executable then pushes its details to that DC using the API and the DC's agent GUID and executes an agent procedure on that DC.  
Finally, the executable waits for its own domain join payload file to appear in its API documents folder, at which point it will domain join the machine.  
If the program does not see the payload file after 10 minutes, it will terminate.

### CreateDJOINFileAPI.exe

This executable is called by an agent procedure triggered from another executable on the endpoint.  
It retrieves all the detail files from its API documents folder and then creates payloads for those that do not have payloads on the endpoint.  
Once no files need to be created, it cleans up its managed files (the files it acted upon) and then closes itself after uploading the payloads to the endpoint.

## Parameters

### GetDCKaseyaName

| Parameter     | Required | Default | Type   | Description                                                                                             |
|---------------|----------|---------|--------|---------------------------------------------------------------------------------------------------------|
| agentguid     | true     |         | String | This is an agent GUID you need to push to the script from the endpoint                                   |
| url           | true     |         | String | The URL for our API connection                                                                           |
| username      | true     |         | String | The username for our API connection                                                                      |
| password      | true     |         | String | The password for our API connection                                                                      |
| renametype    | false    |         | String | Set to SERIAL for Serial, set to COMPUTERNAME for computer name; otherwise, the program will take input as the computer name |
| customdomain  | false    |         | String | Input the domain name you wish to join; there must be a domain controller for this domain in that organization |

### GetDCKaseyaName

| Parameter     | Required | Default | Type   | Description                                                                                             |
|---------------|----------|---------|--------|---------------------------------------------------------------------------------------------------------|
| agentguid     | true     |         | String | This is an agent GUID you need to push to the script from the endpoint                                   |
| url           | true     |         | String | The URL for our API connection                                                                           |
| username      | true     |         | String | The username for our API connection                                                                      |
| password      | true     |         | String | The password for our API connection                                                                      |

## Output

Output files for the endpoint are located in the same directory as the executable:  
`./{YOURAGENTGUID}-EndpointCompName.txt - local file for DC to create the djoin file`  
`./RemoteADJoin_CreateDJOINFile-log.txt - log file for endpoint`  
`./{YOURAGENTGUID}Z-DJoinPayload.txt - the djoin file`

## Locations

| Executable Endpoint                                                                                     | Executable DC                                                                                          |
|---------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| [RemoteADJoin-CreateDJOINFileAPI.exe](https://file.provaltech.com/repo/app/RemoteADJoin-CreateDJOINFileAPI.exe) | [RemoteADJoin-GetDCKaseyaNameAPI.exe](https://file.provaltech.com/repo/app/RemoteADJoin-GetDCKaseyaNameAPI.exe) |
| Automate                                                                                               | N/A                                                                                                    |
| Kaseya endpoint procedure                                                                               | Shared / PVAL Stack / Tool Set - Global / Remote Domain Join                                          |
| Kaseya DC procedure                                                                                   | Shared / PVAL Stack / Tool Set - Global / Remote Domain Join                                          |
