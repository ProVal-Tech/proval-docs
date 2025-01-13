---
id: 'ps-basic-detection-brute-force-attack'
title: 'Basic Detection of a Brute Force Attack on an Endpoint'
title_meta: 'Basic Detection of a Brute Force Attack on an Endpoint'
keywords: ['brute', 'force', 'attack', 'endpoint', 'security', 'log', 'failures', 'threshold', 'events']
description: 'This document outlines a script designed to detect brute force attacks on an endpoint by monitoring login failures in the security log. The script can be scheduled to run periodically, checking for failed login attempts and alerting if the count exceeds a specified threshold. It also supports outputting the results to a file in various formats.'
tags: ['security', 'configuration', 'windows', 'report', 'notification']
draft: true
unlisted: true
---
## Overview

Basic detection of a brute force attack on an endpoint

## Requirements

This script should be scheduled to run re-occurringly on an endpoint.

## Process

1. Sets up a history so it remembers its last run date
2. Queries the security log for any log in failures since its last run
3. Determines if output is going to a file, if so output the found items to the desired file and file type
4. Counts how many failed logins are found
5. If the count is higher than the threshold it returns true, otherwise false

How does the content operate and accomplish the goal?

## Payload Usage

```
Test-BruteForceAttack.ps1 -Threshold 25
```
Queries the event log from the last time it ran to the current time, counts the instances of failed logins and alerts if over 25.

```
Test-BruteForceAttack.ps1 -Threshold 25 -outfile "C:\temp\test.csv"
```
Queries the event log from the last time it ran to the current time, counts the instances of failed logins and alerts if over 25, and outputs the found events to a csv.

### Parameters

| Parameter     | Alias | Required | Default | Type   | Description                                                                                                                                                                                                 |
|---------------|-------|----------|---------|--------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `-Threshold`  |       | False    | 25      | Int    | This designates the threshold of found items; if the amount of found failed login events is greater than the threshold value, it triggers a true response; otherwise, it will trigger false.               |
| `-OutFile`    |       | False    |         | String | This designates that an output of the found failed login items should be sent to a file. The default file type is .json, but the script accepts file types of .txt, .xml, .csv, and .json file exports. |

## Output

If `-Outfile` is not provided - Boolean  
If `-Outfile` is provided - Boolean and file.  
`.\\Test-BruteForceAttack.ps1-log.txt`

## Locations

| Payload                      | /repo/scripts/Test-BruteForceAttack.ps1 |
|------------------------------|------------------------------------------|
| Automate                     |                                          |
| ConnectWise RMM              |                                          |
| Kaseya                       |                                          |
| Datto RMM                    |                                          |



