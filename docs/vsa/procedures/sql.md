---
id: 'd0694f70-303e-4518-b47c-a796ca73d905'
slug: /d0694f70-303e-4518-b47c-a796ca73d905
title: 'SQL'
title_meta: 'SQL'
keywords: ['patch', 'sql', 'kb', 'database', 'vsa']
description: 'This document provides a detailed guide on how to clear a specific patch from the Failed Patches list in Kaseya VSA using SQL queries. It includes steps for backing up the database, modifying the SQL query with the appropriate KB number, and executing the query on KSubscribers.'
tags: ['backup', 'database', 'sql', 'update']
draft: false
unlisted: false
---

## Purpose

This document allows you to clear a patch from the Failed Patches list with the help of SQL.

## Associated Content

| **Content**                     | **Type**      | **Function**                                             |
|----------------------------------|---------------|----------------------------------------------------------|
| SQL - clearFailedPatchesByKB     | SQL Query     | Removes a specific patch from failed patches.            |

## Implementation

1. **Take a Backup of the VSA Database.**  
   ![](../../../static/img/docs/d0694f70-303e-4518-b47c-a796ca73d905/image_1.webp)

2. **Update the KB Number in the SQL Query Below.**  
   ![](../../../static/img/docs/d0694f70-303e-4518-b47c-a796ca73d905/image_2.webp)  
   ```sql
   -- clears "failed" patches on all agents for a specific KB article ID
   DECLARE @kbArticleId AS VARCHAR(10) = '5034441', -- enter KB article ID here
   @agentGuid AS NUMERIC(26)

   SELECT @agentGuid = MIN(agentguid)
   FROM patchStatus s
   JOIN patchData d ON s.patchDataId = d.patchDataId AND d.kbArticleId = @kbArticleId
   WHERE s.patchState = 0
   AND s.schedTogether IN (2,3,8)

   WHILE @agentGuid IS NOT NULL
   BEGIN
       UPDATE patchStatus SET schedTogether = 0
       FROM patchStatus s
       JOIN patchData d ON s.patchDataId = d.patchDataId AND d.kbArticleId = @kbArticleId
       WHERE patchState = 0
       AND schedTogether IN (2,3,8)
       AND agentGuid = @agentGuid

       EXEC updatePatchStatusTotals @agentGuid

       SELECT @agentGuid = MIN(agentguid)
       FROM patchStatus s
       JOIN patchData d ON s.patchDataId = d.patchDataId AND d.kbArticleId = @kbArticleId
       WHERE s.patchState = 0
       AND s.schedTogether IN (2,3,8)
   END
   ```

3. **Run this Query on KSubscribers on SQL Server.**  
   ![](../../../static/img/docs/d0694f70-303e-4518-b47c-a796ca73d905/image_3.webp)
