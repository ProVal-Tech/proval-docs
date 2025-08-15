---
id: '08281245-9380-4946-b1a6-099aebfffd6f'
slug: /08281245-9380-4946-b1a6-099aebfffd6f
title: 'New SQL Updates'
title_meta: 'New SQL Updates'
keywords: ['sql', 'sql-server', 'sql-server-patching']
description: 'This solution automates the detection of new SQL-related Windows Updates on SQL servers and generates tickets in CW RMM for the updates found since the last script execution.'
tags: ['auditing', 'mssql', 'patching']
draft: false
unlisted: false
---

## Purpose

This solution automates the detection of new SQL-related Windows Updates on SQL servers and generates tickets in CW RMM for the updates found since the last script execution.

## Associated Content

### Group

| Name        | Purpose                                       |
|-------------|-----------------------------------------------|
| [SQL Servers](/docs/85ffcde0-01c8-4e6b-8c08-51371f80ae9c) | Dynamic group that targets Microsoft SQL Servers |

### Task

| Name        | Purpose                                       |
|-------------|-----------------------------------------------|
| [Get New SQL Updates](/docs/3b44e58d-1764-414b-94fd-05fedddd511d) | Audits and reports on new SQL-related Windows Updates since the last script run. |

## Implementation

### Step 1: Create the Dynamic Group

Set up the [SQL Servers](/docs/85ffcde0-01c8-4e6b-8c08-51371f80ae9c) group under `ENDPOINTS → Groups` as a dynamic group to automatically include all Microsoft SQL Servers.

### Step 2: Create the Task

Add the [Get New SQL Updates](/docs/3b44e58d-1764-414b-94fd-05fedddd511d) task under `AUTOMATION → Tasks`.

### Step 3: Schedule the Task

Configure the task to run daily, following the instructions in the [Schedule Task](/docs/3b44e58d-1764-414b-94fd-05fedddd511d#schedule-task) section of the script documentation.

## FAQ

**Q: What does the "SQL Servers" group include?**  
A: The "SQL Servers" dynamic group automatically identifies Windows servers running a service with a display name containing "SQL Server".

**Q: What does the "Get New SQL Updates" task do?**  
A: The task audits and reports on new SQL-related Windows Updates detected since the last time the script was run. It generates a single ticket in CW RMM containing detailed information about all SQL-related updates found during the scan.

**Q: How often should the task be scheduled?**  
A: The recommended schedule is once per day to ensure timely detection and reporting of new SQL-related updates.

**Q: What happens on the first run of the script?**  
A: On its initial execution, the script checks for SQL-related updates released within the past 90 days.

**Q: What are the prerequisites for running the script?**  
A: The script requires PowerShell 5 or higher on the target SQL servers.
