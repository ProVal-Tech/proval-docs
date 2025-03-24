# Overview

The Remove-PUA.ps1 script is designed to manage and remove bloatware packages on Windows systems. It provides functionality to list and remove pre-installed packages using curated lists from a [trusted repository](https://raw.githubusercontent.com/ProVal-Tech/proval-docs/main/static/attachments/potentially-unwanted-applications.json).

 <span style="color:red">**EXERCISE EXTREME CAUTION - Removing system components may cause system instability.**</span>

# Requirements

This script requires an internet connection to fetch the list of potentially unwanted applications (PUA) from a remote repository. It also requires the `Strapper` module, which will be installed and updated automatically if not already present.

# Process

The script operates by first setting up the necessary environment and fetching the list of PUAs from a [remote URL](https://raw.githubusercontent.com/ProVal-Tech/proval-docs/main/static/attachments/potentially-unwanted-applications.json). It then processes the installed packages on the system and performs actions based on the provided parameters. The script can list installed packages, remove all packages from specified categories, exclude specific packages from removal, or remove specific packages by name.

# Payload Usage

The script is executed using PowerShell and requires specific parameters to perform its operations. Below are examples of how to use the script:

```powershell
# List all installed Appx packages
.\Remove-PUA.ps1 -ListBloatware

# Remove all Microsoft bloatware packages
.\Remove-PUA.ps1 -RemoveAll -Category MsftBloatApps

# Remove all bloatware except Solitaire
.\Remove-PUA.ps1 -RemoveAll -Except 'Microsoft.SolitaireCollection'

# Remove specific packages by name
.\Remove-PUA.ps1 -Remove 'Microsoft.BingWeather', 'Microsoft.GetHelp'
```

# Parameters
| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `RemoveAll`       |       | True      |           | Switch    | Remove all packages from specified categories (default: both Microsoft and ThirdParty). |
| `Category`        |       | False     |           | String    | Filter removal to specific categories (`MsftBloatApps`/`ThirdPartyBloatApps`). |
| `Except`          |       | False     |           | String[]  | Exclude specific packages from removal operations. |
| `Remove`          |       | True      |           | String[]  | Remove specific packages by name (bypasses category filters). |
| `ListBloatware`   |       | True      |           | Switch    | List installed packages without making changes. |

# Output

- `.\Remove-PUA-log.txt`
- `.\Remove-PUA-error.txt`

# PUA List

| **MsftBloatApps**                              | **ThirdPartyBloatApps**                      |
|------------------------------------------------|----------------------------------------------|
| E046963F.CameraSettings                        | 46928bounde.EclipseManager                   |
| Microsoft.3DBuilder                            | 4DF9E0F8.Netflix                             |
| Microsoft.549981C3F5F10                        | 5319275A.WhatsAppDesktop                     |
| Microsoft.AppConnector                         | 7EE7776C.LinkedInforWindows                  |
| Microsoft.BingFinance                          | 828B5831.HiddenCityMysteryofShadows          |
| Microsoft.BingNews                             | 828B5831.JewelsofEgyptMatchGame              |
| Microsoft.BingSearch                           | 89006A2E.AutodeskSketchBook                  |
| Microsoft.BingSports                           | 9E2F88E3.Twitter                             |
| Microsoft.BingWeather                          | A278AB0D.DisneyMagicKingdoms                 |
| Microsoft.CommsPhone                           | A278AB0D.MarchofEmpires                      |
| Microsoft.ConnectivityStore                    | ActiproSoftwareLLC.562882FEEB491             |
| Microsoft.Copilot                              | AD2F1837.HPDesktopSupportUtilities           |
| Microsoft.DesktopAppInstaller                  | AD2F1837.HPEasyClean                         |
| Microsoft.GamingApp                            | AD2F1837.HPJumpStarts                        |
| Microsoft.GetHelp                              | AD2F1837.HPPCHardwareDiagnosticsWindows      |
| Microsoft.Messaging                            | AD2F1837.HPPowerManager                      |
| Microsoft.Microsoft3DViewer                    | AD2F1837.HPPrivacySettings                   |
| Microsoft.MicrosoftOfficeHub                   | AD2F1837.HPQuickDrop                         |
| Microsoft.MicrosoftPowerBIDesktop              | AD2F1837.HPQuickTouch                        |
| Microsoft.MicrosoftPowerBIForWindows           | AD2F1837.HPSupportAssistant                  |
| Microsoft.MicrosoftSolitaireCollection         | AD2F1837.HPSureShieldAI                      |
| Microsoft.MicrosoftStickyNotes                 | AD2F1837.HPSystemInformation                 |
| Microsoft.MinecraftUWP                         | AD2F1837.HPWorkWell                          |
| Microsoft.MixedReality.Portal                  | AD2F1837.myHP                                |
| Microsoft.MSPaint                              | AdobeSystemsIncorporated.AdobeCreativeCloudExpress |
| Microsoft.NetworkSpeedTest                     | AdobeSystemsIncorporated.AdobePhotoshopExpress |
| Microsoft.Office.OneNote                       | AmazonMobileLLC.AmazonMusic                  |
| Microsoft.Office.Sway                          | AmazonVideo.PrimeVideo                       |
| Microsoft.OneConnect                           | BytedancePte.Ltd.TikTok                      |
| Microsoft.OneDrive                             | CAF9E577.Plex                                |
| Microsoft.OneDriveSync                         | Clipchamp.Clipchamp                          |
| Microsoft.OutlookForWindows                    | D52A8D61.FarmVille2CountryEscape             |
| Microsoft.Paint                                | D5EA27B7.Duolingo-LearnLanguagesforFree      |
| Microsoft.People                               | DellInc.DellSupportAssistforPCs              |
| Microsoft.PowerAutomateDesktop                 | Disney.37853FC22B2CE                         |
| Microsoft.Print3D                              | Drawboard.DrawboardPDF                       |
| Microsoft.RemoteDesktop                        | DropboxInc.Dropbox                           |
| Microsoft.SkypeApp                             | E046963F.cameraSettings                      |
| Microsoft.StorePurchaseApp                     | E046963F.LenovoCompanion                     |
| Microsoft.Todos                                | E046963F.LenovoSettingsforEnterprise         |
| Microsoft.Whiteboard                           | FACEBOOK.317180B0BB486                       |
| Microsoft.Windows.NarratorQuickStart           | FACEBOOK.FACEBOOK                            |
| Microsoft.Windows.Photos                       | Facebook.InstagramBeta                       |
| Microsoft.WindowsAlarms                        | flaregamesGmbH.RoyalRevolt2                  |
| Microsoft.WindowsCamera                        | GAMELOFTSA.Asphalt8Airborne                  |
| Microsoft.WindowsCommunicationsApps            | HPInc.MyHP                                   |
| Microsoft.WindowsFeedbackHub                   | KeeperSecurityInc.Keeper                     |
| Microsoft.WindowsMaps                          | king.com.BubbleWitch3Saga                    |
| Microsoft.WindowsSoundRecorder                 | king.com.CandyCrushFriends                   |
| Microsoft.WindowsStore                         | king.com.CandyCrushJellySaga                 |
| Microsoft.Xbox.TCUI                            | king.com.CandyCrushSaga                      |
| Microsoft.XboxApp                              | king.com.CandyCrushSodaSaga                  |
| Microsoft.XboxGameCallableUI                   | laregamesGmbH.RoyalRevolt2                   |
| Microsoft.XboxGameOverlay                      | SnapInc.Snapchat                             |
| Microsoft.XboxGamingOverlay                    | SpotifyAB.SpotifyMusic                       |
| Microsoft.XboxIdentityProvider                 |                                              |
| Microsoft.XboxLive                             |                                              |
| Microsoft.XboxSpeechToTextOverlay              |                                              |
| Microsoft.YourPhone                            |                                              |
| Microsoft.ZuneMusic                            |                                              |
| Microsoft.ZuneVideo                            |                                              |
| MicrosoftCorporationII.QuickAssist             |                                              |
| MicrosoftWindows.LKG.DesktopSpotlight          |                                              |