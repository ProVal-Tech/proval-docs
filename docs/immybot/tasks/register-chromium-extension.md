---
id: '8aca8419-c848-4ec5-94c0-eda89ca63753'
slug: /8aca8419-c848-4ec5-94c0-eda89ca63753
title: 'Register Chromium Extension'
title_meta: 'Register Chromium Extension'
keywords: ['register', 'extension', 'chromium', 'edge', 'brave', 'browser']
description: 'ImmyBot task to register Chromium browser extensions via policy enforcement.'
tags: ['chrome', 'web-browser', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-04-02
---

## Description

Adds one or more extensions to popular Chromium-based browsers.

## Requirements

The Extension URL ID must be obtained from [Chrome Web Store](https://chromewebstore.google.com).

## Sample Deployment Parameters

### Example 1: Installing `Claude` Extension for `Chrome`

**ExtensionID:**

```PlainText
fcoeoabgfenejglbffodgkkbkcdhcgfn
```

**Target:**

```PlainText
Chrome
```

![Image1](../../../static/img/docs/8aca8419-c848-4ec5-94c0-eda89ca63753/image1.webp)

### Example 2: Installing `Dark Reader` Extension for `Edge`

**ExtensionID:**

```PlainText
eimadpbcbfnmbkopoojfekhnkhdbieeh
```

**Target:**

```PlainText
Edge
```

![Image2](../../../static/img/docs/8aca8419-c848-4ec5-94c0-eda89ca63753/image2.webp)

### Example 3: Installing both `Claude` and `Dark Reader` Extensions for both `Chrome` and `Edge`

**ExtensionID:**

```PlainText
fcoeoabgfenejglbffodgkkbkcdhcgfn
eimadpbcbfnmbkopoojfekhnkhdbieeh
```

**Target:**

```PlainText
Chrome
Edge
```

![Image3](../../../static/img/docs/8aca8419-c848-4ec5-94c0-eda89ca63753/image3.webp)

### Example 4: Installing both `Claude` and `Dark Reader` Extensions for all supported browsers (`Chromium`, `Chrome`, `Edge`, `Brave`, and `Vivaldi`)

**ExtensionID:**

```PlainText
fcoeoabgfenejglbffodgkkbkcdhcgfn
eimadpbcbfnmbkopoojfekhnkhdbieeh
```

**Target:** (leave blank or omit to apply to all supported browsers)

![Image4](../../../static/img/docs/8aca8419-c848-4ec5-94c0-eda89ca63753/image4.webp)

## Parameters

| Parameter         | ValidateSet | Required  | Default   | Type      | Description                               |
| ----------------- | ----------- | --------- | --------- | --------- | ----------------------------------------- |
| `ExtensionID`     |             | True      |           | String[]  | Holds the URL id values for the desired extensions to install. |
| `Target`          | `Chromium`, `Chrome`, `Edge`, `Brave`, `Vivaldi` | False | Defaults to applying settings to all available targets | String[] | Designates the target browser to add the extension to. |

[Task Configuration](https://github.com/ProVal-Tech/immybot/blob/main/tasks/register-chromium-extension.toml)

## Changelog

### 2026-04-02

- Deprecated `Install Google Chrome Extension` and `Install Microsoft Edge Extension`
- Initial version of the document
