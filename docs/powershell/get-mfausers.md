---
id: '86026b1e-c2e4-48a1-8f4a-463f060b7496'
slug: /86026b1e-c2e4-48a1-8f4a-463f060b7496
title: 'Get-MFAUsers'
title_meta: 'Get-MFAUsers'
keywords: ['mfa', 'multi-factor', 'entra', 'microsoft-graph', 'authentication-methods', 'sms', 'passkey', 'authenticator', 'tenant-audit']
description: 'Reports the MFA methods registered by every account in a Microsoft 365 tenant and flags the accounts whose only authentication method is SMS or a voice call.'
tags: ['microsoft365', 'security', 'identity', 'accounts', 'auditing', 'report', 'api', 'azure']
draft: false
unlisted: false
last_update:
  date: 2026-08-17
---

## Overview

Connects to Microsoft Graph as a registered application, enumerates every account in a Microsoft 365 tenant, and reports which authentication methods each one has registered. Returns the result as an object and writes a human readable report to `Get-MFAUsers-result.txt`, beside the log.

Every account is returned with a column per method class - SMS/voice, Authenticator app, passkey, Windows Hello, software OTP - plus a `Flagged` column. Supply `-ExportCsv` to also write per account detail to `Get-MFAUsers-result.csv` for a spreadsheet or a ticket.

The point of the script is to answer "who in this tenant can only get in with a text message?" without clicking through the Entra portal one user at a time. Since SMS and voice are the methods most exposed to SIM swap and interception, the accounts that hold nothing else are the remediation list.

No `Microsoft.Graph` PowerShell module is required. The script calls the REST API directly, which avoids installing several hundred megabytes of SDK submodules on an endpoint to make a handful of requests.

## Requirements

- PowerShell v5.1
- An Entra ID app registration in the target tenant, with a client secret or a certificate.
- The following **application** permissions on that app registration, admin consented:

    | Permission | Used for |
    | ---------- | -------- |
    | `User.Read.All` | Enumerating the accounts in the tenant. |
    | `AuditLog.Read.All` | Reading the authentication method registration report. |
    | `UserAuthenticationMethod.Read.All` | Resolving accounts missing from that report. |

- A Microsoft Entra ID **P1 or P2** license in the tenant, for the registration report. Without it that call returns 403 and the script falls back to the per-user API for every account, which is far slower. The report states when this has happened, so a degraded run is obvious rather than silently slow.

Delegated permissions are not sufficient. The script authenticates with the client credentials grant, so consent must be granted on the application permissions rather than on their delegated equivalents.

## Process

1. Acquires an application access token for Graph, using either a client secret or a certificate signed JWT assertion. The token is renewed a minute before expiry so a long run cannot be caught mid-page.
2. Reads every account in the tenant from `/users`, including disabled accounts and guests.
3. Reads `/reports/authenticationMethods/userRegistrationDetails`, one paged call covering the whole directory.
4. Resolves the accounts the registration report did not return, one at a time, through `/users/{id}/authentication/methods`.
5. Classifies each account's registered methods, decides whether it is flagged, and applies whichever filter parameters were supplied.
6. Writes the report to `Get-MFAUsers-result.txt`, optionally the CSV, and returns the same information as an object.

### What "flagged" means

An account is flagged when it holds one of the methods named by `TargetMethod`, which defaults to SMS and voice call, and holds **none** of the methods named by `AlternateMethod`. In other words, the phone number is the only thing it can authenticate with.

An account that also holds a passkey, the Authenticator app, a software or hardware OATH token, or a certificate is not dependent on the phone, and so is not flagged even though it is registered for SMS. This is the distinction that makes the output a remediation list rather than an inventory: the accounts that appear are the ones somebody has to go and talk to.

Email is deliberately **not** an accepted alternative by default, because Entra ID does not accept it as a second factor for sign-in - it is a self-service password reset method. An account holding a mobile number and an email address can still only sign in with the phone, so it is flagged. Add `Email` to `AlternateMethod` if you want it to count.

Every method class is reported in its own column regardless of what `TargetMethod` and `AlternateMethod` name, so changing either one changes which accounts are flagged without changing what the report tells you about them. The same run's data answers a different question by rerunning with different parameters.

### Why two Graph sources are used

Neither API covers the whole tenant on its own:

| Source | Covers | Cost | Caveat |
| ------ | ------ | ---- | ------ |
| `/reports/authenticationMethods/userRegistrationDetails` | The whole directory in one paged call. The API Microsoft intends for population wide auditing. | One call per page | Does not return disabled users, and its data can lag a registration by up to 36 hours. |
| `/users/{id}/authentication/methods` | A single account, live, including disabled accounts. | One call per user | Microsoft explicitly recommends against iterating a whole tenant with it. |

