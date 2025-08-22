---
id: 'df3d2cab-2568-4b41-b447-7b21ef64220b'
slug: /df3d2cab-2568-4b41-b447-7b21ef64220b
title: 'SimpleNotification'
title_meta: 'SimpleNotification'
keywords: ['notification', 'pop-up']
description: 'SimpleNotification is a lightweight application designed to show a simple notification prompt.'
tags: ['notifications']
draft: false
unlisted: false
---

<p align="center">
  <img src="https://raw.githubusercontent.com/ProVal-Tech/proval-docs/refs/heads/main/static/img/docs/df3d2cab-2568-4b41-b447-7b21ef64220b/SimpleNotification.webp" alt="Simple Notification Icon" width="200" />
</p>

## Description

SimpleNotification is a lightweight application designed to show a simple notification prompt.

## Parameters

| Parameter    | Alias | Required | Description                                    | Type   |
| ------------ | ----- | -------- | ---------------------------------------------- | ------ |
| `--message`  | `-m`  | true     | The message content of the notification        | String |
| `--imageurl` | `-i`  | false    | Url to the image displayed in the notification | String |
| `--email`    | `-e`  | false    | Email address to display in the notification   | String |
| `--phone`    | `-p`  | false    | Phone number to display in the notification    | String |

## TOML Config File

A TOML configuration file can be used instead of the other parameters.

| Parameter      | Alias | Required | Description             | Type   |
| -------------- | ----- | -------- | ----------------------- | ------ |
| `--configfile` | `-c`  | true     | Path to the config file | String |

The file should have the following format:

```toml
message = "Hello, World!"
image_url = "https://some.path.to/image.png"
email = "support@company.local"
phone = "000-000-0000"
```

## Usage

Images should ideally be a 1:1 ratio and at least 200x200px for displaying in the notification window properly.

```shell
SimpleNotification.exe --Message "Hello, World!" --ImageURL "https://raw.githubusercontent.com/ProVal-Tech/SimpleNotification/refs/heads/main/res/SimpleNotification.jpeg" --Email "myemail@somewhere.local" --Phone "000-000-0000"
```

```shell
SimpleNotification.exe -c "C:\config.toml"
```
