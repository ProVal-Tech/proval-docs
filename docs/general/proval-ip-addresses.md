---
id: 794c9b95-df88-4b63-8605-b7c9b138532b
slug: /794c9b95-df88-4b63-8605-b7c9b138532b
title: 'ProVal IP Addresses'
title_meta: 'ProVal IP Addresses'
keywords: [ 'proval', 'ips', 'ip addresses', 'whitelist' ]
description: 'This document provides a list of ProVal IP addresses that should be whitelisted in security systems to ensure proper functionality of ProVal scripts and tools.'
tags: [ 'networking' ]
draft: false
unlisted: false
---

![diagram](/img/docs/794c9b95-df88-4b63-8605-b7c9b138532b/data.webp)

## allow6.provaltech.com
- **IPv4**: 68.183.18.58
- **IPv6**: 2604:a880:400:d0::23c7:4001
- **Location**: United States
- **Description**: VPN US Exit Node

## allow7.provaltech.com
- **IPv4**: 139.59.12.200
- **IPv6**: 2400:6180:100:d0::2bf:a001
- **Location**: India
- **Description**: VPN IN Exit Node

## file.provaltech.com
- **IPv4**: 20.169.248.145
- **Location**: United States
- **Description**: ProVal Tech File Repository

In many cases geo-blocking will take priority even over Allowed IPs. If you are also using geo-blocking please allow Allow6 and Allow7 IPs to bypass geo-blocking for our Germany based data center and VPN exit nodes.

Addtionally - Uptime Robot - Used for on-prem up / down status reporting
https://uptimerobot.com/help/locations/

NOTE: the subdomain `whitelist` has been deprecated. however, `whitelist(n).provaltech.com` will still function for legacy clients.