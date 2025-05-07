---
id: 48cd317b-4188-4881-b9c3-411cd0323508
slug: /48cd317b-4188-4881-b9c3-411cd0323508
title: 'Restrict Vendor Access to Clients'
title_meta: 'Restrict Vendor Access to Clients'
keywords: ['restrict', 'vendor', 'access', 'clients', 'automate']
description: 'This document outlines the process to restrict vendor access to clients in Automate, including the necessary configurations and steps to implement the solution effectively.'
tags: ['security', 'setup', 'software']
draft: false
unlisted: false
---

## Purpose

Due to compliance issues, some MSP partners need to restrict the ability for resources to see end-client machines in Automate. This solution will allow Automate admins to remove the ability to see specific clients in Automate.

**NOTE:** Any users with Super Admin will be able to remove the restricted access.

## Content Pieces

Below are the pieces of content to make this solution function.

1. Two Extra Data Fields named "Restrict Vendor Access" (One at the Client level and one at the Location level and one at computer level).
2. A search that looks for machines at the clients where the EDFs are **NOT** marked.
3. A group that is populated by the above search. This group is used to limit access to the vendor's Automate user account.
4. A new userclass is also added to the system. This is to limit the permissions of users being able to check/uncheck the EDFs.

## Process

1. Import the [Script - ScreenConnect - Update Vendor Restricted Property* [RMM+]](/docs/b634da09-7507-466f-be5e-f7a8d62aacf7) using the ProSync Plugin
   - It is a Duplicate of the [Script - ScreenConnect - Update Custom Property* [RMM+,Param]](/docs/b634da09-7507-466f-be5e-f7a8d62aacf7), just its user parameters are global parameters.

2. Reload the System Cache
   ![Reload the System Cache](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_1.webp)

3. Run the script against any machine to create "Restrict Vendor Access" EDF's, "PropertyIndex" System Properties, "Vendor Restricted - Super Admin" user class, "Restricted vendor Access" search and "Restrict Vendor Access" group
   - Navigate to Automation --> Scripts within the CWA Control Center.
   - Open [ScreenConnect - Update Vendor Restricted Property* [RMM+]](/docs/b634da09-7507-466f-be5e-f7a8d62aacf7) Script
   - Debug script on any machine with parameter `Set_Environment= 1`
   ![Debug script](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_2.webp)

4. After performing the above step, reload the System Cache again otherwise group will cease to open with a permissions error
   ![Reload the System Cache](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_1.webp)

5. With the pieces imported this is where a super admin user must take over.
   - The admin must mark the Extra Data Fields (**Which are only editable if the user has the Super Admin userclass**) for the clients, locations or computers that must be hidden from the Vendor. Please open the target client, location or computer and navigate to the "Info" > "Default" tab.
   ![Navigate to Info > Default tab](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_3.webp)

## CWA User Account

1. Create the user account that you would like to restrict. The typical setup has been outlined below:
   - User Account - PRONOC -
     - Apply the Super Admin - Restrict Vendor Access permission to this account.
       - This is the account the team is trained to use.
   - User Account - PRONOCA - This is our standard US Only Super Admin account.
     - When storing the credentials in ITGlue, apply the "US Resources" ITGlue Group to the password entry. This will hide it for Non-US Based resources.
     ![Store credentials in ITGlue](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_4.webp)

2. Assign the proper permissions to the accounts you just created
   - The Vendor Restricted user should have the newly created user class assigned to it   
     - Vendor Restricted - Super Admin
     ![Vendor Restricted - Super Admin](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_5.webp)
   - The US account can have the full Super Admin rights

3. Assign the proper group membership from the Groups and Clients tab:
   - For the restricted user, the only group that should be in the 'Member of' side is 'All Agents.Restrict Vendor Access'.
     - This is the setting on the user account that hides the restricted clients from the login.
     ![Group membership](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_6.webp)

4. To propagate EDF changes quicker to the restricted accounts, you can force sync the search like shown below:
   - Users with this configuration will perform similarly to the "All Agents" group in Automate, but thanks to the search included in the XML, excludes any clients where the EDF is marked. The 'All Agents.Restricted Vendor Access' group will not display these agents. This will effectively hide all machines at clients where the EDF is marked.
   - These changes can take up to 30 minutes to go into effect. If this needs to happen more quickly, please navigate to the 'All Agents.Restricted Vendor Access' group and force update agents in the group.
   ![Force sync the search](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_7.webp)

## Client Permissions

After following the above steps, we need to add client-level permissions for "Super Admin - Restricted Vendor Access". Follow the below steps to perform it.

1. Find the client you would like to deem the 'Default/Standard' configuration.

2. Make sure to ensure there are no exceptions to the default configuration that will need to get accounted for. Once you clear all of the permissions to begin copying the permissions, you can't view the old data.
   - It is recommended to open/export the 'User Classes - Client Level Permissions Matrix [View]' dataview to allow us to re-create the permissions if asked.

