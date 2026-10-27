---
id: 'e359e323-4c2e-43a0-b6c6-5d82e4e50984'
slug: /e359e323-4c2e-43a0-b6c6-5d82e4e50984
title: 'Set-OneDriveLibraryAutoSync'
title_meta: 'Set-OneDriveLibraryAutoSync'
keywords: ['onedrive', 'sharepoint', 'library', 'sync', 'automount', 'tenantautomount']
description: 'This script makes OneDrive automatically sync a SharePoint document library for every user on a computer.'
tags: ['software', 'windows', 'onedrive']
draft: false
unlisted: false
last_update:
  date: 2026-10-15
---

## Overview

This script makes OneDrive automatically sync a SharePoint document library for every user on a computer. Users who have access to the library see it in File Explorer without selecting **Sync** themselves. It uses Microsoft's supported OneDrive policy, **Configure team site libraries to sync automatically**.

**Key Features:**

- **All users at once:** Configures every user profile on the computer, including users who are not signed in.
- **Permissions respected:** Only users who have access to the library in SharePoint receive it.
- **Faster delivery:** The library appears the next time OneDrive starts, instead of within Microsoft's window of up to 8 hours.
- **Optional immediate sync:** `-RestartOneDrive` restarts OneDrive for signed-in users, so the library appears within a few minutes.
- **Paste-ready library ID:** Accepts the library ID exactly as SharePoint's **Copy library ID** link provides it.
- **Nothing left behind:** Runs as SYSTEM and leaves no scheduled task or helper file on the computer.

## Requirements

- PowerShell version 5.1 or later.
- Windows 10 version 1709 or later, or Windows 11.
- Administrative privileges (SYSTEM context).
- OneDrive installed, with each user signed in to their work or school account.
- OneDrive Files On-Demand turned on (the default).
- A SharePoint Online document library. On-premises SharePoint is not supported.
- Network access to **ProVal's File Server** to download the module installer ([Install-PSGalleryModule.ps1](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)).
- Network access to **www.powershellgallery.com** (queried by `Install-PSGalleryModule` to download the Strapper module).

## Get the Library ID

The library ID identifies one SharePoint document library. Get it once for each library you want to sync.

### Copy It From SharePoint (Recommended)

1. Sign in to SharePoint as a Global Administrator or SharePoint Administrator.
2. Open the document library to sync.
3. Select **Sync**. If the browser asks to open OneDrive, select **Cancel**.
4. In the **Starting sync** dialog, select **Copy library ID**.
5. Paste the value into `-LibraryId` exactly as it is.