So the registration report is read first and carries the bulk of the run, and the per-user API is used only to fill in the accounts the report did not return - the disabled accounts, and anything registered inside the report's latency window. That keeps the expensive API down to a small remainder rather than the whole directory.

Each row records which source it came from in `DataSource`, so a row built from lagging report data is distinguishable from a live one. In the text report the same distinction appears in the `Src` column as `report` or `live`.

### Accounts whose methods could not be read

An account that could not be resolved by either source gets `DataSource` of `Unavailable`, `Flagged` of `$null`, and **null** rather than `$false` in every method column. A `$false` there would read as "checked, and has nothing", which is exactly the wrong conclusion to hand somebody building a remediation list. Those accounts are counted and listed separately in the report, under `Unknown`.

This happens when `-SkipPerUserFallback` is supplied, when the number of missing accounts exceeds `-MaxFallbackUser`, or when an individual lookup fails - usually because `UserAuthenticationMethod.Read.All` has not been consented.

### Method classes

Graph returns a long list of method names, and the two sources name the same method differently. Both vocabularies are normalised onto one set of classes before anything is decided:

| Class | Covers |
| ----- | ------ |
| `SmsVoice` | SMS and voice call to a mobile, alternate mobile, or office number. Microsoft reports the number rather than the channel, so an account reachable by either is counted once. |
| `AuthenticatorApp` | Microsoft Authenticator, push and passwordless phone sign-in. |
| `Passkey` | FIDO2 security keys, device bound and synced passkeys, macOS secure enclave keys. |
| `WindowsHello` | Windows Hello for Business. |
| `SoftwareOtp` | Any TOTP authenticator. Kept apart from `AuthenticatorApp` because a software OATH registration does not say the code is coming from Microsoft Authenticator rather than any other app. |
| `HardwareOtp` | Hardware OATH tokens. |
| `Certificate` | Certificate based authentication. |
| `Email` | Email. Not usable as a second factor for sign-in. |
| `SecurityQuestion` | Security questions. Not usable as a second factor for sign-in. |
| `TemporaryAccessPass` | Temporary Access Pass. |
| `Other` | Anything Graph returns that is not in the map. |

A method name the script does not recognise is still reported verbatim in `MethodsRegistered` and counted under `Other`, so a method Microsoft adds later shows up as an unrecognised registration rather than silently reading as "no method". Passwords are excluded, since a password is not a second factor and would otherwise be counted as a registration.

### Authenticating with a certificate instead of a secret

`-CertificateThumbprint` is mutually exclusive with `-ClientSecret`. The certificate must be uploaded to the app registration and present with its private key in `Cert:\CurrentUser\My` or `Cert:\LocalMachine\My`.

A certificate credential is proved by signing a short lived JWT with the private key rather than by sending anything reusable over the wire, which is the reason to prefer it where the extra setup is acceptable. The account running the script needs read access to the private key.

### Throttling and paging

Graph throttles per tenant and per resource, so a 429 on a large directory is expected rather than exceptional. Every request follows paging to completion, honours the `Retry-After` header the service sends, and falls back to an exponential backoff capped at 60 seconds where the header cannot be read. Each page is attempted five times before the run gives up.

### Why the report is not written to the log

The report goes to a file of its own, `Get-MFAUsers-result.txt`, in the same folder as the log. The log stays a record of what the run did - what was read, what was skipped, what failed - and the result file holds nothing but the report, so it can be read or attached to a ticket without a timestamp on every line.

The result file is overwritten on each run and so always holds the latest result. The log appends, and keeps the history.

### Encoding

A display name can hold any character the directory allows, and plenty of them are outside the console's default code page, where they become question marks on the way out. Since the point of the report is to name the person somebody has to go and talk to, the same encoding handling [Get-DiskUsage.ps1](/docs/bf4b616c-fbd0-4f76-848b-a9d5e9a4af6a) uses is applied here:

- The console output encoding is set to UTF-8. The assignment is wrapped in a `try`, because a host without a real console - which is how an RMM runs this - throws rather than ignoring it.
- `Get-MFAUsers-result.txt` is written with `[System.IO.File]::WriteAllText` and a `System.Text.UTF8Encoding` constructed with `$false`, giving UTF-8 without a byte order mark. `Set-Content -Encoding UTF8` would leave three bytes of preamble on PowerShell 5.1 for every reader to step over.
- Line endings are pinned to CRLF rather than left to the platform, so the report reads correctly in Notepad and in an RMM's output viewer. A lone line feed arriving from a display name containing one is normalised too.
- The **CSV** keeps its byte order mark, unlike the text report. Excel reads a UTF-8 CSV without one as ANSI and mangles every non-ASCII display name, and the CSV exists precisely to be opened in Excel, so the preamble is the lesser evil there.

