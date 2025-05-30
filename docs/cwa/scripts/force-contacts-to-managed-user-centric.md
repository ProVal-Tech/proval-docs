---
id: '44840fd1-931c-45e1-aa69-2c52f30117a8'
slug: /44840fd1-931c-45e1-aa69-2c52f30117a8
title: "Force Contacts to 'Managed' (User Centric)"
title_meta: "Force Contacts to 'Managed' (User Centric)"
keywords: ['user', 'active-directory', 'integration', 'manage', 'plugin']
description: 'This document outlines a script designed to integrate User-Centric with Active Directory, ensuring that users imported via the AD plugin are properly flagged as managed and activated to prevent them from appearing in the UserCentric plugin in Manage. The script is intended for use on the Automate Server and requires correct configuration of the Active Directory plugin.'
tags: ['active-directory']
draft: false
unlisted: false
---

## Summary

This script is for use in conjunction with User-Centric. When users are imported using the AD plugin, it doesn't set them to 'managed' and 'activated', which are the flags that prevent them from showing in the UserCentric plugin in Manage. The Active Directory plugin must be configured correctly, and the script is intended to run against the Automate Server.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/docs/44840fd1-931c-45e1-aa69-2c52f30117a8/image_1.webp)

## Dependencies

@plugin_ad_users

## Process

This script is for use in conjunction with User-Centric. When users are imported using the AD plugin, it doesn't set them to 'managed' and 'activated', which are the flags that prevent them from showing in the UserCentric plugin in Manage. The script is intended to run against the Automate Server, and before running the script, the Active Directory plugin must be configured correctly.

## Output

Manage plugin