---
id: '64cf5b44-11bf-42dc-87bc-f1f93582ed8d'
slug: /64cf5b44-11bf-42dc-87bc-f1f93582ed8d
title: 'Scripting Engine Hung - Troubleshooting'
title_meta: 'Scripting Engine Hung - Troubleshooting'
keywords: ['query', 'troubleshooting', 'scripts', 'monitor', 'database']
description: 'This document outlines the steps to troubleshoot and run queries in ConnectWise Automate, specifically focusing on managing running scripts and addressing scripting engine issues. It includes detailed instructions on navigating the system, running specific SQL queries, and exporting results for further analysis.'
tags: ['database', 'report']
draft: true
unlisted: false
---

## Run a Query

## Example Ticket

![Example Ticket](../../static/img/Scripting-Engine-Hung---Troubleshooting/image_1.png)

When you see a ticket like the above for any partner, please follow the troubleshooting steps below.

### 1. Check MAX Running Scripts

Navigate to **System >> VNC / Ticket Priority >> MAX Running Scripts**.

Look for "MAX Running Scripts" and ensure its value is at least 1/3 of the value of the agent count.  
This applies only to the environment where you have seen frequent Scripting Engine Hung issues.  
This is not a stated statement; rather, it is an assumption to prevent situations in the partner environment if they continuously encounter scripting engine crash issues.

![MAX Running Scripts](../../static/img/Scripting-Engine-Hung---Troubleshooting/image_2.png)

Navigate to **System >> Configuration >> Dashboard >> Config >> Configuration >> Properties**.

Look for the property "LT_MAXRunningScripts" and ensure its value is reflected.

### 2. Monitor Internal Scripts

Navigate to **Automation >> Monitor >> Internal Monitor**.

### 3. Create a New Monitor

Right-click and select **New Monitor**.

![New Monitor](../../static/img/Scripting-Engine-Hung---Troubleshooting/image_3.png)

### 4. Start Fresh

Select **Start Fresh >> Next**.

![Start Fresh](../../static/img/Scripting-Engine-Hung---Troubleshooting/image_4.png)

### 5. Run the Query

Run the query as mentioned below:

![Run Query](../../static/img/Scripting-Engine-Hung---Troubleshooting/image_5.png)

```
SELECT COUNT(r.scriptid) AS `Count`,
       s.ScriptName,
       r.`Start` AS `Last Start Date`,
       r.Priority
FROM runningscripts r
JOIN lt_scripts s ON s.scriptid = r.scriptid
WHERE r.Running = 0
  AND r.`start` BETWEEN DATE(NOW() - INTERVAL 7 DAY) AND DATE(NOW() - INTERVAL 1 HOUR)
  AND (r.`executed` IS NULL OR r.executed = '0000-00-00 00:00:00')
GROUP BY r.scriptid
HAVING `Count` > 10
ORDER BY COUNT(r.scriptid) DESC;
```

Export the list to share with the consultant.  
Check for the top scripts whose running count is excessive, figure out why they have been running like that, and fix them if found irrelevant.  
Bring the concern to the consultant with notes and screenshots.

### 6. Run Another Query

Follow steps 2-4, then run the query below:

![Another Query](../../static/img/Scripting-Engine-Hung---Troubleshooting/image_6.png)

![Another Query](../../static/img/Scripting-Engine-Hung---Troubleshooting/image_7.png)

```
SELECT
      COUNT(0)
FROM
      pendingscripts p
      JOIN lt_scripts l ON p.scriptid = l.scriptid
      JOIN computers c ON p.targetcomputerid = c.computerid
WHERE
      p.targetcomputerid NOT IN (
            SELECT
                  DISTINCT computerid
            FROM
                  maintenancemodequeue
            WHERE
                  timestart + INTERVAL `Duration` MINUTE > NOW()
      )
      AND p.NextRun < NOW() - INTERVAL 15 MINUTE
      AND CASE WHEN c.lastcontact > NOW() - INTERVAL 15 MINUTE THEN l.ScriptFlags = 0 ELSE l.scriptflags = 1 END
```

Please validate the stuck scripts and export that report to Excel to forward to the consultant with your feedback and analysis.

### 7. Restart the Database Agent Service

**Only if the scripting engine appears to be hung with a lot of scripts reporting in the queue**, restart the DB Agent service.

Navigate to **Help >> Server Status >> Restart Database Agent**.

This will remove all queued scripts and will temporarily fix the scripting engine hang if the script queuing issue is not resolved from the above query results.


