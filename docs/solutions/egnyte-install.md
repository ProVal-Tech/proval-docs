---
id: 'ddd45f6e-2b41-4b83-a81e-ff3639b462a5'
slug: /ddd45f6e-2b41-4b83-a81e-ff3639b462a5
title: 'Egnyte - Install'
title_meta: 'Egnyte - Install'
keywords: ['egnyte', 'installation', 'endpoint', 'update', 'procedure']
description: 'This document outlines the procedure for installing Egnyte on an endpoint, including how to manage custom fields for reboot requirements and rescheduling the installation process if necessary.'
tags: ['installation', 'software', 'update']
draft: false
unlisted: false
---

## Purpose

This solution installs Egnyte on an endpoint. It will update a custom field if a user does not select a reboot and will reschedule the procedure if necessary.

## Associated Content

| Content                                                                 | Type             | Function                                                               |
|-------------------------------------------------------------------------|------------------|------------------------------------------------------------------------|
| [Agent Procedure](/docs/04d18467-ad93-4ed2-8da9-52796031d41c)     | Agent Procedure   | Installs/updates the Egnyte software on the endpoint.                 |
| [Custom Field](/docs/03f423c9-8538-42c0-9822-b7c92befb215) | Custom Field      | Designates whether the machine needs a reboot from the software.       |

## Implementation

Ensure the custom field is added prior to running the agent procedure. Additionally, ensure the installer is added to managed files.


