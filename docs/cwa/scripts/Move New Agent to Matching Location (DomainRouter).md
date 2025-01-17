---
id: 'f04ef005-9203-4967-9bcc-11457c91d2dc'
title: 'Move Unassigned Computers to Matching Locations'
title_meta: 'Move Unassigned Computers to Matching Locations'
keywords: ['computers', 'location', 'domain', 'router', 'automation']
description: 'This document describes a script that automates the process of moving new or unassigned computers from Location ID 1 to their appropriate locations based on matching domain or router addresses, saving time and improving efficiency.'
tags: ['networking', 'performance', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

This script will move the new/unassigned computers from Location ID 1 to the matching locations based on their domain or router address.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Move-New-Agent-to-Matching-Location-(DomainRouter)/image_1.png)

## Variables

#### Global Parameters

| Name            | Example | Required | Description                                                                                                                                                                                                                     |
|-----------------|---------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ObjectThreshold  | 3       | True     | This is the threshold (number of computers in a location) that the script will check before marking it as a possible location.   **Example:**  If a target computer has a domain of `TEST.local`  LocationID 4 has three computers with the domain `TEST.local`. It is ignored.  LocationID 124 has seven computers with the domain `TEST.local`. It is marked as a possible domain to move the computer to. |

## Process

- The script will run on the machines which have LocationID=1.
- The script will fetch all the existing domains and will try to match them with the domain of the target computer.
- The script will accordingly move the machine to a location based on the matching domain.
- If no match is found, the script will look for any matching Router address for the computer.
- Accordingly, it will move the computer to a location based on the matching router address.
- The script will fail if none of the above conditions are met.

## Output

- Script Log.











