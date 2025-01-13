---
id: 'cwa-active-directory-missing-agents'
title: 'Active Directory Machines Missing Automate Agents'
title_meta: 'Active Directory Machines Missing Automate Agents'
keywords: ['active-directory', 'automate', 'dataview', 'onboarding', 'clients', 'machines']
description: 'This document outlines a Dataview that identifies machines within the Active Directory integration that do not have an associated Automate agent. It is designed to assist during the onboarding process and to ensure that no agents are missing for clients. The Dataview pulls data from the Active Directory Plugin, which retrieves information directly from Domain Controllers in client environments, with a 7-day data limit.'
tags: ['active-directory', 'dataview', 'clients', 'machines', 'setup']
draft: false
unlisted: false
---
## Summary

Display any machines found within the Active Directory integration that does not have an associated Automate agent applied to them. Ideally to help during onboarding and to double-check a client and make sure no agents are missing.  
This Dataview pulls from the Active Directory Plugin. The data inside of this plugin is pulled directly from the Domain Controllers in end-client environments. There is a 7-day limit built into the Dataview, so if a machine hasn't checked into AD within 7 days it will not show in this Dataview.  

## Dependencies

The active directory plugin must be installed and configured properly to detect machines. The Dataview uses the following plugins to fetch data:

- plugin_ad_entries
- plugin_ad_computers
- plugin_ad_domains

## Columns

| Column                     | Description                                         |
|---------------------------|-----------------------------------------------------|
| Client                    | Displays the name of the client                     |
| Location                  | Displays the name of the location                   |
| DomainName                | Displays the name of the domain                     |
| Domain Controller          | Display the name of the Domain Controller           |
| Computer Missing from LT  | Displays the name of the computer which is missing in Automate |
| OS                        | Display the OS installed on the machine             |
| Description               | Displays the Description of the machine if anything is there |
| Created                   | Displays the creation date and time                 |
| Last logon               | Displays the Last Login date and time               |



