# LAMPv7 Adaptation to AWS

Below are steps taken to adapt the **_LAMP_v7.zip_** from **_vLab_** section under https://downloads.f5.com/   .

[LAMPv7 Notes](LAMPv7%20Notes.txt) may enable more comfortable reading of the steps/changes done to the LAMPv7 server during the adaptation process.



```
╔═╦══════════════════════════╦═╗
║ ║                          ║ ║
╠═╬══════════════════════════╬═╣
║ ║ Networking Configuration ║ ║
╠═╬══════════════════════════╬═╣
║ ║                          ║ ║
╚═╩══════════════════════════╩═╝

root@xubuntu-vm:/# ls -lap /etc/network/
total 52
drwxr-xr-x   7 root root  4096 Apr 19 04:18 ./
drwxr-xr-x 158 root root 12288 Apr 19 04:41 ../
drwxr-xr-x   2 root root  4096 Sep 17  2015 if-down.d/
drwxr-xr-x   2 root root  4096 Sep 17  2015 if-post-down.d/
drwxr-xr-x   2 root root  4096 Sep 17  2015 if-pre-up.d/
drwxr-xr-x   2 root root  4096 Sep 17  2015 if-up.d/
-rw-r--r--   1 root root  2039 Apr 19 04:18 interfaces                   --------->>>>>>>>> Networking Configuration Used By Operating System.
-rw-r--r--   1 root root   114 Apr 19 04:18 interfaces.archive           --------->>>>>>>>> Does NOT Exist before Correction. Archive After Correction Finished (NOT Important): Networking Configuration Auto-Modified by AWS, Does NOT Work. To Be Deleted When Importing (Packaging) VM to AWS.
-rw-r--r--   1 root root     0 Apr 19 04:18 interfaces.corrected         --------->>>>>>>>> Indicator/Flag File Whether Correction Procedure Has Taken Place or Not.
drwxr-xr-x   2 root root  4096 May 12  2014 interfaces.d/
lrwxrwxrwx   1 root root    12 Apr 20  2013 run -> /run/network/
-rwxrwxrwx   1 root root  1252 Apr 18 19:09 VMImportCompensateIF         --------->>>>>>>>> Executable Bash Script. Note the "-rwxrwxrwx" property.
-rw-r--r--   1 root root  2039 Apr 19 01:27 vmimport.interfaces          --------->>>>>>>>> Correct Networking Configuration.



root@xubuntu-vm:/# ls -lap /etc/iproute2/
total 56
drwxr-xr-x   2 root root  4096 Apr 19 04:18 ./
drwxr-xr-x 158 root root 12288 Apr 19 04:41 ../
-rw-r--r--   1 root root    75 Dec 11  2012 ematch_map
-rw-r--r--   1 root root    31 May 21  2012 group
-rw-r--r--   1 root root   442 May 21  2012 rt_dsfield
-rw-r--r--   1 root root   317 May 21  2012 rt_protos
-rw-r--r--   1 root root   112 May 21  2012 rt_realms
-rw-r--r--   1 root root    92 May 21  2012 rt_scopes
-rw-r--r--   1 root root    93 Apr 19 04:18 rt_tables                    --------->>>>>>>>> Networking Configuration Used By Operating System.
-rw-r--r--   1 root root    93 Apr 19 04:18 rt_tables.archive            --------->>>>>>>>> Does NOT Exist before Correction. Archive After Correction Finished (NOT Important): Networking Configuration Auto-Modified by AWS, Does NOT Work. To Be Deleted When Importing (Packaging) VM to AWS.
-rw-r--r--   1 root root     0 Apr 19 04:18 rt_tables.corrected          --------->>>>>>>>> Indicator/Flag File Whether Correction Procedure Has Taken Place or Not.
-rwxrwxrwx   1 root root  1252 Apr 18 19:13 VMImportCompensateRT         --------->>>>>>>>> Executable Bash Script. Note the "-rwxrwxrwx" property.
-rw-r--r--   1 root root    93 Apr 18 19:15 vmimport.rt_tables           --------->>>>>>>>> Correct Networking Configuration.



root@xubuntu-vm:/# ls -lap /etc/cron.hourly/                           --------->>>>>>>>> Any Executable File In This Folder Will Be Executed Hourly.
total 24
drwxr-xr-x   2 root root  4096 Apr 18 19:34 ./
drwxr-xr-x 158 root root 12288 Apr 19 04:41 ../
-rw-r--r--   1 root root   102 Jun 14  2012 .placeholder
-rwxrwxrwx   1 root root   140 Apr 18 19:59 VMImportCompensate         --------->>>>>>>>> Executable Bash Script (Simplification Bridge Script Only). Note the "-rwxrwxrwx" property.



root@xubuntu-vm:~# ls -lap /root/
total 168
drwx------ 20 root root  4096 May 31 04:09 ./
drwxr-xr-x 22 root root  4096 Sep 30  2015 ../
-rw-r--r--  1 root root   107 Oct 13  2015 .apport-ignore.xml
-rw-------  1 root root 17379 May 31 04:09 .bash_history
-rw-r--r--  1 root root  3106 Jul  3  2012 .bashrc
drwx------ 12 root root  4096 Oct 15  2018 .cache/
drwx------ 11 root root  4096 Sep 30  2015 .config/
drwx------  3 root root  4096 Apr 29  2013 .dbus/
drwxr-xr-x  2 root root  4096 Oct 27  2017 Desktop/
-rw-r--r--  1 root root    41 Feb 12  2015 .dmrc
drwxr-xr-x  2 root root  4096 May 15  2013 Documents/
drwxr-xr-x  6 root root  4096 Oct  3  2015 Downloads/
drwx------  3 root root  4096 Oct 15  2018 .gconf/
drwx------  3 root root  4096 Feb 17  2016 .gnome2/
drwx------  2 root root  4096 Apr 21  2015 .gnupg/
-rw-------  1 root root 13364 Oct 15  2018 .ICEauthority
drwx------  3 root root  4096 Apr 29  2013 .local/
drwx------  4 root root  4096 May 15  2013 .mozilla/
drwxr-xr-x  2 root root  4096 May 15  2013 Music/
-rw-r--r--  1 root root   259 Feb 12  2015 .pam_environment
drwxr-xr-x  2 root root  4096 May 15  2013 Pictures/
-rw-r--r--  1 root root   150 Feb 24  2015 .profile
drwxr-xr-x  2 root root  4096 May 15  2013 Public/
drwx------  2 root root  4096 Feb 12  2015 .pulse/
-rw-------  1 root root   256 Apr 20  2013 .pulse-cookie
-rwxrwxrwx  1 root root   489 May 31 03:53 RotateLog                         --------->>>>>>>>> Executable Bash Script for Rotating Log Files.
drwxr-xr-x  2 root root  4096 May 15  2013 Templates/
drwx------  4 root root  4096 Feb 10  2016 .thumbnails/
drwxr-xr-x  2 root root  4096 May 15  2013 Videos/
-rwxrwxrwx  1 root root   251 May 31 03:55 VMImportCleanUp4Packaging         --------->>>>>>>>> Executable Bash Script for Cleaning-Up/Reset Flag, Archive and Log Files. Note the "-rwxrwxrwx" property.
-rw-r--r--  1 root root   644 May 31 04:09 VMImportCompensate.log            --------->>>>>>>>> The/Single Log File For The Whole Networking Configuration Correction Procedure.
-rw-r--r--  1 root root    55 Oct 15  2018 .Xauthority
-rw-r--r--  1 root root     0 Jan 29  2015 .Xauthority.A298SX
-rw-------  1 root root   233 Oct 15  2018 .xsession-errors
-rw-------  1 root root   292 Oct 15  2018 .xsession-errors.old



root@xubuntu-vm:/# cat /etc/crontab
# /etc/crontab: system-wide crontab
# Unlike any other crontab you don't have to run the `crontab'
# command to install the new version when you edit this file
# and files in /etc/cron.d. These files also have username fields,
# that none of the other crontabs do.

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# m h dom mon dow user  command
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
*/9  *  *  *  *   root   sudo /bin/bash /etc/network/VMImportCompensateIF crontab          #########--------->>>>>>>>> Execute "/etc/network/VMImportCompensateIF crontab" Every 9 Minutes. The "crontab" Part Is Only A Parameter For The Executable Bash Script.
*/9  *  *  *  *   root   sudo /bin/bash /etc/iproute2/VMImportCompensateRT crontab         #########--------->>>>>>>>> Execute "/etc/iproute2/VMImportCompensateRT crontab" Every 9 Minutes. The "crontab" Part Is Only A Parameter For The Executable Bash Script.
#



