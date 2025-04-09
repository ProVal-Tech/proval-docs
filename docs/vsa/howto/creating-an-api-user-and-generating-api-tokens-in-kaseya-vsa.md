---
id: 3d6fedad-5cd1-47d6-b136-8c9fb3a092ba
slug: /3d6fedad-5cd1-47d6-b136-8c9fb3a092ba
title: 'Creating an API User and Generating API Tokens in Kaseya VSA'
title_meta: 'Creating an API User and Generating API Tokens in Kaseya VSA'
keywords: ['kaseya', 'api', 'user', 'token', 'vsa']
description: 'This document provides a step-by-step guide on how to create an API user and generate API tokens in Kaseya VSA. It includes instructions for setting up the user, generating tokens, and saving credentials securely.'
tags: ['kaseya', 'api', 'user', 'token', 'vsa']
draft: false
unlisted: false
---

## Creating the API User
1. Log into the Client VSA and navigate to System > Server Management > Default Settings.
2. Take note of the current setting "Require email address for user name". If this is set to 'Yes', change this setting to No.
    ![image](/static/img/3d6fedad-5cd1-47d6-b136-8c9fb3a092ba/image1.png)
3. Next, go to System > Users.
4. Click "New"
5. Enter the following information in the fields:
    - Email Address: support@provaltech.com
    - Initial Role: Master or System
    - Initial Scope: Master or System
    - First Name: API
    - Last name: Service
    - Staff Org: Select the Client's internal Organization
    - Staff Dept: Select the Client's internal Department
    - Staff member: Leave the default "--Create new staff member--"
    - User Name: provalApi
    - Password: 
        - Generate a random 16char + password in ITGlue
    - Confirm Password: Enter the same password as above.
    - Require Password change at next login: Leave unchecked.
6. Click Save.
7. Save these credentials in an ITG password as "Kaseya - API"

    ![image](/static/img/3d6fedad-5cd1-47d6-b136-8c9fb3a092ba/image2.png)

## Generating API Tokens
1. Now that the API User is created, select it in the list and click on the "Access Tokens" tab at the right.

2. Click New and fill the following properties:
    - Token Name: REST API
    - Expires after the date: Leave Blank
    - Scopes Assigned: Check ONLY "REST API (Read, Write)"

    ![image](/static/img/3d6fedad-5cd1-47d6-b136-8c9fb3a092ba/image3.png)
3. Click Save
4. Once you click save, the token window will pop up. Copy the token to the clipboard, and IMMEDIATELY save this information in the ITGlue API User you created earlier in the process, in the Notes field, as: `REST API Token: TOKEN`
    
    ![image](/static/img/3d6fedad-5cd1-47d6-b136-8c9fb3a092ba/image4.png)

5. Once that's done, close the token window, and click "New" again. We will now create a Data Warehouse token. Fill the following properties:
    - Token Name: DataWarehouse API
    - Expires after the date: Leave Blank
    - Scopes Assigned: Check ONLY "Data Warehouse API (Read, Write)"
        
6. Click Save
7. Once you click save, the token window will pop up. Copy the token to the clipboard, and IMMEDIATELY save this information in the ITGlue API User you created earlier in the process, in the Notes field, as: `DW API Token: TOKEN`