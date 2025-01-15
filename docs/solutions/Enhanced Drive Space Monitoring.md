---
id: '0757e19d-56e4-4491-83b3-6012fde3b753'
title: 'Enhanced Drive Space Monitoring'
title_meta: 'Enhanced Drive Space Monitoring for ProVal'
keywords: ['monitoring', 'drive', 'space', 'thresholds', 'tickets']
description: 'This document provides a comprehensive guide on implementing enhanced drive space monitoring using specific thresholds to reduce false positive drive space tickets in ProVal. It includes associated content, implementation steps, and configuration details for monitors and alert templates.'
tags: ['monitoring', 'disk', 'configuration', 'alert', 'windows']
draft: false
unlisted: false
---
## Purpose

Being able to monitor drive space using specifically assigned thresholds eliminates most false positive drive space tickets.

## Associated Content

### Automation

| Content                                                                                                                                          | Type            | Function                                                                                                                                                                    |
|--------------------------------------------------------------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](https://proval.itglue.com/DOC-5078775-12182106)              | Internal monitor | Determines target machine/ drives that violate set thresholds. Used to run the associated script to clean up the drive with Soji                                        |
| [Internal Monitor - Agent - Enhanced Drive Space Monitor [Ticket Management]](https://proval.itglue.com/DOC-5078775-14608610)                  | Internal monitor | Needs to be imported in case the partner wants to reopen prematurely closed tickets for the machines where the issue persists                                          |
| [EPM - Disk - Script - Enhanced Disk Space Monitoring Process](https://proval.itglue.com/DOC-5078775-12033151)                                | Autofix script   | Double-checks thresholds, runs the soji agnostic script on the target endpoint for the target drive, and creates/closes ticket(s).                                      |
| △ Custom - Autofix - Enhanced Drive Space Monitoring                                                                                           | Alert Template   | The alert template runs the Autofix script on the machines detected by the alert template.                                                                                |

### Other Content

| Content                                                                                                                                          | Type            | Function                                                                                                                                                                    |
|--------------------------------------------------------------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [EPM - Disk - Automate - Script - Soji - Disk Space Management](https://proval.itglue.com/DOC-5078775-11073740)                              | Function Script  | Called by the Autofix script [EPM - Disk - Script - Enhanced Disk Space Monitoring Process](https://proval.itglue.com/DOC-5078775-12033151) to perform disk cleanup. |

## Implementation

1. Import the below script using the ProSync plugin:
   - [Script - Enhanced Disk Space Monitoring Process](https://proval.itglue.com/DOC-5078775-12033151)

2. Import the below monitor using the ProSync Plugin:
   - [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](https://proval.itglue.com/DOC-5078775-12182106)
   - [Internal Monitor - Agent - Enhanced Drive Space Monitor [Ticket Management]](https://proval.itglue.com/DOC-5078775-14608610)

3. Import the below Alert Templates using the ProSync plugin:
   - `△ Custom - Autofix - Enhanced Drive Space Monitoring`

4. Run or debug the [Script - Enhanced Disk Space Monitoring Process](https://proval.itglue.com/DOC-5078775-12033151) against a random Windows computer. **Set the user parameter** `SetEnvironment` to 1 during execution. This step will create the associated EDFs and System Properties.

5. Reload the System Cache  
   ![Reload the System Cache](https://proval.itglue.com/5078775/docs/14876168/images/21622864)

6. **If custom thresholds have been requested**:  
   Use the instructions in the [Script - Enhanced Disk Space Monitoring Process](https://proval.itglue.com/DOC-5078775-12033151) and the [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](https://proval.itglue.com/DOC-5078775-12182106) to Configure System Properties and EDFs as per Partners requirement. If nothing was specified by the consultant, assume the defaults are what is requested:
   - **If you configured any custom thresholds**, please run the following to get the monitor to update its results quickly. (Or Wait 25 minutes)
     - If you updated any Group Level EDFs
       - `Call V_Extradata(7, 'Groups');`
       - `Call V_ExtradataRefresh(7, 'Groups');`
     - If you updated any Computer Level EDFs
       - `Call V_Extradata(1, 'Computers');`
       - `Call V_ExtradataRefresh(1, 'Computers');`

7. Navigate to Automation -> Monitors and setup the following:
   - [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](https://proval.itglue.com/DOC-5078775-12182106)  
     Configure with the alert template: `△ Custom - Autofix - Enhanced Drive Space Monitoring`
   - [Internal Monitor - Agent - Enhanced Drive Space Monitor [Ticket Management]](https://proval.itglue.com/DOC-5078775-14608610)  
     Configure with the alert template: `△ Custom - Autofix - Enhanced Drive Space Monitoring`

8. Open the main service plan groups and enable the monitor on the required groups:
   - Unless otherwise specified by the consultant, enable both monitors on the Managed 24x7 + 8x5 groups for both servers and workstations.

9. Navigate to Automation -> Monitors and setup the following:
   - [Internal Monitor - ProVal - Production - Agent - Enhanced Drive Space Monitor](https://proval.itglue.com/DOC-5078775-12182106)  
     Right-click and Run Now to start the monitor.
   - [Internal Monitor - Agent - Enhanced Drive Space Monitor [Ticket Management]](https://proval.itglue.com/DOC-5078775-14608610)  
     Set this to run starting the following day at 5:50 AM  
     (The specific time is not too important, just want to make sure we run it at a different time than the other monitor)  
     Ensure the monitor reports it is not Disabled.






