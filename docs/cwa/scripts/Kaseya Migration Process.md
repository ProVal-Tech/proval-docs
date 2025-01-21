---
id: 'de4bfced-9152-46ca-ae22-853f9aa756f8'
title: 'Migrate Automate Agent to Kaseya Group ID'
title_meta: 'Migrate Automate Agent to Kaseya Group ID'
keywords: ['migrate', 'agent', 'kaseya', 'automate', 'migration']
description: 'This document outlines a script used for migrating an Automate agent to the respective Kaseya Group ID. It includes details on dependencies, process, and expected outputs, ensuring a smooth transition from CWA to Kaseya.'
tags: ['kaseya']
draft: false
unlisted: false
---

## Summary

This document describes a script used to migrate an Automate agent to the respective Kaseya Group ID. This should be used for migrations from CWA to Kaseya. 

Note that this requires configuration outside of Automate in Kaseya and Bitbucket, so please review with an escalation point if you do not have access.

**Time Saved by Automation:** 10 Minutes

## Sample Run

**Target:** Windows Agent  
![Image](../../../static/img/Kaseya-Migration-Process/image_1.png)

## Dependencies

- A generic installer file for the target Kaseya instance must be uploaded to Bitbucket and copied to the LTShare in the `/Transfer/Software` directory.  
- Note: Lines 6 and 8 are disabled to remind you to complete this step before implementing the script.  
- All Group IDs must be created in Kaseya before running the script.  
- `@vsa-clientname.exe`

## Variables

- `@concatArg@`: This variable is used to generate a Kaseya-style container name to ensure fields will map between both environments. Example: ProValTech.LocationName

## Process

The script will attempt to download the agent installer from the ProVal repository. If the download fails, it will attempt to download from the Automate server LTShare. The `@vsa-clientname.exe` performs most of the tasks. Please review the executable document for more details on the process.

## Output

The script logs the output status (fail/success) in Automate.
