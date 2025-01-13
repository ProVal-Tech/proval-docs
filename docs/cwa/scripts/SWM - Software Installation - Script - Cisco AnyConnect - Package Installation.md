---
id: 'cwa-install-cisco-anyconnect'
title: 'Install Cisco AnyConnect'
title_meta: 'Install Cisco AnyConnect'
keywords: ['cisco', 'anyconnect', 'install', 'script', 'edf']
description: 'This document provides a comprehensive guide on installing Cisco AnyConnect along with its desired components using an agnostic script. It includes argument options, implementation steps, sample runs, dependencies, user parameters, and the overall process of execution.'
tags: ['installation', 'configuration', 'security', 'software']
draft: false
unlisted: false
---
## Summary

This script will install Cisco AnyConnect and any of its desired components.

This utilizes the related Install-Anyconnect agnostic script.

Ignore parameters -
- ClientID (Gathered from EDF)
- Fingerprint (Gathered from EDF)
- OrgId (Gathered from EDF)

### Argument options
- -Amp
- -Dart
- -Gina
- -Nam
- -Nvm
- -IsePosture
- -Posture
- -Umbrella (Requires Client ID, Org ID, and Fingerprint in the agnostic script, however this will be set to the client's EDF)
- -ALL (Requires Client ID, Org ID, and Fingerprint in the agnostic script, however this will be set to the client's EDF)

---

## Implementation

- Set up the Client Level EDF

![Client Level EDF](..\..\..\static\img\SWM---Software-Installation---Script---Cisco-AnyConnect---Package-Installation\image_1.png)

- The OpenDNS_EnabledClient checkbox can be utilized to automatically execute this script if desired.

---

## Sample Run

Install All Cisco AnyConnect packages.

![Install All Packages](..\..\..\static\img\SWM---Software-Installation---Script---Cisco-AnyConnect---Package-Installation\image_2.png)

Install specific AnyConnect packages

![Install Specific Packages](..\..\..\static\img\SWM---Software-Installation---Script---Cisco-AnyConnect---Package-Installation\image_3.png)

---

## Dependencies

- Please reference Agnostic content document for more information 

---

## Variables

| Name        | Description                                                 |
|-------------|-------------------------------------------------------------|
| OrgID       | The ID set in the client level opendns EDF under orgID    |
| Fingerprint | The fingerprint set in the client level opendns EDF under fingerprint |
| Client      | The userID set in the client level opendns EDF under clientID |

#### User Parameters

| Name      | Example                     | Required | Description                                                                                                                                                                                                                                                                                                                                                   |
|-----------|-----------------------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Arguments | -All<br>-Dart -Amp -Umbrella | False    | This is the argument you would pass to the Install-AnyConnect Agnostic script as you would pass them.<br>You may ignore the ClientID, OrgID, and Fingerprint parameter in all cases as the script will add the corresponding EDF value as that parameter value during the processing of this installation.<br>Providing a ClientID, OrgID, and Fingerprint or any combination of those in the Arguments user parameter will overwrite any EDF value set at the client level. |

---

## Process

1. Get the fingerprint, orgid, and client from the client level EDF.
2. Check if the Argument is not All or Umbrella; if it is not, use the arguments as is.
3. Check if the Argument does not contain umbrella; if it does not, use the arguments as is.
4. Check if the Argument contains -ClientID; if it does not, add it using the EDF.
5. Check if the Argument contains -OrgID; if it does not, add it using the EDF.
6. Check if the Argument contains -Fingerprint; if it does not, add it using the EDF.
7. Run the agnostic script with the required arguments.

---

## Output

- Script log


