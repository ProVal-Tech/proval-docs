---
id: '927ed9c8-98d6-4efa-b22f-a516458ef19c'
title: 'Latest Approved Patches and Their Release Date'
title_meta: 'Latest Approved Patches and Their Release Date'
keywords: ['patches', 'updates', 'computers', 'review', 'status']
description: 'This document provides a detailed overview of the dataview that displays the latest approved patches along with their release dates. It outlines the criteria for filtering patches, the columns included in the dataview, and the SQL representation for querying the relevant data. It highlights the importance of reviewing computers that are overdue for updates or have encountered failed patch installations.'
tags: ['update', 'review', 'status', 'database', 'report']
draft: false
unlisted: false
---
## Summary

The dataview displays the latest approved patches and their release date.

If any computer is over 2 months out from the last update it received, or the last update it received was in a failed state, it should be considered for review.

The dataview filters the patches that it displays based on the following requirements:

- Patches should be in the default policy
- Patches displayed should have been released within the last two months.
- Do not display any patch that was denied.
- Do not display any patch that pertains to Windows Defender or malicious software removal.

## Columns

| Column                     | Description                                               |
|---------------------------|-----------------------------------------------------------|
| Client Name               | The name of the client a computer belongs to.            |
| Location Name             | The name of the location that a computer belongs to.     |
| ComputerID                | The Id of the computer being queried.                    |
| Computer Name             | The name of the computer.                                |
| KBID                      | The KBID for the patch last attempted.                   |
| Title                     | The title of the update that was last attempted.         |
| Severity                  | The severity of the update.                              |
| Patch Approved on Date    | The date the patch was approved.                         |
| Patch Last Attempt Date   | The date the patch install was attempted last.          |
| Status                    | The status of the computer at this time (Up To Date, or Please Review) |

## SQL Representation

```
SELECT
    Computers.ComputerID,
    clients.Name AS 'ClientName',
    locations.Name AS 'LocationName',
    computers.Name AS 'ComputerName',
    MAX(patchjobs.FinishDate) AS 'PatchLastAttemptDate',
    v_setpatches.SetTime AS 'PatchApprovedonDate',
    Severity,
    KBID,
    Title,
    if((MAX(FinishDate) > v_setpatches.Settime + INTERVAL 2 MONTH) OR ((MAX(FinishDate) < v_setpatches.Settime + INTERVAL 2 MONTH) AND operationResultCode != '2'), "Please Review","Up To Date") AS 'ComputerState'
FROM
    Computers
    INNER JOIN Patchjobs
    ON Patchjobs.ComputerID = Computers.ComputerID
    LEFT JOIN patchjobpatches
    ON patchjobpatches.PatchJobGuid = patchjobs.PatchJobGuid
    LEFT JOIN locations
    ON locations.LocationID = computers.LocationID
    LEFT JOIN clients
    ON clients.ClientID = computers.ClientID
    LEFT JOIN v_setpatches
    ON v_setpatches.HotfixID = Patchjobpatches.PatchID
WHERE v_setpatches.approvalPolicyID = 6 AND v_setpatches.settime >= now() - INTERVAL 2 MONTH AND v_setpatches.approvalsetting != '4' and NOT v_setpatches.Title REGEXP '//W*(Microsoft Defender)//W*|//W*(Malicious Software Removal)//W*'
GROUP BY computerid
```







