---
id: 'cwa-sentinelone-agent-deployment'
title: 'SentinelOne Agent Deployment'
title_meta: 'SentinelOne Agent Deployment'
keywords: ['sentinelone', 'agent', 'deployment', 'token', 'installation']
description: 'This document provides a comprehensive guide for deploying the SentinelOne agent, detailing the use of agent tokens at various levels, implementation instructions, and process steps to ensure successful installation and configuration.'
tags: ['installation', 'security', 'software', 'configuration', 'windows']
draft: false
unlisted: false
---
## Summary

Deploys the SentinelOne agent with an agent token set at either the Global, Client, or Script level.

## Sample Run

![Sample Run 1](5078775/docs/11599920/images/16198808)

- Running in this manner with No token will result in the script attempting the client level token edf value, and if this is not set it will grab the System property token value to process the request.

![Sample Run 2](5078775/docs/11599920/images/16198827)

- Adding a token to the Token parameter will trump all client level tokens and global property tokens, and use the provided token as the means to process the request.

## Dependencies

- The following links must remain valid or change to reflect any changes in this download made by Connectwise:
  - [SentinelOneAgent-Windows_64bit.msi](https://cwa.connectwise.com/tools/sentinelone/SentinelOneAgent-Windows_64bit.msi)
  - [SentinelOneAgent-Windows_32bit.msi](https://cwa.connectwise.com/tools/sentinelone/SentinelOneAgent-Windows_32bit.msi)

## Implementation

Global Parameter Set instructions:

1. Sync the following proval script [CWM - Automate - Script - Property - Set](https://proval.itglue.com/DOC-5078775-11420461).
2. Run [CWM - Automate - Script - Property - Set](https://proval.itglue.com/DOC-5078775-11420461) with the following parameters:
   - Name: SentinelOneDefaultToken
   - Type: Global
   - Value: [Your Default SentinelOne Token]
   - Overwrite can be left blank or change it to 1 if you believe you already may have a SentinelOneDefaultToken global parameter.
3. Sync and run this script.

Client level tokens can be set in the following client edf location:

![Client EDF Location](5078775/docs/11599920/images/16217674)

Exclusions can be set in the following locations:

![Exclusion Location 1](5078775/docs/11599920/images/16217679)

![Exclusion Location 2](5078775/docs/11599920/images/16217693)

## Variables

| Name           | Description                                                                                           |
|----------------|-------------------------------------------------------------------------------------------------------|
| S1SiteToken    | Variable holder for a site token from either the client level edf or the system property.            |
| ComputerExclude| Variable holder to check for a computer level exclusion to the installation.                         |
| LocationExclude| Variable holder to check for a location level exclusion to the installation.                         |

#### User Parameters

| Name   | Example          | Required | Description                                                                                 |
|--------|------------------|----------|---------------------------------------------------------------------------------------------|
| Token  | Sometokenhere    | False    | Use this parameter to bypass Client EDF tokens and global property tokens for this installation. |

## Process

1. Ensure software is not already installed; exit if it is.
2. Determine the necessary token:
   1. Check the client level edf first; this trumps the global set parameter.
   2. If a client level edf is not set, get the global set parameter.
   3. If that is not set, then exit with error.
3. Check for any computer level exclusion; if one exists, exit with error.
4. Check for any location level exclusion; if one exists, exit with error.
5. Download the installer to the `C:\Windows\ltsvc\SentinelOne` folder.
6. Verify the download; if not downloaded, exit with error.
7. Install SentinelOne.
8. Verify installation success; if not successful, then exit with error.

## Output

- Script log

