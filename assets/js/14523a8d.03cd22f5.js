"use strict";(self.webpackChunkproval_docs=self.webpackChunkproval_docs||[]).push([[3721],{7896:(e,t,s)=>{s.r(t),s.d(t,{assets:()=>a,contentTitle:()=>l,default:()=>h,frontMatter:()=>o,metadata:()=>n,toc:()=>d});const n=JSON.parse('{"id":"powershell/ps-set-vmgueststate","title":"Set-VMGuestState","description":"Documentation for the Set-VMGuestState command to start or stop all running VMs on the Hyper-V host, with special handling for domain controllers.","source":"@site/docs/powershell/Set-VMGuestState.md","sourceDirName":"powershell","slug":"/powershell/ps-set-vmgueststate","permalink":"/docs/powershell/ps-set-vmgueststate","draft":false,"unlisted":false,"editUrl":"https://github.com/proval-tech/docs/tree/main/packages/create-docusaurus/templates/shared/docs/powershell/Set-VMGuestState.md","tags":[{"inline":false,"label":"Configuration","permalink":"/docs/tags/configuration","description":"Content related to configuring a device."},{"inline":false,"label":"Windows","permalink":"/docs/tags/windows","description":"Content related to the Windows operating system."},{"inline":false,"label":"Hyper-V","permalink":"/docs/tags/hyper-v","description":"Content related to Hyper-V virtualization."},{"inline":false,"label":"Virtualization","permalink":"/docs/tags/virtualization","description":"Content related to virtualization."}],"version":"current","frontMatter":{"id":"ps-set-vmgueststate","title":"Set-VMGuestState","title_meta":"Set-VMGuestState Command","keywords":["vm","guest","state","hyper-v"],"description":"Documentation for the Set-VMGuestState command to start or stop all running VMs on the Hyper-V host, with special handling for domain controllers.","tags":["configuration","windows","hyper-v","virtualization"],"draft":false,"unlisted":false},"sidebar":"contentSidebar","previous":{"title":"Set-UserRegistryValue","permalink":"/docs/powershell/ps-set-userregistryvalue"},"next":{"title":"Set-Wallpaper","permalink":"/docs/powershell/ps-set-wallpaper"}}');var r=s(4848),i=s(8453);const o={id:"ps-set-vmgueststate",title:"Set-VMGuestState",title_meta:"Set-VMGuestState Command",keywords:["vm","guest","state","hyper-v"],description:"Documentation for the Set-VMGuestState command to start or stop all running VMs on the Hyper-V host, with special handling for domain controllers.",tags:["configuration","windows","hyper-v","virtualization"],draft:!1,unlisted:!1},l=void 0,a={},d=[{value:"Description",id:"description",level:2},{value:"Requirements",id:"requirements",level:2},{value:"Usage",id:"usage",level:2},{value:"Stop Process",id:"stop-process",level:3},{value:"Start Process",id:"start-process",level:3},{value:"Parameters",id:"parameters",level:2},{value:"Output",id:"output",level:2}];function c(e){const t={code:"code",em:"em",h2:"h2",h3:"h3",li:"li",ol:"ol",p:"p",pre:"pre",table:"table",tbody:"tbody",td:"td",th:"th",thead:"thead",tr:"tr",...(0,i.R)(),...e.components};return(0,r.jsxs)(r.Fragment,{children:[(0,r.jsx)(t.h2,{id:"description",children:"Description"}),"\n",(0,r.jsx)(t.p,{children:"Starts or stops all running VMs on the Hyper-V host. If a domain controller guest is detected, it will be stopped last and started first."}),"\n",(0,r.jsx)(t.h2,{id:"requirements",children:"Requirements"}),"\n",(0,r.jsx)(t.p,{children:"VMs must be stopped first using this script."}),"\n",(0,r.jsx)(t.h2,{id:"usage",children:"Usage"}),"\n",(0,r.jsx)(t.h3,{id:"stop-process",children:"Stop Process"}),"\n",(0,r.jsxs)(t.ol,{children:["\n",(0,r.jsx)(t.li,{children:"Find all machines with a valid heartbeat and categorize those machines as Domain Controllers or Standard VMs."}),"\n",(0,r.jsx)(t.li,{children:"Stop all VMs, starting with Standard VMs."}),"\n",(0,r.jsx)(t.li,{children:"If any VM fails to stop in the allotted time: Power on VMs that were previously stopped and exit."}),"\n",(0,r.jsx)(t.li,{children:"A final check is performed to ensure all VMs are off. If this check fails: Power on VMs that were previously stopped and exit."}),"\n",(0,r.jsxs)(t.li,{children:["Exports an XML list of powered-off VMs for use in the ",(0,r.jsx)(t.code,{children:"-Start"})," process."]}),"\n"]}),"\n",(0,r.jsx)(t.h3,{id:"start-process",children:"Start Process"}),"\n",(0,r.jsxs)(t.ol,{children:["\n",(0,r.jsxs)(t.li,{children:["If the ",(0,r.jsx)(t.code,{children:"-Stop"})," process has not been run previously, write an error and exit."]}),"\n",(0,r.jsxs)(t.li,{children:["If the XML files from the ",(0,r.jsx)(t.code,{children:"-Stop"})," process are found: Start all previously stopped VMs, starting with Domain Controllers."]}),"\n"]}),"\n",(0,r.jsx)(t.p,{children:(0,r.jsx)(t.em,{children:"Stop all running VMs on the host, ending with any detected domain controller guests."})}),"\n",(0,r.jsx)(t.pre,{children:(0,r.jsx)(t.code,{className:"language-powershell",children:".\\Set-VMGuestState.ps1 -Stop\n"})}),"\n",(0,r.jsx)(t.p,{children:(0,r.jsx)(t.em,{children:"Start all previously running VMs on the host from the last time the 'Stop' action was run, starting with any detected domain controller guests. If any machine fails to start in 300 seconds the script will abort."})}),"\n",(0,r.jsx)(t.pre,{children:(0,r.jsx)(t.code,{className:"language-powershell",children:".\\Set-VMGuestState.ps1 -Start -LeadTime 300\n"})}),"\n",(0,r.jsx)(t.h2,{id:"parameters",children:"Parameters"}),"\n",(0,r.jsxs)(t.table,{children:[(0,r.jsx)(t.thead,{children:(0,r.jsxs)(t.tr,{children:[(0,r.jsx)(t.th,{children:"Parameter"}),(0,r.jsx)(t.th,{children:"Alias"}),(0,r.jsx)(t.th,{children:"Required"}),(0,r.jsx)(t.th,{children:"Default"}),(0,r.jsx)(t.th,{children:"Type"}),(0,r.jsx)(t.th,{children:"Description"})]})}),(0,r.jsxs)(t.tbody,{children:[(0,r.jsxs)(t.tr,{children:[(0,r.jsx)(t.td,{children:(0,r.jsx)(t.code,{children:"Stop"})}),(0,r.jsx)(t.td,{}),(0,r.jsx)(t.td,{children:"True (Semi)"}),(0,r.jsx)(t.td,{}),(0,r.jsx)(t.td,{children:"String"}),(0,r.jsx)(t.td,{children:"Attempt to stop all running VMs on the host."})]}),(0,r.jsxs)(t.tr,{children:[(0,r.jsx)(t.td,{children:(0,r.jsx)(t.code,{children:"Start"})}),(0,r.jsx)(t.td,{}),(0,r.jsx)(t.td,{children:"True (Semi)"}),(0,r.jsx)(t.td,{}),(0,r.jsx)(t.td,{}),(0,r.jsx)(t.td,{children:"Attempt to start all previously stopped VMs on the host."})]}),(0,r.jsxs)(t.tr,{children:[(0,r.jsx)(t.td,{children:(0,r.jsx)(t.code,{children:"LeadTime"})}),(0,r.jsx)(t.td,{}),(0,r.jsx)(t.td,{children:"False"}),(0,r.jsx)(t.td,{children:"300"}),(0,r.jsx)(t.td,{children:"Int"}),(0,r.jsx)(t.td,{children:"The amount of time to wait before considering the action a failure."})]})]})]}),"\n",(0,r.jsx)(t.h2,{id:"output",children:"Output"}),"\n",(0,r.jsx)(t.p,{children:"Location of output for log, result, and error files."}),"\n",(0,r.jsx)(t.p,{children:".\\Set-VMGuestState-log.txt\r\n.\\Set-VMGuestState-error.txt"})]})}function h(e={}){const{wrapper:t}={...(0,i.R)(),...e.components};return t?(0,r.jsx)(t,{...e,children:(0,r.jsx)(c,{...e})}):c(e)}},8453:(e,t,s)=>{s.d(t,{R:()=>o,x:()=>l});var n=s(6540);const r={},i=n.createContext(r);function o(e){const t=n.useContext(i);return n.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function l(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(r):e.components||r:o(e.components),n.createElement(i.Provider,{value:t},e.children)}}}]);