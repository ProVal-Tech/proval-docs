---
id: 'bf20a303-f1b6-427a-a5cc-371de6104e98'
title: 'Import Custom Backgrounds to Microsoft Teams'
title_meta: 'Import Custom Backgrounds to Microsoft Teams'
keywords: ['microsoft', 'teams', 'backgrounds', 'zip', 'images']
description: 'This document outlines the process for importing custom backgrounds into Microsoft Teams using a ZIP file containing supported image formats. It includes implementation steps, dependencies, and the overall process to ensure successful background uploads for active users.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes how to import custom backgrounds to Microsoft Teams using a provided ZIP file.

## Implementation

Export the agent procedure.  
**Name:** Microsoft - Teams - Import - Background

![Image 1](../../../static/img/Microsoft---Teams---Import---Background/image_1.png)  
![Image 2](../../../static/img/Microsoft---Teams---Import---Background/image_2.png)  

The agent procedure requires a ZIP file containing the backgrounds.  
The ZIP file can contain multiple images.  
The following image formats are supported: **('jpeg', 'jpg', 'png', 'bmp')**

![Image 3](../../../static/img/Microsoft---Teams---Import---Background/image_3.png)  

If the selected file is "background.zip," no further changes are required.  
If a different file has been specified, update the filename in the PowerShell execution.  
Modify **background.zip** to the name of the ZIP file you selected in the previous step.  

![Image 4](../../../static/img/Microsoft---Teams---Import---Background/image_4.png)  

## Dependencies

- Managed File (Import-TeamsBackground.PS1)
- Managed File (background.zip)

## Process

- Deploy the ZIP file and Import-TeamsBackground.ps1 to the endpoint.
- Check if Teams is installed and retrieve the list of active users' information
  - Get the user profile path from the user's SID for each active user
    - Create the Backgrounds and Uploads folders for each active user
      - Extract images from the ZIP file
        - Remove the temporary directories if they exist
        - Create the temporary directories
          - Extract images from the ZIP file to the temporary directory
            - Rename JPEG, JPG, PNG, and BMP files with Teams GUID
            - Create a _thumb copy of each image
              - Copy renamed images to active users' Teams Backgrounds directories

## Output

Agent Procedure Log Entry & vAgentConfiguration.agentTempSecureDir/Import-TeamsBackground-log.txt

