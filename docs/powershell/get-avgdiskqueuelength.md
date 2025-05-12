---
id: '662544c5-360c-4348-9e8f-a95b5bb4efd9'
slug: /662544c5-360c-4348-9e8f-a95b5bb4efd9
title: 'Get-AvgDiskQueueLength'
title_meta: 'Get-AvgDiskQueueLength'
keywords: ['disk', 'queue', 'length', 'performance']
description: 'Documentation for the Get-AvgDiskQueueLength command to calculate and return the average of X numbers of Average Disk Queue Length using the performance counter.'
tags: ['performance', 'report', 'windows']
draft: false
unlisted: false
---

## Description
This script calculates and returns the average of X numbers of Average Disk Queue Length using the performance counter `\PhysicalDisk(_total)\Avg. Disk Queue Length`.

## Usage
1. **Parameter Setup**: 
   - Accepts an optional parameter `$Samples` (default is 3) to specify the number of samples for averaging.

2. **Environment Preparation**:
   - Sets `ProgressPreference` to 'SilentlyContinue'.
   - Configures the security protocol for HTTPS.
   - Installs or updates the `Strapper` module from the PSGallery.

3. **Sample Retrieval**:
   - Defines the table name `AvgDiskQueueLength`.
   - Retrieves existing samples from the table.
   - Attempts to collect a new sample using the performance counter `\PhysicalDisk(_total)\Avg. Disk Queue Length`.

4. **Data Aggregation**:
   - Converts the current and previous samples into a list of objects containing `Timestamp` and `Reading`.

5. **Sample Storage**:
   - Stores the current samples in the table, overwriting existing data if necessary.

6. **Average Calculation**:
   - If the number of samples meets or exceeds the specified `$Samples`, calculates the average disk queue length.
   - Constructs a custom object containing sample count, timestamps, time interval, average disk queue length, and count of fixed disks.

7. **Logging and Output**:
   - Logs the results if the required number of samples is collected.
   - Returns the custom object with the calculated data.
   - Logs a message if the required number of samples is not available, without returning any result.

This example runs the script to calculate the average of the last 5 samples of the Average Disk Queue Length.

```powershell
.\Get-AvgDiskQueueLength.ps1 -Samples 5
```

## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                                                   |
| ----------------- | ----- | --------- | --------- | --------- | ------------------------------------------------------------- |
| `Samples`         |       | False     | 3         | Int32     | Specifies the number of samples to calculate the average for. |

## Output
- `.\Get-AvgDiskQueueLength-log.txt`
- `.\Get-AvgDiskQueueLength-Error.txt`