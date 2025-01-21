---
id: 'b2661e46-518b-4a4f-9b4b-21f9b69ff100'
title: 'Time Saved Report Generation for VSA'
title_meta: 'Time Saved Report Generation for VSA'
keywords: ['csv', 'report', 'time', 'saved', 'vsa', 'automation', 'org', 'total', 'monthly']
description: 'This document describes the process of generating a CSV report that displays cumulative and monthly time saved values for each organization in a VSA environment, along with the total time saved across all organizations. The report provides insights into the efficiency and time savings achieved through automation.'
tags: ['report']
draft: false
unlisted: false
---

## Summary

This document generates a CSV report for the end client to show cumulative and monthly time saved values for each organization in their environment, as well as the total for all organizations.

## Example Output

| **Org Name**                               | **Total** | **Monthly** |
|--------------------------------------------|-----------|-------------|
| Entire VSA                                 | 3:35:00   | 2:35:00     |
| PC Computing and Consulting                 | 0:10:00   | 0:10:00     |
| ProVal Technologies                         | 2:15:00   | 1:15:00     |
| Meriplex                                   | 0:10:00   | 0:10:00     |
| Bercell Integrated Technologies Ltd        | 0:10:00   | 0:10:00     |
| Groff Networks                              | 0:05:00   | 0:05:00     |
| SysIntegrators, LLC                        | 0:05:00   | 0:05:00     |
| MBTech                                     | 0:10:00   | 0:10:00     |
| CIO Solutions                               | 0:00:00   | 0:00:00     |
| Binatech                                   | 0:10:00   | 0:10:00     |
| itSynergy                                  | 0:10:00   | 0:10:00     |
| Unnamed                                    | 0:00:00   | 0:00:00     |
| Avatar Computer                            | 0:05:00   | 0:05:00     |
| Trinity Worldwide Technologies             | 0:05:00   | 0:05:00     |
| Test                                       | 0:00:00   | 0:00:00     |
| DataBlue                                   | 0:00:00   | 0:00:00     |

## Dependencies

[VSA - VSA Configuration - Solution - Automation Time Saved Tracking](https://proval.itglue.com/DOC-5078775-11143659)

## Process

- Gets the Agent list from the API.
- Gets the Organization list from the API.
- Adds the sums of the custom fields (CFs) on all agents and places them into the object (for total across VSA).
- Loops through each organization and adds together the CFs only for agents in the current organization (for organization totals).
- Outputs data to CSV.

## Output

`$env:ProgramData/_automation/AgentProcedure/StackContent/TimeSavedByAutomation_$timestamp.csv`

