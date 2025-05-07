---
id: '0757e19d-56e4-4491-83b3-6012fde3b753'
slug: /0757e19d-56e4-4491-83b3-6012fde3b753
title: 'Enhanced Drive Space Monitoring'
title_meta: 'Enhanced Drive Space Monitoring'
keywords: ['monitoring', 'drive', 'space', 'thresholds', 'tickets']
description: 'This document provides a comprehensive guide on implementing enhanced drive space monitoring using specific thresholds to reduce false positive drive space tickets in ProVal. It includes associated content, implementation steps, and configuration details for monitors and alert templates.'
tags: ['disk', 'windows']
draft: false
unlisted: false
---

## Purpose

Being able to monitor drive space using specifically assigned thresholds eliminates most false positive drive space tickets.

## Associated Content

### Automation

| Content                                                                                                                                          | Type            | Function                                                                                                                                                                    |
|--------------------------------------------------------------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](/docs/f7235a0b-b6b6-456d-8af3-bd3471b1e70f)              | Internal monitor | Determines target machine/drives that violate set thresholds. Used to run the associated script to clean up the drive with Soji                                        |
| [Internal Monitor - Agent - Enhanced Drive Space Monitor [Ticket Management]](/docs/4535820b-8254-4b20-bb7c-f68b2f05494e)                  | Internal monitor | Needs to be imported in case the partner wants to reopen prematurely closed tickets for the machines where the issue persists                                          |
| [EPM - Disk - Script - Enhanced Disk Space Monitoring Process](/docs/8efd9cc2-b054-4dda-a690-bbe1d4bd16b3)                                | Autofix script   | Double-checks thresholds, runs the Soji-agnostic script on the target endpoint for the target drive, and creates/closes ticket(s).                                      |
| △ Custom - Autofix - Enhanced Drive Space Monitoring                                                                                           | Alert Template   | The alert template runs the Autofix script on the machines detected by the alert template.                                                                                |

### Other Content

| Content                                                                                                                                          | Type            | Function                                                                                                                                                                    |
|--------------------------------------------------------------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [EPM - Disk - Automate - Script - Soji - Disk Space Management](/docs/47f53d1e-f609-46f8-b407-ccdf11eeede4)                              | Function Script  | Called by the Autofix script [EPM - Disk - Script - Enhanced Disk Space Monitoring Process](/docs/8efd9cc2-b054-4dda-a690-bbe1d4bd16b3) to perform disk cleanup. |

## Implementation

1. Import the script below using the ProSync plugin:
   - [Script - Enhanced Disk Space Monitoring Process](/docs/8efd9cc2-b054-4dda-a690-bbe1d4bd16b3)

2. Import the monitors below using the ProSync Plugin:
   - [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](/docs/f7235a0b-b6b6-456d-8af3-bd3471b1e70f)
   - [Internal Monitor - Agent - Enhanced Drive Space Monitor [Ticket Management]](/docs/4535820b-8254-4b20-bb7c-f68b2f05494e)

3. Import the Alert Templates below using the ProSync plugin:
   - `△ Custom - Autofix - Enhanced Drive Space Monitoring`

4. Run or debug the [Script - Enhanced Disk Space Monitoring Process](/docs/8efd9cc2-b054-4dda-a690-bbe1d4bd16b3) against a random Windows computer. **Set the user parameter** `SetEnvironment` to 1 during execution. This step will create the associated EDFs and System Properties.

5. Reload the System Cache
6. **If custom thresholds have been requested**:  
   Use the instructions in the [Script - Enhanced Disk Space Monitoring Process](/docs/8efd9cc2-b054-4dda-a690-bbe1d4bd16b3) and the [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](/docs/f7235a0b-b6b6-456d-8af3-bd3471b1e70f) to configure System Properties and EDFs as per the partner's requirements. If nothing was specified by the consultant, assume the defaults are what is requested:
   - **If you configured any custom thresholds**, please run the following to get the monitor to update its results quickly. (Or wait 25 minutes)
     - If you updated any Group Level EDFs
       - `Call V_Extradata(7, 'Groups');`
       - `Call V_ExtradataRefresh(7, 'Groups');`
     - If you updated any Computer Level EDFs
       - `Call V_Extradata(1, 'Computers');`
       - `Call V_ExtradataRefresh(1, 'Computers');`

7. Navigate to Automation -> Monitors and set up the following:
   - [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](/docs/f7235a0b-b6b6-456d-8af3-bd3471b1e70f)  
     Configure with the alert template: `△ Custom - Autofix - Enhanced Drive Space Monitoring`
   - [Internal Monitor - Agent - Enhanced Drive Space Monitor [Ticket Management]](/docs/4535820b-8254-4b20-bb7c-f68b2f05494e)  
     Configure with the alert template: `△ Custom - Autofix - Enhanced Drive Space Monitoring`

8. Open the main service plan groups and enable the monitor on the required groups:
   - Unless otherwise specified by the consultant, enable both monitors on the Managed 24x7 + 8x5 groups for both servers and workstations.

9. Navigate to Automation -> Monitors and set up the following:
   - [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](/docs/f7235a0b-b6b6-456d-8af3-bd3471b1e70f)  
     Right-click and Run Now to start the monitor.
   - [Internal Monitor - Agent - Enhanced Drive Space Monitor [Ticket Management]](/docs/4535820b-8254-4b20-bb7c-f68b2f05494e)  
     Set this to run starting the following day at 5:50 AM  
     (The specific time is not too important; just want to make sure we run it at a different time than the other monitor.)  
     Ensure the monitor reports it is not disabled.

