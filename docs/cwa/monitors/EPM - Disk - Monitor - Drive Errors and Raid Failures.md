---
id: 'cwa_drive-monitoring'
title: 'Drive Monitoring and RAID Failure Detection'
title_meta: 'Drive Monitoring and RAID Failure Detection'
keywords: ['monitoring', 'raid', 'errors', 'windows', 'event', 'logs']
description: 'This document provides a comprehensive overview of a monitor designed to proactively detect drive errors and RAID failure events in managed Windows computers. It details its functionality, limitations, and customization options for alerting based on specific error types.'
tags: ['monitoring', 'raid', 'windows', 'event', 'configuration']
draft: false
unlisted: false
---
## Summary

This monitor proactively looks for all the Drive errors and Raid failures events generated in the last 24 hours.

**Note:**  
- The monitor set explicitly excludes virtual machines.  
- The monitor set works on the event logs stored/gathered in Automate. So, it's not 100% reliable.

## Target

Managed Windows Computers

![Image](5078775/docs/8028099/images/19027776)

## FAQ

**Q:** How do I ignore certain error types or only alert on a number of events  
**A:** At the end of the query there is a commented-out (by default) line for this behavior.  
![Image](5078775/docs/8028099/images/15513324)  
Remove the # from this line and that will allow this line to go into production. In this example, we want to ignore controller errors if there are less than 20 of them on a specific drive. The portion:  
![Image](5078775/docs/8028099/images/15513360) is the subject line of the event log that we want to exclude unless there are X results. The portion here:  
![Image](5078775/docs/8028099/images/15513372) is the number of events.  

Translated from programming to human this essentially says "Do not tell me about controller errors unless there are more than 20 of them".  

This could work for Paging Errors or Bad Blocks or really anything you can match.

