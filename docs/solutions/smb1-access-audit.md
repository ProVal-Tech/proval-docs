---
id: 'b9c24693-91db-4014-a5d9-7208d7fe492a'
slug: /b9c24693-91db-4014-a5d9-7208d7fe492a
title: 'SMB1 Access Audit'
title_meta: 'SMB1 Access Audit'
keywords: ['smb1', 'traffic', 'audit', 'detection']
description: 'This solution monitors servers for SMB1 protocol usage. It enables SMB1 access auditing (if disabled), scans event logs for recent SMB1 access attempts (Event IDs 1001, 3000) within the past hour, and triggers an alert through a compound condition if SMB1 is enabled and any access attempts are detected.'
tags: ['alerting', 'auditing', 'eventlogs', 'smb']
draft: false
unlisted: false
---

## Purpose

This solution monitors servers for SMB1 protocol usage. It enables SMB1 access auditing (if disabled), scans event logs for recent SMB1 access attempts (Event IDs 1001, 3000) within the past hour, and triggers an alert through a compound condition if SMB1 is enabled and any access attempts are detected.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [SMB1 Access Audit And Detection](/docs/a65607e3-42b0-473c-bf09-36e63107a835)      | Automation| Enables SMB1 access auditing if disabled and scans event logs for recent SMB1 access attempts (Event IDs 1001, 3000) within the last hour. Returns exit codes for detection or script failure. |
|[SMB1 Traffic Audit](/docs/f6b984a2-acbe-40fa-93e3-43682acde7ca)|Compound Condition| This Compound Condition creates an alert on Servers with SMB1 Protocol enabled and if SMB1 access attempts (Event IDs 1001, 3000) is detected within the last hour|

## Implementation

To implement this solution, follow the steps below:

**1. Import the Automation** – Start by importing the [SMB1 Access Audit And Detection](/docs/a65607e3-42b0-473c-bf09-36e63107a835)
 automation into the Ninja environment.

    This script enables SMB1 access auditing (if disabled) and scans for SMB1 access attempts in the last hour.

**2. Import the Compound Condition** – Next, import the [SMB1 Traffic Audit](/docs/f6b984a2-acbe-40fa-93e3-43682acde7ca)
 compound condition.

    This condition will trigger an alert when SMB1 is enabled and recent access attempts are detected.

## FAQ

**1. What does this solution detect?**  
It detects whether the SMB1 protocol is enabled on a server and checks for any recent SMB1 access attempts (Event IDs 1001 or 3000) within the last hour.

**2. Do I need to enable any settings manually before using this solution?**  
No manual configuration is required. The automation will automatically enable SMB1 access auditing if it’s currently disabled.

**3. What kind of alert does this solution generate?**  
The compound condition triggers an alert when SMB1 is enabled and there are recent SMB1 access attempts, helping identify potential security risks.

**4. How often does the detection run?**  
The automation checks the event logs for the past hour.

**5. Can I modify the time range for log scanning?**  
Yes. The time window (currently 1 hour) can be adjusted in the PowerShell script if you want to monitor a longer or shorter period.

**6. What happens if SMB1 auditing is already enabled?**  
If SMB1 auditing is already active, the script simply proceeds to log scanning without making any changes.

**7. Will this solution disable SMB1 or block access automatically?**  
No, this solution only audits and detects SMB1 usage. It does not disable SMB1 or block any connections.

**8. Where can I view the detection results or alerts?**  
Results are logged within the Ninja environment, and tickets can be configured.

**9. What should I do if SMB1 activity is detected?**  
If activity is detected, review the source of the access. It’s recommended to disable SMB1 if it’s not required, as it poses a known security risk.