root@xubuntu-vm:/# cat /etc/anacrontab
# /etc/anacrontab: configuration file for anacron
# See anacron(8) and anacrontab(5) for details.

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
HOME=/root
LOGNAME=root
# the maximal random delay added to the base delay of the jobs
RANDOM_DELAY=22
# the jobs will be started during the following hours only
START_HOURS_RANGE=0-9

# These replace cron's entries
1           9   cron.daily.vmimportcompensate   /usr/bin/sudo /bin/bash /etc/network/VMImportCompensateIF anacrontab          #########--------->>>>>>>>> Execute "/etc/network/VMImportCompensateIF anacrontab" Daily. Delay 9 Minutes If Unit Has Just Started/Booted-Up. The "anacrontab" Part Is Only A Parameter For The Executable Bash Script.
1           9   cron.daily.vmimportcompensate   /usr/bin/sudo /bin/bash /etc/iproute2/VMImportCompensateRT anacrontab         #########--------->>>>>>>>> Execute "/etc/iproute2/VMImportCompensateRT anacrontab" Daily. Delay 9 Minutes If Unit Has Just Started/Booted-Up. The "anacrontab" Part Is Only A Parameter For The Executable Bash Script.
1           9   cron.daily.logrotate            /usr/bin/sudo /bin/bash /root/RotateLog                                       #########--------->>>>>>>>> Execute "/root/RotateLog" Daily. Delay 9 Minutes If Unit Has Just Started/Booted-Up.
1           9   cron.daily                      run-parts --report /etc/cron.daily
7          22   cron.weekly                     run-parts --report /etc/cron.weekly
@monthly   22   cron.monthly                    run-parts --report /etc/cron.monthly



