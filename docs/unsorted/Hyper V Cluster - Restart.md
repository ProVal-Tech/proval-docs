---
id: 'c9f79a60-a081-47e9-923e-5a00bd36f01f'
title: 'Restart Hyper-V Cluster'
title_meta: 'Restart Hyper-V Cluster'
keywords: ['hyper-v', 'cluster', 'reboot', 'drain', 'timeout']
description: 'This document provides a detailed overview of a PowerShell script designed to reboot all nodes of a Hyper-V cluster sequentially, ensuring each node is fully operational before proceeding to the next. It includes requirements, process steps, parameters, and output logs for monitoring the script execution.'
tags: ['hyper-v', 'cluster', 'reboot', 'timeout', 'performance']
draft: false
unlisted: false
---
## Overview

Reboots all nodes of a cluster waiting for each to come back up and fallback is engaged before moving to the next.

## Requirements

PowerShell V5

## Process

1. Foreach node in the cluster determine if the node is up if not and continue not true then exit.
2. Drain the node and set up a timer.
3. Wait for the drain to finish or the state is paused, or the elapsed time is exceeded.
4. If the timeout is passed and the status isn't complete and the state is not paused exit.
5. Reboot the Node.
6. Check the node status until it's back up.
7. Turn the fallback on and resume the cluster.
8. Continue to the next node.

```
./Restart-HyperVCluster.ps1 -ClusterName "ClusterName" -HostTimeoutThreshold 30
```
Will cycle through all nodes of ClusterName and attempt to drain the nodes stopping if the attempt to drain takes longer than 30 seconds.

```
./Restart-HyperVCluster.ps1 -ClusterName "ClusterName" -HostTimeoutThreshold 30 -Continue
```
Will cycle through all nodes of ClusterName and attempt to drain the nodes stopping if the attempt to drain takes longer than 30 seconds, skipping any already offline nodes.

```
./Restart-HyperVCluster.ps1 -ClusterName "ClusterName" -HostTimeoutThreshold 30 -Continue -Passthru
```
Will cycle through all nodes of ClusterName and attempt to drain the nodes stopping if the attempt to drain takes longer than 30 seconds, skipping any already offline nodes, and returning the Cluster Object.

### Parameters

| Parameter                  | Alias | Required | Default | Type   | Description                                                                 |
|----------------------------|-------|----------|---------|--------|-----------------------------------------------------------------------------|
| `-ClusterName`             |       | True     |         | String | Holds the name of the Cluster to execute the reboot command on.           |
| `-HostTimeoutThreshold`    |       | True     |         | Int    | The amount of time to attempt the drain and preparation for the Node restart. |
| `-Continue`                |       | False    |         | Switch | Allows the reboot sequence to continue if a node is currently offline.     |
| `-Passthru`                |       | False    |         | Switch | Allows for the return of the Cluster object upon completion.               |

## Output

```
./Restart-HyperVCluster-log.txt
./Restart-HyperVCluster-error.txt
```







