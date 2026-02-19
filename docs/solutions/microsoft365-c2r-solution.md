---
id: 'f8deaddc-02c1-492d-b9dc-381a653de0e5'
slug: /f8deaddc-02c1-492d-b9dc-381a653de0e5
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
|[Office C2R Update Schedule Select](/docs/401a54a-5bff-4d37-8fdf-001220f73fb5) | Script | To set teh channel |
|[Office C2R Update Channel Status] | script | To fetch the data |
|[Office C2R Update Schedule Select] | Script | To set teh channel |
|[Office C2R Automatic Update Repair] | Script | To reapair the microsoft365 |
|[Office C2R Update] | script | To update the office

## Implementation

Check the above details for the implemtation.


## FAQ

<!-- Add frequently asked questions here -->

1. Can I have executed the script without mapping the ps1?

A. No we always need to map it into the agent procedure.

2. Do I need to use all the above script to repair the microsoft365 c2r?

A. No, you only need to execute the 'Office C2R Automatic Update Repair' script in this situation.