root@xubuntu-vm:/# cat /etc/cron.hourly/VMImportCompensate            --------->>>>>>>>> This Executable Bash Script Envelops The Following 2 Commands WITH The Needed Parameter.
#!/bin/bash -ex

sudo /bin/bash /etc/network/VMImportCompensateIF cron.hourly          #########--------->>>>>>>>> Execute "/etc/network/VMImportCompensateIF cron.hourly". The "cron.hourly" Part Is Only A Parameter For The Executable Bash Script.
sudo /bin/bash /etc/iproute2/VMImportCompensateRT cron.hourly         #########--------->>>>>>>>> Execute "/etc/iproute2/VMImportCompensateRT cron.hourly". The "cron.hourly" Part Is Only A Parameter For The Executable Bash Script.



root@xubuntu-vm:/# cat /etc/iproute2/rt_tables         --------->>>>>>>>> The Working Configuration Sample.
#
# reserved values
#
255     local
254     main
253     default
0       unspec
#
# local
#
#1      inr.ruhep
1       rt2         #########--------->>>>>>>>> Add Route Table "rt2" And Set Its Preference To 1.



root@xubuntu-vm:/# cat /etc/iproute2/vmimport.rt_tables         --------->>>>>>>>> The Working Configuration File As Source Of Correction Procedure.
#
# reserved values
#
255     local
254     main
253     default
0       unspec
#
# local
#
#1      inr.ruhep
1       rt2         #########--------->>>>>>>>> Add Route Table "rt2" And Set Its Preference To 1.



root@xubuntu-vm:/# cat /etc/iproute2/VMImportCompensateRT         --------->>>>>>>>> The Executable Bash Script For Correcting The Networking Configuration.
#!/bin/bash -ex

