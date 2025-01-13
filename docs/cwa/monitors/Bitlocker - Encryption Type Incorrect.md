---
id: 'cwa-bitlocker-monitoring'
title: 'Bitlocker Monitoring Script Overview'
title_meta: 'Bitlocker Monitoring Script Overview'
keywords: ['bitlocker', 'monitoring', 'encryption', 'security', 'compliance']
description: 'This document provides an overview of a Bitlocker monitoring script that identifies target machines based on specific conditions related to Bitlocker settings and client configurations. It includes SQL queries, dependencies, and guidelines for targeting the Bitlocker solution.'
tags: ['encryption', 'security', 'compliance', 'monitoring', 'database']
draft: false
unlisted: false
---
## Summary

This monitor will return any target machine whose client has the 'Bitlocker Monitoring' EDF checked, and the target's 'Bitlocker Monitoring Exclusion' is not checked, and its 'C' drive is listed as a mount point in 'plugin_proval_bitlocker_audit' under the following conditions:

- If the client level 'Bitlocker XTS-AES 256' edf is checked and the value for Encryption Method is not NONE and not 'XtsAes256' then return that target.
- If the client level 'Bitlocker XTS-AES 256' edf is not checked and the value for Encryption Method is not NONE and not 'Aes256' then return that target.

## Dependencies

- [SEC - Encryption - Custom Table - plugin_proval_bitlocker_audit](https://proval.itglue.com/DOC-5078775-8943520)
- [SEC - Encryption - Solution - Bitlocker](https://proval.itglue.com/DOC-5078775-8953721)

## Target

Please follow the recommended target for the bitlocker solution.

## Translated SQL

```
SELECT 
   ppba.EncryptionMethod as TestValue,
   computers.name as IdentityField,
   computers.computerid,
   clients.name as `Client Name`,
   computers.domain as `Computer Domain`,
   computers.username as `Computer User`,
   IFNULL(IFNULL(edfAssigned1.Value,edfDefault1.value),'0') as `Computer - Client - Extra Data Field - Security Compliance - Bitlocker Monitoring`,
   IFNULL(IFNULL(edfAssigned2.Value,edfDefault2.value),'0') as `Computer - Extra Data Field - Security Compliance - Bitlocker Monitoring Exclusion`,
   IFNULL(IFNULL(edfAssigned3.Value,edfDefault3.value),'0') as `Computer - Client - Extra Data Field - Security Compliance - Bitlocker XTS-AES 256`,
   ppba.MountPoint,
   a.noalerts,
   a.uptimestart,
   a.uptimeend,
   computers.DateAdded
FROM Computers 
LEFT JOIN inv_operatingsystem ON (Computers.ComputerId=inv_operatingsystem.ComputerId)
LEFT JOIN Clients ON (Computers.ClientId=Clients.ClientId)
LEFT JOIN Locations ON (Computers.LocationId=Locations.LocationID)
LEFT JOIN plugin_proval_bitlocker_audit ppba ON computers.ComputerID = ppba.ComputerID
LEFT JOIN agentcomputerdata a ON computers.computerid = a.computerid
LEFT JOIN ExtraFieldData edfAssigned1 ON (edfAssigned1.id=Clients.ClientId and edfAssigned1.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE `Name` = 'Bitlocker Monitoring'))
LEFT JOIN ExtraFieldData edfDefault1 ON (edfDefault1.id=0 and edfDefault1.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE `Name` = 'Bitlocker Monitoring'))
LEFT JOIN ExtraFieldData edfAssigned3 ON (edfAssigned3.id=Clients.ClientId and edfAssigned3.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE `Name` = 'Bitlocker XTS-AES 256'))
LEFT JOIN ExtraFieldData edfDefault3 ON (edfDefault3.id=0 and edfDefault3.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE `Name` = 'Bitlocker XTS-AES 256'))
LEFT JOIN ExtraFieldData edfAssigned2 ON (edfAssigned2.id=Computers.ComputerId and edfAssigned2.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE `Name` = 'Bitlocker Monitoring Exclusion'))
LEFT JOIN ExtraFieldData edfDefault2 ON (edfDefault2.id=0 and edfDefault2.ExtraFieldId =(Select ExtraField.id FROM ExtraField WHERE LTGuid='Bitlocker Monitoring Exclusion'))
WHERE 
((((IFNULL(IFNULL(edfAssigned1.Value,edfDefault1.value),'0')<>0) AND (IFNULL(IFNULL(edfAssigned2.Value,edfDefault2.value),'0')=0)))) 
AND ( 
   (ppba.MountPoint = 'C:')
   AND (
       Case  When (IFNULL(IFNULL(edfAssigned3.Value,edfDefault3.value),'0') = 1) Then
       (ppba.`EncryptionMethod` != 'NONE' AND ppba.`EncryptionMethod` != 'XtsAes256')
       ELSE (ppba.`EncryptionMethod` != 'NONE' AND ppba.`EncryptionMethod` != 'Aes256')
       END
   ) 
) AND (
       computers.DateAdded < DATE_SUB(NOW(), INTERVAL 7 DAY )
)
```

## Ticketing

![Ticketing Image](..\..\..\static\img\Bitlocker---Encryption-Type-Incorrect\image_1.png)


