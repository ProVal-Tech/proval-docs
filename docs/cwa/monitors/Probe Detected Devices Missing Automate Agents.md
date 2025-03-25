---
id: '02f3c288-d5e4-4b45-9020-e47f41a254af'
slug: /02f3c288-d5e4-4b45-9020-e47f41a254af
title: 'Probe Detected Devices Missing Automate Agents'
title_meta: 'Probe Detected Devices Missing Automate Agents'
keywords: ['device', 'monitor', 'automate', 'agent', 'deployment', 'readiness', 'network', 'probe']
description: 'This document outlines a monitoring solution that identifies devices detected by the Network probe that can have the Automate agent deployed. It checks for machines with non-matching MAC addresses against existing Automate agents and provides readiness status and installation attempt details.'
tags: ['ticketing']
draft: false
unlisted: false
---

## Summary

This monitor looks for any device detected by the Network probe on which the Automate agent can be deployed. It checks for machines whose MAC addresses do not match any machines with existing Automate agents. It also lists the readiness status of the device, the last attempt to install the Automate agent, the number of attempts, and the last readiness check.

## Dependencies

Schedule the [CWM - Automate - Script - MySQL - Permission - Set agentdeploymentreadinesscheck Table Permissions](<../scripts/MySQL - Permission - Set agentdeploymentreadinesscheck Table Permissions.md>) script to run every 12-24 hours as a client script in the dashboard. This will provide the necessary permissions for the `agentdeploymentreadinesscheck` table for both Hosted and On-Prem Clients. Otherwise, the monitor will not provide any results.

## Implementation

The monitor can be imported normally; just make sure to schedule the [CWM - Automate - Script - MySQL - Permission - Set agentdeploymentreadinesscheck Table Permissions](<../scripts/MySQL - Permission - Set agentdeploymentreadinesscheck Table Permissions.md>) script every 12-24 hours. Otherwise, the monitor will not work.

## Target

Global

## Ticketing

**Subject:** %CLIENTNAME%/%LocationName% Detected a Missing Automate Agent

**Ticket Body on Failure:**  
> A computer has been found by the network probe that has been confirmed to not have an Automate agent deployed. This machine was found more than 3 times during the discovery scan duration.  
>  
> The details of the computer are as follows:  
>  
> Network Probe Location: %LOCATIONNAME%  
> Client Name: %CLIENTNAME%  
> Device Name: %FieldName%  
> Last Contact: %Result%  
>  
> Please determine if this machine needs to have Automate installed or not.

**Ticket Body on Success:**  
> The following computer is no longer found by the network probe. The details of the computer are as follows:  
>  
> Network Probe Location: %LOCATIONNAME%  
> Client Name: %CLIENTNAME%  
> Device Name: %FieldName%  
> Last Contact: %Result%  

## Alert Template

△ Custom - Ticket Creation - Computer