"use strict";(self.webpackChunkproval_docs=self.webpackChunkproval_docs||[]).push([[7723],{5641:(e,t,s)=>{s.r(t),s.d(t,{assets:()=>o,contentTitle:()=>i,default:()=>p,frontMatter:()=>a,metadata:()=>n,toc:()=>l});const n=JSON.parse('{"id":"powershell/ps-set-netadapterdns","title":"Set-NetAdapterDNS","description":"Documentation for the Set-NetAdapterDNS command to append a DNS server address to all physical, active network adapters.","source":"@site/docs/powershell/Set-NetAdapterDNS.md","sourceDirName":"powershell","slug":"/powershell/ps-set-netadapterdns","permalink":"/docs/powershell/ps-set-netadapterdns","draft":false,"unlisted":false,"editUrl":"https://github.com/proval-tech/docs/tree/main/packages/create-docusaurus/templates/shared/docs/powershell/Set-NetAdapterDNS.md","tags":[{"inline":false,"label":"Networking","permalink":"/docs/tags/networking","description":"Content related to networking."},{"inline":false,"label":"Configuration","permalink":"/docs/tags/configuration","description":"Content related to configuring a device."},{"inline":false,"label":"Windows","permalink":"/docs/tags/windows","description":"Content related to the Windows operating system."},{"inline":false,"label":"DNS","permalink":"/docs/tags/dns","description":"Content related to DNS."}],"version":"current","frontMatter":{"id":"ps-set-netadapterdns","title":"Set-NetAdapterDNS","title_meta":"Set-NetAdapterDNS Command","keywords":["dns","network","adapter","configuration"],"description":"Documentation for the Set-NetAdapterDNS command to append a DNS server address to all physical, active network adapters.","tags":["networking","configuration","windows","dns"],"draft":false,"unlisted":false},"sidebar":"contentSidebar","previous":{"title":"Set-LastLoggedOnUser","permalink":"/docs/powershell/ps-set-lastloggedonuser"},"next":{"title":"Set-OfficeUpdateSchedule","permalink":"/docs/powershell/ps-set-officeupdateschedule"}}');var r=s(4848),d=s(8453);const a={id:"ps-set-netadapterdns",title:"Set-NetAdapterDNS",title_meta:"Set-NetAdapterDNS Command",keywords:["dns","network","adapter","configuration"],description:"Documentation for the Set-NetAdapterDNS command to append a DNS server address to all physical, active network adapters.",tags:["networking","configuration","windows","dns"],draft:!1,unlisted:!1},i=void 0,o={},l=[{value:"Description",id:"description",level:2},{value:"Requirements",id:"requirements",level:2},{value:"Usage",id:"usage",level:2},{value:"Parameters",id:"parameters",level:2},{value:"Output",id:"output",level:2}];function c(e){const t={code:"code",h2:"h2",li:"li",ol:"ol",p:"p",pre:"pre",table:"table",tbody:"tbody",td:"td",th:"th",thead:"thead",tr:"tr",...(0,d.R)(),...e.components};return(0,r.jsxs)(r.Fragment,{children:[(0,r.jsx)(t.h2,{id:"description",children:"Description"}),"\n",(0,r.jsx)(t.p,{children:"Historical. Incomplete. Used to append a DNS server address to all physical, active network adapters."}),"\n",(0,r.jsx)(t.h2,{id:"requirements",children:"Requirements"}),"\n",(0,r.jsx)(t.p,{children:"PowerShell v5"}),"\n",(0,r.jsx)(t.h2,{id:"usage",children:"Usage"}),"\n",(0,r.jsxs)(t.ol,{children:["\n",(0,r.jsx)(t.li,{children:"Gets all physical network adapters that are currently active."}),"\n",(0,r.jsx)(t.li,{children:"For each adapter, determines if the adapter is using DHCP, and if true, skips it."}),"\n",(0,r.jsx)(t.li,{children:"Gathers the current list of DNS servers on each adapter and appends the new address to the end if it does not already exist in the list."}),"\n"]}),"\n",(0,r.jsx)(t.p,{children:"Appends the DNS address 1.1.1.1 to the end of all active, physical network adapters with static IP addresses."}),"\n",(0,r.jsx)(t.pre,{children:(0,r.jsx)(t.code,{className:"language-powershell",children:'.\\Set-NetAdapterDNS.ps1 -DNSServer "1.1.1.1"\n'})}),"\n",(0,r.jsx)(t.h2,{id:"parameters",children:"Parameters"}),"\n",(0,r.jsxs)(t.table,{children:[(0,r.jsx)(t.thead,{children:(0,r.jsxs)(t.tr,{children:[(0,r.jsx)(t.th,{children:"Parameter"}),(0,r.jsx)(t.th,{children:"Alias"}),(0,r.jsx)(t.th,{children:"Required"}),(0,r.jsx)(t.th,{children:"Default"}),(0,r.jsx)(t.th,{children:"Type"}),(0,r.jsx)(t.th,{children:"Description"})]})}),(0,r.jsxs)(t.tbody,{children:[(0,r.jsxs)(t.tr,{children:[(0,r.jsx)(t.td,{children:(0,r.jsx)(t.code,{children:"-DNSServer"})}),(0,r.jsx)(t.td,{}),(0,r.jsx)(t.td,{children:"True"}),(0,r.jsx)(t.td,{}),(0,r.jsx)(t.td,{children:"String"}),(0,r.jsx)(t.td,{children:"The DNS server address to append to the network adapter(s)."})]}),(0,r.jsxs)(t.tr,{children:[(0,r.jsx)(t.td,{children:(0,r.jsx)(t.code,{children:"-Force"})}),(0,r.jsx)(t.td,{}),(0,r.jsx)(t.td,{children:"False"}),(0,r.jsx)(t.td,{}),(0,r.jsx)(t.td,{children:"Int"}),(0,r.jsx)(t.td,{children:"Unimplemented. Intended to force DNS address updates to DHCP-enabled adapters."})]})]})]}),"\n",(0,r.jsx)(t.h2,{id:"output",children:"Output"}),"\n",(0,r.jsx)(t.p,{children:".\\Set-NetAdapterDNS-log.txt\r\n.\\Set-NetAdapterDNS-data.txt"})]})}function p(e={}){const{wrapper:t}={...(0,d.R)(),...e.components};return t?(0,r.jsx)(t,{...e,children:(0,r.jsx)(c,{...e})}):c(e)}},8453:(e,t,s)=>{s.d(t,{R:()=>a,x:()=>i});var n=s(6540);const r={},d=n.createContext(r);function a(e){const t=n.useContext(d);return n.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function i(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(r):e.components||r:a(e.components),n.createElement(d.Provider,{value:t},e.children)}}}]);