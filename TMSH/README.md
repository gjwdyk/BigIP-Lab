# TMSH Configuration Samples

This folder contains only **samples** of how Big-IP can be configured using TMSH Utility. Refer to [TMSH Home](https://clouddocs.f5.com/api/tmsh/) or [F5 TMSH Reference](https://clouddocs.f5.com/cli/tmsh-reference/latest/) for further details on TMSH Commands.



## Virtual Servers redirection from HTTP to HTTPS, SSL-OffLoad, HTTP/TCP Analytics Profile, IP Reputation, GeoLocation Filtering, DDoS Protection

The diagram below depicts the Logical Configuration Diagram built by [AS3_LTM_SSLoL_AVR_NOutB.json](AS3_LTM_SSLoL_AVR_NOutB.json) AS3 Declaration.
![Logical Configuration Diagram](AS3_LTM_SSLoL_AVR_NOutB.png)

- [ ] HTTP Virtual Servers are redirected to HTTPS Virtual Server.
- [ ] HTTPS Virtual Servers are using SSL-OffLoad. Traffic to server is plain-text.
- [ ] HTTP and HTTPS Virtual Servers are attached with both HTTP and TCP Analytics Profiles.
- [ ] TCP Virtual Servers are attached with TCP Analytics Profile.
- [ ] Listener/Virtual Server on Port 22 and 5900 for SSH and VNC to the LAMPv7 Server

AS3 Declaration configures only the stuffs inside Big-IP (refer to the diagram above).
Anything outside Big-IP shall be configured by AWS CloudFormation ; or if you use this AS3 Declaration in VE or Hardware; the things outside Big-IP shall be configured separately, either manually or by other scripts or some external orchestrator node.




***

<br><br><br>
```
╔═╦═════════════════╦═╗
╠═╬═════════════════╬═╣
║ ║ End of Document ║ ║
╠═╬═════════════════╬═╣
╚═╩═════════════════╩═╝
```
<br><br><br>


