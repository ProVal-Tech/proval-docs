---
id: 'cwa-install-perch-log-shipper'
title: 'Install Perch Log Shipper'
title_meta: 'Install Perch Log Shipper with ClientToken or EDF Retrieval'
keywords: ['perch', 'log', 'shipper', 'clienttoken', 'edf', 'installation']
description: 'This document provides a comprehensive guide on installing Perch Log Shipper using either a user-provided ClientToken or retrieving the token from a client level EDF. It includes sample runs, dependencies, implementation details, variables, user parameters, and the process for successful installation.'
tags: ['installation', 'software', 'exclusion', 'token', 'validation', 'download']
draft: false
unlisted: false
---
## Summary

This script will install Perch Log Shipper with either a user provided ClientToken, or the token can be retrieved from a client level edf.

## Sample Run

![Sample Run 1](5078775/docs/11599921/images/16198972)

- Executing the script without setting a ClientToken will result in the script obtaining the token from the Client level EDF.

![Sample Run 2](5078775/docs/11599921/images/16198991)

- Executing the script with a ClientToken specified will utilize the ClientToken bypassing any currently set Client level EDF.

## Dependencies

- [https://cdn.perchsecurity.com/downloads/perch-log-shipper-latest.exe](https://cdn.perchsecurity.com/downloads/perch-log-shipper-latest.exe) must remain a valid download link.

## Implementation

Perch tokens are set in the following location

![Perch Token Location](5078775/docs/11599921/images/16217699)

Exclusions are set at the following locations

![Exclusion Location 1](5078775/docs/11599921/images/16217701)

![Exclusion Location 2](5078775/docs/11599921/images/16217703)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name            | Description                                                                 |
|-----------------|-----------------------------------------------------------------------------|
| PerchToken      | Variable used to hold the Client level EDF value set for the perch installation. |
| ComputerExclude | Variable used to determine if a computer level exclusion is present for this installation. |
| LocationExclude | Variable used to determine if a location level exclusion is present for this installation. |

#### User Parameters

| Name        | Example         | Required | Description                                        |
|-------------|------------------|----------|----------------------------------------------------|
| ClientToken | SomeTokenHere    | False    | The desired token to use for the perch installation. |

## Process

1. Script Info Setup.
2. Validate the desired token.
   1. If a ClientToken is set bypass and use that token.
   2. Get the perchtoken data from the Client level EDF.
3. Check for any computer or location exclusion; if one exists, exit with error.
4. Check for perch log shipper application; if it exists, then exit with error.
5. Download the installer.
6. Verify the install; if failed, exit with error.
7. Run the installer.
8. Verify the installation; if it's not installed, exit with error.

## Output

- Script log


