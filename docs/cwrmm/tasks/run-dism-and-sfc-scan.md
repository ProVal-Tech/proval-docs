---
id: '8ec14581-b7a3-4e68-a4f9-28764e3dc242'
slug: /8ec14581-b7a3-4e68-a4f9-28764e3dc242
title: 'Run DISM and SFC Scan'
title_meta: 'Run DISM and SFC Scan'
keywords: ['Diagnostic','SFC','DISM','Scan']
description: 'CW RMM task to execute a DISM repair followed by a SFC scan. This can be used to fix any potential corruptions'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This script is used to execute the DISM and SFC commands on the endpoint. Running the script does not guarantee resolution of any corrupted system files.

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Image 1](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_1.webp)

![Task Creation Image 2](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_2.webp)

**Name:** `Run DISM and SFC Scan`  \
**Description:** `This script is used to execute the DISM and SFC commands on the endpoint. Running the script does not guarantee resolution of any corrupted system files.`  \
**Category:** `Patching`  

![Task Creation Image 3](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_3.webp)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Task Creation Image 4](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_4.webp)

A blank function will appear.

![Task Creation Image 5](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_5.webp)

### Row 1 Function: Command Prompt Script

Search and select the `Command Prompt (CMD) Script` function.

![Task Creation Image 6](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_6.webp)

The following function will pop up on the screen:

![Task Creation Image 7](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_7.webp)

Paste in the following Command Prompt script and set the `Expected time of script execution in seconds` to `600` seconds. Click the `Save` button.

```
DISM.exe /Online /Cleanup-image /Restorehealth
```

![Task Creation Image 8](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_8.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Task Creation Image 9](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_9.webp)

A blank function will appear.

![Task Creation Image 5](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_5.webp)

Search and select the `Script Log` function.

![Task Creation Image 10](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_10.webp)

The following function will pop up on the screen:

![Task Creation Image 11](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_11.webp)

In the script log message, simply type `%Output%` and click the `Save` button.

![Task Creation Image 12](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_12.webp)

### Row 3 Function: Command Prompt Script

Search and select the `Command Prompt (CMD) Script` function.

![Task Creation Image 6](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_6.webp)

The following function will pop up on the screen:

![Task Creation Image 7](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_7.webp)

Paste in the following Command Prompt script and set the `Expected time of script execution in seconds` to `600` seconds. Click the `Save` button.

```
sfc /scannow
```

![Task Creation Image 13](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_13.webp)

### Row 4 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Task Creation Image 9](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_9.webp)

A blank function will appear.

![Task Creation Image 5](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_5.webp)

Search and select the `Script Log` function.

![Task Creation Image 10](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_10.webp)

The following function will pop up on the screen:

![Task Creation Image 11](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_11.webp)

In the script log message, simply type `%Output%` and click the `Save` button.

![Task Creation Image 12](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_12.webp)

Click the `Save` button at the top-right corner of the screen to save the script.

![Task Creation Image 14](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_14.webp)

## Completed Task

![Task Creation Image 15](../../../static/img/docs/8ec14581-b7a3-4e68-a4f9-28764e3dc242/image_15.webp)

## Output

- Script log