AWS_File=/etc/iproute2/rt_tables.archive
My_File=/etc/iproute2/vmimport.rt_tables
Operate_File=/etc/iproute2/rt_tables
Flag_File=/etc/iproute2/rt_tables.corrected
Log_File=~/VMImportCompensate.log
Log_Indicator=RT

if [ -f "$Flag_File" ]; then
  sudo echo "$1 `date +%Y%m%d%H%M%S` $Log_Indicator $Flag_File exist." >> "$Log_File"
else
  sudo echo "$1 `date +%Y%m%d%H%M%S` $Log_Indicator $Flag_File does NOT exist. Start correction." >> "$Log_File"
  if [ -f "$My_File" ]; then
    sudo echo "$1 `date +%Y%m%d%H%M%S` $Log_Indicator $My_File exist." >> "$Log_File"
    if [ -f "$Operate_File" ]; then
      sudo echo "$1 `date +%Y%m%d%H%M%S` $Log_Indicator $Operate_File exist. Remove $Operate_File ." >> "$Log_File"
      sudo cp "$Operate_File" "$AWS_File"
      sudo rm -f "$Operate_File"
    else
      sudo echo "$1 `date +%Y%m%d%H%M%S` $Log_Indicator $Operate_File does NOT exist." >> "$Log_File"
    fi
    sudo cp "$My_File" "$Operate_File"
    sudo touch "$Flag_File"
    sudo echo "$1 `date +%Y%m%d%H%M%S` $Log_Indicator $Operate_File is corrected. Reboot." >> "$Log_File"
    sudo reboot
  else
    sudo echo "$1 `date +%Y%m%d%H%M%S` $Log_Indicator $My_File does NOT exist. Can NOT perform correction." >> "$Log_File"
  fi
fi



root@xubuntu-vm:/# cat /etc/network/interfaces         --------->>>>>>>>> The Working Configuration Sample.
# The loopback network interface

auto lo
iface lo inet loopback

# The primary network interface

auto eth0
iface eth0 inet static
  address 10.1.1.252
  netmask 255.255.255.0
  network 10.1.1.0
  broadcast 10.1.1.255
  post-up ip route add 10.1.1.0/24 dev eth0 src 10.1.1.252 table rt2         #########--------->>>>>>>>> Statement : Network 10.1.1.0/24 Can Be Reached Through "eth0" Interface.
  post-up ip route add default via 10.1.1.1 dev eth0 table rt2               #########--------->>>>>>>>> Statement : Set-Up The Default Gateway.
  post-up ip rule add from 10.1.1.252/32 table rt2                           #########--------->>>>>>>>> Statement : Traffic FROM IP Address 10.1.1.252 Use The "rt2" Route Table.
  post-up ip rule add to 10.1.1.252/32 table rt2                             #########--------->>>>>>>>> Statement : Traffic TO IP Address 10.1.1.252 Use The "rt2" Route Table.
  dns-nameservers 8.8.4.4         #########--------->>>>>>>>> DNS Server.

auto eth1
iface eth1 inet static
  address 10.1.20.252
  netmask 255.255.255.0
  network 10.1.20.0
  gateway 10.1.20.241             #########--------->>>>>>>>> Default Gateway. Can Set Only ONE Default Gateway. Decided This Interface Should Be The Main Default Gateway.
  dns-nameservers 8.8.8.8         #########--------->>>>>>>>> DNS Server.
  broadcast 10.1.20.255
auto eth1:1
iface eth1:1 inet static
  address 10.1.20.16
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:2
iface eth1:2 inet static
  address 10.1.20.17
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:3
iface eth1:3 inet static
  address 10.1.20.18
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:4
iface eth1:4 inet static
  address 10.1.20.19
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:5
iface eth1:5 inet static
  address 10.1.20.20
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:6
iface eth1:6 inet static
  address 10.1.20.11
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:7
iface eth1:7 inet static
  address 10.1.20.12
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:8
iface eth1:8 inet static
  address 10.1.20.13
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:9
iface eth1:9 inet static
  address 10.1.20.14
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:10
iface eth1:10 inet static
  address 10.1.20.15
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:11
iface eth1:11 inet static
  address 10.1.20.50
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255



