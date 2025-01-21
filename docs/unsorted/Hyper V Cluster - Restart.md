---
id: 'c9f79a60-a081-47e9-923e-5a00bd36f01f'
title: 'Restart Hyper-V Cluster'
title_meta: 'Restart Hyper-V Cluster'
keywords: ['hyper-v', 'cluster', 'reboot', 'drain', 'timeout']
description: 'This document provides a detailed overview of a PowerShell script designed to reboot all nodes of a Hyper-V cluster sequentially, ensuring each node is fully operational before proceeding to the next. It includes requirements, process steps, parameters, and output logs for monitoring the script execution.'
tags: ['cluster', 'hyper-v', 'performance', 'reboot']
draft: true
unlisted: false
---

## Overview

This script reboots all nodes of a Hyper-V cluster, waiting for each node to come back online and ensuring fallback is engaged before moving to the next.

## Requirements

- PowerShell V5

## Process

1. For each node in the cluster, determine if the node is up. If not, exit.
2. Drain the node and set up a timer.
3. Wait for the drain to finish, or until the state is paused, or the elapsed time is exceeded.
4. If the timeout is passed and the status isn't complete and the state is not paused, exit.
5. Reboot the node.
6. Check the node status until it's back online.
7. Turn the fallback on and resume the cluster.
8. Continue to the next node.

```powershell
./Restart-HyperVCluster.ps1 -ClusterName "ClusterName" -HostTimeoutThreshold 30
```
This command will cycle through all nodes of ClusterName and attempt to drain the nodes, stopping if the drain attempt takes longer than 30 seconds.

```powershell
./Restart-HyperVCluster.ps1 -ClusterName "ClusterName" -HostTimeoutThreshold 30 -Continue
```
This command will cycle through all nodes of ClusterName and attempt to drain the nodes, stopping if the drain attempt takes longer than 30 seconds, while skipping any nodes that are already offline.

```powershell
./Restart-HyperVCluster.ps1 -ClusterName "ClusterName" -HostTimeoutThreshold 30 -Continue -Passthru
```
This command will cycle through all nodes of ClusterName and attempt to drain the nodes, stopping if the drain attempt takes longer than 30 seconds, skipping any already offline nodes, and returning the Cluster object.

### Parameters

| Parameter                  | Alias | Required | Default | Type   | Description                                                                 |
|----------------------------|-------|----------|---------|--------|-----------------------------------------------------------------------------|
| `-ClusterName`             |       | True     |         | String | Holds the name of the cluster to execute the reboot command on.           |
| `-HostTimeoutThreshold`    |       | True     |         | Int    | The amount of time to attempt the drain and preparation for the node restart. |
| `-Continue`                |       | False    |         | Switch | Allows the reboot sequence to continue if a node is currently offline.     |
| `-Passthru`                |       | False    |         | Switch | Allows for the return of the cluster object upon completion.               |

## Output

```
./Restart-HyperVCluster-log.txt
./Restart-HyperVCluster-error.txt
```

