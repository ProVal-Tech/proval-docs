"use strict";(self.webpackChunkproval_docs=self.webpackChunkproval_docs||[]).push([[603],{1895:(e,t,s)=>{s.r(t),s.d(t,{assets:()=>i,contentTitle:()=>d,default:()=>p,frontMatter:()=>n,metadata:()=>r,toc:()=>o});const r=JSON.parse('{"id":"powershell/ps-set-wallpaper","title":"Set-Wallpaper","description":"Documentation for the Set-Wallpaper command to set the active desktop wallpaper for all users.","source":"@site/docs/powershell/Set-Wallpaper.md","sourceDirName":"powershell","slug":"/powershell/ps-set-wallpaper","permalink":"/docs/powershell/ps-set-wallpaper","draft":false,"unlisted":false,"editUrl":"https://github.com/proval-tech/docs/tree/main/packages/create-docusaurus/templates/shared/docs/powershell/Set-Wallpaper.md","tags":[{"inline":false,"label":"Configuration","permalink":"/docs/tags/configuration","description":"Content related to configuring a device."},{"inline":false,"label":"Windows","permalink":"/docs/tags/windows","description":"Content related to the Windows operating system."}],"version":"current","frontMatter":{"id":"ps-set-wallpaper","title":"Set-Wallpaper","title_meta":"Set-Wallpaper Command","keywords":["wallpaper","desktop","background","image"],"description":"Documentation for the Set-Wallpaper command to set the active desktop wallpaper for all users.","tags":["configuration","windows"],"draft":false,"unlisted":false},"sidebar":"contentSidebar","previous":{"title":"Set-VMGuestState","permalink":"/docs/powershell/ps-set-vmgueststate"},"next":{"title":"Set-WindowsUpdateShown","permalink":"/docs/powershell/ps-set-windowsupdateshown"}}');var l=s(4848),a=s(8453);const n={id:"ps-set-wallpaper",title:"Set-Wallpaper",title_meta:"Set-Wallpaper Command",keywords:["wallpaper","desktop","background","image"],description:"Documentation for the Set-Wallpaper command to set the active desktop wallpaper for all users.",tags:["configuration","windows"],draft:!1,unlisted:!1},d=void 0,i={},o=[{value:"Description",id:"description",level:2},{value:"Requirements",id:"requirements",level:2},{value:"Usage",id:"usage",level:2},{value:"Set Mode",id:"set-mode",level:3},{value:"Reset Mode",id:"reset-mode",level:3},{value:"Parameters",id:"parameters",level:2},{value:"Output",id:"output",level:2}];function c(e){const t={code:"code",h2:"h2",h3:"h3",li:"li",p:"p",pre:"pre",table:"table",tbody:"tbody",td:"td",th:"th",thead:"thead",tr:"tr",ul:"ul",...(0,a.R)(),...e.components};return(0,l.jsxs)(l.Fragment,{children:[(0,l.jsx)(t.h2,{id:"description",children:"Description"}),"\n",(0,l.jsx)(t.p,{children:"Sets the active desktop wallpaper for all users."}),"\n",(0,l.jsx)(t.h2,{id:"requirements",children:"Requirements"}),"\n",(0,l.jsxs)(t.ul,{children:["\n",(0,l.jsx)(t.li,{children:"Must be run as an Administrator"}),"\n",(0,l.jsx)(t.li,{children:"PowerShell v5+"}),"\n"]}),"\n",(0,l.jsx)(t.h2,{id:"usage",children:"Usage"}),"\n",(0,l.jsx)(t.p,{children:"The script has two primary modes: Set and Reset"}),"\n",(0,l.jsx)(t.h3,{id:"set-mode",children:"Set Mode"}),"\n",(0,l.jsxs)(t.p,{children:["In set mode, the wallpaper is set based on the URI passed into the script via the ",(0,l.jsx)(t.code,{children:"-Uri"})," parameter. If ",(0,l.jsx)(t.code,{children:"-Enforce"})," is passed, then a scheduled task will be created to set the wallpaper to the specified wallpaper on each user login."]}),"\n",(0,l.jsx)(t.h3,{id:"reset-mode",children:"Reset Mode"}),"\n",(0,l.jsxs)(t.p,{children:["In reset mode, the wallpaper for all users is reset to the last known wallpaper, and any scheduled tasks or policies are removed. Enter reset mode by passing the ",(0,l.jsx)(t.code,{children:"-Reset"})," parameter."]}),"\n",(0,l.jsx)(t.p,{children:"Sets the target image as the wallpaper for all users."}),"\n",(0,l.jsx)(t.pre,{children:(0,l.jsx)(t.code,{className:"language-powershell",children:'.\\Set-Wallpaper.ps1 -Uri "C:\\user\\user\\Pictures\\Wallpapers\\generic-background.jpg"\n'})}),"\n",(0,l.jsx)(t.p,{children:"Downloads the image from the remote server and sets it as the current wallpaper for all users. Creates a scheduled task to set the wallpaper on each user login."}),"\n",(0,l.jsx)(t.pre,{children:(0,l.jsx)(t.code,{className:"language-powershell",children:'.\\Set-Wallpaper.ps1 -Uri "https://www.nerdchefs.com/wp-content/uploads/2020/07/generic-background.jpg" -Enforce\n'})}),"\n",(0,l.jsx)(t.h2,{id:"parameters",children:"Parameters"}),"\n",(0,l.jsxs)(t.table,{children:[(0,l.jsx)(t.thead,{children:(0,l.jsxs)(t.tr,{children:[(0,l.jsx)(t.th,{children:"Parameter"}),(0,l.jsx)(t.th,{children:"Required"}),(0,l.jsx)(t.th,{children:"Default"}),(0,l.jsx)(t.th,{children:"Type"}),(0,l.jsx)(t.th,{children:"Description"})]})}),(0,l.jsxs)(t.tbody,{children:[(0,l.jsxs)(t.tr,{children:[(0,l.jsx)(t.td,{children:(0,l.jsx)(t.code,{children:"Uri"})}),(0,l.jsx)(t.td,{children:"True"}),(0,l.jsx)(t.td,{}),(0,l.jsx)(t.td,{children:"System.URI"}),(0,l.jsx)(t.td,{children:"The local path or URL to the image file to set as the wallpaper. Must be a valid local path or URL."})]}),(0,l.jsxs)(t.tr,{children:[(0,l.jsx)(t.td,{children:(0,l.jsx)(t.code,{children:"Enforce"})}),(0,l.jsx)(t.td,{children:"False"}),(0,l.jsx)(t.td,{children:"False"}),(0,l.jsx)(t.td,{children:"Switch"}),(0,l.jsx)(t.td,{children:"A scheduled task will be created to set the wallpaper of each user that logs into the machine."})]}),(0,l.jsxs)(t.tr,{children:[(0,l.jsx)(t.td,{children:(0,l.jsx)(t.code,{children:"Reset"})}),(0,l.jsx)(t.td,{children:"False"}),(0,l.jsx)(t.td,{children:"False"}),(0,l.jsx)(t.td,{children:"Switch"}),(0,l.jsx)(t.td,{children:"Resets each user's wallpaper to their last used wallpaper and removes enforcement."})]})]})]}),"\n",(0,l.jsx)(t.h2,{id:"output",children:"Output"}),"\n",(0,l.jsx)(t.p,{children:(0,l.jsx)(t.code,{children:"PSCustomObject"})}),"\n",(0,l.jsx)(t.p,{children:"Returns the registry settings edited by the script."})]})}function p(e={}){const{wrapper:t}={...(0,a.R)(),...e.components};return t?(0,l.jsx)(t,{...e,children:(0,l.jsx)(c,{...e})}):c(e)}},8453:(e,t,s)=>{s.d(t,{R:()=>n,x:()=>d});var r=s(6540);const l={},a=r.createContext(l);function n(e){const t=r.useContext(a);return r.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function d(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(l):e.components||l:n(e.components),r.createElement(a.Provider,{value:t},e.children)}}}]);