## Payload Usage

Reports every account in the tenant, flagging any whose only authentication method is SMS or a voice call.

```powershell
.\Get-MFAUsers.ps1 -TenantId 'contoso.onmicrosoft.com' -ClientId '11111111-1111-1111-1111-111111111111' -ClientSecret 'aBc...'
```

Authenticates with a certificate held in the local certificate store instead of a client secret.

```powershell
.\Get-MFAUsers.ps1 -TenantId $tenant -ClientId $app -CertificateThumbprint 'A1B2C3...'
```

Narrows the report to enabled member accounts that have nothing but a phone number, which is the usual shape for a remediation list.

```powershell
.\Get-MFAUsers.ps1 -TenantId $tenant -ClientId $app -ClientSecret $secret -FlaggedOnly -ExcludeDisabled -ExcludeGuest
```

Also writes `Get-MFAUsers-result.csv`, for attaching to a ticket or opening in Excel.

```powershell
.\Get-MFAUsers.ps1 -TenantId $tenant -ClientId $app -ClientSecret $secret -ExportCsv
```

Treats only phishing resistant methods as an acceptable alternative, so an account whose other method is the Authenticator app or a TOTP token is flagged as well.

```powershell
.\Get-MFAUsers.ps1 -TenantId $tenant -ClientId $app -ClientSecret $secret -AlternateMethod 'Passkey', 'WindowsHello'
```

Searches for a different method entirely: accounts whose only method is a TOTP token.

```powershell
.\Get-MFAUsers.ps1 -TenantId $tenant -ClientId $app -ClientSecret $secret -TargetMethod 'SoftwareOtp' -AlternateMethod 'AuthenticatorApp', 'Passkey', 'WindowsHello'
```

Inspects the flagged accounts on the returned object.

```powershell
$mfa = .\Get-MFAUsers.ps1 -TenantId $tenant -ClientId $app -ClientSecret $secret
$mfa.Users | Where-Object { $_.Flagged } | Select-Object UserPrincipalName, MethodsRegistered
```

## Parameters

| Parameter               | Alias | Required | Default | Type     | Description                               |
| ----------------------- | ----- | -------- | ------- | -------- | ----------------------------------------- |
| `TenantId`              |       | True     |         | String   | The tenant to report on. Accepts the tenant GUID or any verified domain, for example `contoso.onmicrosoft.com`. |
| `ClientId`              |       | True     |         | String   | The application (client) ID of the app registration used to authenticate. |
| `ClientSecret`          |       | True     |         | String   | A client secret belonging to the app registration. Required in the `Secret` parameter set. Mutually exclusive with `CertificateThumbprint`. |
| `CertificateThumbprint` |       | True     |         | String   | The thumbprint of a certificate uploaded to the app registration and present with its private key in `Cert:\CurrentUser\My` or `Cert:\LocalMachine\My`. Required in the `Certificate` parameter set. Mutually exclusive with `ClientSecret`. |
| `TargetMethod`          |       | False    | `SmsVoice` | String[] | The method classes being searched for. An account must hold at least one of them to be flagged. Valid values: `SmsVoice`, `Email`, `SoftwareOtp`, `HardwareOtp`, `AuthenticatorApp`, `Passkey`, `WindowsHello`, `Certificate`. |
| `AlternateMethod`       |       | False    | `AuthenticatorApp`, `Passkey`, `WindowsHello`, `SoftwareOtp`, `HardwareOtp`, `Certificate` | String[] | The method classes whose presence means the account is not dependent on the target method, and so is not flagged. Valid values as above. `Email` is not in the default, because Entra ID does not accept it as a second factor for sign-in. |
| `ExcludeDisabled`       |       | False    | `False` | Switch   | Omit accounts where `accountEnabled` is false. |
| `ExcludeGuest`          |       | False    | `False` | Switch   | Omit accounts whose `userType` is `Guest`. |
| `ExcludeUnlicensed`     |       | False    | `False` | Switch   | Omit accounts with no assigned licenses. Useful for dropping service and resource accounts. |
| `FlaggedOnly`           |       | False    | `False` | Switch   | Return and report only the accounts where `Flagged` is true. |
| `ExportCsv`             |       | False    | `False` | Switch   | Also write per account detail to `Get-MFAUsers-result.csv`, beside the log. Off by default: the returned object already carries every per account column, so the spreadsheet is only worth writing when somebody is going to open it. `CsvPath` on the returned object is `$null` unless this is supplied. |
| `SkipPerUserFallback`   |       | False    | `False` | Switch   | Do not call the per-user authentication methods API for accounts missing from the registration report. Those accounts are still returned, with `DataSource` set to `Unavailable` and every method column `$null` rather than `$false`. |
| `MaxFallbackUser`       |       | False    | `500`   | Int      | The largest number of accounts to resolve individually through the per-user API. Accounts beyond the cap are returned with `DataSource` set to `Unavailable`, and the report says how many were left unresolved. Range 0-100000. |

