"use strict";(self.webpackChunkproval_docs=self.webpackChunkproval_docs||[]).push([[97],{6870:(e,n,s)=>{s.r(n),s.d(n,{assets:()=>a,contentTitle:()=>l,default:()=>c,frontMatter:()=>i,metadata:()=>t,toc:()=>d});const t=JSON.parse('{"id":"powershell/ps-get-chromiumextensions","title":"Get-ChromiumExtensions","description":"Documentation for the Get-ChromiumExtensions command to gather information about extensions installed on Chromium-based browsers for each user.","source":"@site/docs/powershell/Get-ChromiumExtensions.md","sourceDirName":"powershell","slug":"/powershell/ps-get-chromiumextensions","permalink":"/docs/powershell/ps-get-chromiumextensions","draft":false,"unlisted":false,"editUrl":"https://github.com/proval-tech/docs/tree/main/packages/create-docusaurus/templates/shared/docs/powershell/Get-ChromiumExtensions.md","tags":[{"inline":false,"label":"Chrome","permalink":"/docs/tags/chrome","description":"Content related to the Chrome web browser."},{"inline":false,"label":"Web Browser","permalink":"/docs/tags/web-browser","description":"Content related to web browsers."},{"inline":false,"label":"Configuration","permalink":"/docs/tags/configuration","description":"Content related to configuring a device."},{"inline":false,"label":"Software","permalink":"/docs/tags/software","description":"Content related to software."}],"version":"current","frontMatter":{"id":"ps-get-chromiumextensions","title":"Get-ChromiumExtensions","title_meta":"Get-ChromiumExtensions Command","keywords":["chromium","extensions","browser","user"],"description":"Documentation for the Get-ChromiumExtensions command to gather information about extensions installed on Chromium-based browsers for each user.","tags":["chrome","web-browser","configuration","software"],"draft":false,"unlisted":false},"sidebar":"contentSidebar","previous":{"title":"Get-CWControlUsers","permalink":"/docs/powershell/ps-get-cwcontrolusers"},"next":{"title":"Get-CriticalDiskInfo","permalink":"/docs/powershell/ps-get-criticaldiskinfo"}}');var r=s(4848),o=s(8453);const i={id:"ps-get-chromiumextensions",title:"Get-ChromiumExtensions",title_meta:"Get-ChromiumExtensions Command",keywords:["chromium","extensions","browser","user"],description:"Documentation for the Get-ChromiumExtensions command to gather information about extensions installed on Chromium-based browsers for each user.",tags:["chrome","web-browser","configuration","software"],draft:!1,unlisted:!1},l=void 0,a={},d=[{value:"Description",id:"description",level:2},{value:"Requirements",id:"requirements",level:2},{value:"Usage",id:"usage",level:2},{value:"Parameters",id:"parameters",level:2},{value:"Output",id:"output",level:2}];function h(e){const n={code:"code",h2:"h2",hr:"hr",li:"li",ol:"ol",p:"p",pre:"pre",strong:"strong",table:"table",tbody:"tbody",td:"td",th:"th",thead:"thead",tr:"tr",ul:"ul",...(0,o.R)(),...e.components};return(0,r.jsxs)(r.Fragment,{children:[(0,r.jsx)(n.h2,{id:"description",children:"Description"}),"\n",(0,r.jsx)(n.p,{children:"Gather information about extensions installed on Chromium browsers for each user.\r\nSupported Browsers: Google Chrome, Brave, Microsoft Edge Chromium"}),"\n",(0,r.jsx)(n.h2,{id:"requirements",children:"Requirements"}),"\n",(0,r.jsxs)(n.ul,{children:["\n",(0,r.jsx)(n.li,{children:"Run as administrator"}),"\n",(0,r.jsx)(n.li,{children:"Powershell v5+"}),"\n"]}),"\n",(0,r.jsx)(n.h2,{id:"usage",children:"Usage"}),"\n",(0,r.jsxs)(n.ol,{children:["\n",(0,r.jsx)(n.li,{children:"Get valid user profile paths."}),"\n",(0,r.jsx)(n.li,{children:"Set the UserProfile's relative path to the 'Extensions' directory for each browser."}),"\n",(0,r.jsxs)(n.li,{children:["For each browser's 'Extensions' directory for each user profile performs the following steps:","\n",(0,r.jsxs)(n.ol,{children:["\n",(0,r.jsx)(n.li,{children:"Find the installation path and Manifest.json file of each installed extension."}),"\n",(0,r.jsxs)(n.li,{children:["Read the Manifest.json file to find the ",(0,r.jsx)(n.code,{children:"name"})," of the extension."]}),"\n",(0,r.jsxs)(n.li,{children:["The manifest file either contains the ",(0,r.jsx)(n.code,{children:"name"})," of the extension or the reference of the variable storing the name in the Message.json file"]}),"\n",(0,r.jsxs)(n.li,{children:["If the manifest file returns a variable starting with double underscores (e.g., '",(0,r.jsx)(n.strong,{children:"MSG_APP_NAME"}),"'), then attempts to find the extension's name from the 'en\\messages.json' file followed by the 'en_us\\messages.json' file.\r\ne.g., if the ",(0,r.jsx)(n.code,{children:"name"})," stored in the Manifest.json file is '",(0,r.jsx)(n.strong,{children:"MSG_APP_NAME"}),"' then both message.json files will be checked for the value stored under the 'APP_NAME' object.\r\nv. Stores the extension's information in a [pscustomobject] and returns."]}),"\n"]}),"\n"]}),"\n"]}),"\n",(0,r.jsx)(n.p,{children:"Get installed extensions from all supported browsers."}),"\n",(0,r.jsx)(n.pre,{children:(0,r.jsx)(n.code,{className:"language-powershell",children:".\\Get-ChromiumExtensions.ps1\n"})}),"\n",(0,r.jsx)(n.p,{children:"Get installed extensions from Google Chrome only."}),"\n",(0,r.jsx)(n.pre,{children:(0,r.jsx)(n.code,{className:"language-powershell",children:".\\Get-ChromiumExtensions.ps1 -Browser Chrome\n"})}),"\n",(0,r.jsx)(n.p,{children:"Get installed extensions from Microsoft Edge only."}),"\n",(0,r.jsx)(n.pre,{children:(0,r.jsx)(n.code,{className:"language-powershell",children:".\\Get-ChromiumExtensions.ps1 -Browser Edge\n"})}),"\n",(0,r.jsx)(n.p,{children:"Get installed extensions from Microsoft Edge and Brave."}),"\n",(0,r.jsx)(n.pre,{children:(0,r.jsx)(n.code,{className:"language-powershell",children:".\\Get-ChromiumExtensions.ps1 -Browser Edge,Brave\n"})}),"\n",(0,r.jsx)(n.h2,{id:"parameters",children:"Parameters"}),"\n",(0,r.jsxs)(n.table,{children:[(0,r.jsx)(n.thead,{children:(0,r.jsxs)(n.tr,{children:[(0,r.jsx)(n.th,{children:"Parameter"}),(0,r.jsx)(n.th,{children:"Alias"}),(0,r.jsx)(n.th,{children:"Required"}),(0,r.jsx)(n.th,{children:"Default"}),(0,r.jsx)(n.th,{children:"Type"}),(0,r.jsx)(n.th,{children:"Description"})]})}),(0,r.jsx)(n.tbody,{children:(0,r.jsxs)(n.tr,{children:[(0,r.jsx)(n.td,{children:(0,r.jsx)(n.code,{children:"Browser"})}),(0,r.jsx)(n.td,{}),(0,r.jsx)(n.td,{children:"False"}),(0,r.jsx)(n.td,{children:"Chrome,Edge,Brave"}),(0,r.jsx)(n.td,{children:"String"}),(0,r.jsx)(n.td,{children:"Validate set array containing popular Chromium based browsers. Available options: Chrome, Edge, Brave"})]})})]}),"\n",(0,r.jsx)(n.h2,{id:"output",children:"Output"}),"\n",(0,r.jsx)(n.p,{children:".\\Get-ChromiumExtensions-log.txt\r\n.\\Get-ChromiumExtensions-error.txt\r\nSystem.Management.Automation.PSCustomObject\r\nName                    MemberType   Definition"}),"\n",(0,r.jsx)(n.hr,{}),"\n",(0,r.jsx)(n.p,{children:"Browser                 NoteProperty string Browser=Chrome\r\nExtensionID             NoteProperty string ExtensionID=ejgnolahdlcimijhloboakpjogbfdkkp\r\nExtensionInstallTimeUtc NoteProperty datetime ExtensionInstallTimeUtc=04/10/2022 10:14:46\r\nExtensionName           NoteProperty string ExtensionName=An Extension\r\nIsDefault               NoteProperty bool IsDefault=False\r\nExtensionVersion        NoteProperty string ExtensionVersion=1.12.2\r\nUserProfilePath         NoteProperty System.String UserProfilePath=C:\\Users\\localadmin"})]})}function c(e={}){const{wrapper:n}={...(0,o.R)(),...e.components};return n?(0,r.jsx)(n,{...e,children:(0,r.jsx)(h,{...e})}):h(e)}},8453:(e,n,s)=>{s.d(n,{R:()=>i,x:()=>l});var t=s(6540);const r={},o=t.createContext(r);function i(e){const n=t.useContext(o);return t.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function l(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(r):e.components||r:i(e.components),t.createElement(o.Provider,{value:n},e.children)}}}]);