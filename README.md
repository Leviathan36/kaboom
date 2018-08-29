![Release](https://img.shields.io/badge/release-under%20development-red.svg)
![Language](https://img.shields.io/badge/made%20with-bash-brightgreen.svg)
![License](https://img.shields.io/badge/license-GPLv3-blue.svg)
![LastUpdate](https://img.shields.io/badge/last%20update-2018%2F08%2F24-yellow.svg)


<p align="center"><img src="https://github.com/Leviathan36/kaboom/blob/master/kaboom_images/kaboom_logo.png" width="80%" height="auto"></p>

## About:
kaboom is a sript that automates the penetration test. It performs several tasks for each phases of pentest:

1. Information gathering [nmap-unicornscan]

	* TCP scan 
	* UDP scan

2. Vulnerability assessment [nmap-nikto-dirb-searchsploit-msfconsole]  
It tests several services:
	* smb
	* ssh
	* snmp
	* smtp
	* ftp
	* tftp
	* ms-sql
	* mysql
	* rdp
	* http  
	* https
	* and more...  
It finds the CVEs and then searchs them on exploit-db or Metasploit db.
3. Exploitation [hydra]

	* brute force ssh

## Usage
kaboom supports two mode:
	
* Interactive mode:  
kaboom [ENTER]  ...and the script does the rest
<p align="center"><img src="https://github.com/Leviathan36/kaboom/blob/master/kaboom_images/screenshot_interactive_mode.PNG" height="400" width="auto"></p>
		
* NON-interactive mode:  
kaboom <results_path> \<nic> <target_ip> [-s or --shutdown]

If you use the shutdown option, kaboom will shutdown the machine at the end of tasks.
	
If you want see this help:  
kaboom -h (or --help)
<p align="center"><img src="https://github.com/Leviathan36/kaboom/blob/master/kaboom_images/screenshot_help.PNG" height="90" width="auto"></p>

## Directory Hierarchy
kaboom saves the results of commands in this way:
<p align="center"><img src="https://github.com/Leviathan36/kaboom/blob/master/kaboom_images/kaboom_dir_hierarchy.png" height="500" width="auto"></p>

## Disclaimer:
**Author assume no liability and are not responsible for any misuse or damage caused by this program.**

**kaboom is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.**

## License:
kaboom is released under GPLv3 license. See [LICENSE](LICENSE) for more details.

	