## Output

`System.Management.Automation.PSCustomObject`. A single object describing the scan:

| Name                    | Type             | Description                                                            |
| ----------------------- | ---------------- | ---------------------------------------------------------------------- |
| `TenantId`              | string           | The tenant that was reported on.                                        |
| `ScanTime`              | datetime         | When the scan started.                                                  |
| `ResultPath`            | string           | Full path of the report file. `$null` if it could not be written.        |
| `CsvPath`               | string           | Full path of the CSV. `$null` unless `-ExportCsv` was supplied.          |
| `TargetMethod`          | string[]         | The method classes that were searched for.                              |
| `AlternateMethod`       | string[]         | The method classes accepted as an alternative.                          |
| `RegistrationAvailable` | bool             | Whether the tenant wide registration report could be read.              |
| `ReportLastUpdated`     | string           | When Microsoft last refreshed the registration report. `$null` when unavailable. |
| `TotalAccounts`         | int              | Accounts reported, after filtering.                                     |
| `ExcludedAccounts`      | int              | Accounts removed by the filter parameters supplied.                     |
| `FlaggedAccounts`       | int              | Accounts whose only method is the target method.                        |
| `TargetMethodUsers`     | int              | Accounts holding the target method, flagged or not.                     |
| `TargetWithAlternate`   | int              | Accounts holding the target method that also hold an alternative.       |
| `NoMethodAccounts`      | int              | Accounts with nothing registered at all.                                |
| `UnresolvedAccounts`    | int              | Accounts whose methods could not be read.                               |
| `MethodAdoption`        | PSCustomObject[] | Registration count and percentage per method class, over the accounts whose methods were read. `MethodClass` (string), `UserCount` (int), `Percent` (double). |
| `Users`                 | PSCustomObject[] | One object per reported account, as below.                              |

Each object in `Users`:

| Name                    | Type   | Description                                                              |
| ----------------------- | ------ | ------------------------------------------------------------------------ |
| `UserPrincipalName`     | string | The account's UPN.                                                        |
| `DisplayName`           | string | The account's display name.                                               |
| `UserId`                | string | The account's object ID in the directory.                                 |
| `UserType`              | string | `Member` or `Guest`.                                                      |
| `AccountEnabled`        | bool   | Whether the account is enabled.                                           |
| `IsLicensed`            | bool   | Whether the account has any assigned licenses.                            |
| `IsDirectorySynced`     | bool   | Whether the account is synced from on-premises Active Directory.          |
| `IsAdmin`               | bool   | Whether the account holds an admin role. `$null` unless the row came from the registration report. |
| `Flagged`               | bool   | The target method is the only thing this account can authenticate with. `$null` when the methods could not be read. |
| `FlagReason`            | string | Why the account was flagged, or why its methods are unknown. Empty when not flagged. |
| `HasTargetMethod`       | bool   | Holds at least one of the `TargetMethod` classes.                         |
| `HasAlternateMethod`    | bool   | Holds at least one of the `AlternateMethod` classes.                      |
| `HasSmsVoice`           | bool   | Holds SMS or voice call to any phone number.                              |
| `HasAuthenticatorApp`   | bool   | Holds Microsoft Authenticator, push or passwordless.                      |
| `HasPasskey`            | bool   | Holds a passkey or FIDO2 security key.                                    |
| `HasWindowsHello`       | bool   | Holds Windows Hello for Business.                                         |
| `HasSoftwareOtp`        | bool   | Holds a software OATH token.                                              |
| `IsMfaRegistered`       | bool   | Microsoft's own MFA registration flag. `$null` unless the row came from the registration report. |
| `IsMfaCapable`          | bool   | Microsoft's own MFA capability flag. `$null` unless the row came from the registration report. |
| `IsPasswordlessCapable` | bool   | Microsoft's own passwordless capability flag. `$null` unless the row came from the registration report. |
| `PreferredMethod`       | string | The account's preferred method for secondary authentication. `$null` unless the row came from the registration report. |
| `MethodCount`           | int    | Number of methods registered.                                             |
| `MethodsRegistered`     | string | Graph's own method names, semicolon separated.                            |
| `MethodClasses`         | string | The classes those methods fall into, semicolon separated.                 |
| `DataSource`            | string | `RegistrationReport`, `PerUserMethods`, or `Unavailable`.                 |
| `CreatedDateTime`       | string | When the account was created.                                             |

