---
id: 'cwa-memory-threshold-violation-monitor'
title: 'Memory Threshold Violation Monitor'
title_meta: 'Memory Threshold Violation Monitor'
keywords: ['memory', 'monitor', 'threshold', 'windows', 'performance']
description: 'This document outlines the configuration and details of a remote monitor designed to track memory usage on Windows machines, employing specific thresholds for alerting based on memory utilization metrics. It provides insights into the choice of performance counters and includes ticketing templates for automated alerts.'
tags: ['monitoring', 'threshold', 'windows', 'performance', 'alert', 'notification']
draft: false
unlisted: false
---
## Summary

This remote monitor uses a high threshold ($th) and a low threshold ($tl). The low threshold will only be used when the high threshold has been previously triggered.

Default high threshold: 90%  
Default low threshold: 75%

Warning Stage represents the PowerShell errors.

**NOTE:** The remote monitor employs the "\Memory\% Committed Bytes In Use" performance counter, while it should be noted that the default monitor set in Automate utilizes the "Memory\Available MBytes" performance counter.

The choice between "\Memory\Available MBytes" and "\Memory\% Committed Bytes In Use" as a performance counter for memory monitoring depends on your specific monitoring goals and what aspect of memory usage you want to track. Here's a brief explanation of both counters:

1. "\Memory\Available MBytes":  
   - This counter measures the amount of physical memory (RAM) available, in megabytes, at a given moment. It represents the memory that the operating system can allocate to applications without causing excessive paging (swapping data to disk).  
   - Useful when you want to monitor the immediate availability of free memory for applications to use.  
   - Includes the memory allocated by idle processes as well that can be released to accommodate new processes.

2. "\Memory\% Committed Bytes In Use":  
   - This counter represents the percentage of the total virtual address space that is currently committed to physical memory. In simpler terms, it shows how much of the memory allocated for running processes is in use.  
   - Useful when you want to monitor the overall system memory load and understand how much of the allocated memory is currently in use.  
   - Monitoring this counter can help you gauge memory utilization across all running processes and detect potential memory bottlenecks.  
   - Excludes the memory allocated by idle processes that can be released to accommodate new processes.

- If you want to keep an eye on the available physical memory to ensure that your applications have enough memory to operate smoothly, "\Memory\Available MBytes" is a suitable choice.
- If you're interested in understanding the overall memory utilization of your system and identifying situations where memory is being highly committed, then "\Memory\% Committed Bytes In Use" is more appropriate.

## Details

**Suggested "Limit to"**: Windows Machines  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: △ Custom - Ticket Creation - Computer  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 127.0.0.1      | Run File   | **REDACTED**  | State Based | 600      | ![Result](..\..\..\static\img\Memory-Threshold-Violation-Monitor\image_1.png) |

## Target

Windows Machines - Should be run on all Windows machines

## Ticketing

**Subject:** ` Memory Usage High on %Computername% at %locationname%`

**Success Body**:  
```  
This is an automated update to inform you that the high Memory utilization issue reported earlier has now been resolved. The system has detected that the Memory usage has returned to normal and the performance has improved.  
```

**Failure Body:**  
```  
The machine %computername% at %clientname%\%locationname% has exceeded the memory threshold. Please investigate the root cause and take corrective actions as soon as possible. This is a high-priority issue that may affect the performance and availability of the system. Note that the total memory usage may not match the memory used by the top 5 processes, because the total memory usage includes the cached pool and the memory used by the system as well.  
```
%RESULT%

**Sample %RESULT%:**  
```
Total Memory Usage: 70.7%
```

**Top 5 Processes utilizing Memory:**  
```
Process                MemoryUsage
-------                -----------
mysqld                 18.72
w3wp                   15.75
svchost                7.98
ScreenConnect.Service   4.91
chrome                 4.55
```

**Sample Ticket:**  
![Sample Ticket](..\..\..\static\img\Memory-Threshold-Violation-Monitor\image_2.png)

## How to Import

[Import - Remote Monitor - Memory Threshold Violation Monitor](https://proval.itglue.com/DOC-5078775-13276991)



