---
id: 'b8313365-d95d-41bd-b2fc-e3e77f4fdcf7'
title: 'Monitor Set for Location Detection'
title_meta: 'Monitor Set for Location Detection'
keywords: ['monitor', 'location', 'router', 'ip', 'address', 'detection']
description: 'This document outlines the purpose and functionality of a monitor set designed to detect computers that are placed in the wrong location based on router addresses. It details how to define multiple router IPs, the format required for input, and provides sample screenshots for clarity.'
tags: ['networking', 'security']
draft: false
unlisted: false
---

## Summary

The purpose of the monitor set is to detect computers that are placed in the wrong location. Location is verified based on the router address. The router IP for each location must be defined, and multiple router IPs can also be specified. A router address must be written in double quotes ("Router Address"). When using multiple router addresses, each address must be separated by a space and a comma ("Router Address 1", "Router Address 2", "Router Address n").

### Sample Screenshots

**Multiple Router Addresses:**

![Sample screenshot for multiple Router Addresses](../../../static/img/Agent-Checking-in-with-Wrong-Location/image_1.png)

**Single Router Address:**

![Sample screenshot for single Router Address](../../../static/img/Agent-Checking-in-with-Wrong-Location/image_2.png)

There is an option available in the monitor set to use router addresses without quotes; however, in that case, you will not be able to use multiple router addresses for any of the locations.

To use a single router address without quotes, you can uncomment the line `#ON FIND_IN_SET (a.routeraddress, b.scrouteraddress) <> 0` in the additional condition, followed by commenting the very next line.

**Single Unquoted Router Address:**

![Sample Screenshot for single unquoted router address](../../../static/img/Agent-Checking-in-with-Wrong-Location/image_3.png)

## Target

Global