The `Has*` columns and `Flagged` are `$null`, not `$false`, on a row whose `DataSource` is `Unavailable`.

The object and the CSV keep Graph's own method names, so they can be matched against the API and the Entra portal without a translation step. The text report uses friendly labels instead.

The same information is written to `Get-MFAUsers-result.txt` as a report. Sample:

```text
----------------------------------------------------------------------------------------------------
MFA method registration report
----------------------------------------------------------------------------------------------------
Tenant             : acb42f2c-66de-46b0-ab2c-f740312f8f32
Application        : 5e5f0e9a-302c-4d0c-8321-2d14cff9b2d3
Generated          : 2026-08-17 11:36:46 local
Flagging accounts whose only method is: SmsVoice
Accepted alternatives                 : AuthenticatorApp, Certificate, HardwareOtp, Passkey, SoftwareOtp, WindowsHello

Accounts
  Reported         :       2
  Excluded         :     399  (removed by the filter parameters supplied)
  Enabled          :       2
  Disabled         :       0
  Guests           :       0
  Licensed         :       2

Findings
  FLAGGED          :       2  (100% of reported accounts; SmsVoice is all they have)
  Registered for it:       2  (total holding SmsVoice, flagged or not)
  Has another too  :       0  (holds SmsVoice but is not dependent on it, so not flagged)
  No method at all :       0  (nothing registered; cannot be flagged by this search)

Registration by method class, over the 2 account(s) whose methods were read
  Passkey                    0      0%
  WindowsHello               0      0%
  AuthenticatorApp           0      0%
  SoftwareOtp                0      0%
  HardwareOtp                0      0%
  Certificate                0      0%
  SmsVoice                   2    100%
  Email                      1     50%
  SecurityQuestion           0      0%
  TemporaryAccessPass        0      0%
  Other                      0      0%

----------------------------------------------------------------------------------------------------
Accounts whose only authentication method is SmsVoice (2)
----------------------------------------------------------------------------------------------------
On   Lic Src    Account                  Registered methods
----------------------------------------------------------------------------------------------------
yes  yes report notify@contoso.com       Email, Mobile phone (SMS/voice)
yes  yes report svc-o365@contoso.com     Mobile phone (SMS/voice)

----------------------------------------------------------------------------------------------------
Notes
----------------------------------------------------------------------------------------------------
- 2 account(s) came from the tenant wide registration report and 0 were read live, one at a time.
- The registration report was last refreshed 2026-08-16T14:52:22.1817212Z. Microsoft updates it for most accounts within 36 hours, so a
  registration made today may not appear yet. Rows read live are current as of this run.
- Disabled accounts are never returned by the registration report, so each one was read live where possible.
- Flagged means the account holds SmsVoice and none of: AuthenticatorApp, Certificate, HardwareOtp, Passkey, SoftwareOtp, WindowsHello.
  Every method class is reported in its own column regardless, so the search can be rerun for a different
  method, or with a different set of accepted alternatives, without losing any detail.
- Email is not an accepted alternative by default, because Entra ID does not accept it as a second factor
  for sign-in. An account with a phone number and an email address can still only sign in with the phone.
- SmsVoice covers SMS and voice call to a mobile, alternate mobile, or office number. Microsoft reports the
  number rather than the channel, so an account reachable by either is counted once.
- A software OATH registration is counted separately from the Authenticator app, because the registration only
  says a TOTP code is in use and not which application produces it.
- Per account detail, including the columns not shown above, is on the object this script returns.
  Rerun with -ExportCsv to have it written to a spreadsheet alongside this report.
----------------------------------------------------------------------------------------------------
```

The flagged accounts are sorted to the top of both the report and the CSV, so the rows that need action are first without anybody sorting them.

Result files:

```text
.\Get-MFAUsers-result.txt
.\Get-MFAUsers-result.csv   (only with -ExportCsv)
```

Log files:

```text
.\Get-MFAUsers-log.txt
.\Get-MFAUsers-error.txt
```

## Changelog

### 2026-08-17

- Initial version of the document
