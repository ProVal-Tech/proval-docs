---
id: '5059a874-fdcd-4b78-989f-a0fd5184d7ce'
title: 'ClearAudit Browsers Saved Password'
title_meta: 'ClearAudit Browsers Saved Password'
keywords: ['custom', 'fields', 'dynamic', 'groups', 'browser', 'saved', 'password', 'audit', 'task']
description: 'This document describes the custom fields used in the creation of Dynamic Groups for Browser Saved Passwords and their application in the Task for Clearing and Auditing Browser Saved Passwords. It includes details about each field, its purpose, and implementation steps.'
tags: ['security', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The custom fields described here are used in the creation of [Dynamic Groups - Browser Saved Password](<../groups/Browser Saved Password.md>) and are utilized in the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286).

## Dependencies

- [Dynamic Groups - Browser Saved Password](<../groups/Browser Saved Password.md>)
- [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286)

## Details

| Field Name                               | Level    | Type  | Default | Editable | Description                                                                                                                                                                 |
|------------------------------------------|----------|-------|---------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Browser Saved Pwd Audit Only             | Endpoint | Flag  | No      | Yes      | This will allow the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286) to audit only on the endpoint.                          |
| Browser Saved Pwd Audit Only             | Company  | Flag  | No      | Yes      | This field will allow the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286) to audit only rather than delete it on the endpoints of the company. |
| Exclude Browser Saved Pwd Audit          | Endpoint | Flag  | No      | Yes      | This will exclude the endpoint from executing the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286).                             |
| Exclude Browser Saved Pwd Audit          | Site     | Flag  | No      | Yes      | This will exclude the site endpoints from executing the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286).                   |
| Clear Browser Saved Pwd                  | Company  | Flag  | No      | Yes      | This will allow the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286) to perform the saved password clearance from the browsers on company endpoints. |
| Clear Browser Saved Pwd                  | Endpoint | Flag  | No      | Yes      | This will allow the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286) to perform the saved password clearance from the browsers of the endpoint. |
| Exclude Clear Browser Saved Pwd          | Site     | Flag  | No      | Yes      | This will deny the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286) from performing the saved password clearance from the browsers of the site endpoints. |
| Exclude Clear Browser Saved Pwd          | Endpoint | Flag  | No      | Yes      | This will deny the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286) from performing the saved password clearance from the browsers of the endpoint. |
| Browser Saved Pwd Audit Data             | Endpoint | Text  |         | No       | This stores the audit result of the [Task - Clear/Audit - Browser Saved Password](https://proval.itglue.com/DOC-5078775-17309286).                                      |

## Implementation

1. Navigate to **Settings** -> **Custom Fields**:  
   ![Navigate to Custom Fields](../../../static/img/ClearAudit-Browsers-Saved-Password/image_1.png)

2. Click on the **Add** button once the Custom Fields page is opened.  
   ![Click Add Button](../../../static/img/ClearAudit-Browsers-Saved-Password/image_2.png)

3. After clicking **Add**, you will see the fields below to be filled:  
   ![Fields to Fill](../../../static/img/ClearAudit-Browsers-Saved-Password/image_3.png)

4. Enter the values provided above one by one and save the custom fields.  
   Once the custom fields are created, please validate them by searching for them in the search input text field provided in the custom fields:  
   ![Search Custom Fields](../../../static/img/ClearAudit-Browsers-Saved-Password/image_4.png)  
   It will show you the custom fields you created.



