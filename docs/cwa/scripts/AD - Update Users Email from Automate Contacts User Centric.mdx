---
id: '6344993b-3e75-4bfe-9e28-a7548a14243e'
title: 'Update AD Users Email from Automate Contacts'
title_meta: 'Update AD Users Email from Automate Contacts'
keywords: ['ad', 'email', 'automate', 'billing', 'sync']
description: 'This document details a script designed to update Active Directory users email addresses by matching them with contacts in Automate, facilitating user-centric billing and ensuring accurate email synchronization. The script operates specifically on Domain Controllers and includes a SQL query to retrieve necessary contact information.'
tags: ['active-directory', 'database', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

This script is designed to update AD users where their email addresses have not been entered to match, by name, to contacts in Automate. The purpose is related to User Centric billing so that email addresses can be used to sync users based on the email field.  
**Time Saved by Automation:** 5 Minutes

## Sample Run

**Target:** Domain Controllers  
![Sample Run](../../../static/img/AD---Update-Users-Email-from-Automate-Contacts-User-Centric/image_1.png)

## Dependencies

If billing in CW Manage is not being performed via User-Centric this script may not provide any benefits.

## Variables

- `@LoopCounter@` - This variable is used as part of the SQL data loop that will gather the data by user so it can be inserted into AD.
- `@SQLName@` - This variable is determined by the SQL query in the scripting loop and is the First and Last name of the target user account that will have its email address updated.
- `@sqlemail@` - This variable is determined by the SQL query in the scripting loop and is the email address that will be pushed into the user's AD account.

## Process

This script is targeted for Domain Controllers only! The initial check will cause the script to fail if this is not run against a Domain Controller.  

The script will first start a SQL scripting loop and gather data by running the SQL Query:

```
SELECT contactid,CONCAT(firstname,' ',lastname) AS name, email FROM contacts where email != '' and clientid = %clientid%
```

This query will grab the ContactID, the first and last name, and the email address of contacts in Automate so long as the contact isn't missing an email address and the clientid of the contact is the same as the clientid of the domain controller in Automate.  

From there, the script will go user account by user account and fill out the email address field in AD. The script then runs the following PowerShell:

```
Import-Module ActiveDirectory;Get-ADUser -filter 'Name -like "@sqlname@"'|set-aduser -emailaddress "@sqlemail@"
```

This PS will import the AD module if it is not already there, and then it will get the user's first and last name and then set the user's email address based on the earlier SQL query.  

The script will then verify if there were any errors during the PowerShell run; the script will place the information in the error log, or it will exit with success.  
**NOTE:** The script will continue on after an error and attempt to update the next record in the SQL loop.  

## Output

Script log messages only.











