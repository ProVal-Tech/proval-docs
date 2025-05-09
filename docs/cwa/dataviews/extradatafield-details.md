---
id: 'f6186972-e38b-4e2a-952f-b87204915278'
slug: /f6186972-e38b-4e2a-952f-b87204915278
title: 'Extradatafield details'
title_meta: 'Extradatafield details'
keywords: ['extradatafields', 'edf', 'value', 'details', 'usage']
description: 'This document provides a comprehensive overview of the Extradatafields (EDF), including their details, usage, and values within the system. It lists various attributes of the EDFs, such as ID, name, type, level, and associated values, along with notes on their usage status.'
tags: ['database', 'report', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

The purpose of this document is to represent all the details of the Extradatafields, including where they are being used and what their values are.

## Columns

| Column                     | Description                                                                                      |
|---------------------------|--------------------------------------------------------------------------------------------------|
| ExtraField ID             | ID of the EDF                                                                                   |
| ExtraField Name           | Name of the EDF                                                                                 |
| ExtraField Type           | Type of the EDF                                                                                 |
| ExtraField Level          | Level of the EDF                                                                                |
| Default Value Set         | Default value specified for the EDF within the System Dashboard                                 |
| Default EDF Value         | Value of the Default EDF                                                                         |
| EDF Value                 | Value of the EDF where it is being used. <em><strong>Note:</strong> "Not Used" is written against EDFs that are not currently used.</em> |
| Entity ID                 | Contains computer ID for computer EDF, client ID for client EDF, location ID for location EDF, device ID for network devices EDF, ticket ID for Tickets EDF, computer ID for Probe EDF, group ID for Group EDF, and contact ID for contacts EDF. <em><strong>Note:</strong> Its value will be 0 for Default EDFs and "Not Used" for EDFs that are not currently used.</em> |
| Machine Name              | Machine Name in case it is a Computer EDF                                                      |
| Location Name             | Location Name in case it is a Location EDF                                                     |
| Client Name               | Client Name in case it is a Client EDF                                                         |
| Device Name               | Device Name in case it is a Network Devices EDF                                                |
| Group Name                | Group Name in case it is a Group EDF                                                           |
| Probe Name                | Probe Name in case it is a Probe EDF                                                            |
| Ticket ID                 | Ticket ID in case it is a Tickets EDF                                                            |
| Contact                   | Contact Name in case it is a Contacts EDF                                                       |
| Section                   | Data screen where the EDF will appear                                                            |
| Fill                      | Describes the EDF or contains the EDF fill value                                                |
| Is Hidden                 | Represents whether the EDF is hidden or not                                                     |
| Is Encrypted              | Represents whether the EDF is encrypted or not                                                  |
| Is Editable               | Represents whether the EDF is editable or not                                                   |
| Is Restricted             | Represents whether the EDF is restricted or not                                                 |
| (Masked/Password)         | Represents whether the EDF is masked or has a password                                          |
