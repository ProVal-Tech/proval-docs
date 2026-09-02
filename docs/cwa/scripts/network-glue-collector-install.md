---
id: '11b30dcb-74c1-4736-a495-5908ce17117a'
slug: /11b30dcb-74c1-4736-a495-5908ce17117a
title: 'Network Glue Collector - Install'
title_meta: 'Network Glue Collector - Install'
keywords: ['network', 'glue', 'collector', 'installation', 'client', 'activation', 'deployment']
description: 'This document provides detailed instructions for installing the NetworkGlue Collector, including requirements for the client-specific activation key and the necessary URL for the installer. It outlines user and global parameters, the process for installation, and ticketing information for failed installations.'
tags: ['deployment', 'installation', 'software', 'ticketing']
draft: false
unlisted: true
last_update:
  date: 2026-02-26
---

## Summary
This document provides detailed instructions for installing the NetworkGlue Collector, including requirements for the client-specific activation key and the necessary URL for the installer. It outlines user and global parameters, the process for installation, and ticketing information for failed installations.

## Sample Run

![Sample Run](../../../static/img/docs/11b30dcb-74c1-4736-a495-5908ce17117a/image1.webp)

## Dependencies

- [Solution - Application - Network Glue Collector](/docs/2aceee46-2a96-465d-929d-85de69811a3a)
- [Internal Monitor - ProVal Production - Network Glue - Deployment](/docs/4e0f7314-bf88-44de-a162-139c191e6e09)

#### Global Parameters

| Name                     | Example                             | Required | Description                                                               |
|--------------------------|-------------------------------------|----------|---------------------------------------------------------------------------|
| URL  | https://s3.amazonaws.com/networkdetective/download/NetworkGlueCollector.msi | True    | MSI URL link to install Network Glue Collector|


#### User Parameters

| Name                     | Example                             | Required | Description                                                               |
|--------------------------|-------------------------------------|----------|---------------------------------------------------------------------------|
| Activation Key   | &!GHGSDG$#SHJG7668717%  | False    | This is required to be set with the individual clients activation key found in their IT Glue Networks page to enable auto deployment. |
| Set_Environment  | 1 | 	True (for first execution)   | Run the script with the Set_Environment parameter set to 1 to create the EDFs used by the solution. |

## EDFs

| Name                        | Level   | Type  | Editable | Description                                                                                                                         |
|-----------------------------|---------|-------|----------|-------------------------------------------------------------------------------------------------------------------------------------|
| Network Glue Activation Key  | Client  | Text  | Yes      | This is required to be set with the individual clients activation key found in their IT Glue Networks page to enable auto deployment. |

## Output

- Script Logs
- Ticketing

## Ticketing

<B>Subject</B> :   
```
SW - Network Glue Collector failed to install on %computername%
```

<B>Body</B> :   
```
Network Glue Collector installation failed on %CLIENTNAME%\%COMPUTERNAME% at %LOCATIONNAME%. Please review the log below:

@ErrorLog@.
```

<B>Comment</B> : 
```
Network Glue Collector installation failed again on the %computername% of %clientname%\%locationname%. Please review the log below:

@ErrorLog@.
```

## Changelog

### 2026-02-26

- Fixed the document as it was missing the content.
- Signed the powershell script used in the script.
- Updated script to auto close ticket.
- Added set_environment parameter to create EDFs in a new environment. 

### 2025-04-10

- Initial version of the document
