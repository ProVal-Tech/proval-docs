---
id: '2910ca09-a0c7-4b44-8ea4-ef6e71304df8'
slug: /2910ca09-a0c7-4b44-8ea4-ef6e71304df8
title: 'Queue Script Next Checkin'
title_meta: 'Queue Script Next Checkin'
keywords: ['script', 'offline', 'automate', 'queue', 'computer']
description: 'This document explains how to schedule a script in ConnectWise Automate to run on a computer the next time it checks in, specifically targeting offline machines. It covers the implementation process, associated content, and answers to frequently asked questions regarding the script queueing process.'
tags: ['setup']
draft: false
unlisted: false
---

## Purpose

This solution provides a way to schedule a script in Automate to run on a computer the next time it checks in. It is intended for offline computers, in cases where you are unsure of when this computer will become available again; however, it can be utilized to schedule any script to run on any machine.

## Associated Content

| Content                                                                                             | Type          | Function                                                                                                                         |
|-----------------------------------------------------------------------------------------------------|---------------|----------------------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Custom Table - plugin_proval_queued_scripts](/docs/a20befa8-ecca-4cf9-9d18-c4140f87aafc) | Custom Table  | Stores queued scripts and their requested parameters.                                                                           |
| 'Machines With Queued Scripts' Group                                                              | Group         | Members will be computers with pending queued scripts. The group has the [CWM - Automate - Script - Run Queued Scripts](/docs/f60f4501-a2ea-43f0-87ee-99fc8ee15031) script scheduled to run every 3 days. |
| [CWM - Automate - Script - Queue Script](/docs/c96624e1-038a-45ca-a6d0-645a629af721)          | Script        | Creates the table, group, and scheduled script on the group if required. Adds the target agent to the created group and stores the target script ID and parameters in the custom table. |
| [CWM - Automate - Script - Run Queued Scripts](/docs/f60f4501-a2ea-43f0-87ee-99fc8ee15031)   | Script        | Collects script information for the target agent from the table and executes the script(s) with the requested parameters. The script then removes executed script entries from the custom table and removes the computer from the group. |
| [CWM - Automate - Monitor - Monitor~~ Autofix - Run Queued Scripts](/docs/41b393a9-cb59-4418-8536-9fe911cb4c9d) | Internal Monitor | This monitor is created by the [CWM - Automate - Script - Queue Script](/docs/c96624e1-038a-45ca-a6d0-645a629af721) automate script. It returns failed if the computer is offline, and success when online. |

## Implementation

Import both scripts.  
Run the [CWM - Automate - Script - Queue Script](/docs/c96624e1-038a-45ca-a6d0-645a629af721) script; this sets up the environment on the first run. No additional setup is required.

## FAQ

1. *How does this work?*
   1. [CWM - Automate - Script - Queue Script](/docs/c96624e1-038a-45ca-a6d0-645a629af721)
      1. If you run [CWM - Automate - Script - Queue Script](/docs/c96624e1-038a-45ca-a6d0-645a629af721) on an online machine, the script will schedule the desired script to run immediately.
      2. The script, [CWM - Automate - Script - Queue Script](/docs/c96624e1-038a-45ca-a6d0-645a629af721), creates the custom table, [CWM - Automate - Custom Table - plugin_proval_queued_scripts](/docs/a20befa8-ecca-4cf9-9d18-c4140f87aafc), if it does not exist, when running on an offline machine.
      3. The script, [CWM - Automate - Script - Queue Script](/docs/c96624e1-038a-45ca-a6d0-645a629af721), creates the 'Machines With Queued Scripts' group if it does not exist and assigns an internal monitor to that group if it's not already assigned. This monitor will check for a recent check-in from the agent; if a recent check-in has been found, then the monitor autofix will run [CWM - Automate - Script - Run Queued Scripts](/docs/f60f4501-a2ea-43f0-87ee-99fc8ee15031).
      4. The script, [CWM - Automate - Script - Queue Script](/docs/c96624e1-038a-45ca-a6d0-645a629af721), then adds the target computer to that group if the computer is not already a member.
      5. After the computer is verified to be a member of the group, the script, [CWM - Automate - Script - Queue Script](/docs/c96624e1-038a-45ca-a6d0-645a629af721), will populate the custom table, [CWM - Automate - Custom Table - plugin_proval_queued_scripts](/docs/a20befa8-ecca-4cf9-9d18-c4140f87aafc), with the requested script and parameters, **if that computer does not already have that script scheduled.**

2. 'Machines With Queued Scripts' Group
   1. The group, 'Machines With Queued Scripts', holds all computers that have any queued scripts using this solution.
   2. This group's intention is to ensure that only computers with queued scripts are targeted with the [CWM - Automate - Script - Run Queued Scripts](/docs/f60f4501-a2ea-43f0-87ee-99fc8ee15031) script.

3. [CWM - Automate - Custom Table - plugin_proval_queued_scripts](/docs/a20befa8-ecca-4cf9-9d18-c4140f87aafc)
   1. The custom table, [CWM - Automate - Custom Table - plugin_proval_queued_scripts](/docs/a20befa8-ecca-4cf9-9d18-c4140f87aafc), is intended to hold a memory of any script for any target machine that you would like to execute the next time the computer checks in.

4. [CWM - Automate - Script - Run Queued Scripts](/docs/f60f4501-a2ea-43f0-87ee-99fc8ee15031)
   1. The script, [CWM - Automate - Script - Run Queued Scripts](/docs/f60f4501-a2ea-43f0-87ee-99fc8ee15031), is executed from an internal monitor's alert action 'Monitor~~Autofix - Run Queued Scripts'.
   2. This script will execute any script(s) found in [CWM - Automate - Custom Table - plugin_proval_queued_scripts](/docs/a20befa8-ecca-4cf9-9d18-c4140f87aafc) for the target machine with its associated desired parameters either silently or with natural logging.
   3. This script will remove any queued scripts from [CWM - Automate - Custom Table - plugin_proval_queued_scripts](/docs/a20befa8-ecca-4cf9-9d18-c4140f87aafc) upon execution of that script.
   4. This script will remove the computer from the group 'Machines With Queued Scripts' at the completion of the script.

5. *I have scheduled a script on a target machine, and I want to schedule that same script again. Can I?*  
   Unfortunately, no. The system safeguards against duplicate entries in the [CWM - Automate - Custom Table - plugin_proval_queued_scripts](/docs/a20befa8-ecca-4cf9-9d18-c4140f87aafc) table and will not allow a target to schedule the same script on the same computer twice at the next check-in.

6. *I have been running this, and I am noticing that my scripting engine is suffering. What can I do?*  
   A silent parameter is present in the [CWM - Automate - Script - Run Queued Scripts](/docs/f60f4501-a2ea-43f0-87ee-99fc8ee15031) script. Modify the [CWM - Automate - Script - Run Queued Scripts](/docs/f60f4501-a2ea-43f0-87ee-99fc8ee15031) script, setting the script's global silent switch to 'Yes'. This will transfer the running of the queued scripts from the script engine to simply being called directly from the [CWM - Automate - Script - Run Queued Scripts](/docs/f60f4501-a2ea-43f0-87ee-99fc8ee15031) script. Keep in mind this means that your queued scripts will not show up in the script history or on the computer's scripts page, and all logging for any script called in this manner will be displayed under the [CWM - Automate - Script - Run Queued Scripts](/docs/f60f4501-a2ea-43f0-87ee-99fc8ee15031) log on the computer's script page.
