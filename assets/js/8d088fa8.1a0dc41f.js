"use strict";(self.webpackChunkproval_docs=self.webpackChunkproval_docs||[]).push([[3394],{1902:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>r,contentTitle:()=>a,default:()=>p,frontMatter:()=>l,metadata:()=>s,toc:()=>c});const s=JSON.parse('{"id":"powershell/ps-get-newlocaladmin","title":"Get-NewLocalAdmin","description":"Documentation for the Get-NewLocalAdmin command to get user accounts that have been granted elevated permissions since the last run of the script.","source":"@site/docs/powershell/Get-NewLocalAdmin.md","sourceDirName":"powershell","slug":"/powershell/ps-get-newlocaladmin","permalink":"/proval-docs/docs/powershell/ps-get-newlocaladmin","draft":false,"unlisted":false,"editUrl":"https://github.com/proval-tech/docs/tree/main/packages/create-docusaurus/templates/shared/docs/powershell/Get-NewLocalAdmin.md","tags":[{"inline":false,"label":"Windows","permalink":"/proval-docs/docs/tags/windows","description":"Content related to the Windows operating system."},{"inline":false,"label":"Security","permalink":"/proval-docs/docs/tags/security","description":"Content related to security."},{"inline":false,"label":"Configuration","permalink":"/proval-docs/docs/tags/configuration","description":"Content related to configuring a device."}],"version":"current","frontMatter":{"id":"ps-get-newlocaladmin","title":"Get-NewLocalAdmin","title_meta":"Get-NewLocalAdmin Command","keywords":["new","local","admin","permissions"],"description":"Documentation for the Get-NewLocalAdmin command to get user accounts that have been granted elevated permissions since the last run of the script.","tags":["windows","security","configuration"],"draft":false,"unlisted":false},"sidebar":"contentSidebar","previous":{"title":"Get-NewDomainAdmin","permalink":"/proval-docs/docs/powershell/ps-get-newdomainadmin"},"next":{"title":"Get-NewLocalUser","permalink":"/proval-docs/docs/powershell/ps-get-newlocaluser"}}');var i=n(4848),o=n(8453);const l={id:"ps-get-newlocaladmin",title:"Get-NewLocalAdmin",title_meta:"Get-NewLocalAdmin Command",keywords:["new","local","admin","permissions"],description:"Documentation for the Get-NewLocalAdmin command to get user accounts that have been granted elevated permissions since the last run of the script.",tags:["windows","security","configuration"],draft:!1,unlisted:!1},a=void 0,r={},c=[{value:"Description",id:"description",level:2},{value:"Requirements",id:"requirements",level:2},{value:"Output",id:"output",level:2},{value:"Log Files",id:"log-files",level:3},{value:"Tables",id:"tables",level:3}];function d(e){const t={code:"code",h2:"h2",h3:"h3",li:"li",p:"p",pre:"pre",ul:"ul",...(0,o.R)(),...e.components};return(0,i.jsxs)(i.Fragment,{children:[(0,i.jsx)(t.h2,{id:"description",children:"Description"}),"\n",(0,i.jsx)(t.p,{children:"Gets user accounts that have been granted elevated permissions since the last run of the script."}),"\n",(0,i.jsx)(t.h2,{id:"requirements",children:"Requirements"}),"\n",(0,i.jsxs)(t.ul,{children:["\n",(0,i.jsx)(t.li,{children:"Run as administrator"}),"\n",(0,i.jsx)(t.li,{children:"PowerShell v5"}),"\n"]}),"\n",(0,i.jsx)(t.p,{children:"If the script has not been run previously, then the admin data is saved to the table and the script exits. If a new admin is detected from a previous run, then it returns the newly elevated users (if any)."}),"\n",(0,i.jsx)(t.pre,{children:(0,i.jsx)(t.code,{className:"language-powershell",children:".\\Get-NewLocalAdmin.ps1\n"})}),"\n",(0,i.jsx)(t.h2,{id:"output",children:"Output"}),"\n",(0,i.jsx)(t.h3,{id:"log-files",children:"Log Files"}),"\n",(0,i.jsx)(t.p,{children:".\\Get-NewLocalAdmin-log.txt"}),"\n",(0,i.jsx)(t.h3,{id:"tables",children:"Tables"}),"\n",(0,i.jsx)(t.p,{children:"Get-NewLocalAdmin_log\r\nGet-NewLocalAdmin_admins"})]})}function p(e={}){const{wrapper:t}={...(0,o.R)(),...e.components};return t?(0,i.jsx)(t,{...e,children:(0,i.jsx)(d,{...e})}):d(e)}},8453:(e,t,n)=>{n.d(t,{R:()=>l,x:()=>a});var s=n(6540);const i={},o=s.createContext(i);function l(e){const t=s.useContext(o);return s.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function a(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(i):e.components||i:l(e.components),s.createElement(o.Provider,{value:t},e.children)}}}]);