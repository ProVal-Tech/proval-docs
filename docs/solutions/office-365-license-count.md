---
id: 'bc6fad19-065a-4960-8a41-65bd2a8ecdbe'
slug: /bc6fad19-065a-4960-8a41-65bd2a8ecdbe
title: 'Office 365 License Count'
title_meta: 'Office 365 License Count'
keywords: ['office365','license','count']
description: 'The solution aims to fetch and display the Office 365 License Counts for the client.'
tags:  ['office365','update','windows','software']
draft: false
unlisted: false
---

## Purpose

The solution aims to fetch and display the Office 365 License Counts for the client.

## Associated Content

| Content                                              | Type             | Function                                                                   |
| ---------------------------------------------------- | ---------------- | -------------------------------------------------------------------------- |
| [Office 365 License Count](/docs/e79c314d-8d1c-4ca0-a0b3-2a495a232d2b) | Script           | Fetches the data                                                           |
| [pvl_m365_license_count](/docs/8fe2a7a7-4456-4221-80e5-3fb4f2fdb615)    | Custom Table     | Stores the data                                                            |
| [Office 365 License Count](/docs/9d5f0626-7fed-46e4-99e9-e9ee17e1ad2d)    | Dataview         | Displays the data                                                          |
| [Execute Script – Office 365 License Count](/docs/4b0f8e3f-0efe-49b5-a81b-a617d5940833) | Internal Monitor | Detects computers to execute the script                                    |
| △ Custom – Execute Script – Office 365 License Count | Alert Template   | Executes the script against the computers detected by the internal monitor |


## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - Office 365 License Count](/docs/e79c314d-8d1c-4ca0-a0b3-2a495a232d2b) 
   - [Dataview - Office 365 License Count](/docs/9d5f0626-7fed-46e4-99e9-e9ee17e1ad2d)  
   - [Internal Monitor - Execute Script – Office 365 License Count](/docs/4b0f8e3f-0efe-49b5-a81b-a617d5940833) 
   - △ Custom – Execute Script – Office 365 License Count 

2. Reload the system cache:  
   ![Reload Cache](../../static/img/docs/69ac0a53-e25a-4e16-b266-b174acf20b3f/image_24.webp)

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Execute Script – Office 365 License Count](/docs/4b0f8e3f-0efe-49b5-a81b-a617d5940833)
       - Set up with the alert template `△ Custom – Execute Script – Office 365 License Count`
       - Right-click and select "Run Now" to start the monitor.