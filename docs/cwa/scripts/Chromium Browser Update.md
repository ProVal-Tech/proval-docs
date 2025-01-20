---
id: 'a17a9537-62ae-43f8-8212-dbac0a328ca0'
title: 'Update Chromium Based Browsers'
title_meta: 'Update Chromium Based Browsers - Script for Automating Updates'
keywords: ['chromium', 'update', 'browser', 'ticketing', 'automation']
description: 'This document provides a script designed to automate the update process for Chromium-based browsers including Google Chrome, Microsoft Edge, Brave, and Opera. The script can optionally create tickets for failures, enhancing maintenance workflows.'
tags: ['software', 'ticketing', 'update', 'windows']
draft: false
unlisted: false
---
## Summary

Primary use to address recent Chromium CVE

Script will execute the same update command as used in Windows Task Scheduler to update the following Chromium based browsers:

- Google Chrome
- Microsoft Edge
- Brave
- Opera

Ticketing is optional if global parameter is set to a ticket category above 0.

## Sample Run

![Sample Run](../../../static/img/Chromium-Browser-Update/image_1.png)

## Dependencies

Suggested for use as an Autofix - [CWM - Software - Monitor - ProVal - Chromium Browser Outdated [G]](<../monitors/ProVal - Chromium Browser Outdated G.md>)

#### Global Parameters

| Name                    | Example | Required | Description                                                             |
|-------------------------|---------|----------|-------------------------------------------------------------------------|
| ticketcreationcategory   | 123     | True     | Defaults to 0, if set above will trigger ticket creation on script failure |

## Process

Gathers the current Max version for the noted browsers.

Executes the same command as Windows Task Scheduler to update the browser.  
ex. - *"C:/Program Files (x86)/Microsoft/EdgeUpdate/MicrosoftEdgeUpdate.exe" /ua /installsource scheduler*

Resends software to Automate server and performs basic checking for new version number and optional ticketing for failures.

## Output

- Script log
- Optional - Ticketing












