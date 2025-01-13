---
id: 'rmm-smb1-detection-monitor'
title: 'SMB1 Detection Monitor Setup'
title_meta: 'SMB1 Detection Monitor Setup'
keywords: ['smb1', 'monitor', 'detection', 'scripting', 'rmm']
description: 'This document provides a step-by-step guide for setting up a monitor to check whether SMB1 is enabled on end machines. It details the necessary configurations, script implementation, and conditions for effective monitoring using RMM tools.'
tags: ['monitor', 'scripting', 'configuration', 'alert', 'windows']
draft: false
unlisted: false
---
## Summary

This monitor checks whether the SMB1 is enabled on the end machine or not. It runs the OS version [compatible command](https://learn.microsoft.com/en-us/windows-server/storage/file-server/troubleshoot/detect-enable-and-disable-smbv1-v2-v3?tabs=server#how-to-detect-status-enable-and-disable-smb-protocols) to fetch the data.

## Monitor

1. Go to Alert Management > Monitors > Add monitor  
   ![Image 1](..\..\..\static\img\-SMB1-Detection\image_1.png)  
   ![Image 2](..\..\..\static\img\-SMB1-Detection\image_2.png)  

2. This screen will appear.  
   ![Image 3](..\..\..\static\img\-SMB1-Detection\image_3.png)  

3. Fill the Name and Description boxes.  
   **Name:** SMB1 Detection  
   **Description:** Check whether the SMB1 is enabled on the end machine or not.  

   Select `Script` as `Type`, `RMM Agent` for the `Family`, and `Others` or any relevant option for the `Severity`.  
   ![Image 4](..\..\..\static\img\-SMB1-Detection\image_4.png)  

4. In conditions selection, select Powershell in the Script Language, select Schedule in Run Script on, type 167 hours in Repeat every. Add the following query in the Script box:  
   ```powershell
   $ErroractionPreference= 'SilentlyContinue';  
   $ver = [Version](get-WmiObject -Class Win32_OperatingSystem).version;  
   "$($ver.Major).$($ver.Minor)";  
   if($ver -ge [version]'6.3') {  
       if ( ( (Get-SmbServerConfiguration).EnableSMB1Protocol ) -ne 'True') {  
           return 'False'  
       } else {  
           return 'True'  
       }  
   } else {  
       $s = (Get-Item HKLM:\\SYSTEM\\CurrentControlSet\\Services\\LanmanServer\\Parameters | ForEach-Object {Get-ItemProperty $_.pspath -Name SMB1});  
       if ( ( -not $s ) -or ( $s -contains 1 )) {  
           return 'True'  
       } else {  
           return 'False'  
       }  
   }
   ```  

   In Criteria select `Contains`, `AND`  
   Enter `True` in Script output.  
   The Conditions Section should look something like this:  
   ![Image 5](..\..\..\static\img\-SMB1-Detection\image_5.png)  

5. Select `Run same script as above` condition for the Ticket Resolution section. Select `Contains`, `AND` for criteria. Enter `False` in Script Output.  
   Ticket Resolution should look something like this:  
   ![Image 6](..\..\..\static\img\-SMB1-Detection\image_6.png)  

6. Select the Resources/Clients to apply the monitor set against.  
   ![Image 7](..\..\..\static\img\-SMB1-Detection\image_7.png)  

7. This is how the monitor set should look before saving it.  
   ![Image 8](..\..\..\static\img\-SMB1-Detection\image_8.png)  
   **![Image 9](..\..\..\static\img\-SMB1-Detection\image_9.png)**  

8. Click the `Save` button to save the monitor set.


