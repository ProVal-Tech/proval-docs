---
id: '615b14aa-fee1-4eeb-9e5f-02ad695317d9'  
title: 'Remove-FirefoxHomepage'  
title_meta: 'Remove-FirefoxHomepage'  
keywords: ['remove', 'homepage', 'firefox', 'browser']  
description: 'Documentation for the Remove-FirefoxHomepage command to remove the homepage from the Firefox browser.'  
tags: ['firefox', 'web-browser']  
draft: false  
unlisted: false  
---  

## Description  
Removes the homepage from the Firefox browser.  

## Usage  
1. Verifies if the policy exists; if it does not exist, it will notify the user.  
2. Removes any set policy for the homepage.  

```powershell  
.\Remove-FirefoxHomepage.ps1  
```  
This will remove all homepage policies from the policies.json file.  

## Output  

    .\Remove-FirefoxHomepage-log.txt  