3. Navigate to Automation --> Scripts within the CWA Control Center.
   - Open [ScreenConnect - Update Vendor Restricted Property* [RMM+]](/docs/b634da09-7507-466f-be5e-f7a8d62aacf7) Script
   - Debug script on any machine of the selected CLIENT (From step 1) with parameter `Set_Client_Permissions= 1`
   ![Debug script](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_8.webp)
   This will add `Super Admin - Restricted Vendor Access` UserClass with full permission to that client
   ![UserClass with full permission](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_9.webp)

4. On the client you have deemed to be the 'Default/Standard' permission structure in step 1:
   - Right-click --> Permissions --> Clear All Permissions
   **NOTE:** This will clear ALL client permissions except for the one you are selected on. If there are a lot of clients, _this can lock the system up with no progress bar._ Be patient and wait for the application to become responsive when hovering over things.        
   ![Clear All Permissions](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_10.webp)

5. Next, after the system has cleared the permissions, you should be able to tell things are not frozen by hovering over a client and seeing if it highlights as if you can click on them.
   - Once it is good, right-click the same client and go to Permissions --> Copy Permissions
   ![Copy Permissions](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_11.webp)

6. This will not only copy the permissions from that client everywhere, it will now become the standard default configuration for all newly created/imported clients in the future, eliminating the need to constantly update them through SQL.

## ScreenConnect

1. Make sure you Duplicate the 'All Machines' group and rename the original to 'All Machines (Unrestricted)'.
   ![Duplicate All Machines group](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_12.webp)

2. Create "Vendor Restricted" Custom Property:
   1. Open the Appearance page (Admin --> Appearance)
   2. Type CTRL+F and look for custom property resource strings beginning with the key, `SessionProperty.Custom5.LabelText`.
      - Custom Property slot 1-4 are used by the CWA / CWC plugin. Avoid using them.      
      - Try using the properties between 5-8 that are not already used.
   3. Edit `SessionProperty.Custom5.LabelText`
   4. Enter "Vendor Restricted" in the **Custom** text area. Click **Save Resource** to save
      ![Save Resource](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_13.webp)
   5. Set the visibility of the "Vendor Restricted" Custom Field
      - Just Above `SessionProperty.Custom5.LabelText` you will find `SessionProperty.Custom5.AccessVisible`, Set this property to True.
      ![Set property to True](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_14.webp)
   6. The final setting should look like this:
      ![Final setting](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_15.webp)
      The "Vendor Restricted" property will start displaying like shown below:
      ![Vendor Restricted property](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_16.webp)
      _Note: Use the word "Restricted" to restrict any machine in Screenconnect_

3. Now go to the copied Group 'All Machines'
   - Click on three dots on the right-hand side of the session group.
   - Click on Edit.
   ![Edit Group](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_17.webp)
   - This will open a dialog box,
     - Fill in the `Session Filter:` with `CustomProperty5 <> 'Restricted'` So it will show only machines that are not restricted
       **NOTE:** The number after 'CustomProperty' needs to match the number configured for the solution. 5 is the most common but can be changed.
       ![Session Filter](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_18.webp)

4. Work with the client to set this to 'Restricted' for all machines that need to be removed from vision for vendor
   ![Set to Restricted](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_16.webp)

5. Go to Admin --> Security --> Roles. Clone the Administrator role, rename to 'Administrator (Unrestricted)', and clone again to create a 'Administrator (Vendor Access)' or Administrator depending on the client's needs.
   This sets up admins or other tiered techs.
   ![Clone Administrator role](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_19.webp)

6. Last step is to apply this role and permissions on the newly restricted group:
   ![Apply role and permissions](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_20.webp)

## SC Permissions

Below is the process that will ensure that when the EDFs "Restrict Vendor Access" are checked within automate, it automatically restricts the machines in SC.

1. Import the internal Monitor using ProSync Plugin
   - [Internal Monitor - Automatically Restrict Vendor Machines in SC](/docs/4a4b5a11-8087-4e0a-b2b1-629d07326dd2)

2. Import the following Alert Template using the ProSync plugin:
   - `△ Custom - Execute Script - Update Vendor Restricted Property`

3. Reload the System Cache
   ![Reload the System Cache](/img/docs/48cd317b-4188-4881-b9c3-411cd0323508/image_1.webp)

4. Configure the solution as follows:
   - Navigate to System dashboard --> Config --> Configurations --> System Properties within the CWA Control Center.
     - Fetch "Vendor Restricted" property Index From Screenconnect Portal
     - In the above example we have used `SessionProperty.Custom5.LabelText` so its Property Index will be "5"
       - Set the Correct Value for the System property `PropertyIndex`
     - PropertyValue will automatically be fetched based on the EDF's value. If EDF's are selected and the machine is not restricted in Screenconnect it will automatically restrict it, similarly if any machine is accidentally set to restricted and EDF's are not selected at client or location level, it will automatically revert the changes for that machine.  
   - Navigate to Automation --> Monitors within the CWA Control Center.
     - [CWM - Automate - Internal Monitor - Automatically Restrict Vendor Machines in SC](/docs/4a4b5a11-8087-4e0a-b2b1-629d07326dd2)
       - Configure with the alert template: `△ Custom - Execute Script - Update Vendor Restricted Property`
       - Right-click and Run Now to start the monitor.