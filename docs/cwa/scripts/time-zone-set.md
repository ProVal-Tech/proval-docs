---
id: '89fafb58-91d4-48de-a65d-dafa185bc63b'
slug: /89fafb58-91d4-48de-a65d-dafa185bc63b
title: 'Time Zone - Set'
title_meta: 'Time Zone - Set'
keywords: ['time', 'zone', 'script', 'windows', 'configuration']
description: 'This document outlines a script that sets the time zone on a Windows machine based on user input. It verifies the current time zone, compares it with the desired time zone, and makes the necessary adjustments while ensuring the changes are accepted by the system.'
tags: ['setup', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script will set the time zone to the user-specified time zone.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/89fafb58-91d4-48de-a65d-dafa185bc63b/image_1.webp)

## Dependencies

An appropriate time zone must be entered by the user.

## Variables

`@ShellResult@` - Used to verify results throughout the script.

### User Parameters

| Name          | Example                   | Required | Description                                                                                                                                                 |
|---------------|---------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `@TimeZone@`  | Central Standard Time     | True     | The desired time zone of the target endpoint. All available variables are listed at the bottom of the document, as well as the script notes in Automate. |

## Process

The script will first verify the current time zone of the machine and compare that with the user parameter. If there is no change required, the script will exit with a message indicating that the time zone is already set to the user's submitted parameter.

If the current time zone does not match the user parameter, the script will run the command line function `tzutil` available in Windows to set the desired time zone.

The script will verify that the new time zone has been accepted by the system and will exit successfully if the new time zone was set as intended.

If the time zone is not accepted, the script will exit with an error message.

## Output

- Script log

## Available User Parameters

- Dateline Standard Time  
- UTC-11  
- Aleutian Standard Time  
- Hawaiian Standard Time  
- Marquesas Standard Time  
- Alaskan Standard Time  
- UTC-09  
- Yukon Standard Time  
- Pacific Standard Time (Mexico)  
- UTC-08  
- Pacific Standard Time  
- US Mountain Standard Time  
- Mountain Standard Time (Mexico)  
- Mountain Standard Time  
- Central America Standard Time  
- Central Standard Time  
- Easter Island Standard Time  
- Central Standard Time (Mexico)  
- Canada Central Standard Time  
- SA Pacific Standard Time  
- Eastern Standard Time (Mexico)  
- Eastern Standard Time  
- Haiti Standard Time  
- Cuba Standard Time  
- US Eastern Standard Time  
- Turks and Caicos Standard Time  
- Paraguay Standard Time  
- Atlantic Standard Time  
- Venezuela Standard Time  
- Central Brazilian Standard Time  
- SA Western Standard Time  
- Pacific SA Standard Time  
- Newfoundland Standard Time  
- Tocantins Standard Time  
- E. South America Standard Time  
- SA Eastern Standard Time  
- Argentina Standard Time  
- Greenland Standard Time  
- Montevideo Standard Time  
- Magallanes Standard Time  
- Saint Pierre Standard Time  
- Bahia Standard Time  
- UTC-02  
- Azores Standard Time  
- Cape Verde Standard Time  
- UTC  
- GMT Standard Time  
- Greenwich Standard Time  
- Sao Tome Standard Time  
- Morocco Standard Time  
- W. Europe Standard Time  
- Central Europe Standard Time  
- Romance Standard Time  
- Central European Standard Time  
- W. Central Africa Standard Time  
- Jordan Standard Time  
- GTB Standard Time  
- Middle East Standard Time  
- Egypt Standard Time  
- E. Europe Standard Time  
- Syria Standard Time  
- West Bank Standard Time  
- South Africa Standard Time  
- FLE Standard Time  
- Israel Standard Time  
- Kaliningrad Standard Time  
- Sudan Standard Time  
- Libya Standard Time  
- Namibia Standard Time  
- Arabic Standard Time  
- Turkey Standard Time  
- Arab Standard Time  
- Belarus Standard Time  
- Russian Standard Time  
- E. Africa Standard Time  
- Iran Standard Time  
- Arabian Standard Time  
- Astrakhan Standard Time  
- Azerbaijan Standard Time  
- Russia Time Zone 3  
- Mauritius Standard Time  
- Saratov Standard Time  
- Georgian Standard Time  
- Volgograd Standard Time  
- Caucasus Standard Time  
- Afghanistan Standard Time  
- West Asia Standard Time  
- Ekaterinburg Standard Time  
- Pakistan Standard Time  
- Qyzylorda Standard Time  
- India Standard Time  
- Sri Lanka Standard Time  
- Nepal Standard Time  
- Central Asia Standard Time  
- Bangladesh Standard Time  
- Omsk Standard Time  
- Myanmar Standard Time  
- SE Asia Standard Time  
- Altai Standard Time  
- W. Mongolia Standard Time  
- North Asia Standard Time  
- N. Central Asia Standard Time  
- Tomsk Standard Time  
- China Standard Time  
- North Asia East Standard Time  
- Singapore Standard Time  
- W. Australia Standard Time  
- Taipei Standard Time  
- Ulaanbaatar Standard Time  
- Aus Central W. Standard Time  
- Transbaikal Standard Time  
- Tokyo Standard Time  
- North Korea Standard Time  
- Korea Standard Time  
- Yakutsk Standard Time  
- Cen. Australia Standard Time  
- AUS Central Standard Time  
- E. Australia Standard Time  
- AUS Eastern Standard Time  
- West Pacific Standard Time  
- Tasmania Standard Time  
- Vladivostok Standard Time  
- Lord Howe Standard Time  
- Bougainville Standard Time  
- Russia Time Zone 10  
- Magadan Standard Time  
- Norfolk Standard Time  
- Sakhalin Standard Time  
- Central Pacific Standard Time  
- Russia Time Zone 11  
- New Zealand Standard Time  
- UTC+12  
- Fiji Standard Time  
- Chatham Islands Standard Time  
- UTC+13  
- Tonga Standard Time  
- Samoa Standard Time  
- Line Islands Standard Time  