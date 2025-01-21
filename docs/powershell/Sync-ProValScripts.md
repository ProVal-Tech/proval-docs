---
id: ps-sync-provalscripts
title: 'Sync-ProValScripts'
title_meta: 'Sync-ProValScripts'
keywords: ['sync', 'repository', 'scripts', 'git']
description: 'Documentation for the Sync-ProValScripts command to synchronize a target ProVal repository with the public file server repo.'
tags: []
draft: false
unlisted: false
---

## Description
Used to synchronize a target ProVal repository with the public file server repo.

## Requirements
- Must be run as an Administrator.
- PowerShell v5
- Must be run as the *non-Core* version of PowerShell

## Usage
1. If [git](https://git-scm.com/) is not installed, the script will exit with an error.
2. Installs/Imports the [posh-git](https://github.com/dahlbyk/posh-git) module.
3. If an `ed25519` key is not found with the name specified in `$SSHKeyName`, it will be generated.
    - The public key will be displayed in the console. Use this to [add a new Deploy Key](https://docs.github.com/en/developers/overview/managing-deploy-keys#setup-2) to the repo defined in `$RepoAlias`.
4. The SSH fingerprints for GitHub will be added to the `known_hosts` for SSH, if missing.
5. A `Host` entry will be added to the `config` file for SSH to use the `ed25519` key, if missing.
6. If the `$RepoAlias` repo has not been cloned, it will be cloned.
7. A `git fetch` is run against the repo.
8. A `git rev-parse` command is used to compare the commit at the `HEAD` of the local repo versus the `HEAD` of the origin.
    - If there are new commits to the origin, a `git pull` is run, and the function `Merge-GitWithLocal` is executed, ensuring that all changed files from GitHub are synced to `$Path`.
    - If there are no new commits but `-Force` is specified, then the function `Merge-GitWithLocal` is still called.
    - Otherwise, the script exits with a message that the local repo is up to date with the origin.

Sets up the environment if required and syncs any new or changed scripts from the repo to the file server.

```powershell
.\\Sync-ProValScripts.ps1
```

Sets up the environment if required and syncs any new or changed scripts from the repo to the file server, even if there are no new files in GitHub.

```powershell
.\\Sync-ProValScripts.ps1 -Force
```

## Parameters
| Parameter         | Required  | Default                    | Type      | Description                               |
| ----------------- | --------- | -------------------------- | --------- | ----------------------------------------- |
| `Path`            | False     | `'E:\\repo\\script'`      | String    | The path of the destination directory for the file server script repo. |
| `SSHKeyName`      | False     | `'pvlscripts'`            | String    | The name to give the generated SSH key pair. |
| `RepoAlias`       | False     | `'scripts'`               | String    | The name of the repo to sync from.      |
| `GitHubEmail`     | False     | `'support@provaltech.com'`| String    | The email address to use for the SSH key generation. |
| `ScriptTypes`     | False     | `('.ps1', '.bat', '.py')` | String[]  | List of extensions that should be synced. |
| `Force`           | False     |                            | Switch    | Use this switch to force a local diff check between the GitHub repo and the file server repo, even if the origin GitHub repo has no pending changes. |



