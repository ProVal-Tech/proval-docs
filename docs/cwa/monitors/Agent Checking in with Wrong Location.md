---
id: 'cwa-monitor-set-location-detection'
title: 'Monitor Set for Location Detection'
title_meta: 'Monitor Set for Location Detection'
keywords: ['monitor', 'location', 'router', 'ip', 'address', 'detection']
description: 'This document outlines the purpose and functionality of a monitor set designed to detect computers that are placed in the wrong location based on router addresses. It details how to define multiple router IPs, the format required for input, and provides sample screenshots for clarity.'
tags: ['configuration', 'networking', 'security']
draft: false
unlisted: false
---
## Summary

The purpose of the monitor set is to detect the computers that are placed in the wrong location. Location is verified on the basis of the router address. Router IP for each location must be defined. Multiple router IPs can be defined as well. A router address must be written in double quotes ("Router Address"). For using multiple router addresses, each router address must be separated by a space and a comma ("Router Address 1", "Router Address 2", "Router Address n").

Sample screenshot for the multiple Router Addresses:

![Sample screenshot for multiple Router Addresses](5078775/docs/9421789/images/13009994)

Sample screenshot for the single Router Address:

![Sample screenshot for single Router Address](5078775/docs/9421789/images/13009996)

However, there's an option available in Monitor set to use router address without quotes, but in that case, you would not be able to use multiple router addresses for any of the locations. 

In order to use a single router address without quotes, you can un-comment "#ON FIND_IN_SET (a.routeraddress, b.scrouteraddress) <> 0" statement in the additional condition followed by commenting the very next line.

Sample Screenshot for single unquoted router address:

![Sample Screenshot for single unquoted router address](5078775/docs/9421789/images/13009999)

## Target

Global

