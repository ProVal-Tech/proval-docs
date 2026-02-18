---
id: 'New GUID'
slug: /New GUID
title: 'Microsoft365 Click-to-Run Solution'
title_meta: 'Microsoft365 Click-to-Run Solutionme'
keywords: ['repair','c2r','office','update','channel']
description: 'This solution is used to get the Microsoft365 channel details, set the office channel update repair the office and update office the c2r.'
tags: ['office', 'office365', 'microsoft365', 'update']
draft: false
unlisted: false
---

## Purpose

The purpose is to get the office channel details, update and repair the c2r and set the channel on the machine.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| Link to the documentation of the content piece      | What is the type of content? (Script, Custom Table, VSA Policy, CWM Dataview, etc.) | What does this content piece do in the overall solution? |
|[Office C2R Update Channel Status](/docs/bf426f89-7da1-4f4b-88b7-03983136458c) | script | To fetch the data |
|[Office C2R Update Schedule Select](/docs/401a54a-5bff-4d37-8fdf-001220f73fb5) | Script | To set teh channel |
|[Office C2R Automatic Update Repair](/docs/c0c1b5a3-0e2d-4ed9-9c0a-926ce2181c7c) | Script | To reapair the microsoft365 |
|[Office C2R Update](/docs/ddcdb6e8-8ce6-4c38-b494-1284f0fc6fd8) | script | To update the office

## Implementation

Check the above details for the implemtation.


## FAQ

<!-- Add frequently asked questions here -->

1. Can I have executed the script without mapping the ps1?

A. No we always need to map it into the agent procedure.

2. Do I need to use all the above script to repair the microsoft365 c2r?

A. No, you only need to execute the 'Office C2R Automatic Update Repair' script in this situation.