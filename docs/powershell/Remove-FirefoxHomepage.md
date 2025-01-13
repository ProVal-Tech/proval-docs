---
id: ps-remove-firefoxhomepage
title: 'Remove-FirefoxHomepage'
title_meta: 'Remove-FirefoxHomepage Command'
keywords: ['remove', 'homepage', 'firefox', 'browser']
description: 'Documentation for the Remove-FirefoxHomepage command to remove the homepage from the Firefox browser.'
tags: ['configuration', 'firefox', 'web-browser']
draft: false
unlisted: false
---
## Description
Removes the homepage from the Firefox browser.

## Usage
1. verifies the policy exists, if it does not exits.
2. removes any set policy for the homepage.



```powershell
.\Remove-FirefoxHomepage.ps1
```
This will remove all homepage policies from the policies.json file.

## Output

    .\Remove-FirefoxHomepage-log.txt

