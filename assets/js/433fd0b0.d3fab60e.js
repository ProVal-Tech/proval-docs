"use strict";(self.webpackChunkproval_docs=self.webpackChunkproval_docs||[]).push([[8545],{2626:(e,n,s)=>{s.r(n),s.d(n,{assets:()=>d,contentTitle:()=>r,default:()=>f,frontMatter:()=>l,metadata:()=>t,toc:()=>o});const t=JSON.parse('{"id":"powershell/ps-invoke-officescrub","title":"Invoke-OfficeScrub","description":"Documentation for the Invoke-OfficeScrub command to uninstall Microsoft Office products via OffScrub.","source":"@site/docs/powershell/Invoke-OfficeScrub.md","sourceDirName":"powershell","slug":"/powershell/ps-invoke-officescrub","permalink":"/docs/powershell/ps-invoke-officescrub","draft":false,"unlisted":false,"editUrl":"https://github.com/proval-tech/docs/tree/main/packages/create-docusaurus/templates/shared/docs/powershell/Invoke-OfficeScrub.md","tags":[{"inline":false,"label":"Uninstallation","permalink":"/docs/tags/uninstallation","description":"Content related to uninstalling software."},{"inline":false,"label":"Office 365","permalink":"/docs/tags/office-365","description":"Content related to Office 365."}],"version":"current","frontMatter":{"id":"ps-invoke-officescrub","title":"Invoke-OfficeScrub","title_meta":"Invoke-OfficeScrub Command","keywords":["uninstall","office","cleanup","remove"],"description":"Documentation for the Invoke-OfficeScrub command to uninstall Microsoft Office products via OffScrub.","tags":["uninstallation","office365"],"draft":false,"unlisted":false},"sidebar":"contentSidebar","previous":{"title":"Invoke-LSUClientUpdate","permalink":"/docs/powershell/ps-invoke-lsuclientupdate"},"next":{"title":"Invoke-RepairVolume","permalink":"/docs/powershell/ps-invoke-repairvolume"}}');var i=s(4848),c=s(8453);const l={id:"ps-invoke-officescrub",title:"Invoke-OfficeScrub",title_meta:"Invoke-OfficeScrub Command",keywords:["uninstall","office","cleanup","remove"],description:"Documentation for the Invoke-OfficeScrub command to uninstall Microsoft Office products via OffScrub.",tags:["uninstallation","office365"],draft:!1,unlisted:!1},r=void 0,d={},o=[{value:"Description",id:"description",level:2},{value:"Usage",id:"usage",level:2},{value:"Parameters",id:"parameters",level:2},{value:"Output",id:"output",level:2}];function a(e){const n={code:"code",h2:"h2",li:"li",ol:"ol",p:"p",pre:"pre",table:"table",tbody:"tbody",td:"td",th:"th",thead:"thead",tr:"tr",...(0,c.R)(),...e.components};return(0,i.jsxs)(i.Fragment,{children:[(0,i.jsx)(n.h2,{id:"description",children:"Description"}),"\n",(0,i.jsx)(n.p,{children:"Allows the uninstallation of Microsoft Office products via OffScrub."}),"\n",(0,i.jsx)(n.h2,{id:"usage",children:"Usage"}),"\n",(0,i.jsxs)(n.ol,{children:["\n",(0,i.jsx)(n.li,{children:"Ensures that the session is elevated, if not warns and exits."}),"\n",(0,i.jsx)(n.li,{children:"Determines what switches you entered and sets up an object with the file download locations."}),"\n",(0,i.jsx)(n.li,{children:"If no switches are present: warn and exit."}),"\n",(0,i.jsx)(n.li,{children:"Loops through all the switches, downloading and executing them."}),"\n"]}),"\n",(0,i.jsx)(n.pre,{children:(0,i.jsx)(n.code,{className:"language-powershell",children:".\\Invoke-OfficeScrub.ps1 -Office03\n"})}),"\n",(0,i.jsx)(n.p,{children:"Uninstalls detected Office 2003 installs."}),"\n",(0,i.jsx)(n.pre,{children:(0,i.jsx)(n.code,{className:"language-powershell",children:".\\Invoke-OffScrub.ps1 -Office03 -Office10 -Office16\n"})}),"\n",(0,i.jsx)(n.p,{children:"Removes all detected instances of Office 2003, 2010, and 2016."}),"\n",(0,i.jsx)(n.pre,{children:(0,i.jsx)(n.code,{className:"language-powershell",children:".\\Invoke-OffScrub.ps1 -All\n"})}),"\n",(0,i.jsx)(n.p,{children:"Removes all installed versions of Office."}),"\n",(0,i.jsx)(n.h2,{id:"parameters",children:"Parameters"}),"\n",(0,i.jsxs)(n.table,{children:[(0,i.jsx)(n.thead,{children:(0,i.jsxs)(n.tr,{children:[(0,i.jsx)(n.th,{children:"Parameter"}),(0,i.jsx)(n.th,{children:"Alias"}),(0,i.jsx)(n.th,{children:"Required"}),(0,i.jsx)(n.th,{children:"Default"}),(0,i.jsx)(n.th,{children:"Type"}),(0,i.jsx)(n.th,{children:"Description"})]})}),(0,i.jsxs)(n.tbody,{children:[(0,i.jsxs)(n.tr,{children:[(0,i.jsx)(n.td,{children:(0,i.jsx)(n.code,{children:"Office03"})}),(0,i.jsx)(n.td,{}),(0,i.jsx)(n.td,{children:"False"}),(0,i.jsx)(n.td,{}),(0,i.jsx)(n.td,{children:"Switch"}),(0,i.jsx)(n.td,{children:"Uninstalls Office 2003"})]}),(0,i.jsxs)(n.tr,{children:[(0,i.jsx)(n.td,{children:(0,i.jsx)(n.code,{children:"Office07"})}),(0,i.jsx)(n.td,{}),(0,i.jsx)(n.td,{children:"False"}),(0,i.jsx)(n.td,{}),(0,i.jsx)(n.td,{children:"Switch"}),(0,i.jsx)(n.td,{children:"Uninstalls Office 2007"})]}),(0,i.jsxs)(n.tr,{children:[(0,i.jsx)(n.td,{children:(0,i.jsx)(n.code,{children:"Office10"})}),(0,i.jsx)(n.td,{}),(0,i.jsx)(n.td,{children:"False"}),(0,i.jsx)(n.td,{}),(0,i.jsx)(n.td,{children:"Switch"}),(0,i.jsx)(n.td,{children:"Uninstalls Office 2010"})]}),(0,i.jsxs)(n.tr,{children:[(0,i.jsx)(n.td,{children:(0,i.jsx)(n.code,{children:"Office13"})}),(0,i.jsx)(n.td,{}),(0,i.jsx)(n.td,{children:"False"}),(0,i.jsx)(n.td,{}),(0,i.jsx)(n.td,{children:"Switch"}),(0,i.jsx)(n.td,{children:"Uninstalls Office 2013"})]}),(0,i.jsxs)(n.tr,{children:[(0,i.jsx)(n.td,{children:(0,i.jsx)(n.code,{children:"Office16"})}),(0,i.jsx)(n.td,{}),(0,i.jsx)(n.td,{children:"False"}),(0,i.jsx)(n.td,{}),(0,i.jsx)(n.td,{children:"Switch"}),(0,i.jsx)(n.td,{children:"Uninstalls Office 2016"})]}),(0,i.jsxs)(n.tr,{children:[(0,i.jsx)(n.td,{children:(0,i.jsx)(n.code,{children:"OfficeC2R"})}),(0,i.jsx)(n.td,{}),(0,i.jsx)(n.td,{children:"False"}),(0,i.jsx)(n.td,{}),(0,i.jsx)(n.td,{children:"Switch"}),(0,i.jsx)(n.td,{children:"Uninstalls Office Click to Run"})]}),(0,i.jsxs)(n.tr,{children:[(0,i.jsx)(n.td,{children:(0,i.jsx)(n.code,{children:"All"})}),(0,i.jsx)(n.td,{}),(0,i.jsx)(n.td,{children:"False"}),(0,i.jsx)(n.td,{}),(0,i.jsx)(n.td,{children:"Switch"}),(0,i.jsx)(n.td,{children:"Uninstalls all above Office versions"})]})]})]}),"\n",(0,i.jsx)(n.h2,{id:"output",children:"Output"}),"\n",(0,i.jsx)(n.p,{children:".\\Invoke-OffScrub-log.txt\r\n.\\Invoke-OffScrub-error.txt"})]})}function f(e={}){const{wrapper:n}={...(0,c.R)(),...e.components};return n?(0,i.jsx)(n,{...e,children:(0,i.jsx)(a,{...e})}):a(e)}},8453:(e,n,s)=>{s.d(n,{R:()=>l,x:()=>r});var t=s(6540);const i={},c=t.createContext(i);function l(e){const n=t.useContext(c);return t.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function r(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(i):e.components||i:l(e.components),t.createElement(c.Provider,{value:n},e.children)}}}]);