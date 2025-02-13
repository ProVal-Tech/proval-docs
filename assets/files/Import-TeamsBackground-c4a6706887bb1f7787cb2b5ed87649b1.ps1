<#
.SYNOPSIS
    Imports custom backgrounds to Microsoft Teams using a provided ZIP file.
.PARAMETER ZIP
    Specify the ZIP file containing the backgrounds.
.EXAMPLE
    PS C:\> Import-TeamsBackground.ps1 -ZIP 'C:\PATH\TO\BACKGROUND.ZIP'
    Executes the script, importing the background(s) to Microsoft Teams.
.OUTPUTS
    .\Import-TeamsBackground-log.txt
    .\Import-TeamsBackground-error.txt
.NOTES
    This script imports backgrounds to applicable users at runtime.
    It cannot import backgrounds for future users, instead a Teams Premium license should be utilized for such functionality, allowing management through the Teams admin portal.

#>
[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [ValidateScript({ Test-Path $_ -PathType Leaf })]
    [string]$ZIP
)

### Region Strapper ###
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
try {
    Update-Module -Name Strapper -ErrorAction Stop
} catch {
    Install-Module -Name Strapper -Repository PSGallery -SkipPublisherCheck -Force
    Get-Module -Name Strapper -ListAvailable | Where-Object { $_.Version -ne (Get-InstalledModule -Name Strapper).Version } | ForEach-Object { Uninstall-Module -Name Strapper -MaximumVersion $_.Version }
}
(Import-Module -Name 'Strapper') 3>&1 2>&1 1>$null
Set-StrapperEnvironment

### Region Functions ###
function Get-AppUsersInfo {
    param (
        $AppName = 'MSTeams'
    )
    $AppxPackages = Get-AppxPackage -AllUsers | Where-Object { $_.Name -eq $AppName }
    $UsersInfo = $AppxPackages | ForEach-Object {
        $_.PackageUserInformation | ForEach-Object {
            @{
                SID      = $_.UserSecurityId.Sid
                Username = $_.UserSecurityId.Username
            }
        }
    }
    return $UsersInfo
}

# Function to rename images with GUIDs and create thumbnails
function Rename-Image {
    param (
        [string]$sourceDir,
        [string]$destinationDir,
        [string[]]$extensions
    )

    foreach ($extension in $extensions) {
        $images = Get-ChildItem $sourceDir -Filter "*.$extension"
        foreach ($image in $images) {
            $uuid = [guid]::NewGuid().ToString()
            $name = "$uuid.$extension"
            $thumbname = "${uuid}_thumb.$extension"
            $newnamedestination = Join-Path -Path $destinationDir -ChildPath $name
            $newthumbdestination = Join-Path -Path $destinationDir -ChildPath $thumbname
            Copy-Item -Path $image.FullName -Destination $newnamedestination
            Copy-Item -Path $image.FullName -Destination $newthumbdestination
        }
    }
}

# Function to get the user profile path from the user's SID
function Get-UserProfilePath {
    param (
        [string]$UserSID
    )
    $userProfilePath = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\$UserSID" -Name 'ProfileImagePath').ProfileImagePath
    return $userProfilePath
}

# Check if Teams is installed and get the list of active users' info
$activeUsersInfo = Get-AppUsersInfo -AppName 'MSTeams'
if ($activeUsersInfo.Count -eq 0) {
    Write-Log 'Microsoft Teams is not installed for any user. Exiting script.' -Type Error
    exit 1
}

# Create the Backgrounds and Uploads folders for each active user
foreach ($userInfo in $activeUsersInfo) {
    $userProfilePath = Get-UserProfilePath -UserSID $userInfo.SID
    $teamsBackgroundDir = Join-Path -Path $userProfilePath -ChildPath 'AppData\Local\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams'
    $backgroundsDir = Join-Path -Path $teamsBackgroundDir -ChildPath 'Backgrounds'
    if (-not (Test-Path -Path $backgroundsDir)) {
        New-Item -Path $backgroundsDir -ItemType Directory -Force | Out-Null
    }

    $uploadsDir = Join-Path -Path $backgroundsDir -ChildPath 'Uploads'
    if (-not (Test-Path -Path $uploadsDir)) {
        New-Item -Path $uploadsDir -ItemType Directory -Force | Out-Null
    }
}

# Extract images from the ZIP file
$tempExtractDir = Join-Path -Path $env:TEMP -ChildPath 'TeamsBackgrounds\Extracted'
$backgroundsDir = Join-Path -Path $env:TEMP -ChildPath 'TeamsBackgrounds\RenamedBackgrounds'

# Remove the temporary directories if they exist
if (Test-Path -Path $tempExtractDir) {
    Remove-Item -Path $tempExtractDir -Recurse -Force
}

if (Test-Path -Path $backgroundsDir) {
    Remove-Item -Path $backgroundsDir -Recurse -Force
}

# Create the temporary directories
New-Item -Path $tempExtractDir -ItemType Directory -Force | Out-Null
New-Item -Path $backgroundsDir -ItemType Directory -Force | Out-Null

# Extract images from the ZIP file to the temporary directory
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($ZIP, $tempExtractDir)

# Rename JPEG, JPG, PNG, BMP files
Rename-Image -SourceDir $tempExtractDir -DestinationDir $backgroundsDir -Extensions @('jpeg', 'jpg', 'png', 'bmp')

# Copy renamed images to active users' Teams Backgrounds directories
foreach ($userInfo in $activeUsersInfo) {
    $userProfilePath = Get-UserProfilePath -UserSID $userInfo.SID
    $teamsBackgroundDir = Join-Path -Path $userProfilePath -ChildPath 'AppData\Local\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams'
    $uploadsDir = Join-Path -Path $teamsBackgroundDir -ChildPath 'Backgrounds\Uploads'
    Copy-Item -Path "$backgroundsDir\*" -Destination $uploadsDir -Force
    Write-Log "Background images have been imported for user: $($userInfo.Username)" -Type Log
}

Write-Log 'Script execution completed.' -Type Log