root@xubuntu-vm:/# cat /etc/network/vmimport.interfaces         --------->>>>>>>>> The Working Configuration File As Source Of Correction Procedure.
# The loopback network interface

auto lo
iface lo inet loopback

# The primary network interface

auto eth0
iface eth0 inet static
  address 10.1.1.252
  netmask 255.255.255.0
  network 10.1.1.0
  broadcast 10.1.1.255
  post-up ip route add 10.1.1.0/24 dev eth0 src 10.1.1.252 table rt2         #########--------->>>>>>>>> Statement : Network 10.1.1.0/24 Can Be Reached Through "eth0" Interface.
  post-up ip route add default via 10.1.1.1 dev eth0 table rt2               #########--------->>>>>>>>> Statement : Set-Up The Default Gateway.
  post-up ip rule add from 10.1.1.252/32 table rt2                           #########--------->>>>>>>>> Statement : Traffic FROM IP Address 10.1.1.252 Use The "rt2" Route Table.
  post-up ip rule add to 10.1.1.252/32 table rt2                             #########--------->>>>>>>>> Statement : Traffic TO IP Address 10.1.1.252 Use The "rt2" Route Table.
  dns-nameservers 8.8.4.4         #########--------->>>>>>>>> DNS Server.

auto eth1
iface eth1 inet static
  address 10.1.20.252
  netmask 255.255.255.0
  network 10.1.20.0
  gateway 10.1.20.241             #########--------->>>>>>>>> Default Gateway. Can Set Only ONE Default Gateway. Decided This Interface Should Be The Main Default Gateway.
  dns-nameservers 8.8.8.8         #########--------->>>>>>>>> DNS Server.
  broadcast 10.1.20.255
auto eth1:1
iface eth1:1 inet static
  address 10.1.20.16
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:2
iface eth1:2 inet static
  address 10.1.20.17
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:3
iface eth1:3 inet static
  address 10.1.20.18
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:4
iface eth1:4 inet static
  address 10.1.20.19
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:5
iface eth1:5 inet static
  address 10.1.20.20
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:6
iface eth1:6 inet static
  address 10.1.20.11
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:7
iface eth1:7 inet static
  address 10.1.20.12
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:8
iface eth1:8 inet static
  address 10.1.20.13
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:9
iface eth1:9 inet static
  address 10.1.20.14
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:10
iface eth1:10 inet static
  address 10.1.20.15
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255
auto eth1:11
iface eth1:11 inet static
  address 10.1.20.50
  netmask 255.255.255.0
  network 10.1.20.0
  broadcast 10.1.20.255



root@xubuntu-vm:/# cat /etc/network/VMImportCompensateIF         --------->>>>>>>>> The Executable Bash Script For Correcting The Networking Configuration.
#!/bin/bash -ex

AWS_File=/etc/network/interfaces.archive
My_File=/etc/network/vmimport.interfaces
Operate_File=/etc/network/interfaces
Flag_File=/etc/network/interfaces.corrected
Log_File=~/VMImportCompensate.log
Log_Indicator=IF

if [ -f "$Flag_File" ]; then
  sudo echo "$1 `date +%Y%m%d%H%M%S` $Log_Indicator $Flag_File exist." >> "$Log_File"
