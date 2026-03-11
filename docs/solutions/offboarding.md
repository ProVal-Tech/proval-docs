---
id: 'cb9ba98d-9a64-4003-b7d5-a7a18192f161'
slug: /cb9ba98d-9a64-4003-b7d5-a7a18192f161
title: 'Offboarding'
title_meta: 'Offboarding'
keywords: ['offboarding', 'monitor', 'scripts', 'automation', 'configuration']
description: 'This document outlines the implementation of an offboarding process tailored to client requirements, detailing associated scripts, templates, and monitors necessary for effective execution. It provides step-by-step instructions for importing and configuring the relevant components using the ProSync plugin.'
tags: []
draft: false
unlisted: false
last_update:
  date: 2026-02-17
---

## Purpose

The purpose of this solution is to facilitate the Offboarding process as per the client's requirements.

## Associated Content

| Content                                                                 | Type            | Function                                                                                                                                                                                                                                        |
|-------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Offboarding Wrapper](/docs/1fef1360-cfd3-4a3f-8444-207c09fb5a78) | Script          | This is a wrapper script that can be used to offboard machines from the client's environment by defining the scripts to be run before offboarding the machine.                                                                                 |
| [Offboarding Scripts - Partner [Template]](/docs/c74040d5-4fbb-487f-bb4f-b19696daab1c) | Template Script  | Template script to be used with [Script - Offboarding Wrapper](/docs/1fef1360-cfd3-4a3f-8444-207c09fb5a78) to run Child scripts. This script needs to be duplicated and modified as per the client's requirements.               |
| [Offboarding](/docs/5721d83a-3303-4dc2-97ca-118683da0690) | Internal Monitor | The purpose of this monitor is to detect the clients, locations, or machines opted for offboarding.                                                                                                                                           |
| `△ Custom - Execute Script - Offboarding Wrapper`                       | Alert Template   | Executes the script [Offboarding Wrapper](/docs/1fef1360-cfd3-4a3f-8444-207c09fb5a78) against the computers detected in the monitor set [Offboarding](/docs/5721d83a-3303-4dc2-97ca-118683da0690). |

## Implementation

1. Import the following script using the ProSync plugin:
   - [Offboarding Wrapper](/docs/1fef1360-cfd3-4a3f-8444-207c09fb5a78)

2. Import the following monitor using the ProSync plugin:
   - [Offboarding](/docs/5721d83a-3303-4dc2-97ca-118683da0690)

3. Import the following Alert Template using the ProSync plugin:
   - `△ Custom - Execute Script - Offboarding Wrapper`

4. Reload the System Cache  
   ![Reload Cache](../../static/img/docs/5721d83a-3303-4dc2-97ca-118683da0690/image_4.webp)

5. Configure the solution as follows:
   - Go to Automation → Scripts → View Scripts → 'ProVal/Client Specific' folder
     - Duplicate [Script - Offboarding Scripts - Partner [Template]](/docs/c74040d5-4fbb-487f-bb4f-b19696daab1c)
       - Update the duplicated script as per the client's requirements as defined in [Offboarding Scripts - Partner [Template]](/docs/c74040d5-4fbb-487f-bb4f-b19696daab1c).
     - Under 'ProVal/Automate' - Open the [Script - Offboarding Wrapper](/docs/1fef1360-cfd3-4a3f-8444-207c09fb5a78)
     - Update the script to use this updated script instead of the template one.
   - Ask the consultant if the client would like to set up a 'Failed Uninstall Process'.
     - If yes, select the required process from Dropdown EDF `"Failed Uninstall Process"`. For more details on this EDF, visit [Offboarding Wrapper](/docs/1fef1360-cfd3-4a3f-8444-207c09fb5a78) script.
   - Navigate to Automation → Monitors within the CWA Control Center.
     - [Offboarding](/docs/5721d83a-3303-4dc2-97ca-118683da0690)
       - Configure with the alert template: `△ Custom - Execute Script - Offboarding Wrapper`
       - Right-click and Run Now to start the monitor.
   - The following EDFs can be selected to offboard a client, location, or machine. These EDFs are described in detail in [Script - Offboarding Wrapper](/docs/1fef1360-cfd3-4a3f-8444-207c09fb5a78).
     - Offboard Client
     - Offboard Location
     - Offboard Computer

## Changelog

### 2025-04-10

- Initial version of the document
