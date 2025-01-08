---
id: 'cwa-script-effectiveness-monitor'
title: 'Script Effectiveness Monitor Configuration'
title_meta: 'Script Effectiveness Monitor Configuration'
keywords: ['monitor', 'scripts', 'effectiveness', 'tickets', 'threshold', 'alerting']
description: 'This document provides a detailed guide on configuring a script effectiveness monitor in ConnectWise Automate. It explains how to set thresholds for script effectiveness, adjust ticket generation settings for on-prem and hosted partners, and customize alert messages. Follow the instructions to ensure proper monitoring and ticket creation for scripts with low effectiveness rates.'
tags: ['alert', 'configuration', 'monitoring', 'ticketing', 'thresholds']
draft: false
unlisted: false
---
## Summary

The monitor will create a ticket for the scripts which have a success/effectiveness rate of less than X% over the set script log retention days.

The Script log retention days can be seen at the automate location below:

![Script Log Retention Days](5078775/docs/11067205/images/15431061)

50% is the default Threshold. The value for the `@ThresholdPercent` in the extra condition of the monitor set can be adjusted to update the Threshold. If you set this number to 30, the monitor set will look for scripts for which the effectiveness is less than 30%.

![Threshold Adjustment](5078775/docs/11067205/images/15431098)

And change this number in the Alert Message on Failure section under the alerting tab accordingly.

![Alert Message Adjustment](5078775/docs/11067205/images/15431345)

The monitor's default behavior is to detect all scripts, regardless of how many times they have been executed. Update the value for the `@ThresholdRuns` from 0 to the required number if you want the monitor set to catch scripts with a minimum number of executions. By setting this number to 10, the monitor set will only identify scripts that have run at least 10 times.

![Threshold Runs Adjustment](5078775/docs/11067205/images/15431243)

### For On-Prem Partners

Default nature of the monitor is to create all the tickets against the Automate server. If you would like to generate the tickets for another computer, then set a number for the `@ComptueridForTickets` variable.

![On-Prem Ticket Generation](5078775/docs/11067205/images/15431295)

### For Hosted Partners

Default nature of the monitor is to create all the tickets for the oldest computer of clientid 1. If you would like to generate the tickets for another computer, then set a number for the `@ComptueridForTickets` variable.

![Hosted Ticket Generation](5078775/docs/11067205/images/15431304)

If you would like to generate the ticket for the minimum clientid of another client, then set another number/id for the `@HostedPartnersDefaultClientid` Variable.

![Hosted Partners Default Client ID](5078775/docs/11067205/images/15431333)

Note: Do Not Remove the Semi-colons (;) while making changes.

### Alerting Tab:

Ticket Subject: Effectiveness Check - %Script Name% - Failed

Ticket Body for Failures:

Threshold Percent: 50

Total Runs: %TotalNumberOfScriptRuns%  
Effective Percent: %Effective Percent%  
Last Run Date: %LastRunDateofScript%.

Sample Screenshot Ticket Subject:

![Sample Ticket Subject](5078775/docs/11067205/images/15431425)

Sample Screenshot Ticket Body:

![Sample Ticket Body](5078775/docs/11067205/images/15431430)

**Above screenshot contains ticket body from three tickets.

Recommended Alert Template: Default Create Ticket

## Target

Global

