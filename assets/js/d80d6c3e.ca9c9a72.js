"use strict";(self.webpackChunkproval_docs=self.webpackChunkproval_docs||[]).push([[1522],{3064:(e,t,s)=>{s.r(t),s.d(t,{assets:()=>i,contentTitle:()=>a,default:()=>c,frontMatter:()=>r,metadata:()=>l,toc:()=>d});const l=JSON.parse('{"id":"powershell/ps-update-powershell","title":"Update-PowerShell","description":"Documentation for the Update-PowerShell command to update PowerShell Desktop to the latest version.","source":"@site/docs/powershell/Update-PowerShell.md","sourceDirName":"powershell","slug":"/powershell/ps-update-powershell","permalink":"/proval-docs/docs/powershell/ps-update-powershell","draft":false,"unlisted":false,"editUrl":"https://github.com/proval-tech/docs/tree/main/packages/create-docusaurus/templates/shared/docs/powershell/Update-PowerShell.md","tags":[{"inline":false,"label":"Updates","permalink":"/proval-docs/docs/tags/update","description":"Content related to updating software."},{"inline":false,"label":"Installation","permalink":"/proval-docs/docs/tags/installation","description":"Content related to installing software."},{"inline":false,"label":"Windows","permalink":"/proval-docs/docs/tags/windows","description":"Content related to the Windows operating system."},{"inline":false,"label":"Software","permalink":"/proval-docs/docs/tags/software","description":"Content related to software."}],"version":"current","frontMatter":{"id":"ps-update-powershell","title":"Update-PowerShell","title_meta":"Update-PowerShell Command","keywords":["update","powershell","installation","windows"],"description":"Documentation for the Update-PowerShell command to update PowerShell Desktop to the latest version.","tags":["update","installation","windows","software"],"draft":false,"unlisted":false},"sidebar":"contentSidebar","previous":{"title":"Update-Office","permalink":"/proval-docs/docs/powershell/ps-update-office"},"next":{"title":"Update-PowerShellGet","permalink":"/proval-docs/docs/powershell/ps-update-powershellget"}}');var o=s(4848),n=s(8453);const r={id:"ps-update-powershell",title:"Update-PowerShell",title_meta:"Update-PowerShell Command",keywords:["update","powershell","installation","windows"],description:"Documentation for the Update-PowerShell command to update PowerShell Desktop to the latest version.",tags:["update","installation","windows","software"],draft:!1,unlisted:!1},a=void 0,i={},d=[{value:"Description",id:"description",level:2},{value:"Requirements",id:"requirements",level:2},{value:"Usage",id:"usage",level:2}];function p(e){const t={code:"code",h2:"h2",li:"li",ol:"ol",p:"p",pre:"pre",...(0,n.R)(),...e.components};return(0,o.jsxs)(o.Fragment,{children:[(0,o.jsx)(t.h2,{id:"description",children:"Description"}),"\n",(0,o.jsx)(t.p,{children:"Updates PowerShell Desktop to the latest version."}),"\n",(0,o.jsx)(t.h2,{id:"requirements",children:"Requirements"}),"\n",(0,o.jsxs)(t.ol,{children:["\n",(0,o.jsx)(t.li,{children:"Target OS is not Windows XP, 2003, or Vista/2008, Because PowerShell V5 is not available for these operating systems."}),"\n",(0,o.jsx)(t.li,{children:"Target OS is not Windows 10 or Server 2016, Because PowerShell V5 is installed by default on these systems."}),"\n",(0,o.jsx)(t.li,{children:"Target OS is not Windows 7 or Server 2008R2 but not SP2, Because SP2 must be installed to install PowerShell V5."}),"\n",(0,o.jsx)(t.li,{children:"Target OS is not Windows 8, Because PowerShell V5 is not applicable to this operating system."}),"\n",(0,o.jsx)(t.li,{children:"Target OS is not Windows 7 or Server 2008R2 SP2 but missing .NET Framework 4.5.2 or greater, because .Net 4.5.2 is required."}),"\n"]}),"\n",(0,o.jsx)(t.h2,{id:"usage",children:"Usage"}),"\n",(0,o.jsxs)(t.ol,{children:["\n",(0,o.jsx)(t.li,{children:"Checks for all the requirements and exits if not met."}),"\n",(0,o.jsxs)(t.li,{children:["Downloads the WMF5 installer based on OS and architecture.","\n",(0,o.jsxs)(t.ol,{children:["\n",(0,o.jsx)(t.li,{children:"Extracts the .zip file downloaded, if necessary."}),"\n"]}),"\n"]}),"\n",(0,o.jsxs)(t.li,{children:["Executes the MSU installation with ",(0,o.jsx)(t.code,{children:"wusa.exe"}),"."]}),"\n",(0,o.jsx)(t.li,{children:"Exits after the installation is complete."}),"\n"]}),"\n",(0,o.jsx)(t.pre,{children:(0,o.jsx)(t.code,{className:"language-powershell",children:".\\Update-PowershellV2.ps1\n"})}),"\n",(0,o.jsx)(t.p,{children:"Updates PowerShell on the target machine to PowerShell V5."})]})}function c(e={}){const{wrapper:t}={...(0,n.R)(),...e.components};return t?(0,o.jsx)(t,{...e,children:(0,o.jsx)(p,{...e})}):p(e)}},8453:(e,t,s)=>{s.d(t,{R:()=>r,x:()=>a});var l=s(6540);const o={},n=l.createContext(o);function r(e){const t=l.useContext(n);return l.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function a(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(o):e.components||o:r(e.components),l.createElement(n.Provider,{value:t},e.children)}}}]);