else
  sudo echo "$1 `date +%Y%m%d%H%M%S` $Log_Indicator $Flag_File does NOT exist. Start correction." >> "$Log_File"
  if [ -f "$My_File" ]; then
    sudo echo "$1 `date +%Y%m%d%H%M%S` $Log_Indicator $My_File exist." >> "$Log_File"
    if [ -f "$Operate_File" ]; then
      sudo echo "$1 `date +%Y%m%d%H%M%S` $Log_Indicator $Operate_File exist. Remove $Operate_File ." >> "$Log_File"
      sudo cp "$Operate_File" "$AWS_File"
      sudo rm -f "$Operate_File"
    else
      sudo echo "$1 `date +%Y%m%d%H%M%S` $Log_Indicator $Operate_File does NOT exist." >> "$Log_File"
    fi
    sudo cp "$My_File" "$Operate_File"
    sudo touch "$Flag_File"
    sudo echo "$1 `date +%Y%m%d%H%M%S` $Log_Indicator $Operate_File is corrected. Reboot." >> "$Log_File"
    sudo reboot
  else
    sudo echo "$1 `date +%Y%m%d%H%M%S` $Log_Indicator $My_File does NOT exist. Can NOT perform correction." >> "$Log_File"
  fi
fi



root@xubuntu-vm:/# cat /root/VMImportCleanUp4Packaging         --------->>>>>>>>> The Executable Bash Script for Cleaning-Up/Reset Flag, Archive and Log Files. To Be Executed After All Necessary Changes Are Done And Just Before Importing The VM To AWS.
#!/bin/bash -ex

sudo rm -f /etc/network/interfaces.corrected
sudo rm -f /etc/iproute2/rt_tables.corrected
sudo rm -f ~/VMImportCompensate.log*
sudo rm -f /etc/network/interfaces.archive
sudo rm -f /etc/iproute2/rt_tables.archive
sudo shutdown -h now
root@xubuntu-vm:/#



root@xubuntu-vm:~# cat /root/RotateLog         --------->>>>>>>>> The Executable Bash Script for Rotating Log Files. Executed regularly by Anacrontab.
#!/bin/bash

if [ -z $1 ]; then
  Log_File=~/VMImportCompensate.log
else
  Log_File=$1
fi

if [ -z $2 ]; then
  Max_Log=22
else
  Max_Log=$2
fi

if [ -f "$Log_File.$Max_Log" ]; then
  rm -f "$Log_File.$Max_Log"
fi

for counter in `seq $((Max_Log-1)) -1 1`; do
  if [ -f "$Log_File.$counter" ]; then
    mv -f "$Log_File."{$counter,$((counter+1))}
  fi
done

if [ -f "$Log_File" ]; then
  cp -f "$Log_File" "$Log_File.1"
  echo "`/bin/date +%Y%m%d%H%M%S` Rotate $Log_File" > "$Log_File"
fi
root@xubuntu-vm:~#



╔═╦═════════════════╦═╗
║ ║                 ║ ║
╠═╬═════════════════╬═╣
║ ║ Change TimeZone ║ ║
╠═╬═════════════════╬═╣
║ ║                 ║ ║
╚═╩═════════════════╩═╝

Change TimeZone through the GUI, to: Asia/Singapore .         --------->>>>>>>>> Or other TimeZone.



╔═╦═════════════════════╦═╗
║ ║                     ║ ║
╠═╬═════════════════════╬═╣
║ ║ Change SSH Password ║ ║
╠═╬═════════════════════╬═╣
║ ║                     ║ ║
╚═╩═════════════════════╩═╝

sudo passwd root         --------->>>>>>>>> There may be other user(s) which needs to be secured.



╔═╦════════════════════════╦═╗
║ ║                        ║ ║
╠═╬════════════════════════╬═╣
║ ║ Change X11VNC Password ║ ║
╠═╬════════════════════════╬═╣
║ ║                        ║ ║
╚═╩════════════════════════╩═╝

root@xubuntu-vm:/# x11vnc -storepasswd /etc/x11vnc.pass
Enter VNC password:
Verify password:
Write password to /etc/x11vnc.pass?  [y]/n y
Password written to: /etc/x11vnc.pass
root@xubuntu-vm:/# ls -lap /etc/x11vnc.pass
-rw------- 1 root root 8 Apr 19 00:15 /etc/x11vnc.pass
root@xubuntu-vm:/# reboot



╔═╦═════════════════╦═╗
║ ║                 ║ ║
╠═╬═════════════════╬═╣
║ ║ End of Document ║ ║
╠═╬═════════════════╬═╣
║ ║                 ║ ║
╚═╩═════════════════╩═╝
```


