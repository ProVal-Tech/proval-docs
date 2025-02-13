$CWAPath = "$((get-location).Drive.Name):\Windows\LTSvc"
$FolderName = "PwdTesting"
$AgnosticPath = "$((get-location).Drive.Name):\$FolderName"
$PwdDict = "400MB"
$DictFileName = "PasswordDict$PwdDict.7z"
$DC = hostname
$ValidData = $False
$CleanupAllFiles = $False
$CleanupTxtFile = $True

#Is Automate Installed? If so, place downloaded files in the LTSvc directory
If(Test-Path -Path $CWAPath){
    #Make sure the directory for this exists
    If(Test-Path -Path "$CWAPath\$FolderName"){
        $DictFileLoc = "$CWAPath\$FolderName"
        #write-host "Debug: Verified "$CWAPath\$FolderName" Exists"
    }
    else {
        #Create Folder
        #write-host "Debug: Verified "$CWAPath\$FolderName" Did not exist. Creating"
        New-Item -Path $CWAPath -Name "$FolderName" -ItemType "directory"
        $DictFileLoc = "$CWAPath\$FolderName"
        If(Test-Path -Path "$CWAPath\$FolderName"){
        }
        else {
            Write-Host "Failed to create directory ($DictFileLoc). Exiting Script"
            Exit  
        }
    }
}
else {
    #Make sure the directory for this exists
    If(Test-Path -Path "$((get-location).Drive.Name):\$FolderName"){
        $DictFileLoc = $AgnosticPath
        #write-host "Debug: Looks Like Automate is not Installed - Switching to Agnostic: "$AgnosticPath""
    }
    else {
        #Create Folder
        New-Item -Path "$((get-location).Drive.Name):\" -Name "$FolderName" -ItemType "directory"
        $DictFileLoc = $AgnosticPath
        If(Test-Path -Path "$((get-location).Drive.Name):\$FolderName"){
            #Success. No Action Required
            #write-host "Debug: Verified "$((get-location).Drive.Name):\$FolderName" Exists"
        }
        else {
            Write-Host "Failed to create directory ($DictFileLoc). Exiting Script"
            Exit
        }
    }
}
#Download 7-zip if required
If(Test-Path -Path "$DictFileLoc\7za.exe" -PathType leaf){
    #No Download Required
    #write-host "Debug: Verified "$DictFileLoc\7za.exe" Exists - No Download required"
}
else {
    [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
    (New-Object System.Net.WebClient).DownloadFile("https://file.provaltech.com/repo/tools/7za.exe","$DictFileLoc\7za.exe")
    If(Test-Path -Path "$DictFileLoc\7za.exe" -PathType leaf){
        #Success. No action Required
        #write-host "Debug: Verified "$DictFileLoc\7za.exe" Exists after downloading"
    }
    else {
        Write-Host "Failed to Download 7-zip"
        Exit  
    }
}
#Begin Downloading Proper Password Dictionary
if($PwdDict -eq "140MB") {
    Write-Host "Dictionary File is set to 140MB file."
    $ValidData = $True
    $txtfilename = "rockyou.txt"
    If(Test-Path -Path "$DictFileLoc\$DictFileName" -PathType leaf){
        #Success. No action Required
        #write-host "Debug: Verified "$DictFileLoc\$DictFileName". No Download Required."
    }
    else {
        If(Test-Path -Path "$DictFileLOC\$txtfilename" -PathType leaf){
            #Success. No action Required
            #write-host "Debug: Verified "$DictFileLoc\$DictFileName" does not exist, but The Password Dictionary "$DictFileLOC\$txtfilename" Does Exist. No download required."
        }
        else {
                    #Download File
            [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
            (New-Object System.Net.WebClient).DownloadFile("http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2","$DictFileLoc\$DictFileName")    
            If(Test-Path -Path "$DictFileLoc\$DictFileName" -PathType leaf){
                #Success. No action Required
                #write-host "Debug: Verified "$DictFileLoc\$DictFileName" after downloading."
            }
            else {
                Write-Host "Failed to download the password dictionary "$DictFileLoc\$DictFileName". Exiting Script."
                Exit
            }
        }
    }      
}
if($PwdDict -eq "400MB") {
    #Write-Host "Debug: Dictionary File is set to 400MB file."
    $ValidData = $True
    $txtfilename = "hk_hlm_founds.txt"
    If(Test-Path -Path "$DictFileLoc\$DictFileName" -PathType leaf){
        #Success. No action Required
        #write-host "Debug: Verified "$DictFileLoc\$DictFileName". No Download Required."
    }
    else {
        If(Test-Path -Path "$DictFileLOC\$txtfilename" -PathType leaf){
            #Success. No action Required
            #write-host "Debug: Verified "$DictFileLoc\$DictFileName" does not exist, but The Password Dictionary "$DictFileLOC\$txtfilename" Does Exist. No download required."
        }
        else {
            [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
            (New-Object System.Net.WebClient).DownloadFile("https://download.weakpass.com/wordlists/1256/hk_hlm_founds.txt.gz","$DictFileLoc\$DictFileName")
            If(Test-Path -Path "$DictFileLoc\$DictFileName" -PathType leaf){
                #Success. No action Required
                #write-host "Debug: Verified "$DictFileLoc\$DictFileName" after downloading."
            }
            else {
                Write-Host "Failed to download the password dictionary "$DictFileLoc\$DictFileName". Exiting Script."
                Exit
            }
        }
    }
}
if($PwdDict -eq "12GB") {
    #Write-Host "Debug: Dictionary File is set to 12GB file."
    $ValidData = $True
    $txtfilename = "weakpass_3w.txt"
    If(Test-Path -Path "$DictFileLoc\$DictFileName" -PathType leaf){
        #Success. No action Required
        #write-host "Debug: Verified "$DictFileLoc\$DictFileName". No Download Required."
    }
    else {
        If(Test-Path -Path "$DictFileLOC\$txtfilename" -PathType leaf){
            #Success. No action Required
            #write-host "Debug: Verified "$DictFileLoc\$DictFileName" does not exist, but The Password Dictionary "$DictFileLOC\$txtfilename" Does Exist. No download required."
        }
        else {
            [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
            (New-Object System.Net.WebClient).DownloadFile("https://download.weakpass.com/wordlists/1950/weakpass_3w.7z","$DictFileLoc\$DictFileName")
            If(Test-Path -Path "$DictFileLoc\$DictFileName" -PathType leaf){
                #Success. No action Required
                #write-host "Debug: Verified "$DictFileLoc\$DictFileName" after downloading."
            }
            else {
                Write-Host "Failed to download the password dictionary "$DictFileLoc\$DictFileName". Exiting Script."
                Exit
            }   
        }
    }
}
if($ValidData){
    #Nothing to do here. Already downloaded.
}
else {
    if($PwdDict -eq "9MB") {
        #Do Nothing - This is normal
    }
    else {
        #write-host "Debug: Password Dictionary Setting Unmatched - Setting default 9MB Pwd List"
    }  
    $txtfilename = "ignis-1M.txt"
    $DictFileName = "PasswordDict9MB.7z"
    If(Test-Path -Path "$DictFileLoc\$DictFileName" -PathType leaf){
        #Success. No action Required
        #write-host "Debug: Verified "$DictFileLoc\$DictFileName". No Download Required."
    }
    else {
        [Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
        (New-Object System.Net.WebClient).DownloadFile("https://download.weakpass.com/wordlists/1937/ignis-1M.txt.7z","$DictFileLoc\$DictFileName")
        If(Test-Path -Path "$DictFileLoc\$DictFileName" -PathType leaf){
            #Success. No action Required
            #write-host "Debug: Verified "$DictFileLoc\$DictFileName" after downloading."
        }
        else {
            Write-Host "Failed to download the password dictionary "$DictFileLoc\$DictFileName". Exiting Script."
            Exit
        }
    }   
}
#Extract all files
$7zipEXE = "$DictFileLoc\7za.exe"
If(Test-Path -Path "$DictFileLOC\$txtfilename" -PathType leaf){
    #Success. No action Required
    #write-host "Debug: Verified "$DictFileLOC\$txtfilename". No Extracting Required."
}
else {
    #7-Zip Command Functions: https://sevenzip.osdn.jp/chm/cmdline/switches/index.htm
    Start-Process -FilePath $7zipEXE -ArgumentList "x $DictFileLoc\$DictFileName -aoa -o$DictFileLoc" -Wait -NoNewWindow -RedirectStandardOutput ".\NUL"
    If(Test-Path -Path "$DictFileLOC\$txtfilename" -PathType leaf){
        #Success. No action Required
        #write-host "Debug: Verified "$DictFileLOC\$txtfilename" after extracting"
    }
    else {
        Write-Host "Failed to Extract the password dictionary "$DictFileLOC\$txtfilename". Exiting Script."
        Exit
    }
}
#write-host "Debug: Password Dictionary Located Here - $DictFileLOC\$txtfilename"
If(Get-Module -ListAvailable -Name "DSinternals"){
    #write-host "Debug: DSInternals Module Exists"
}
else {
    #write-host "Debug: DSInternals Module does not exist - Installing"
    Install-Module DSInternals
    If(Get-Module -ListAvailable -Name "DSinternals"){
        #write-host "Debug: DSInternals Module Exists after installing"
    }
    else {
        Write-Host "Failed to install the DSInternals Module. Exiting Script"
        Exit
    }
}
#Sets Variables with output information
$Domain = (Get-ADDomain).DistinguishedName
$PasswordReport = Get-ADReplAccount -All -Server $DC -NamingContext $Domain | Test-PasswordQuality -WeakPasswordsFile "$DictFileLOC\$txtfilename"
$stringArrayDuplicatePW = $PasswordReport.DuplicatePasswordGroups | % {$_}
$stringArrayDuplicatePW = $stringArrayDuplicatePW.Replace((Get-ADDomain).NetBIOSName,'').Replace('\','')
$FinalStringDuplicatePW = $stringArrayDuplicatePW -join ','
$stringArrayWeakPW = $PasswordReport.WeakPassword | % {$_}
$stringArrayWeakPW = $stringArrayWeakPW.Replace((Get-ADDomain).NetBIOSName,'').Replace('\','')
$FinalStringWeakPW = $stringArrayWeakPW -join ','
#Get Formatted Duplicate Password List
$outstring = ""
$counter = 0
$PasswordReport.DuplicatePasswordGroups | % {
    $outstring += "Group $($counter + 1):`n"
    $_ | % {$outstring += "`t$($_)`n"}
    $counter++
}
$FormattedDuplicatePW = $outstring.Replace((Get-ADDomain).NetBIOSName,'').Replace('\','')
#write-host "Debug: (Duplicate Password Groups: $StringArrayDuplicatePW, Weak Passwords Reported: $StringArrayWeakPW)"

#Get Extra Info for Custom Table
#generate XML docs for the effective GPO to be able to select other settings
    [string]$domain = (Get-WmiObject Win32_ComputerSystem).Domain
    New-Item -ItemType Directory -Force -Path "c:\temp" | out-null
    [string]$Path = "c:\temp\"
    Get-GPOReport -all -Domain $domain -ReportType xml -Path $Path\GPOReportsAll.xml
    [xml]$xmldocument = get-content $path\GPOReportsAll.xml
    #Extra Information pulled from this GPO report that is un-needed for CWA. 
    #$xmldocument.report.gpo.computer.extensiondata.extension.policy | format-table -autosize -wrap -property name, state | out-string -width 4096 |out-file $Path\GPOReportsAllProcessed.text
    #$xmldocument.report.gpo.computer.extensiondata.extension.policy | Where-Object {$_}|Export-CSV $path\GPOReportsAllProcessedcomputer.csv -NoTypeInformation
    #$xmldocument.report.gpo.computer.extensiondata.extension.account | Where-Object {$_}|Export-CSV $path\GPOReportsAllProcessedAccount.csv -NoTypeInformation
    $xmldocument.report.gpo.computer.extensiondata.extension.securityOptions.display | Where-Object {$_}|Export-CSV $path\GPOReportsAllProcessedSecu.csv -NoTypeInformation
    #set results
    $ReversibleEncryptionEnabled = if((get-addefaultdomainpasswordpolicy | select -exp "ReversibleEncryptionEnabled")-eq 'False'){1}else{0}
    $InteractiveLogonMsg = if((import-csv $path\gporeportsallprocessedsecu.csv|where{$_.name  -eq "Interactive logon: Message text for users attempting to log on"}|select -exp name)){1}else{0}

#Build Insert Statement. --Do NOT Modify. Things will break if the order changes--
Write-Host  "$ReversibleEncryptionEnabled, $InteractiveLogonMsg, '$FinalStringDuplicatePW','$FormattedDuplicatePW', '$FinalStringWeakPW'"

#Cleanup Files if specified
If($CleanupTxtFile){
    If($CleanupAllFiles){
        Remove-Item "$DictFileLOC\$txtfilename" -ErrorAction Ignore
        Remove-Item "$DictFileLoc\$DictFileName" -ErrorAction Ignore
    }
    else {
        Remove-Item "$DictFileLOC\$txtfilename" -ErrorAction Ignore
    }
}
else {
    If($CleanupAllFiles){
        Remove-Item "$DictFileLOC\$txtfilename" -ErrorAction Ignore
        Remove-Item "$DictFileLoc\$DictFileName" -ErrorAction Ignore
    }
    else{
        #write-host "Debug: Files are not set to be cleaned up. Leaving all files."
    }
}
