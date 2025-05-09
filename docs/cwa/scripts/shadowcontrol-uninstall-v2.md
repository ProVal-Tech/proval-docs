---
id: 'b5ffbe82-a523-4104-8e8f-c60cfa2f8419'
slug: /b5ffbe82-a523-4104-8e8f-c60cfa2f8419
title: 'ShadowControl Uninstall v2'
title_meta: 'ShadowControl Uninstall v2'
keywords: ['uninstall', 'shadowcontrol', 'script', 'server', 'agent']
description: 'This document details a script that fetches the uninstall string from the database to uninstall ShadowControl and unregister it from the server, streamlining the uninstallation process and saving time through automation.'
tags: ['database', 'software', 'uninstallation']
draft: false
unlisted: false
---

## Summary

This script will fetch the uninstall string from the database and attempt to uninstall ShadowControl and unregister it from the server.

**Time Saved by Automation:** # Minutes

## Sample Run

![Sample Run](../../../static/img/docs/b5ffbe82-a523-4104-8e8f-c60cfa2f8419/image_1.webp)

## Variables

- `@UninstallPath@` - Shows the uninstall path fetched from the database.
- `@NewUninstallPath@` - Shows the new uninstall path after using the replace function.

## Process

- Runs a shell command to unregister the agent from the server.
- Fetches the uninstall path from the database.
- Uses the replace function to create the new uninstall path.
- Utilizes that path for uninstalling the agent.

## Output

- Script log