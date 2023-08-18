┌──(root㉿test-station)-[/home/user1/Documents/scripts]
└─# python3 meta.py
Metasploit script generated: metasploit_script.rc
                                                                                
┌──(root㉿test-station)-[/home/user1/Documents/scripts]
└─# ls
bash2.sh           meta.py               recon.py       scan.py
bash.sh            meta.sh               recon.sh       scan_results.txt
dash.sh            metasploit_script.rc  runnit.sh      scan_results.xml
exploit.py         nmap.py               run.sh         scans.nse
gobuster_scan.txt  nmap_scan.xml         scanbetter.py  testscan
kaboom2.sh         python.py             scanit.lua     testscan.sh
                                                                                
┌──(root㉿test-station)-[/home/user1/Documents/scripts]
└─# msfconsole
                                                  

      .:okOOOkdc'           'cdkOOOko:.
    .xOOOOOOOOOOOOc       cOOOOOOOOOOOOx.
   :OOOOOOOOOOOOOOOk,   ,kOOOOOOOOOOOOOOO:
  'OOOOOOOOOkkkkOOOOO: :OOOOOOOOOOOOOOOOOO'
  oOOOOOOOO.MMMM.oOOOOoOOOOl.MMMM,OOOOOOOOo
  dOOOOOOOO.MMMMMM.cOOOOOc.MMMMMM,OOOOOOOOx
  lOOOOOOOO.MMMMMMMMM;d;MMMMMMMMM,OOOOOOOOl
  .OOOOOOOO.MMM.;MMMMMMMMMMM;MMMM,OOOOOOOO.
   cOOOOOOO.MMM.OOc.MMMMM'oOO.MMM,OOOOOOOc
    oOOOOOO.MMM.OOOO.MMM:OOOO.MMM,OOOOOOo
     lOOOOO.MMM.OOOO.MMM:OOOO.MMM,OOOOOl
      ;OOOO'MMM.OOOO.MMM:OOOO.MMM;OOOO;
       .dOOo'WM.OOOOocccxOOOO.MX'xOOd.
         ,kOl'M.OOOOOOOOOOOOO.M'dOk,
           :kk;.OOOOOOOOOOOOO.;Ok:
             ;kOOOOOOOOOOOOOOOk:
               ,xOOOOOOOOOOOx,
                 .lOOOOOOOl.
                    ,dOd,
                      .

       =[ metasploit v6.3.30-dev-                         ]
+ -- --=[ 2340 exploits - 1220 auxiliary - 413 post       ]
+ -- --=[ 1387 payloads - 46 encoders - 11 nops           ]
+ -- --=[ 9 evasion                                       ]

Metasploit tip: After running db_nmap, be sure to 
check out the result of hosts and services
Metasploit Documentation: https://docs.metasploit.com/

msf6 > ls
[*] exec: ls

bash2.sh           meta.py               recon.py       scan.py
bash.sh            meta.sh               recon.sh       scan_results.txt
dash.sh            metasploit_script.rc  runnit.sh      scan_results.xml
exploit.py         nmap.py               run.sh         scans.nse
gobuster_scan.txt  nmap_scan.xml         scanbetter.py  testscan
kaboom2.sh         python.py             scanit.lua     testscan.sh
msf6 > resource metasploit_script.rc
[*] Processing /home/user1/Documents/scripts/metasploit_script.rc for ERB directives.
resource (/home/user1/Documents/scripts/metasploit_script.rc)> use auxiliary/scanner/smb/smb_version
resource (/home/user1/Documents/scripts/metasploit_script.rc)> set RHOSTS 10.10.10.222
RHOSTS => 10.10.10.222
resource (/home/user1/Documents/scripts/metasploit_script.rc)> run

[*] 10.10.10.222:         - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
resource (/home/user1/Documents/scripts/metasploit_script.rc)> use auxiliary/scanner/ssh/ssh_version
resource (/home/user1/Documents/scripts/metasploit_script.rc)> set RHOSTS 10.10.10.222
RHOSTS => 10.10.10.222
resource (/home/user1/Documents/scripts/metasploit_script.rc)> run
[+] 10.10.10.222:22       - SSH server version: SSH-2.0-OpenSSH_7.9p1 Debian-10+deb10u2 ( service.version=7.9p1 openssh.comment=Debian-10+deb10u2 service.vendor=OpenBSD service.family=OpenSSH service.product=OpenSSH service.cpe23=cpe:/a:openbsd:openssh:7.9p1 os.vendor=Debian os.family=Linux os.product=Linux os.version=10.2 os.cpe23=cpe:/o:debian:debian_linux:10.2 service.protocol=ssh fingerprint_db=ssh.banner )
[*] 10.10.10.222:22       - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
resource (/home/user1/Documents/scripts/metasploit_script.rc)> exit
                                                                                
┌──(root㉿test-station)-[/home/user1/Documents/scripts]
└─# 