Microsoft shows this dialog in [Configure team site libraries to sync automatically](https://learn.microsoft.com/en-us/sharepoint/use-group-policy#configure-team-site-libraries-to-sync-automatically).

### Build It Manually

Use this method when **Copy library ID** is not shown. Collect the values below, then combine them in this format:

```PlainText
tenantId=<tenant ID>&siteId={<site ID>}&webId={<web ID>}&listId={<list ID>}&webUrl=<site URL>&version=1
```

| Value | Where to Find It |
| ----- | ---------------- |
| Tenant ID | Microsoft Entra admin center > **Overview** > **Tenant ID**. See [Find your Microsoft 365 tenant ID](https://learn.microsoft.com/en-us/sharepoint/find-your-office-365-tenant-id). |
| Site ID | Open `https://contoso.sharepoint.com/sites/Marketing/_api/site/id` in a browser. |
| Web ID | Open `https://contoso.sharepoint.com/sites/Marketing/_api/web/id` in a browser. |
| List ID | Open `https://contoso.sharepoint.com/sites/Marketing/_api/web/lists/getbytitle('Documents')/id` in a browser, using the library name instead of `Documents`. |
| Site URL | The site address, for example `https://contoso.sharepoint.com/sites/Marketing`. |

Each browser address shows the ID inside the `Id` element of the response. These addresses are part of the [SharePoint REST service](https://learn.microsoft.com/en-us/sharepoint/dev/sp-add-ins/get-to-know-the-sharepoint-rest-service).

## Payload Usage

Run the script once for each library. Below are usage examples:

### Example 1

Syncs the Marketing library for every user, using the library ID copied from SharePoint.

```powershell
.\Set-OneDriveLibraryAutoSync.ps1 -LibraryName 'Marketing - Documents' -LibraryId 'tenantId=11111111-2222-3333-4444-555555555555&siteId=%7Baaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee%7D&webId=%7Bffffffff-1111-2222-3333-444444444444%7D&listId=%7B55555555-6666-7777-8888-999999999999%7D&webUrl=https%3A%2F%2Fcontoso.sharepoint.com%2Fsites%2FMarketing&version=1'
```

### Example 2

Syncs the same library and restarts OneDrive for signed-in users, so the library appears within a few minutes.

```powershell
.\Set-OneDriveLibraryAutoSync.ps1 -LibraryName 'Marketing - Documents' -LibraryId 'tenantId=11111111-2222-3333-4444-555555555555&siteId=%7Baaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee%7D&webId=%7Bffffffff-1111-2222-3333-444444444444%7D&listId=%7B55555555-6666-7777-8888-999999999999%7D&webUrl=https%3A%2F%2Fcontoso.sharepoint.com%2Fsites%2FMarketing&version=1' -RestartOneDrive
```

### Example 3

Syncs the library using a library ID that was built manually.

```powershell
.\Set-OneDriveLibraryAutoSync.ps1 -LibraryName 'Marketing - Documents' -LibraryId 'tenantId=11111111-2222-3333-4444-555555555555&siteId={aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee}&webId={ffffffff-1111-2222-3333-444444444444}&listId={55555555-6666-7777-8888-999999999999}&webUrl=https://contoso.sharepoint.com/sites/Marketing&version=1'
```

### Example 4

Syncs a second library on the same computer. Each library needs its own `-LibraryName`.

```powershell
.\Set-OneDriveLibraryAutoSync.ps1 -LibraryName 'Finance - Reports' -LibraryId '<Finance library ID>'
```

## What Happens When You Run the Script

1. The script installs or updates the Strapper logging module.
2. It checks that the library ID is complete. If a part is missing, it stops without changing anything.
3. It adds the library to the OneDrive policy of every user profile on the computer, including users who are not signed in.
4. It resets the OneDrive sync timer of every user signed in to OneDrive, so the library is added the next time OneDrive starts.
5. With `-RestartOneDrive`, it restarts OneDrive for each signed-in user. Users only see the OneDrive icon disappear and come back.
6. It writes the result to the log.

You'll know it worked when the library appears in File Explorer under your organization name, next to the user's OneDrive.

## When the Library Appears

| Situation | Library Appears |
| --------- | --------------- |
| `-RestartOneDrive` used and the user is signed in | Within a few minutes |
| User is signed in, no restart | The next time OneDrive starts, or within 8 hours |
| User is not signed in | At the user's next sign-in |
| User signs in to the computer for the first time after the script ran | After the script runs again |
| User has no access to the library | Never |

:::note  
On shared computers, run the script on a schedule (for example daily) so new users also get the library. Leave out `-RestartOneDrive` for scheduled runs, so OneDrive is not restarted every day.  
:::

## Good to Know

- Microsoft recommends this setting only for libraries with up to 5,000 files and folders.
- Microsoft recommends enabling it for the same library on no more than 1,000 devices.
- Files sync as online-only files. They download when a user opens them.
- Users cannot stop syncing a library added this way.
- If Intune or Group Policy already manages this OneDrive setting, add the library there instead. A policy refresh can remove the value this script adds.
- The script only adds libraries. To stop a library from being added, delete its value from `HKCU\SOFTWARE\Policies\Microsoft\OneDrive\TenantAutoMount` for each user. Users who already have the library keep it.

## Troubleshooting

| Problem | Cause | Solution |
| ------- | ----- | -------- |
| `Failure: The library ID is missing the listId= part.` | The library ID was copied or pasted incompletely. | Copy the full library ID again and rerun the script. |
| `Failure: The TenantAutoMount policy was not written to any user profile.` | No user has signed in to the computer yet. | Rerun the script after a user has signed in. |
| The library does not appear for a user. | The user has no access, OneDrive is not signed in, or OneDrive has not restarted yet. | Check the user's access in SharePoint and confirm OneDrive is signed in. Rerun the script with `-RestartOneDrive`. |
| The library stops being added after a while. | Intune or Group Policy manages the same OneDrive setting. | Add the library to the Intune or Group Policy configuration. |
| The wrong library appears. | The library ID belongs to a different library. | Rerun the script with the same `-LibraryName` and the correct library ID. The wrong library stays for users who already have it. |

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| `LibraryName` | `Marketing - Documents` | Any name, unique per library | True | | String | Name that identifies the library in the OneDrive policy. Running the script again with the same name replaces the library ID. |
| `LibraryId` | `tenantId=1111...&version=1` | Library ID as copied from SharePoint or built manually | True | | String | ID of the SharePoint document library to sync. See [Get the Library ID](#get-the-library-id). |
| `RestartOneDrive` | `-RestartOneDrive` | Switch | False | False | Switch | Restarts OneDrive for signed-in users, so the library appears within a few minutes. |

## Output

The script adds the library to the OneDrive policy of each user profile, under `HKEY_USERS\<user SID>\SOFTWARE\Policies\Microsoft\OneDrive\TenantAutoMount`.

Every run ends with a single result line:

```PlainText
Success: Marketing - Documents was added to the TenantAutoMount policy of 2 user profile(s).
```

Log files (next to the script):

- `.\Set-OneDriveLibraryAutoSync-log.txt`
- `.\Set-OneDriveLibraryAutoSync-error.txt`

## Changelog

### 2026-10-15

- Initial version of the document
