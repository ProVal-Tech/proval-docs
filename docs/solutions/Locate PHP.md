---
id: 'cwa-locate-php-exe'
title: 'Locate PHP.exe on Computers'
title_meta: 'Locate PHP.exe on Computers'
keywords: ['php', 'file', 'monitor', 'audit', 'script', 'data']
description: 'This document outlines the steps to identify computers with the PHP.exe file available, including associated scripts and monitors for effective auditing and data management.'
tags: ['script', 'monitor', 'audit', 'data', 'configuration']
draft: false
unlisted: false
---
## Purpose

The goal of the solution is to identify the computers that have the PHP.exe file available.

## Associated Content

| Content                                                                 | Type           | Function        |
|-------------------------------------------------------------------------|----------------|-----------------|
| [Script - Locate PHP.exe](https://proval.itglue.com/DOC-5078775-16245023)   | Script         | Fetches data.   |
| [Custom Table - pvl_php_audit](https://proval.itglue.com/DOC-5078775-16245130) | Custom Table   | Stores data.    |
| [Dataview - PHP.exe File Location](https://proval.itglue.com/DOC-5078775-16192867) | Dataview       | Displays data.  |
| [Internal Monitor - Execute Script - Locate PHP.exe](https://proval.itglue.com/DOC-5078775-16245108) | Internal Monitor | Detects computers. |
| △ Custom - Execute Script - Find PHP.exe                                  | Alert Template | Executes script. |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - Locate PHP.exe](https://proval.itglue.com/DOC-5078775-16245023)
   - [Custom Table - pvl_php_audit](https://proval.itglue.com/DOC-5078775-16245130)
   - [Dataview - PHP.exe File Location](https://proval.itglue.com/DOC-5078775-16192867)
   - [Internal Monitor - Execute Script - Locate PHP.exe](https://proval.itglue.com/DOC-5078775-16245108)
   - Alert Template - △ Custom - Execute Script - Find PHP.exe

2. Reload the system cache:
   ![Reload Cache](5078775/docs/16203072/images/23701777)

3. Run the script with the `Set_Environment` parameter set to `1` after to create the [custom table](https://proval.itglue.com/DOC-5078775-16245130) and the EDF being used by the script.
   ![Run Script](5078775/docs/16203072/images/23894177)

4. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and setup the following:
     - [Internal Monitor - Execute Script - Locate PHP.exe](https://proval.itglue.com/DOC-5078775-16245108)
       - `△ Custom - Execute Script - Find PHP.exe`
       - Right-click and Run Now to start the monitor

5. Mark the `Find PHP.exe` EDF on the clients you would like to audit the information on.
   ![Mark EDF](5078775/docs/16203072/images/23894288)

