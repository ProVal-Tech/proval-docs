---
id: 'cwa-install-dns-filter-agent'
title: 'Install DNS Filter Agent'
title_meta: 'Install DNS Filter Agent for Macintosh and Windows Workstations'
keywords: ['dns', 'filter', 'agent', 'installation', 'windows', 'macintosh']
description: 'This document provides a comprehensive guide on installing the DNS Filter agent on both Macintosh and Windows workstations, detailing the necessary variables, EDFs, and expected output during the installation process.'
tags: ['installation', 'dns', 'windows', 'macintosh', 'client', 'location', 'computer']
draft: false
unlisted: false
---
## Summary

This script installs the DNS Filter agent to the machines. It is compatible with both Macintosh machines and Windows workstations, but not with Windows servers since they do not support DNS Filter Agent.

## Sample Run

![Sample Run](../../../static/img/DNS-Filter-Agent---Install/image_1.png)

## Variables

| Name                  | Description                                                                                              |
|-----------------------|----------------------------------------------------------------------------------------------------------|
| Tickid                | Ticketid of existing new/open ticket                                                                     |
| Body                  | Message to add to the Ticket Body                                                                        |
| Shellresult           | Output returned by the installation command                                                               |
| CompKey               | It stores the secret key from computer-EDF 'DNSFilter Computer Key'                                     |
| Lockey                | It stores the secret key from location-EDF 'DNSFilter Location Key'                                     |
| Sitekey               | It stores the secret key from client-EDF 'DNSFilter Site Key'                                          |
| CompSecretKey         | It checks if the computer's secret key is present. <br> Note: The computer secret key has the highest priority over the client/location secret key. |
| LocSecretKey          | It checks if the location's secret key is present. <br> Note: The location secret key has the highest priority over the client secret key. |
| ClientSecretKey       | It checks if the client's secret key is present. <br> Note: The client secret key would only be used if both the computer and location secret key are empty. |
| TicketCreationCategory | It stores the ticket category ID from the monitor [CWA - Solution - DNS Filter Agent Deployment](https://proval.itglue.com/DOC-5078775-15669152) |
| SecretKey             | It has the final secret key which is used for the installation                                           |

## EDFs

| Name                          | Level   | Type    | Description                                                                                           |
|-------------------------------|---------|---------|-------------------------------------------------------------------------------------------------------|
| Deploy DNS Filter Agent       | Client  | Flag    | If set to 1 -> DNS filter agent will be installed on the agents of the client.                       |
| Exclusion of DNS Filter Agent  | Location| Flag    | If set to 1 -> DNS filter agent will be excluded on the agents of the location.                      |
| Exclusion of DNS Filter Agent  | Computer| Flag    | If set to 1 -> DNS filter agent will not prohibited on the computer.                                 |
| DNSFilter Computer Key        | Computer| Text    | It stores the secret key at the computer level. It overrides the secret key present at the location/client level. |
| DNSFilter Location Key        | Location| Text    | It stores the secret key at the location level. It overrides the secret key present at the client level. |
| DNSFilter Site Key            | Client  | Text    | It stores the secret key at the client level. This key only works when both location (DNSFilter Location Key) and computer level EDF (DNSFilter Computer Key) are empty. |

## Output

- Script Log
- Ticket



