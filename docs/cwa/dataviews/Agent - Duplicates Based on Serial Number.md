---
id: 'a36b0952-ad48-4891-b535-c70d0b2e235b'
title: 'Dataview for Identifying Duplicate Machines in ConnectWise Automate'
title_meta: 'Dataview for Identifying Duplicate Machines in ConnectWise Automate'
keywords: ['duplicate', 'machines', 'automate', 'dataview', 'licensing']
description: 'This document provides an overview of a dataview designed to locate duplicate machines within ConnectWise Automate. It explains the importance of identifying duplicates, particularly in relation to licensing issues, and outlines the limitations regarding serial number retrieval from various manufacturers.'
tags: ['database', 'report', 'software']
draft: false
unlisted: false
---

## Summary

The purpose of the dataview is to locate duplicate machines within Automate. These are usually machines where the agent was reinstalled, and the old agent was never cleared out of Automate. Duplicate machines can pose issues for licensing, as well as introducing unnecessary confusion and complexity to the environment.

**Note:** This dataview specifically references the `biosver` column in the computers table. This is where Automate attempts to store the serial number or service tag of the machine. If the manufacturer of the machine does not include a proper service tag or serial number, this dataview will not work. For example, all Supermicro machines use `123456789` as their serial number. This may also be the case with any "home-built" machines. Automate is not 100% effective at gathering the serial number or asset tags. Virtual machines are excluded as well.

## Columns

| Column           | Description                                         |
|------------------|-----------------------------------------------------|
| Count            | Displays the count of the duplicate machines        |
| Computer Ids     | Displays the IDs of the duplicate machines          |
| Client Name      | Displays the client name of the duplicate machines   |
| Computer Names   | Displays the computer name of the duplicate machines |
| Manufacturer     | Displays the manufacturer of the duplicate machines  |
| Serial Numbers   | Displays the serial number of the duplicate machines  |
| Mac Addresses    | Displays the MAC address of the duplicate machines   |
| Last Contacts    | Displays the last contact of the duplicate machines  |
