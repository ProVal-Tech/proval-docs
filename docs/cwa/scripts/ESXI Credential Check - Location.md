---
id: '48e22d95-37d4-453d-a7a4-d816bd9950f9'
slug: /48e22d95-37d4-453d-a7a4-d816bd9950f9
title: 'ESXI Credential Check - Location'
title_meta: 'ESXI Credential Check - Location'
keywords: ['client', 'ticket', 'virtual', 'machine', 'host', 'manager']
description: 'This document outlines a script that generates client tickets for locations with virtual machines that lack a corresponding host in the virtualization manager. It includes details on variables, process flow, and sample runs to ensure effective monitoring and management.'
tags: ['database', 'report', 'ticketing', 'virtualization']
draft: false
unlisted: false
---

## Summary

This script will create a client ticket for any location in which a virtual machine exists, and no host is present in the virtualization manager plugin.

To exclude any location from this check, please set this checkbox to checked.

![Image](../../../static/img/ESXI-Credential-Check---Location/image_1.png)

## Sample Run

This script should be a scheduled client script; it should be run at regular intervals depending on the client's request for monitoring.

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name        | Description                                                                                     |
|-------------|-------------------------------------------------------------------------------------------------|
| sqldataset  | The returned dataset of all locations with computers that do not have a corresponding host in the virtualization manager. |
| Count       | The number of rows that sqldataset has found.                                                 |

## Process

1. Search the database for virtual machines that do not have a known host and return the objects.
2. Loop through all the rows of data returned, creating a ticket for each client—one ticket per location with all found objects noted in the ticket.

## Ticketing

![Image](../../../static/img/ESXI-Credential-Check---Location/image_2.png)

![Image](../../../static/img/ESXI-Credential-Check---Location/image_3.png)


