---
id: '58ddde1a-dfdd-4eb8-9024-608e7c57ad4f'
slug: /58ddde1a-dfdd-4eb8-9024-608e7c57ad4f
title: 'BitLocker Status and Recovery Key Audit'
title_meta: 'BitLocker Status and Recovery Key Audit'
keywords: ['bitlocker', 'encryption', 'endpoint', 'audit', 'recovery']
description: 'This document details a script that audits endpoints for BitLocker status, checking if drives are BitLocker-enabled, ensuring encryption is complete, and retrieving any available recovery keys. It provides a comprehensive overview of the script’s functionality, dependencies, and expected output.'
tags: ['encryption', 'recovery', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This script will audit the endpoint and output the Drive and Recovery key, if available.

- Checks if any drives are BitLocker-enabled
- Checks to ensure encryption progress is at 100%
- Checks for any available recovery keys

## Sample Run

![Sample Run](../../../static/img/docs/58ddde1a-dfdd-4eb8-9024-608e7c57ad4f/image_1.png)

## Dependencies

- Custom Field: BitLocker Status and Key

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name       | Description                                                                                       |
|------------|---------------------------------------------------------------------------------------------------|
| %output%   | Standard CW RMM Output variable. Used for script log and Custom Field population                 |

## Output

- Custom Field: BitLocker Status and Key
- Script Log

Sample Output:
- BitLocker Not Enabled on Drive X:
- BitLocker Encryption in Progress on Drive X:
- BitLocker enabled on Drive X, No recovery key available
- Drive X: recovery key: dm9ij30d-k4i30jf0-moqiw4oid-oijqwoeij-0qiwjeoqiwj

