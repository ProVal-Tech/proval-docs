"use strict";(self.webpackChunkproval_docs=self.webpackChunkproval_docs||[]).push([[6436],{5012:(e,s,n)=>{n.r(s),n.d(s,{assets:()=>c,contentTitle:()=>l,default:()=>h,frontMatter:()=>d,metadata:()=>i,toc:()=>o});const i=JSON.parse('{"id":"powershell/ps-get-patchconfig","title":"Get-PatchConfig","description":"Documentation for the Get-PatchConfig command to retrieve Windows Update settings and services for system patch management.","source":"@site/docs/powershell/Get-PatchConfig.md","sourceDirName":"powershell","slug":"/powershell/ps-get-patchconfig","permalink":"/proval-docs/docs/powershell/ps-get-patchconfig","draft":false,"unlisted":false,"editUrl":"https://github.com/proval-tech/docs/tree/main/packages/create-docusaurus/templates/shared/docs/powershell/Get-PatchConfig.md","tags":[{"inline":false,"label":"Windows","permalink":"/proval-docs/docs/tags/windows","description":"Content related to the Windows operating system."},{"inline":false,"label":"Updates","permalink":"/proval-docs/docs/tags/update","description":"Content related to updating software."},{"inline":false,"label":"Configuration","permalink":"/proval-docs/docs/tags/configuration","description":"Content related to configuring a device."}],"version":"current","frontMatter":{"id":"ps-get-patchconfig","title":"Get-PatchConfig","title_meta":"Get-PatchConfig Command","keywords":["windows","update","patch","configuration"],"description":"Documentation for the Get-PatchConfig command to retrieve Windows Update settings and services for system patch management.","tags":["windows","update","configuration"],"draft":false,"unlisted":false},"sidebar":"contentSidebar","previous":{"title":"Get-OfficeActivationStatus","permalink":"/proval-docs/docs/powershell/ps-get-officeactivationstatus"},"next":{"title":"Get-PowerPlan","permalink":"/proval-docs/docs/powershell/ps-get-powerplan"}}');var r=n(4848),t=n(8453);const d={id:"ps-get-patchconfig",title:"Get-PatchConfig",title_meta:"Get-PatchConfig Command",keywords:["windows","update","patch","configuration"],description:"Documentation for the Get-PatchConfig command to retrieve Windows Update settings and services for system patch management.",tags:["windows","update","configuration"],draft:!1,unlisted:!1},l=void 0,c={},o=[{value:"Description",id:"description",level:2},{value:"Requirements",id:"requirements",level:2},{value:"Usage",id:"usage",level:2},{value:"PatchConfig Object",id:"patchconfig-object",level:2},{value:"$PatchConfig Structure",id:"patchconfig-structure",level:3},{value:"1. <strong>Services</strong>",id:"1-services",level:4},{value:"2. <strong>BranchReadinessLevel</strong>",id:"2-branchreadinesslevel",level:4},{value:"3. <strong>UxSettings</strong>",id:"3-uxsettings",level:4},{value:"4. <strong>WindowsUpdate</strong>",id:"4-windowsupdate",level:4},{value:"5. <strong>AutoUpdate</strong>",id:"5-autoupdate",level:4},{value:"6. <strong>UserWUPolicy</strong>",id:"6-userwupolicy",level:4},{value:"7. <strong>Orchestrator</strong>",id:"7-orchestrator",level:4},{value:"Example of the Output Object <code>$PatchConfig</code>",id:"example-of-the-output-object-patchconfig",level:4},{value:"Output",id:"output",level:2}];function a(e){const s={code:"code",h2:"h2",h3:"h3",h4:"h4",li:"li",ol:"ol",p:"p",pre:"pre",strong:"strong",ul:"ul",...(0,t.R)(),...e.components};return(0,r.jsxs)(r.Fragment,{children:[(0,r.jsx)(s.h2,{id:"description",children:"Description"}),"\n",(0,r.jsx)(s.p,{children:"Retrieves Windows Update settings and services for system patch management."}),"\n",(0,r.jsx)(s.h2,{id:"requirements",children:"Requirements"}),"\n",(0,r.jsx)(s.p,{children:"PowerShell v5+"}),"\n",(0,r.jsx)(s.h2,{id:"usage",children:"Usage"}),"\n",(0,r.jsxs)(s.ol,{children:["\n",(0,r.jsx)(s.li,{children:"Set Progress Preference and Security Protocol"}),"\n",(0,r.jsxs)(s.li,{children:["Update or Install ",(0,r.jsx)(s.code,{children:"Strapper"})," Module"]}),"\n",(0,r.jsx)(s.li,{children:"Collect Registry Data"}),"\n"]}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:["\n",(0,r.jsx)(s.p,{children:"Branch Readiness Level:"}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:["Path: ",(0,r.jsx)(s.code,{children:"HKLM:\\SOFTWARE\\Microsoft\\PolicyManager\\default\\Update\\BranchReadinessLevel"})]}),"\n",(0,r.jsxs)(s.li,{children:["Collect ",(0,r.jsx)(s.code,{children:"AllowedValues"})," and ",(0,r.jsx)(s.code,{children:"Value"})]}),"\n"]}),"\n"]}),"\n",(0,r.jsxs)(s.li,{children:["\n",(0,r.jsx)(s.p,{children:"UX Settings:"}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:["Path: ",(0,r.jsx)(s.code,{children:"HKLM:\\SOFTWARE\\Microsoft\\WindowsUpdate\\UX\\Settings"})]}),"\n",(0,r.jsxs)(s.li,{children:["Collect ",(0,r.jsx)(s.code,{children:"BranchReadinessLevel"}),", ",(0,r.jsx)(s.code,{children:"ActiveHoursStart"}),", and ",(0,r.jsx)(s.code,{children:"ActiveHoursEnd"})]}),"\n"]}),"\n"]}),"\n",(0,r.jsxs)(s.li,{children:["\n",(0,r.jsx)(s.p,{children:"Windows Update Policies:"}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:["Path: ",(0,r.jsx)(s.code,{children:"HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate"})]}),"\n",(0,r.jsxs)(s.li,{children:["Collect various settings including ",(0,r.jsx)(s.code,{children:"DisableWindowsUpdateAccess"}),", ",(0,r.jsx)(s.code,{children:"BranchReadinessLevel"}),", ",(0,r.jsx)(s.code,{children:"DeferFeatureUpdates"}),", etc."]}),"\n"]}),"\n"]}),"\n",(0,r.jsxs)(s.li,{children:["\n",(0,r.jsx)(s.p,{children:"Automatic Update Policies:"}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:["Path: ",(0,r.jsx)(s.code,{children:"HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU"})]}),"\n",(0,r.jsxs)(s.li,{children:["Collect various settings including ",(0,r.jsx)(s.code,{children:"NoAutoUpdate"}),", ",(0,r.jsx)(s.code,{children:"AUOptions"}),", ",(0,r.jsx)(s.code,{children:"ScheduledInstallDay"}),", etc."]}),"\n"]}),"\n"]}),"\n",(0,r.jsxs)(s.li,{children:["\n",(0,r.jsx)(s.p,{children:"User Windows Update Policy:"}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:["Path: ",(0,r.jsx)(s.code,{children:"HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WindowsUpdate"})]}),"\n",(0,r.jsxs)(s.li,{children:["Collect ",(0,r.jsx)(s.code,{children:"DisableWindowsUpdateAccess"})," for each user"]}),"\n"]}),"\n"]}),"\n",(0,r.jsxs)(s.li,{children:["\n",(0,r.jsx)(s.p,{children:"Orchestrator Settings:"}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:["Path: ",(0,r.jsx)(s.code,{children:"HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\WindowsUpdate\\Orchestrator"})]}),"\n",(0,r.jsxs)(s.li,{children:["Collect ",(0,r.jsx)(s.code,{children:"ScanBeforeInitialLogonAllowed"})," and ",(0,r.jsx)(s.code,{children:"UsoDisableAADJAttribution"})]}),"\n"]}),"\n"]}),"\n"]}),"\n",(0,r.jsxs)(s.ol,{start:"4",children:["\n",(0,r.jsxs)(s.li,{children:["\n",(0,r.jsx)(s.p,{children:"Collect Service Start Types"}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:["Collect the start types of following services:","\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"Wuauserv"})," (Windows Update Service)"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"Cryptsvc"})," (Cryptographic Services)"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"Bits"})," (Background Intelligent Transfer Service)"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"TrustedInstaller"})," (Windows Modules Installer)"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"UsoSvc"})," (Update Orchestrator Service)"]}),"\n"]}),"\n"]}),"\n"]}),"\n"]}),"\n",(0,r.jsxs)(s.li,{children:["\n",(0,r.jsx)(s.p,{children:"Assemble the Output Object"}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:["Combine all collected data into the ",(0,r.jsx)(s.code,{children:"$PatchConfig"})," object:"]}),"\n"]}),"\n"]}),"\n"]}),"\n",(0,r.jsx)(s.pre,{children:(0,r.jsx)(s.code,{className:"language-powershell",children:"        $PatchConfig = [PSCustomObject]@{\r\n            Services = $Services\r\n            BranchReadinessLevel = $BranchReadinessLevel\r\n            UxSettings = $UxSettings\r\n            WindowsUpdate = $WindowsUpdate  \r\n            AutoUpdate = $AutoUpdate\r\n            UserWUPolicy = $UserWUPolicy\r\n            Orchestrator = $Orchestrator\r\n        }\n"})}),"\n",(0,r.jsxs)(s.ol,{start:"8",children:["\n",(0,r.jsx)(s.li,{children:"Return the Output Object"}),"\n"]}),"\n",(0,r.jsx)(s.h2,{id:"patchconfig-object",children:"PatchConfig Object"}),"\n",(0,r.jsxs)(s.p,{children:["The ",(0,r.jsx)(s.code,{children:"$PatchConfig"})," object is a custom PowerShell object that contains configurations and statuses related to Windows Update and system services."]}),"\n",(0,r.jsx)(s.h3,{id:"patchconfig-structure",children:"$PatchConfig Structure"}),"\n",(0,r.jsxs)(s.h4,{id:"1-services",children:["1. ",(0,r.jsx)(s.strong,{children:"Services"})]}),"\n",(0,r.jsx)(s.p,{children:"This sub-object includes the start types of several essential services:"}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.strong,{children:(0,r.jsx)(s.code,{children:"Wuauserv"})})," (Windows Update Service)"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.strong,{children:(0,r.jsx)(s.code,{children:"Cryptsvc"})})," (Cryptographic Services)"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.strong,{children:(0,r.jsx)(s.code,{children:"Bits"})})," (Background Intelligent Transfer Service)"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.strong,{children:(0,r.jsx)(s.code,{children:"TrustedInstaller"})})," (Windows Modules Installer)"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.strong,{children:(0,r.jsx)(s.code,{children:"UsoSvc"})})," (Update Orchestrator Service)"]}),"\n"]}),"\n",(0,r.jsxs)(s.p,{children:[(0,r.jsxs)(s.strong,{children:["Possible values for ",(0,r.jsx)(s.code,{children:"StartType"})]}),":"]}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsx)(s.li,{children:(0,r.jsx)(s.code,{children:"Automatic"})}),"\n",(0,r.jsx)(s.li,{children:(0,r.jsx)(s.code,{children:"Manual"})}),"\n",(0,r.jsx)(s.li,{children:(0,r.jsx)(s.code,{children:"Disabled"})}),"\n"]}),"\n",(0,r.jsxs)(s.h4,{id:"2-branchreadinesslevel",children:["2. ",(0,r.jsx)(s.strong,{children:"BranchReadinessLevel"})]}),"\n",(0,r.jsxs)(s.p,{children:["This sub-object refers to the registry key ",(0,r.jsx)(s.code,{children:"HKLM:\\SOFTWARE\\Microsoft\\PolicyManager\\default\\Update\\BranchReadinessLevel"}),"."]}),"\n",(0,r.jsxs)(s.p,{children:[(0,r.jsx)(s.strong,{children:"Properties"}),":"]}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"Path"}),": The registry path."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"AllowedValues"}),": Possible values for the branch readiness level."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"Value"}),": The current value of the branch readiness level."]}),"\n"]}),"\n",(0,r.jsxs)(s.p,{children:[(0,r.jsxs)(s.strong,{children:["Possible values for ",(0,r.jsx)(s.code,{children:"AllowedValues"})," and ",(0,r.jsx)(s.code,{children:"Value"})]}),":"]}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"16"})," (Semi-Annual Channel)"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"8"})," (Semi-Annual Channel (Targeted))"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"32"})," (Release Preview)"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"48"})," (Insider Fast)"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"64"})," (Insider Slow)"]}),"\n"]}),"\n",(0,r.jsxs)(s.h4,{id:"3-uxsettings",children:["3. ",(0,r.jsx)(s.strong,{children:"UxSettings"})]}),"\n",(0,r.jsxs)(s.p,{children:["This sub-object refers to the registry key ",(0,r.jsx)(s.code,{children:"HKLM:\\SOFTWARE\\Microsoft\\WindowsUpdate\\UX\\Settings"}),"."]}),"\n",(0,r.jsxs)(s.p,{children:[(0,r.jsx)(s.strong,{children:"Properties"}),":"]}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"Path"}),": The registry path."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"BranchReadinessLevel"}),": The current branch readiness level."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"ActiveHoursStart"}),": The start time for active hours."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"ActiveHoursEnd"}),": The end time for active hours."]}),"\n"]}),"\n",(0,r.jsxs)(s.p,{children:[(0,r.jsx)(s.strong,{children:"Possible values"}),":"]}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"BranchReadinessLevel"}),": As defined above."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"ActiveHoursStart"}),": 0-23 (hours)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"ActiveHoursEnd"}),": 0-23 (hours)."]}),"\n"]}),"\n",(0,r.jsxs)(s.h4,{id:"4-windowsupdate",children:["4. ",(0,r.jsx)(s.strong,{children:"WindowsUpdate"})]}),"\n",(0,r.jsxs)(s.p,{children:["This sub-object refers to the registry key ",(0,r.jsx)(s.code,{children:"HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate"}),"."]}),"\n",(0,r.jsxs)(s.p,{children:[(0,r.jsx)(s.strong,{children:"Properties"}),":"]}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"Path"}),": The registry path."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DisableWindowsUpdateAccess"}),": Whether access to Windows Update is disabled."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"BranchReadinessLevel"}),": The current branch readiness level."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DeferFeatureUpdates"}),": Whether feature updates are deferred."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DeferFeatureUpdatesPeriodInDays"}),": Number of days to defer feature updates."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DeferQualityUpdates"}),": Whether quality updates are deferred."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DeferQualityUpdatesPeriodInDays"}),": Number of days to defer quality updates."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"WUServer"}),": URL of the Windows Update server."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"WUStatusServer"}),": URL of the Windows Update status server."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DoNotConnectToWindowsUpdateInternetLocations"}),": Whether to connect to Windows Update internet locations."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"TargetGroup"}),": The target group for updates."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"AcceptTrustedPublisherCerts"}),": Whether to accept trusted publisher certificates."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"ExcludeWUDriversInQualityUpdate"}),": Whether to exclude Windows Update drivers in quality updates."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DisableOSUpgrade"}),": Whether to disable windows upgrade functionality. (from windows 10 to 11)"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"TargetReleaseVersion"}),": Whether to limit the Windows feature release version to a certain version."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"TargetReleaseVersionInfo"}),": Windows Feature Release version to limit the upgrade of the computer. The computer can not be upgraded above the version stored in this registry key."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"SetDisableUXWUAccess"}),": Remove access to use all Windows Update features"]}),"\n"]}),"\n",(0,r.jsxs)(s.p,{children:[(0,r.jsx)(s.strong,{children:"Possible values"}),":"]}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DisableWindowsUpdateAccess"}),": 0 (not disabled), 1 (disabled)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"BranchReadinessLevel"}),": As defined above."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DeferFeatureUpdates"}),": 0 (not deferred), 1 (deferred)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DeferFeatureUpdatesPeriodInDays"}),": 0-365 (days)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DeferQualityUpdates"}),": 0 (not deferred), 1 (deferred)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DeferQualityUpdatesPeriodInDays"}),": 0-30 (days)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"WUServer"}),": String (URL)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"WUStatusServer"}),": String (URL)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DoNotConnectToWindowsUpdateInternetLocations"}),": 0 (allow connection), 1 (do not allow connection)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"TargetGroup"}),": String (group name)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"AcceptTrustedPublisherCerts"}),": 0 (not accepted), 1 (accepted)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"ExcludeWUDriversInQualityUpdate"}),": 0 (not excluded), 1 (excluded)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DisableOSUpgrade"}),": 0 (not disabled), 1 (disabled)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"TargetReleaseVersion"}),": 1 (",(0,r.jsx)(s.code,{children:"TargetReleaseVersionInfo"})," registry key is enabled), 0 (",(0,r.jsx)(s.code,{children:"TargetReleaseVersionInfo"})," registry key is not enabled.)"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"TargetReleaseVersionInfo"}),": String (22H2, 23H2, 24H2 etc.)"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"SetDisableUXWUAccess"}),": 0 (not disabled), 1 (disabled)."]}),"\n"]}),"\n",(0,r.jsxs)(s.h4,{id:"5-autoupdate",children:["5. ",(0,r.jsx)(s.strong,{children:"AutoUpdate"})]}),"\n",(0,r.jsxs)(s.p,{children:["This sub-object refers to the registry key ",(0,r.jsx)(s.code,{children:"HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU"}),"."]}),"\n",(0,r.jsxs)(s.p,{children:[(0,r.jsx)(s.strong,{children:"Properties"}),":"]}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"Path"}),": The registry path."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"NoAutoUpdate"}),": Whether automatic updates are disabled."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"AUOptions"}),": Automatic update options."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"ScheduledInstallDay"}),": The scheduled day for installing updates."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"ScheduledInstallTime"}),": The scheduled time for installing updates."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"UseWUServer"}),": Whether to use Windows Update server."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"RescheduleWaitTime"}),": The reschedule wait time."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"NoAutoRebootWithLoggedOnUsers"}),": Whether to avoid auto reboot with logged-on users."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DetectionFrequency"}),": The detection frequency for updates."]}),"\n"]}),"\n",(0,r.jsxs)(s.p,{children:[(0,r.jsx)(s.strong,{children:"Possible values"}),":"]}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"NoAutoUpdate"}),": 0 (automatic updates enabled), 1 (automatic updates disabled)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"AUOptions"}),":","\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsx)(s.li,{children:"2 (Notify for download and auto install)"}),"\n",(0,r.jsx)(s.li,{children:"3 (Auto download and notify for install)"}),"\n",(0,r.jsx)(s.li,{children:"4 (Auto download and schedule the install)"}),"\n",(0,r.jsx)(s.li,{children:"5 (Allow local admin to choose setting)"}),"\n"]}),"\n"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"ScheduledInstallDay"}),":","\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsx)(s.li,{children:"0 (Every day)"}),"\n",(0,r.jsx)(s.li,{children:"1-7 (Sunday to Saturday)"}),"\n"]}),"\n"]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"ScheduledInstallTime"}),": 0-23 (hours)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"UseWUServer"}),": 0 (do not use WU server), 1 (use WU server)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"RescheduleWaitTime"}),": 1-60 (minutes)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"NoAutoRebootWithLoggedOnUsers"}),": 0 (allow reboot), 1 (do not reboot)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DetectionFrequency"}),": 1-22 (hours)."]}),"\n"]}),"\n",(0,r.jsxs)(s.h4,{id:"6-userwupolicy",children:["6. ",(0,r.jsx)(s.strong,{children:"UserWUPolicy"})]}),"\n",(0,r.jsxs)(s.p,{children:["This sub-object refers to the registry key ",(0,r.jsx)(s.code,{children:"HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WindowsUpdate"}),", and ",(0,r.jsx)(s.code,{children:"HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer"}),"."]}),"\n",(0,r.jsxs)(s.p,{children:[(0,r.jsx)(s.strong,{children:"Properties"}),":"]}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DisableWindowsUpdateAccessPath"}),": The registry path of ",(0,r.jsx)(s.code,{children:"DisableWindowsUpdateAccess"})," property."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DisableWindowsUpdateAccess"}),": Disabling Windows Update access for users."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"NoWindowsUpdatePath"}),": The registry path of ",(0,r.jsx)(s.code,{children:"NoWindowsUpdatePath"})," property."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"NoWindowsUpdate"}),": Prevents users from connecting to the Windows Update website."]}),"\n"]}),"\n",(0,r.jsxs)(s.p,{children:[(0,r.jsx)(s.strong,{children:"Possible values"}),":"]}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"DisableWindowsUpdateAccess"}),": 0 (not disabled), 1 (disabled)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"NoWindowsUpdate"}),": 0 (Disabled or not configured. Users can connect to the Windows Update website.), 1 (Enabled. Users cannot connect to the Windows Update website.)"]}),"\n"]}),"\n",(0,r.jsxs)(s.h4,{id:"7-orchestrator",children:["7. ",(0,r.jsx)(s.strong,{children:"Orchestrator"})]}),"\n",(0,r.jsxs)(s.p,{children:["This sub-object refers to the registry key ",(0,r.jsx)(s.code,{children:"HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\WindowsUpdate\\Orchestrator"}),", and ",(0,r.jsx)(s.code,{children:"HKLM:\\Software\\Microsoft\\WindowsUpdate\\Orchestrator\\Configurations"}),"."]}),"\n",(0,r.jsxs)(s.p,{children:[(0,r.jsx)(s.strong,{children:"Properties"}),":"]}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"ScanBeforeInitialLogonAllowedPath"}),": The registry path of ",(0,r.jsx)(s.code,{children:"ScanBeforeInitialLogonAllowed"})," property."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"ScanBeforeInitialLogonAllowed"}),": Whether scanning before the initial logon is allowed."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"UsoDisableAADJAttributionPath"}),": The registry path of ",(0,r.jsx)(s.code,{children:"UsoDisableAADJAttribution"})," property."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"UsoDisableAADJAttribution"}),": To disable displaying the organization name in Windows Update notifications."]}),"\n"]}),"\n",(0,r.jsxs)(s.p,{children:[(0,r.jsx)(s.strong,{children:"Possible values"}),":"]}),"\n",(0,r.jsxs)(s.ul,{children:["\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"ScanBeforeInitialLogonAllowed"}),": 0 (not allowed), 1 (allowed)."]}),"\n",(0,r.jsxs)(s.li,{children:[(0,r.jsx)(s.code,{children:"UsoDisableAADJAttribution"}),": 0 (not disabled), 1 (disabled)."]}),"\n"]}),"\n",(0,r.jsxs)(s.h4,{id:"example-of-the-output-object-patchconfig",children:["Example of the Output Object ",(0,r.jsx)(s.code,{children:"$PatchConfig"})]}),"\n",(0,r.jsx)(s.pre,{children:(0,r.jsx)(s.code,{className:"language-powershell",children:"$PatchConfig = [PSCustomObject]@{\r\n    Services = [PSCustomObject]@{\r\n        Wuauserv = 'Automatic'\r\n        Cryptsvc = 'Manual'\r\n        Bits = 'Automatic'\r\n        TrustedInstaller = 'Manual'\r\n        UsoSvc = 'Manual'\r\n    }\r\n    BranchReadinessLevel = [PSCustomObject]@{\r\n        Path = 'HKLM:\\SOFTWARE\\Microsoft\\PolicyManager\\default\\Update\\BranchReadinessLevel'\r\n        AllowedValues = 16, 8, 32, 48, 64\r\n        Value = 8\r\n    }\r\n    UxSettings = [PSCustomObject]@{\r\n        Path = 'HKLM:\\SOFTWARE\\Microsoft\\WindowsUpdate\\UX\\Settings'\r\n        BranchReadinessLevel = 8\r\n        ActiveHoursStart = 8\r\n        ActiveHoursEnd = 17\r\n    }\r\n    WindowsUpdate = [PSCustomObject]@{\r\n        Path = 'HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate'\r\n        DisableWindowsUpdateAccess = 0\r\n        BranchReadinessLevel = 8\r\n        DeferFeatureUpdates = 1\r\n        DeferFeatureUpdatesPeriodInDays = 30\r\n        DeferQualityUpdates = 1\r\n        DeferQualityUpdatesPeriodInDays = 7\r\n        WUServer = 'https://update.server.local'\r\n        WUStatusServer = 'https://status.server.local'\r\n        DoNotConnectToWindowsUpdateInternetLocations = 1\r\n        TargetGroup = 'IT'\r\n        AcceptTrustedPublisherCerts = 1\r\n        ExcludeWUDriversInQualityUpdate = 1\r\n        DisableOSUpgrade = 1\r\n        TargetReleaseVersion = 1\r\n        TargetReleaseVersionInfo = '22H2'\r\n        SetDisableUXWUAccess = 1\r\n    }\r\n    AutoUpdate = [PSCustomObject]@{\r\n        Path = 'HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU'\r\n        NoAutoUpdate = 0\r\n        AUOptions = 4\r\n        ScheduledInstallDay = 0\r\n        ScheduledInstallTime = 3\r\n        UseWUServer = 1\r\n        RescheduleWaitTime = 10\r\n        NoAutoRebootWithLoggedOnUsers = 1\r\n        DetectionFrequency = 12\r\n    }\r\n    UserWUPolicy = [PSCustomObject]@{\r\n        DisableWindowsUpdateAccessPath = 'HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WindowsUpdate'\r\n        DisableWindowsUpdateAccess = [PSCustomObject]@{\r\n            UserName = 'user1'\r\n            Value = 1\r\n        }\r\n        NoWindowsUpdatePath = 'HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer'\r\n        NoWindowsUpdate = [PSCustomObject]@{\r\n            UserName = 'user1'\r\n            Value = 1\r\n        }\r\n    }\r\n    Orchestrator = [PSCustomObject]@{\r\n        ScanBeforeInitialLogonAllowedPath = 'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\WindowsUpdate\\Orchestrator'\r\n        ScanBeforeInitialLogonAllowed = 1\r\n        UsoDisableAADJAttributionPath = 'HKLM:\\Software\\Microsoft\\WindowsUpdate\\Orchestrator\\Configurations'\r\n        UsoDisableAADJAttribution = 0\r\n    }\r\n}\n"})}),"\n",(0,r.jsx)(s.h2,{id:"output",children:"Output"}),"\n",(0,r.jsx)(s.p,{children:"Get-PatchConfig-log.txt\r\nGet-PatchConfig-Error.txt"})]})}function h(e={}){const{wrapper:s}={...(0,t.R)(),...e.components};return s?(0,r.jsx)(s,{...e,children:(0,r.jsx)(a,{...e})}):a(e)}},8453:(e,s,n)=>{n.d(s,{R:()=>d,x:()=>l});var i=n(6540);const r={},t=i.createContext(r);function d(e){const s=i.useContext(t);return i.useMemo((function(){return"function"==typeof e?e(s):{...s,...e}}),[s,e])}function l(e){let s;return s=e.disableParentContext?"function"==typeof e.components?e.components(r):e.components||r:d(e.components),i.createElement(t.Provider,{value:s},e.children)}}}]);