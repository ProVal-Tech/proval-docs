---
id: '281f0b52-80f0-4a8c-842d-e6ebc747884a'
title: 'Search for Files and Folders Script'
title_meta: 'Search for Files and Folders Script'
keywords: ['search', 'files', 'folders', 'regex', 'path']
description: 'This document provides a comprehensive overview of a script designed to search for files and folders on a computer. It allows users to specify a search term using the "ToSearchFor" parameter, supports regex input for advanced searching, and details the process, dependencies, and output of the script.'
tags: ['setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

The script can be used to search for any file or folder on the computer. The name of the file or folder to be searched should be passed to the "ToSearchFor" parameter. It also supports regex input.

For example, to search for the folder "Desktop," you should use the regex "Desktop$" (where "$" represents the end of the string). To find any file with "Desktop" in the path, simply enter "Desktop."  
For regex reference, visit: [https://regexr.com/](https://regexr.com/)

## Sample Run

![Sample Run](../../../static/img/FileFolder---Get/image_1.png)

## Dependencies

The files `Everything.exe` and `es.exe` will be downloaded from ProVal's File Server. Ensure that the following URL and files are not blocked by any antivirus program or ThreatLocker:

- [https://file.provaltech.com/repo/tools/everything.exe](https://file.provaltech.com/repo/tools/everything.exe)
- [https://file.provaltech.com/repo/tools/es.exe](https://file.provaltech.com/repo/tools/es.exe)

## Variables

| Name         | Description              |
|--------------|--------------------------|
| SearchResult | Result of the search     |

#### User Parameters

| Name        | Example      | Required | Description                                             |
|-------------|--------------|----------|---------------------------------------------------------|
| ToSearchFor | //Desktop$   | True     | Name of the file or folder to look for. Use regex for better results. |

## Process

1. Check if the parameter is passed or is blank.
2. Attempt to search for the file or folder inputted in the parameter.
3. Retry the search if it fails, displaying "Please make sure Everything is running." in the output.
4. Log the search result or error accordingly.

## Output

- Script Log
- `@SearchResult@` holds the results.
