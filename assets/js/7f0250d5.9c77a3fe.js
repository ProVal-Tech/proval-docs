"use strict";(self.webpackChunkproval_docs=self.webpackChunkproval_docs||[]).push([[6328],{2434:(e,t,s)=>{s.r(t),s.d(t,{assets:()=>a,contentTitle:()=>d,default:()=>c,frontMatter:()=>o,metadata:()=>n,toc:()=>l});const n=JSON.parse('{"id":"powershell/ps-repair-windowsupdate","title":"Repair-WindowsUpdate","description":"Documentation for the Repair-WindowsUpdate command to reset Windows Update settings and troubleshoot update issues.","source":"@site/docs/powershell/Repair-WindowsUpdate.md","sourceDirName":"powershell","slug":"/powershell/ps-repair-windowsupdate","permalink":"/docs/powershell/ps-repair-windowsupdate","draft":false,"unlisted":false,"editUrl":"https://github.com/proval-tech/docs/tree/main/packages/create-docusaurus/templates/shared/docs/powershell/Repair-WindowsUpdate.md","tags":[{"inline":false,"label":"Windows","permalink":"/docs/tags/windows","description":"Content related to the Windows operating system."},{"inline":false,"label":"Updates","permalink":"/docs/tags/update","description":"Content related to updating software."},{"inline":false,"label":"Configuration","permalink":"/docs/tags/configuration","description":"Content related to configuring a device."}],"version":"current","frontMatter":{"id":"ps-repair-windowsupdate","title":"Repair-WindowsUpdate","title_meta":"Repair-WindowsUpdate Command","keywords":["repair","windowsupdate","reset","troubleshoot"],"description":"Documentation for the Repair-WindowsUpdate command to reset Windows Update settings and troubleshoot update issues.","tags":["windows","update","configuration"],"draft":false,"unlisted":false},"sidebar":"contentSidebar","previous":{"title":"Repair-PrintSpooler","permalink":"/docs/powershell/ps-repair-printspooler"},"next":{"title":"Reset-KrbtgtKeys","permalink":"/docs/powershell/ps-reset-krbtgtkeys"}}');var i=s(4848),r=s(8453);const o={id:"ps-repair-windowsupdate",title:"Repair-WindowsUpdate",title_meta:"Repair-WindowsUpdate Command",keywords:["repair","windowsupdate","reset","troubleshoot"],description:"Documentation for the Repair-WindowsUpdate command to reset Windows Update settings and troubleshoot update issues.",tags:["windows","update","configuration"],draft:!1,unlisted:!1},d=void 0,a={},l=[{value:"Description",id:"description",level:2},{value:"Requirements",id:"requirements",level:2},{value:"Usage",id:"usage",level:2},{value:"Parameters",id:"parameters",level:2},{value:"Output",id:"output",level:2}];function p(e){const t={code:"code",em:"em",h2:"h2",li:"li",p:"p",pre:"pre",table:"table",tbody:"tbody",td:"td",th:"th",thead:"thead",tr:"tr",ul:"ul",...(0,r.R)(),...e.components};return(0,i.jsxs)(i.Fragment,{children:[(0,i.jsx)(t.h2,{id:"description",children:"Description"}),"\n",(0,i.jsx)(t.p,{children:"Script used to reset windows update settings."}),"\n",(0,i.jsx)(t.p,{children:'\ud83d\udea8 This script is provided "without warranty". \ud83d\udea8'}),"\n",(0,i.jsx)(t.p,{children:"It is not necessary that running the script will resolve any issue with the windows updates. It will simply attempt to reset windows update settings."}),"\n",(0,i.jsxs)(t.p,{children:["\ud83d\udea8 ",(0,i.jsx)(t.em,{children:"YOU HAVE BEEN WARNED"})," \ud83d\udea8"]}),"\n",(0,i.jsx)(t.h2,{id:"requirements",children:"Requirements"}),"\n",(0,i.jsxs)(t.ul,{children:["\n",(0,i.jsx)(t.li,{children:"PowerShell v5"}),"\n",(0,i.jsx)(t.li,{children:"Must be executed as administrator"}),"\n",(0,i.jsx)(t.li,{children:"Windows must be licensed"}),"\n"]}),"\n",(0,i.jsx)(t.h2,{id:"usage",children:"Usage"}),"\n",(0,i.jsxs)(t.ul,{children:["\n",(0,i.jsx)(t.li,{children:"Stop the services related to windows updates."}),"\n",(0,i.jsx)(t.li,{children:"Perform System File Check."}),"\n",(0,i.jsx)(t.li,{children:"Rename cache directories for windows update."}),"\n",(0,i.jsx)(t.li,{children:"Start the services related to windows updates."}),"\n",(0,i.jsx)(t.li,{children:"Logs any failures to the error log."}),"\n"]}),"\n",(0,i.jsx)(t.p,{children:"Attempt to reset windows update settings as a primary troubleshooting step for windows update issues."}),"\n",(0,i.jsx)(t.pre,{children:(0,i.jsx)(t.code,{className:"language-powershell",children:".\\Repair-WindowsUpdate.ps1\n"})}),"\n",(0,i.jsx)(t.p,{children:"Attempt to reset windows update settings as a primary troubleshooting step, with an optional sfc scan, for windows update issues."}),"\n",(0,i.jsx)(t.pre,{children:(0,i.jsx)(t.code,{className:"language-powershell",children:".\\Repair-WindowsUpdate.ps1 -SFCScan\n"})}),"\n",(0,i.jsx)(t.h2,{id:"parameters",children:"Parameters"}),"\n",(0,i.jsxs)(t.table,{children:[(0,i.jsx)(t.thead,{children:(0,i.jsxs)(t.tr,{children:[(0,i.jsx)(t.th,{children:"Parameter"}),(0,i.jsx)(t.th,{children:"Alias"}),(0,i.jsx)(t.th,{children:"Required"}),(0,i.jsx)(t.th,{children:"Default"}),(0,i.jsx)(t.th,{children:"Type"}),(0,i.jsx)(t.th,{children:"Description"})]})}),(0,i.jsx)(t.tbody,{children:(0,i.jsxs)(t.tr,{children:[(0,i.jsx)(t.td,{children:(0,i.jsx)(t.code,{children:"-SFCScan"})}),(0,i.jsx)(t.td,{}),(0,i.jsx)(t.td,{children:"False"}),(0,i.jsx)(t.td,{}),(0,i.jsx)(t.td,{children:"Switch"}),(0,i.jsx)(t.td,{children:"Toggles an optional sfc scan as a repair option for windows updates."})]})})]}),"\n",(0,i.jsx)(t.h2,{id:"output",children:"Output"}),"\n",(0,i.jsx)(t.p,{children:"Location of output for log, result, and error files."}),"\n",(0,i.jsx)(t.p,{children:".\\Reset-WindowsUpdates-log.txt\r\n.\\Reset-WindowsUpdates-error.txt"})]})}function c(e={}){const{wrapper:t}={...(0,r.R)(),...e.components};return t?(0,i.jsx)(t,{...e,children:(0,i.jsx)(p,{...e})}):p(e)}},8453:(e,t,s)=>{s.d(t,{R:()=>o,x:()=>d});var n=s(6540);const i={},r=n.createContext(i);function o(e){const t=n.useContext(r);return n.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function d(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(i):e.components||i:o(e.components),n.createElement(r.Provider,{value:t},e.children)}}}]);