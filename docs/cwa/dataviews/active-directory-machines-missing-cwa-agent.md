---
id: '68f531ba-4488-4fe6-9652-06b749aa196a'
slug: /68f531ba-4488-4fe6-9652-06b749aa196a
title: 'Active Directory - Machines Missing CWA Agent'
title_meta: 'Active Directory - Machines Missing CWA Agent'
keywords: ['active-directory', 'automate', 'dataview', 'onboarding', 'clients', 'machines']
description: 'This document outlines a Dataview that identifies machines within the Active Directory integration that do not have an associated Automate agent. It is designed to assist during the onboarding process and to ensure that no agents are missing for clients. The Dataview pulls data from the Active Directory Plugin, which retrieves information directly from Domain Controllers in client environments, with a 7-day data limit.'
tags: ['active-directory', 'setup']
draft: false
unlisted: false
---

## Summary

This document displays any machines found within the Active Directory integration that do not have an associated Automate agent applied to them. It is intended to assist during onboarding and to verify that no agents are missing for clients.

The Dataview pulls data from the Active Directory Plugin, which retrieves information directly from the Domain Controllers in end-client environments. There is a 7-day limit built into the Dataview; if a machine hasn't checked into Active Directory within 7 days, it will not appear in this Dataview.

## Dependencies

The Active Directory plugin must be installed and configured properly to detect machines. The Dataview uses the following plugins to fetch data:

- plugin_ad_entries
- plugin_ad_computers
- plugin_ad_domains

## Columns

| Column                     | Description                                         |
|---------------------------|-----------------------------------------------------|
| Client                    | Displays the name of the client                     |
| Location                  | Displays the name of the location                   |
| DomainName                | Displays the name of the domain                     |
| Domain Controller         | Displays the name of the Domain Controller          |
| Computer Missing from LT  | Displays the name of the computer that is missing in Automate |
| OS                        | Displays the OS installed on the machine            |
| Description               | Displays the description of the machine, if available |
| Created                   | Displays the creation date and time                 |
| Last Logon                | Displays the last login date and time               |