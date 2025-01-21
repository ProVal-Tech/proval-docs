---
id: '3990e2f6-344e-4d2a-98ac-bd73b7a6c752'
title: 'DNS Filter Agent Installation Monitor'
title_meta: 'DNS Filter Agent Installation Monitor'
keywords: ['dns', 'filter', 'agent', 'installation', 'monitor']
description: 'This document outlines the functionality of the internal monitor that executes the DNS Filter Agent installation script on eligible online machines. It details the conditions for installation, the dependencies, and the ticketing process for installation failures.'
tags: ['installation', 'windows']
draft: false
unlisted: false
---

## Summary

The internal monitor executes the `DNS Filter Agent - Install` script hourly on online machines that are missing the `DNS Agent`. This monitor excludes Linux and Windows servers since they do not support the DNS Filter Agent. It detects agents where the 'Deploy DNS Filter Agent' client-EDF is checked and the 'Exclusion of DNS Filter Agent' at the location/computer level is not checked. It also ensures that the secret key at the Computer/Location/Client level exists for the installation.

## Dependencies

[CWA - Script - DNS Filter Agent - Install](<../scripts/DNS Filter Agent - Install.md>)

## Target

Windows Workstations & Macintosh

## Ticketing

**Subject:**

DNS Filter Agent Installation Failure - %ClientName%//%ComputerName%

**Body:**

Failed to install DNS Filter Agent for %ClientName%//%ComputerName%.  
Reason: No Secret Key Found.  
Please add a client/location/computer key at the client-level EDF (DNSFilter Site Key), location-level EDF (DNSFilter Location Key), or computer-level EDF (DNSFilter Computer Key) and re-run the script.

OR

Failed to install DNS Filter Agent for %ClientName%//%ComputerName%.  
Installer's Output: %ShellResult%
