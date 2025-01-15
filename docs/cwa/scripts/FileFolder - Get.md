---
id: '281f0b52-80f0-4a8c-842d-e6ebc747884a'
title: 'Search for Files and Folders Script'
title_meta: 'Search for Files and Folders Script'
keywords: ['search', 'files', 'folders', 'regex', 'path']
description: 'This document provides a comprehensive overview of a script designed to search for files and folders on a computer. It allows users to specify a search term using the "ToSearchFor" parameter, supports regex input for advanced searching, and details the process, dependencies, and output of the script.'
tags: ['configuration', 'setup', 'windows', 'software']
draft: false
unlisted: false
---
## Summary

The script can be used to search for any file or folder on the computer. The name of the File/Folder to be searched should be passed to the "ToSearchFor" Parameter. It supports the Regex input as well.

e.g., To search for all the available "Desktop" namely folder "Desktop$" ("$" represents the end of string) should be used. For "Desktop", it will output the path to each and every file with "Desktop" in the path.  
For regex reference: [https://regexr.com/](https://regexr.com/)

## Sample Run

![Sample Run](../../../static/img/FileFolder---Get/image_1.png)

## Dependencies

Everything.exe and es.exe will be downloaded from ProVal's File Server. So, the following URL and files should not be blocked by any AV program or ThreatLocker:

- [https://file.provaltech.com/repo/tools/everything.exe](https://file.provaltech.com/repo/tools/everything.exe)
- [https://file.provaltech.com/repo/tools/es.exe](https://file.provaltech.com/repo/tools/es.exe)

## Variables

| Name         | Description              |
|--------------|--------------------------|
| SearchResult | Result of the search     |

#### User Parameters

| Name        | Example      | Required | Description                                             |
|-------------|--------------|----------|---------------------------------------------------------|
| ToSearchFor | //Desktop$   | True     | Name of the file or folder to look for. Use Regex for a better result |

## Process

1. Check if the parameter is passed or is blank.
2. Attempt to search for the File/Folder inputted in the parameter.
3. Retry with the search, if it fails to search with "Please make sure Everything is running." in output.
4. Logs the search result or error accordingly.

## Output

- Script Log
- @SearchResult@ holds the results.







