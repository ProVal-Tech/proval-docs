---
id: '5cba460d-9322-4c3b-9630-55cb46d57b1a'
slug: /5cba460d-9322-4c3b-9630-55cb46d57b1a
title: 'Get-DiskInfo'
title_meta: 'Get-DiskInfo'
keywords: ['disk', 'info', 'performance', 'health']
description: 'Documentation for the Get-DiskInfo command to return detailed information about all individual drives, including performance and logical drive levels.'
tags: ['performance', 'windows']
draft: false
unlisted: false
---

## Description
Get-CriticalDiskInfo was not working reliably due to a non-standard in SMART reporting on hard drives. We needed to find a way to alert on bad hard drives that doesn't rely on Crystal Disk Info. Get-DiskInfo will return all individual drive information down to the performance and even logical drive levels.

## Requirements
PowerShell V.5

## Usage
1. Creates the returned object.
2. Grabs partition and disk information.
3. Cycles through each partition:
    1. Gets all associated logical drives and cycles through them for that partition.
    2. Creates the partition logical drive and raw performance objects for that partition.
    3. Creates the partition object.
4. Cycles through the drives:
    1. Creates the drive object.
    2. Adds the appropriate partition object to the drive object.
5. Returns all found items.

```powershell
.\Get-DiskInfo.ps1
```
Returns all data for all disks, their partitions, and any logical disks assigned to those partitions on the computer.

## Use Case

**Example: Failing Hard Drive Test**

Run this script twice.
- RawPerformanceData.AvgDiskQueueLength(2nd run) - RawPerformanceData.AvgDiskQueueLength(1st run) / RawPerformanceData.Timestamp_Sys100NS(2nd run) - RawPerformanceData.Timestamp_Sys100NS(1st run)
    - Ideally under 2; if 2 or more for a prolonged time, a bottleneck is found.
- RawPerformanceData.PercentIdleTime (same formula)
    - Higher is better.
- RawPerformanceData.AvgDisksecPerRead (same formula)
    - If you can get a baseline for this, you can compare it over time.
- RawPerformanceData.AvgDisksecPerWrite (same formula)
    - Same as above.
- RawPerformanceData.DiskReadsPersec (same formula)
    - Rather high values usually mean that there are queries, new or old, that are missing indexes and are reading more data than required.
- RawPerformanceData.DiskWritesPersec (same formula)
    - Same as above.
- RawPerformanceData.AvgDiskReadQueueLength (same formula).

**Example Output:**
```
Total disk latency: 42 ms (0.042 seconds is equal to 42 milliseconds)
Idle Time: 87.5204598922
Read latency: 5 ms
Write latency: 80 ms
Current disk queue: 48
Write queue: 45
Read queue: 2.7
```

**Interpretation:**
These results show that the disk is clearly a bottleneck and underperforming for the workload. Both the write latency and write queue are very high. If this were a real environment, we would be digging deeper into the storage to see where the issue is. It could be that there's a problem on the storage side (like a bad drive or a misconfiguration), or that the storage is simply too slow to handle the workload. Generally speaking, the performance tests can be interpreted with the following:

- Disk latency should be below 15 ms. Disk latency above 25 ms can cause noticeable performance issues.
- Latency above 50 ms is indicative of extremely underperforming storage.
- Disk queues should be no greater than twice the number of physical disks serving the drive. For example, if the underlying storage is a 6-disk RAID 5 array, the total disk queue should be 12 or less.
- For storage that isn't mapped directly to an array (such as in a private cloud or in Azure), queues should be below 10 or so.
- Queue length isn't directly indicative of performance issues but can help lead to that conclusion.
- These are general rules and may not apply in every scenario; however, if you see the counters exceeding the thresholds above, it warrants a deeper investigation.

## Output
Location of output for log, result, and error files.

```
[system.object]
```


