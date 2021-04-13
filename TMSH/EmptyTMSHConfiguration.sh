#!/bin/bash



#╔════════════════════╗
#║   PRE Requisites   ║
#╚════════════════════╝
#
#The following to be completed before running the TMSH scripts below:
#
#֍ Interface
#֍ VLAN
#֍ Self IP Address
#֍ Default Route
#֍ License and Provisioning
#֍ NTP
#֍ DNS



#╔═════════════════════════════════════╗
#║   Just Showing System Information   ║
#╚═════════════════════════════════════╝

echo "This TMSH Commands File is practically empty, just showing some system information."
tmsh show sys software
tmsh show sys license



#╔══════════╗
#║   Save   ║
#╚══════════╝
#
# Don't forget to save after configuration changes (in case actual configuration performed above)
#

#tmsh save /sys config



#╔═╦═════════════════╦═╗
#║ ║                 ║ ║
#╠═╬═════════════════╬═╣
#║ ║ End of Document ║ ║
#╠═╬═════════════════╬═╣
#║ ║                 ║ ║
#╚═╩═════════════════╩═╝


