# AS3 Configuration Samples



## AS3 LTM with SSL-OffLoad and HTTP/TCP Analytics Profile (No OutBound)



The diagram below depicts the Logical Configuration Diagram built by [AS3_LTM_SSLoL_AVR_NOutB.json](AS3_LTM_SSLoL_AVR_NOutB.json) AS3 Declaration.
![Logical Configuration Diagram](AS3_LTM_SSLoL_AVR_NOutB.png)

HTTPS Virtual Servers are attached with both HTTP and TCP Analytics Profiles. TCP Virtual Servers are attached with TCP Analytics Profile.

AS3 Declaration configures only the stuffs inside Big-IP (refer to the diagram above).
Anything outside Big-IP shall be configured by AWS CloudFormation ; or if you use this AS3 Declaration in VE or Hardware; the things outside Big-IP shall be configured separately, either manually or by other scripts or some external orchestrator node.


