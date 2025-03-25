---
id: '8edbbe65-d1fd-4b22-b80d-da2dc12a01ba'
slug: /8edbbe65-d1fd-4b22-b80d-da2dc12a01ba
title: 'VLC Uninstall'
title_meta: 'VLC Uninstall'
keywords: ['vlc', 'uninstall', 'silent', 'procedure', 'agent']
description: 'This document outlines the procedure for silently removing VLC from systems where it cannot be uninstalled via winget. It includes example logs and the command used for uninstallation.'
tags: ['software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

VLC is non-removable via winget (no valid silent option in the manifest).  
This procedure silently removes VLC.

## Example Agent Procedure Log

- 2:30:02 pm 15-Feb-23   VLC Uninstall   Success   THEN   provaltech.com/dan.hicks  
- 2:30:02 pm 15-Feb-23   VLC Uninstall-0002   VLC successfully removed.   provaltech.com/dan.hicks  
- 2:29:58 pm 15-Feb-23   VLC Uninstall-0001   Uninstalling VLC...   provaltech.com/dan.hicks  
- 2:28:46 pm 15-Feb-23   Run Now - VLC Uninstall   Admin provaltech.com/dan.hicks scheduled procedure Run Now - VLC Uninstall to run at Feb 15 2023 2:28 PM  

## Process

`Program Files/VideoLAN/VLC/uninstall.exe /S /V/qn`

## Output

AP Log




