---
id: '2a58dc57-a3b9-441f-a94f-102027266936'
slug: /2a58dc57-a3b9-441f-a94f-102027266936
title: 'InstallUpdate - FileZilla'
title_meta: 'InstallUpdate - FileZilla'
keywords: ['filezilla', 'client', 'install', 'update', 'script']
description: 'This document provides a script for installing and updating the FileZilla Client to the latest version based on the configurations set in the Globals and Parameters tab. It outlines the necessary parameters and provides a sample run for reference.'
tags: ['installation', 'software', 'update', 'windows']
draft: false
unlisted: false
---

This script will install and update the FileZilla Client to the latest version as per the configuration done in the `Globals and Parameters` tab.

This does not support the update or installation of the Pro version of the app.

## Global Parameters 

The values for `DownloadURL` and `LatestVersion` need to be changed in the document when a new value is saved in the script.

| Name          | Default                                                                                                                                                         | Description                                         |
|---------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
| AppName       | FileZilla                                                                                                                                                      | Name of the application to be installed              |
| DownloadURL   | [https://dl4.cdn.filezilla-project.org/client/FileZilla_3.67.1_win64-setup.exe?h=c_gyFJN0ps6LRwpPixt0Cg&amp;x=1725021044](https://dl4.cdn.filezilla-project.org/client/FileZilla_3.67.1_win64-setup.exe?h=c_gyFJN0ps6LRwpPixt0Cg&amp;x=1725021044) | Download URL of the application. This URL can be updated if FileZilla releases a new stable version of the application. This URL will download version 3.67.1. |
| LatestVersion  | 3.67.1                                                                                                                                                         | The version that is going to be downloaded and installed. |
