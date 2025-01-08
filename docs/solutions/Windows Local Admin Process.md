---
id: 'cwa-centralized-local-admin-user'
title: 'Centralized Local Admin User Management'
title_meta: 'Centralized Local Admin User Management for Enhanced Security'
keywords: ['admin', 'security', 'password', 'management', 'monitoring']
description: 'This document outlines a solution for establishing a centralized local admin user for each client or computer, implementing a password rotation mechanism to enhance security, facilitate management, and mitigate risks associated with static local admin credentials. It includes implementation steps, update notices, and FAQs.'
tags: ['security', 'management', 'monitoring', 'update', 'windows']
draft: false
unlisted: false
---
## Purpose

This solution aims to establish a centralized local admin user for each client or computer, ensuring a consistent and controlled approach. Additionally, the solution implements a password rotation mechanism to regularly update the password at specified intervals. This centralized approach enhances security, facilitates management, and helps mitigate potential risks associated with unmonitored or static local admin credentials.

## Update Notice: 06-November-2024

A new system property and EDF has been introduced for setting the password to never expire. Update the [Windows - Admin Account - Create/Update](https://proval.itglue.com/DOC-5078775-8223774) script from the `Prosync` plugin.

Run/debug against an online Windows machine with `SetEnvironment_Local_Admin_Process` as `1` to implement the changes for the [Windows Local Admin Process](https://proval.itglue.com/DOC-5078775-13026633) solution.

![Image](5078775/docs/13026633/images/19277145)

## Associated Content

| Content                                                                 | Type            | Function                                                        |
|-------------------------------------------------------------------------|-----------------|-----------------------------------------------------------------|
| [Windows Local Admin Account Process](https://proval.itglue.com/DOC-5078775-13026629) | Internal Monitor | Detects the machine with missing or outdated credentials.       |
| [Windows - Admin Account - Create/Update](https://proval.itglue.com/DOC-5078775-8223774) | Script          | Create/Update the user.                                        |
| △ CUSTOM - Execute Script - Windows - Admin Account - Create/Update    | Alert Template   | Execute the script against the machines detected by the internal monitor. |
| [Windows - Admin Account Password Rotation Notification](https://proval.itglue.com/DOC-5078775-14357326) | Client Script    | This script sets the Ticket Creation or email sent for the password update made by the script 'Windows - Admin Account - Create/Update' |

## Implementation

1. Import/Update the following content from the ProSync Plugin:
   - [Script - Windows - Admin Account - Create/Update](https://proval.itglue.com/DOC-5078775-8223774)
   - [Internal Monitor - Windows Local Admin Account Process](https://proval.itglue.com/DOC-5078775-13026629)
     - If this monitor shows as needing an update, please delete the monitor from the system and re-import it.
   - Alert Template - `△ CUSTOM - Execute Script - Windows - Admin Account - Create/Update`

2. Run/debug the script [Windows - Admin Account - Create/Update](https://proval.itglue.com/DOC-5078775-8223774) against an online Windows machine with `SetEnvironment_Local_Admin_Process` as `1`.

   ![Image](5078775/docs/13026633/images/19277145)

   **NOTE:** The Username and Title Parameters are used for manual run ONLY and will not do anything when using the SetEnvironment variable.

3. Modify the default values for the system properties (If desired). If this is a new implementation, please confirm with the consultant if they would like any of these adjusted.

   ![Image](5078775/docs/13026633/images/20739636)

   New Add:

   ![Image](5078775/docs/13026633/images/27304309)

4. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Windows Local Admin Account Process](https://proval.itglue.com/DOC-5078775-13026629)
       - `Alert Template: △ CUSTOM - Execute Script - Windows - Admin Account - Create/Update`
       - Right-click and Run Now to start the monitor.

### Optional

1. This step should only be attempted if requested by the consultant:
   - Import the script [Windows - Admin Account Password Rotation Notification](https://proval.itglue.com/DOC-5078775-14357326).
     - If the client requested the notification during a password change, then change the value of the system property 'Default_Local_Admin_Password_Change_Notification_Client' to `1` and if the client needs the email for notification then set the email address to the property 'Default_Local_Admin_Password_Change_Notification_Email'.
   - If this information is not provided and clear, reach out to the consultant for further clarification.

   For multiple email addresses put the address separated with ';' (semi-colon without spaces between email IDs) in the property. For example [test@test.com](mailto:test@test.com);[msp@msp.com](mailto:msp@msp.com)

## FAQ

**Q:** What is the process to deactivate the automatic rotation of credentials and opt for password reset when required?  
**A:** To disable the auto rotation of credentials, adjust the system property `Default_Local_Admin_Display_Name` to '99999' and reset the client-level EDF `1f. Change Password After Days` if it is set. This setting will effectively prevent the password from auto-rotating for '99999' days, ensuring it remains unchanged. Following the deactivation of auto password rotation, to reset the password on end machines, simply update the password in the client-level password entry. Once updated, the solution will automatically propagate the new password to the endpoints.

**Q:** How to force reset the password?  
**A:** Removing the password entry from the client-level password tab will force reset the password at the end points.

**Q:** The solution saves the password at the client-level password tab in Automate, is there any way to sync these credentials to ITGlue?  
**A:** Yes, the [StickySync](https://proval.itglue.com/5078775/docs/8842775) plugin can be used and configured to sync those passwords to ITGlue.

**Q:** What do the new EDFs look like?  
**A:** The new EDF structure is shown below:

![Image](5078775/docs/13026633/images/26653536)

**Q:** Marking an EDF is not making the expected change/exclusion?  
**A:** The EDF data might not have been synced to the `v_extradatacomputers` or `v_extradatagroups` tables. Automate runs this sync every 20-25 minutes. So, either you need to wait for 20-25 minutes or you can run the following SQL queries from a `RAWSQL` monitor set to force sync the data:
- `Call V_Extradata(3, 'Clients');`
- `Call V_Extradata(1, 'Computers');`
- `Call V_ExtradataRefresh(3, 'Clients');`
- `Call V_ExtradataRefresh(1, 'Computers');`

