---
id: '2bd7d0b7-7bcb-41aa-be70-2f3ebc2cea6a'
title: 'Remove Drives Script'
title_meta: 'Remove Drives Script for Unlisted Machines'
keywords: ['drives', 'sql', 'database', 'cleanup', 'detection']
description: 'This document outlines a script that automates the removal of drives from machines that are still listed but no longer detected. It provides a summary of the process, a sample run, and the time saved by using this automation.'
tags: ['cleanup', 'database', 'performance', 'windows']
draft: false
unlisted: false
---

## Summary

This script removes drives that are still listed on machines but are no longer detected.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Remove-Missing-Drives/image_1.png)

## Process

- The script runs an SQL query against the database to delete the drives from the machines that are still listed but no longer detected.

