---
id: '8a12468c-582c-11f1-b401-92000234cfc2'
slug: /8a12468c-582c-11f1-b401-92000234cfc2
title: 'RDP File Signer'
title_meta: 'RDP File Signer'
keywords: ['rdp', 'rdp-file', 'sign-rdp-file', 'rdp-certificate', 'code-sign-rdp-file', 'rdp-whitelist']
description: 'Signs RDP files on the local machine using a provided or auto-generated certificate, with optional destination address whitelisting.'
tags: ['certificates', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-04
---

## Summary

This script digitally signs Remote Desktop Protocol (.rdp) files on your Windows device and installs the signing certificate so that signed RDP files open without security warnings.

![Image6](../../../static/img/docs/8a12468c-582c-11f1-b401-92000234cfc2/image6.webp)

After signing, the certificate is automatically trusted by Windows, preventing publisher warnings when users open the RDP files. The script can sign individual files, entire directories, or all RDP files on the device. Additionally, it offers optional address validation to ensure files are only signed if they point to pre-approved destination environments or wildcards.

## How It Works

The script obtains a signing certificate in one of two ways:

1. **Auto-generated certificate** - If you do not provide a certificate, the script creates a self-signed certificate on the device and uses it immediately.
2. **Provided certificate** - If you supply a certificate path and password, the script imports that certificate and uses it for signing.

Before applying the signature, the script can check the connection target defined within the `.rdp` file. If an address whitelist is provided, the script validates the destination address—supporting exact matches, arrays, or wildcards—and safely aborts the signing process for any unapproved or missing configurations. 

After successful verification and signing, the certificate thumbprint is registered in Windows so RDP files stay trusted on that device.

## Sample Run

### Scenario 1: Sign All RDP Files with Auto-Generated Certificate

Run the script without SignaturePath or PfxPasswordTitle. The script will:

- Create a self-signed certificate on the device.
- Find all .rdp files on the device.
- Sign each file.
- Register the certificate as trusted.

**User Parameters:**

- RDPFile = `All`
- ProviderName = (leave blank for default)
- SignaturePath = (leave blank)
- PfxPasswordTitle = (leave blank)
- AllowedAddress = (leave blank)

**Expected Output:**

- RDP files are signed.
- Certificate is trusted on the device.
- Users can open signed RDP files without warnings.

![Image1](../../../static/img/docs/8a12468c-582c-11f1-b401-92000234cfc2/image1.webp)

### Scenario 2: Sign Specific RDP Files with Auto-Generated Certificate

Run the script with one or more RDP file paths. The script will sign only those files with an auto-generated certificate.

**User Parameters:**

- RDPFile = `C:\Temp\Session1.rdp` or `C:\Temp\Session1.rdp, C:\Temp\Session2.rdp, C:\Custom Directory\RDP Sessions`
- ProviderName = (leave blank for default)
- SignaturePath = (leave blank)
- PfxPasswordTitle = (leave blank)
- AllowedAddress = (leave blank)

**Expected Output:**

- Only the specified files are signed.
- Certificate is trusted on the device.

![Image2](../../../static/img/docs/8a12468c-582c-11f1-b401-92000234cfc2/image2.webp)

### Scenario 3: Sign RDP Files in a Directory

Run the script with a directory path. The script will find and sign all .rdp files in that directory and its subdirectories.

**User Parameters:**

- RDPFile = `C:\ProgramData\RDP Sessions`
- ProviderName = (leave blank for default)
- SignaturePath = (leave blank)
- PfxPasswordTitle = (leave blank)
- AllowedAddress = (leave blank)

**Expected Output:**

- All .rdp files in the directory tree are signed.
- Certificate is trusted on the device.

![Image3](../../../static/img/docs/8a12468c-582c-11f1-b401-92000234cfc2/image3.webp)

### Scenario 4: Sign RDP Files with a Provided Certificate

Run the script with a certificate path and its password title. Before running, store the PFX password in a ConnectWise Automate client-level password entry.

**User Parameters:**

- RDPFile = `All`
- ProviderName = (leave blank)
- SignaturePath = `\\fileserver\share\RDPSigner.pfx` or `https://internal.corp/certs/RDPSigner.pfx`
- PfxPasswordTitle = `RDP Signer Password` (title of the password entry you created)
- AllowedAddress = (leave blank)

**Steps:**

1. Create a client-level password entry with the PFX password.
2. Note the exact title of the password entry.
3. Run the script with the certificate path and password title.

**Expected Output:**

- RDP files are signed with your provided certificate.
- Certificate is trusted on the device.
- Users open RDP files with your organization's certificate, not a self-signed one.

![Image4](../../../static/img/docs/8a12468c-582c-11f1-b401-92000234cfc2/image4.webp)

### Scenario 5: Custom Certificate Provider Name

Run the script with a custom provider name for the certificate. This name appears in certificate properties.

**User Parameters:**

- RDPFile = `All`
- ProviderName = `Contoso RDP Signer`
- SignaturePath = (leave blank for auto-generated)
- PfxPasswordTitle = (leave blank)
- AllowedAddress = (leave blank)

**Expected Output:**

- RDP files are signed with a self-signed certificate using your custom provider name.
- Certificate properties show "Contoso RDP Signer" as the issuer.

![Image5](../../../static/img/docs/8a12468c-582c-11f1-b401-92000234cfc2/image5.webp)

### Scenario 6: Sign RDP Files with Address Whitelisting (Wildcards & Arrays)

Run the script while specifying allowed connection targets. This filters out files pointing to unapproved network destinations or files that completely lack a `full address` configuration block.

**User Parameters:**

- RDPFile = `C:\Temp\RDPTest`
- ProviderName = (leave blank for default)
- SignaturePath = (leave blank)
- PfxPasswordTitle = (leave blank)
- AllowedAddress = `*.corp.contoso.com, 10.10.*, secure-gateway.external.com`

**Expected Output:**

- Files pointing to `app01.corp.contoso.com` or `10.10.4.20` are verified and successfully signed.
- Files pointing to an unapproved external address (e.g., `rogue.hackers.net`) are bypassed with a warning and left unsigned.
- Template RDP files containing an empty or missing `full address` property fail validation and are skipped.

![Image7](../../../static/img/docs/8a12468c-582c-11f1-b401-92000234cfc2/image7.webp)

### Scenario 7: Sign RDP Files for a Single Approved Destination Only

Run the script with an exact, single address to ensure extreme strictness. This is useful if you are deploying a dedicated RDS gateway or a single critical server and want to guarantee no other RDP files are accidentally trusted.

**User Parameters:**

- RDPFile = `All`
- ProviderName = (leave blank for default)
- SignaturePath = (leave blank)
- PfxPasswordTitle = (leave blank)
- AllowedAddress = `app01.corp.contoso.com`

**Expected Output:**

- The script scans the device but **only** signs RDP files where the target connection is exactly `app01.corp.contoso.com`.
- Files pointing to any other server (e.g., `app02.corp.contoso.com`), external IP addresses, or those missing a target are explicitly skipped and left unsigned.
- A single trusted connection path is established for the end-user.

![Image8](../../../static/img/docs/8a12468c-582c-11f1-b401-92000234cfc2/image8.webp)

## User Parameters

| Name | Required | Example | Description |
| --- | --- | --- | --- |
| RDPFile | True | `all` or `C:\Temp\Session1.rdp, C:\Temp\Session2.rdp, C:\Custom Directory\RDP Sessions` or `C:\ProgramData\RDP` | Set to `all` to sign every RDP file on the device. Or provide one or more file paths (individual files or directories). Directories are searched recursively for all .rdp files. |
| ProviderName | False | `Contoso RDP Signer` | Optional name for the auto-generated certificate. If left blank, defaults to `RDP File Signer`. Only used when SignaturePath is not provided. |
| SignaturePath | False | `\\fileserver\share\RDPSigner.pfx` or `https://internal.corp/certs/RDPSigner.pfx` or `C:\Certs\RDPSigner.pfx` | Optional path to a PFX certificate file. Can be a local path, UNC path, or download URL. If left blank, a self-signed certificate is created on the device. |
| PfxPasswordTitle | False | `RDP Signer Password` | Title of the client-level password entry containing the PFX password. Only required if you provide a SignaturePath. Create the password entry in ConnectWise Automate before running the script. |
| AllowedAddress | False | `*.corp.contoso.com` or `10.10.*, 192.168.1.50` | Optional single value or comma-separated array of approved connection strings. Supports PowerShell wildcards (`*`, `?`). When specified, files lacking a target or pointing to unlisted addresses are excluded from signing. |

## Output

- Script logs

Check these logs for details about which files were signed and whether any errors occurred.

## FAQ

**Q: What happens if I do not provide a certificate?**

**A:** The script creates a self-signed certificate on the device automatically. This certificate is trusted locally so signed RDP files open without warnings on that device.

**Q: Where do I store the PFX password?**

**A:** Create a client-level password entry in ConnectWise Automate under Clients > [Select Client] > Password Manager. Use any descriptive title (for example, "RDP Signer Password" or "RDP Certificate Password"). Then pass that exact title in the PfxPasswordTitle parameter.

**Q: Can I use a certificate from my organization?**

**A:** Yes. Provide the certificate path in SignaturePath (UNC path, local path, or URL) and the password title in PfxPasswordTitle. The script downloads or imports the certificate and uses it to sign RDP files.

**Q: Will the script create a new self-signed certificate every time it runs?**

**A:** No. The script reuses the same valid certificate on that device for future runs. A new self-signed certificate is created only if the existing certificate has expired or if you change the ProviderName value.

**Q: I am storing the PFX file on a file server. What permissions do I need to set?**

**A:** The script runs in the SYSTEM context, so the file server share must grant read access to the SYSTEM account. Share the certificate folder with either `NT AUTHORITY\SYSTEM` or `Everyone` so the device can download or access the certificate file. Do not restrict permissions to domain users only, as the system account will not be able to read the file.

**Q: What if I have RDP files in multiple locations?**

**A:** You can pass multiple paths to the RDPFile parameter using an array format: `C:\Temp\Session1.rdp, C:\Temp\Session2.rdp, C:\Custom Directory\RDP Sessions`. Or use `all` to sign every RDP file on the device.

**Q: Do I need to run this script multiple times?**

**A:** No. Run it once per device. The certificate is registered as trusted, so all signed RDP files remain trusted on that device. If you later create new RDP files, run the script again to sign them.

**Q: How does the destination address whitelisting work?**

**A:** If you pass values to the `AllowedAddress` parameter, the script opens each `.rdp` file prior to signing and parses the `full address:s:` line. It natively compares this value against your allowed list using PowerShell's operator logic. If a match is found, signing proceeds; otherwise, the file is skipped to protect users from unapproved network modifications.

**Q: Can I pass multiple domains or IP ranges to AllowedAddress?**

**A:** Yes. It accepts comma-separated values. You can combine static entries, IP subnets, and domains containing wildcards all in a single query parameter (e.g., `*.domain.com, 10.20.*, desktop05.lan`).

**Q: What happens if an RDP file does not have a "full address" property when whitelisting is active?**

**A:** The script flags this as a validation failure, logs a warning stating that no address property could be located, and skips the file entirely without applying a digital signature.

**Q: Where do I check if the script succeeded?**

**A:** Check the log files in `C:\ProgramData\_Automation\Script\Invoke-RDPFileSigner`. Or verify manually by opening an RDP file in Notepad and confirming it opens without a security warning.

## Changelog

### 2026-06-04

- Added a destination validation feature via the new optional `AllowedAddress` parameter.

### 2026-05-25

- Initial version of the document.
