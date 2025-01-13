---
id: 'cwa-extradatafields-overview'
title: 'Extradatafields Overview'
title_meta: 'Extradatafields Overview'
keywords: ['extradatafields', 'edf', 'value', 'details', 'usage']
description: 'This document provides a comprehensive overview of the Extradatafields (EDF) including their details, usage, and values within the system. It lists various attributes of the EDFs, such as ID, name, type, level, and associated values, along with notes on their usage status.'
tags: ['database', 'configuration', 'report', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

The purpose of this Dataview is to represent all the Extradatafields details and where they are being used at and what is its value.

## Columns

| Column                     | Description                                                                                      |
|---------------------------|--------------------------------------------------------------------------------------------------|
| ExtraField ID             | Id of the EDF                                                                                   |
| ExtraField Name           | Name of the EDF                                                                                 |
| ExtraField Type           | Type of the EDF                                                                                 |
| ExtraField Level          | Level of the EDF                                                                                |
| Default Value Set         | Default value has been specified for the EDF within the System Dashboard                       |
| Default EDF Value         | Value of the Default EDF                                                                         |
| EDF Value                 | Value of the EDF where it is being used at<br><br><em><u><strong>Note:</strong></u> "Not Used" is written against EDFs which are not being currently used.</em> |
| Entity ID                 | Contains computerid for computer EDF, clientid for client EDF, locationid for location EDF, deviceid for network devices EDF, ticket ID for Tickets EDF, computerid for Probe EDF, Groupid for Group EDF and Contact ID for contacts EDF<br><br><em><u><strong>Note:</strong></u> Its value will be 0 for Default EDFs and "Not Used" for EDFs that are not currently used.</em> |
| Machine Name              | Machine Name in case it is a Computer EDF                                                      |
| Location Name             | Location Name in case it is a Location EDF                                                     |
| Client Name               | Client Name in case it is a Client EDF                                                         |
| Device Name               | Device Name in case it is a Network Devices EDF                                                |
| Group Name                | Group Name in case it is a Group EDF                                                           |
| Probe Name                | Probe Name in case it is a Probe EDF                                                            |
| TicketID                  | TicketID in case it is a Tickets EDF                                                            |
| Contact                   | Contact Name in case it is a Contacts EDF                                                       |
| Section                   | Data Screen where EDF will appear                                                                |
| Fill                      | Describes EDF or contains the EDF fill value                                                    |
| IsHidden                  | Represents whether EDF is hidden or not                                                         |
| IsEncrypted               | Represents whether EDF is encrypted or not                                                      |
| IsEditable                | Represents whether EDF is Editable or not                                                       |
| IsRestricted              | Represents whether EDF is restricted or not                                                     |
| (Masked/Password)         | Represents whether EDF is Masked or has a password                                              |


