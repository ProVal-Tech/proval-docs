---
id: 'cwa-esxi-host-ticket-creation'
title: 'ESXi Host Ticket Creation Script'
title_meta: 'ESXi Host Ticket Creation Script for Automate'
keywords: ['esxi', 'ticket', 'monitor', 'automation', 'network', 'inventory']
description: 'This document details a script designed for creating tickets related to ESXi hosts that have not communicated for over 3 days. The script is monitor-driven, ensuring it runs automatically based on specific conditions and gathers necessary information to create a detailed ticket for IT support.'
tags: ['monitoring', 'ticketing', 'networking', 'automation', 'vmware', 'esxi']
draft: false
unlisted: false
---
## Summary

This script is a complete ticket creation script only to be used with the ESXi Host Not Communicating > 3 Days.

## Monitor Driven Only

This script is designed to be monitor driven only and should never be manually run. If it is manually run, the script will simply exit on the first step in the else section.

## Dependencies

This script's only dependency is that the monitor that is triggering the script has the network deviceID reporting in as the fieldname. The script will gather all other information it needs.

![Image](../../../static/img/Ticket-Creation---ESXi-Not-Communicating/image_1.png)

## Process

1. Gather information based on the network deviceID that the monitor has reported.
2. Create a ticket for the ESXi host outlining that the host has not updated its inventory in a while.

## Example Ticket

> The ESXi Host named <ESXi Host Name> at <Client>/<Location> has not checked into Automate for over 3 days. Please make sure the probe is correctly installed at the location <Location> and that the server is still online and in use. If the server is no longer active, deleting the network device associated with the ESXi server will remove it from monitoring.
>
> The ESXi Host information is outlined below:  
> Host Name: <ESXi Host Name>  
> ESXi Version: VMware ESXi 6.7.0  
> Host Make/Model: HPE ProLiant DL380 Gen10  
> S/N OF Host: <ESXi Serial Number>  
> Last Check-In: 5/31/2022 11:33:54 AM  
> Network Device ID: <Device ID>
>
> There is 1 reported VM running on this host. It has been displayed below:  
> <VM Name>



