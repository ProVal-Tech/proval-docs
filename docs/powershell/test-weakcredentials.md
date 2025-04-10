---
id: '9188a8e9-ba15-45aa-9391-d412866b1ebc'  
slug: /9188a8e9-ba15-45aa-9391-d412866b1ebc  
title: 'Test-WeakCredentials'  
title_meta: 'Test-WeakCredentials'  
keywords: ['weak', 'credentials', 'passwords', 'security']  
description: 'Documentation for the Test-WeakCredentials command to identify users with potentially compromised passwords by querying known password hashes.'  
tags: ['active-directory', 'security']  
draft: false  
unlisted: false  
---  

## Description  
An agnostic method of gathering information on users with potentially compromised passwords by querying currently available comprehensive lists of known password hashes.  

## Requirements  
- PowerShell v5  
- Must be run against an Active Directory domain controller.  

## Usage  
1. Download 7-Zip if needed.  
2. Install the DSInternals module.  
3. Download the selected password list.  
4. Extract and rename the extracted file if necessary.  
5. Get weak passwords and duplicate passwords.  
6. Query for reversible encryption and interactive logon messages.  
7. Format the results into one object.  
8. Clean up the requested files.  
9. Log the results.  
10. Return the created object.  

Downloads the 140MB password dictionary and queries that dictionary for matching hashes found on a domain controller, leaving all files.  
```powershell  
.\Test-WeakCredentials -PWDictSize "Small"  
```  
This will download the 9MB password list, execute the query to compare values, then it will delete the extracted text file and the zipped file.  
```powershell  
.\Test-WeakCredentials -PWDictSize "Tiny" -Cleanup "text,zipped"  
```  
This will download the 12GB password list, execute that query to compare values, then it will delete the text, 7z, 7zip, and the created .xml files.  
```powershell  
.\Test-WeakCredentials -PWDictSize "Large" -Cleanup "All"  
```  

## Parameters  
| Parameter    | Alias | Required | Default | Type     | Description                                                                                                                     |  
| ------------ | ----- | -------- | ------- | -------- | ------------------------------------------------------------------------------------------------------------------------------- |  
| `PWDictSize` | `PDS` | False    | `9MB`   | String   | This parameter specifies the password dictionary you wish to query. It is a valid set of 'Tiny', 'Small', 'Medium', 'Large'. |  
| `Cleanup`    | `C`   | False    |         | String[] | This parameter accepts any combination of its valid set. It is a valid set of 'All', 'Text', 'Zipped'.                       |  

## Output  
PSObject  


