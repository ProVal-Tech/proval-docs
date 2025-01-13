---
id: 'cwa-create-client-ticket-for-vm-without-host'
title: 'Create Client Ticket for VM Without Host'
title_meta: 'Create Client Ticket for VM Without Host'
keywords: ['client', 'ticket', 'virtual', 'machine', 'host', 'manager']
description: 'This document outlines a script that generates client tickets for locations with virtual machines that lack a corresponding host in the virtualization manager. It includes details on variables, process flow, and sample runs to ensure effective monitoring and management.'
tags: ['ticketing', 'virtualization', 'monitoring', 'database', 'report']
draft: false
unlisted: false
---
## Summary

This script will create a client ticket for any location in which a virtual machine exists, and no host is present in the virtualization manager plugin.

To exclude any location from this check please set this check box to checked.

![Image](..\..\..\static\img\ESXI-Credential-Check---Location\image_1.png)

## Sample Run

This script should be a scheduled client script, it should be run on a regular interval depending on the clients request for monitoring.

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name        | Description                                                                                     |
|-------------|-------------------------------------------------------------------------------------------------|
| sqldataset  | The returned dataset of all locations computers that do not have a corresponding host in virtualization manager. |
| Count       | The amount of rows that Sqldataset has found.                                                 |

## Process

1. Search the database for virtual machines that do not have a known host. return the objects
2. Loop through all the rows of data returned creating a ticket for each client, one ticket per location with all found objects noted in the ticket.

## Ticketing

![Image](..\..\..\static\img\ESXI-Credential-Check---Location\image_2.png)

![Image](..\..\..\static\img\ESXI-Credential-Check---Location\image_3.png)



