"use strict";(self.webpackChunkproval_docs=self.webpackChunkproval_docs||[]).push([[6017],{8931:(e,r,t)=>{t.r(r),t.d(r,{assets:()=>l,contentTitle:()=>c,default:()=>u,frontMatter:()=>i,metadata:()=>s,toc:()=>a});const s=JSON.parse('{"id":"powershell/ps-get-groupmembers","title":"Get-GroupMembers","description":"Documentation for the Get-GroupMembers command to return all groups and their members for a local system, Active Directory, or Azure Active Directory.","source":"@site/docs/powershell/Get-GroupMembers.md","sourceDirName":"powershell","slug":"/powershell/ps-get-groupmembers","permalink":"/proval-docs/docs/powershell/ps-get-groupmembers","draft":false,"unlisted":false,"editUrl":"https://github.com/proval-tech/docs/tree/main/packages/create-docusaurus/templates/shared/docs/powershell/Get-GroupMembers.md","tags":[{"inline":false,"label":"Active Directory","permalink":"/proval-docs/docs/tags/active-directory","description":"Content related to Active Directory."},{"inline":false,"label":"Configuration","permalink":"/proval-docs/docs/tags/configuration","description":"Content related to configuring a device."},{"inline":false,"label":"Security","permalink":"/proval-docs/docs/tags/security","description":"Content related to security."}],"version":"current","frontMatter":{"id":"ps-get-groupmembers","title":"Get-GroupMembers","title_meta":"Get-GroupMembers Command","keywords":["groups","members","local","ad","azuread"],"description":"Documentation for the Get-GroupMembers command to return all groups and their members for a local system, Active Directory, or Azure Active Directory.","tags":["active-directory","configuration","security"],"draft":false,"unlisted":false},"sidebar":"contentSidebar","previous":{"title":"Get-GPResult","permalink":"/proval-docs/docs/powershell/ps-get-gpresult"},"next":{"title":"Get-HPiLOHealthReport","permalink":"/proval-docs/docs/powershell/ps-get-hpilohealthreport"}}');var o=t(4848),n=t(8453);const i={id:"ps-get-groupmembers",title:"Get-GroupMembers",title_meta:"Get-GroupMembers Command",keywords:["groups","members","local","ad","azuread"],description:"Documentation for the Get-GroupMembers command to return all groups and their members for a local system, Active Directory, or Azure Active Directory.",tags:["active-directory","configuration","security"],draft:!1,unlisted:!1},c=void 0,l={},a=[{value:"Description",id:"description",level:2},{value:"Requirements",id:"requirements",level:2},{value:"Usage",id:"usage",level:2},{value:"Parameters",id:"parameters",level:2},{value:"Output",id:"output",level:2}];function d(e){const r={code:"code",h2:"h2",li:"li",ol:"ol",p:"p",pre:"pre",table:"table",tbody:"tbody",td:"td",th:"th",thead:"thead",tr:"tr",...(0,n.R)(),...e.components};return(0,o.jsxs)(o.Fragment,{children:[(0,o.jsx)(r.h2,{id:"description",children:"Description"}),"\n",(0,o.jsx)(r.p,{children:"One Script that can return all groups and their members for a local system, or active directory, or Azure Active Directory."}),"\n",(0,o.jsx)(r.h2,{id:"requirements",children:"Requirements"}),"\n",(0,o.jsx)(r.p,{children:"Azure Active Directory connection requires an Azure Active Directory Access Token assigned in Microsoft Graph"}),"\n",(0,o.jsx)(r.h2,{id:"usage",children:"Usage"}),"\n",(0,o.jsxs)(r.ol,{children:["\n",(0,o.jsx)(r.li,{children:"If you are querying Azure Active Directory and do not provide an AadAccessToken, return an error.  Otherwise, install the AzureAD module and connect to Azure Active directory."}),"\n",(0,o.jsx)(r.li,{children:"Switch the query commands based on the -Platform provided to get the groups and their members added to the return object."}),"\n",(0,o.jsx)(r.li,{children:"If Querying Azure Active Directory close the connection."}),"\n",(0,o.jsx)(r.li,{children:"Return any found items."}),"\n"]}),"\n",(0,o.jsx)(r.pre,{children:(0,o.jsx)(r.code,{className:"language-powershell",children:".\\Get-GroupMembers.ps1\n"})}),"\n",(0,o.jsx)(r.p,{children:"The same as Get-GroupMembers.ps1 -Platform Local\r\nReturns a system object of all local computer groups and all members of those groups."}),"\n",(0,o.jsx)(r.pre,{children:(0,o.jsx)(r.code,{className:"language-powershell",children:".\\Get-GroupMembers.ps1 -Platform AD\n"})}),"\n",(0,o.jsx)(r.p,{children:"Returns a system object of all Active Directory groups and all members of those groups."}),"\n",(0,o.jsx)(r.pre,{children:(0,o.jsx)(r.code,{className:"language-powershell",children:".\\Get-GroupMembers.ps1 -Platform AzureAD -AadAccessToken '78943hgjfdku89zbhjksuyfb897df9hjke#@$gdfjio'\n"})}),"\n",(0,o.jsx)(r.p,{children:"Returns a system object of all Azure Active Direcory groups and all members of those groups."}),"\n",(0,o.jsx)(r.h2,{id:"parameters",children:"Parameters"}),"\n",(0,o.jsxs)(r.table,{children:[(0,o.jsx)(r.thead,{children:(0,o.jsxs)(r.tr,{children:[(0,o.jsx)(r.th,{children:"Parameter"}),(0,o.jsx)(r.th,{children:"Alias"}),(0,o.jsx)(r.th,{children:"Required"}),(0,o.jsx)(r.th,{children:"Default"}),(0,o.jsx)(r.th,{children:"Type"}),(0,o.jsx)(r.th,{children:"Description"})]})}),(0,o.jsxs)(r.tbody,{children:[(0,o.jsxs)(r.tr,{children:[(0,o.jsx)(r.td,{children:(0,o.jsx)(r.code,{children:"Platform"})}),(0,o.jsx)(r.td,{}),(0,o.jsx)(r.td,{children:"False"}),(0,o.jsx)(r.td,{children:"Local"}),(0,o.jsx)(r.td,{children:"String"}),(0,o.jsx)(r.td,{children:"Determines the target group type (local, AD, or AzureAD)"})]}),(0,o.jsxs)(r.tr,{children:[(0,o.jsx)(r.td,{children:(0,o.jsx)(r.code,{children:"AadAccessToken"})}),(0,o.jsx)(r.td,{}),(0,o.jsx)(r.td,{children:"False"}),(0,o.jsx)(r.td,{}),(0,o.jsx)(r.td,{children:"String"}),(0,o.jsx)(r.td,{children:"The Azure Active Directory Access Token from Microsoft Graph, which is required if querying Azure AD"})]})]})]}),"\n",(0,o.jsx)(r.h2,{id:"output",children:"Output"}),"\n",(0,o.jsx)(r.p,{children:"[System.Object]\r\nFormatted as\r\nGroup     /      Members"})]})}function u(e={}){const{wrapper:r}={...(0,n.R)(),...e.components};return r?(0,o.jsx)(r,{...e,children:(0,o.jsx)(d,{...e})}):d(e)}},8453:(e,r,t)=>{t.d(r,{R:()=>i,x:()=>c});var s=t(6540);const o={},n=s.createContext(o);function i(e){const r=s.useContext(n);return s.useMemo((function(){return"function"==typeof e?e(r):{...r,...e}}),[r,e])}function c(e){let r;return r=e.disableParentContext?"function"==typeof e.components?e.components(o):e.components||o:i(e.components),s.createElement(n.Provider,{value:r},e.children)}}}]);