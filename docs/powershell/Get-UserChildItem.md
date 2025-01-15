---
id: ps-get-userchilditem
title: 'Get-UserChildItem'
title_meta: 'Get-UserChildItem Command'
keywords: ['retrieve', 'user', 'files', 'folders']
description: 'Documentation for the Get-UserChildItem command to query the c:\\users folder for all users, find the relative subfolder you provide, and return the file properties you would find by running "Get-ChildItem".'
tags: ['configuration', 'windows', 'security']
draft: false
unlisted: false
---
## Description
This Script queries the c:\\users folder for all users, finds the relative subfolder you provide and returns the file properties you would find by running "Get-Childitem" for every file in that folder alone or recursively.

## Requirements
- PowerShell v5

## Usage
1. Loop through all children of the Users folder - Excluding Public.
2. Get a base path for each user and append the desired path to the end.
3. Log the search criteria you selected.
4. Get-ChildItem on the path applying all specified parameters.
5. Save the number of results to the log.
6. Return the items found.


Intended to be run in the same manner as Get-ChildItem, and has all the same parameters as that cmdlet, please run this in the same manner you would using that cmdlet knowing that this is tailored to specifically target all user profiles.

Gets all files in the Documents folder for all users.

```powershell
.\Get-UserChildItem.ps1 -Path Documents
```

Gets all files in the Documents folder and all its subfolder's files for all users.

```powershell
.\Get-UserChildItem.ps1 -Path Documents -Recursive
```



## Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `Path`            | `P`   | True      |           | String    | This parameter holds the relative path found after C:\Users\\(userName)\                                           |
| `Recurse`       | `R`   | False     |           | Switch    | Adding -Recursive will tell the script that you are wanting all files recursively.                            |
| `attributes`      | `A`   | False     |           | Flags expression | Gets files and folders with the specified attributes. This parameter supports all attributes and lets you specify complex combinations of attributes. |
| `Depth`           |       | False     |    -1     | Int32     | This parameter was added in PowerShell 5.0 and enables you to control the depth of recursion. By default, `Get-UserChildItem` displays the contents of the parent directory. The Depth parameter determines the number of subdirectory levels that are included in the recursion and displays the contents. |
| `Directory`       | `D`   | False     |           | Switch    | To get a list of directories, use the Directory parameter or the Attributes parameter with the Directory property. You can use the Recurse parameter with Directory . |
| `Exlude`          |       | False     |           | String[]  | Specifies an array of one or more string patterns to be matched as the cmdlet gets child items. Any matching item is excluded from the output. Enter a path element or pattern, such as ` .txt` or `A `. Wildcard characters are accepted.|
| `File`            | `F`   | False     |           | Switch     | To get a list of files, use the File parameter. You can use the Recurse parameter with File.|
| `Filter`          |       | False     |           | String     | Specifies a filter to qualify the Path parameter. The FileSystem (../Microsoft.PowerShell.Core/About/about_FileSystem_Provider.md)provider is the only installed PowerShell provider that supports filters. Filters are more efficient than other parameters. The provider applies filter when the cmdlet gets the objects rather than having PowerShell filter the objects after they're retrieved. The filter string is passed to the .NET API to enumerate files. The API only supports `*` and `?` wildcards.|
| `Force`           |       | False     |           | Switch      |Allows the cmdlet to get items that otherwise can't be accessed by the user, such as hidden or system files. The Force parameter doesn't override security restrictions. Implementation varies among providers. For more information, see about_Providers (../Microsoft.PowerShell.Core/About/about_Providers.md). |
| `Hidden`          |  `H`  | False     |           | Switch      | To get only hidden items, use the Hidden parameter or the Attributes parameter with the Hidden property. By default, `Get-ChildItem` doesn't display hidden items. Use the Force parameter to get hidden items.|
| `Include`         |       | False     |           | String[]    | Specifies an array of one or more string patterns to be matched as the cmdlet gets child items. Any matching item is included in the output. Enter a path element or pattern, such as `"*.txt"`. Wildcard characters are permitted. The Include parameter is effective only when the command includes the contents of an item, such as `C:\Windows*`, where the wildcard character specifies the contents of the `C:\Windows` directory. The Include and Exclude parameters can be used together. However, the exclusions are applied after the inclusions, which can affect the final output. |
| `Name`            |       | False     |           | Switch        | Gets only the names of the items in the location. The output is a string object that can be sent down the pipeline to other commands. Wildcards are permitted.|
| `ReadOnly`        |       | False     |           | Switch        | To get only read-only items, use the ReadOnly parameter or the Attributes parameter ReadOnly property.|
| `System`          |       | False     |           | Switch        | Gets only system files and directories. To get only system files and folders, use the System parameter or Attributes parameter System property.|



## Output
    
    System Array - Including the exact outputs you would receive by running Get-childitem.
    
    .\Get-UserChildItem-log.txt
    




