![Release](https://img.shields.io/badge/release-stable%201.0.0-green.svg)
![Language](https://img.shields.io/badge/made%20with-bash-brightgreen.svg)
![License](https://img.shields.io/badge/license-GPLv3-blue.svg)
![LastUpdate](https://img.shields.io/badge/last%20update-2019%2F05-orange.svg)
![TestedOn](https://img.shields.io/badge/tested%20on-Kali%20Linux-red.svg)

<p align="center"><img src="https://github.com/Leviathan36/kaboom/blob/master/kaboom_images/logo.png" width="80%" height="auto"></p>

## About
Kaboom is an automatism for penetration tests. It performs several tasks for the first two phases of the test: information gathering and vulnerability assessment.
All informations collected are saved into a directory hierarchy very
simple to browse (also in case of multiple targets).

## Details
Kaboom performs several tasks:

   1. **Information Gathering**

        * Port scan (**Nmap**)
        * Web resources enumeration (**Dirb**)

   2. **Vulnerability assessment**

        * Web vulnerability assessment (**Nikto** - **Dirb**)
        * Vulnerability assessment (**Nmap** - **Metasploit**)
        * Automatic Vulnerabilities research (**Searchsploit** - **Metasploit**)
        * Dictionary Attacks (**Hydra**)

            * SSH
            * POP3
            * IMAP
            * RDP

## Usage
Kaboom can be used in two ways:

   * Interactive mode:

   `kaboom [ENTER], and the script does the rest`

<p align="center"><img src="https://github.com/Leviathan36/kaboom/blob/master/kaboom_images/screenshots/interactive_mode.png" width="80%" height="auto"></p>

   * NON-interactive mode:

   `kaboom -t <target_ip> -f <report_path> [-p one_or_more_phases]`

<br>

**If you want to see the help:**
<br>

   `kaboom -h (or --help)`

<br>

_**For more screenshots see the relative [directory](https://github.com/Leviathan36/kaboom/tree/master/kaboom_images/screenshots/) of the repository.**_

## Dir Hierarchy
<p align="center"><img src="https://github.com/Leviathan36/kaboom/blob/master/kaboom_images/dir_hierarchy.PNG" width="80%" height="auto"></p>

## Customization
It's possible to customize the script by changing the value of variables at the beginning of the file.
In particularly you can choose the wordlists used by Hydra and Dirb, specify another Metasploit scan script and
change the output file names.

```bash
#KABOOM_PATH=''		# THE PATH COULD BE SET HERE INSTEAD OF IN BASHRC FILE

if [[ "$KABOOM_PATH" == '' ]]; then
	KABOOM_PATH='.'
fi

# USER WORDLISTS
USERLIST_HYDRA_SSH="$KABOOM_PATH/user_wordlist_short.txt"
USERLIST_HYDRA_POP3="$KABOOM_PATH/user_wordlist_short.txt"
USERLIST_HYDRA_IMAP="$KABOOM_PATH/user_wordlist_short.txt"
USERLIST_HYDRA_RDP="$KABOOM_PATH/user_wordlist_short.txt"
USERLIST_HYDRA_SMB="$KABOOM_PATH/user_wordlist_short.txt"

# PASSWORD WORDLISTS
PASSLIST_HYDRA="$KABOOM_PATH/fasttrack.txt"
PASSLIST_HYDRA_SSH="$PASSLIST_HYDRA"
PASSLIST_HYDRA_POP3="$PASSLIST_HYDRA"
PASSLIST_HYDRA_IMAP="$PASSLIST_HYDRA"
PASSLIST_HYDRA_RDP="$PASSLIST_HYDRA"
PASSLIST_HYDRA_SMB="$PASSLIST_HYDRA"

# DIRB WORDLISTS
HTTP_WORDLIST="$KABOOM_PATH/custom_url_wordlist.txt"
HTTP_EXTENSIONS_FILE="$KABOOM_PATH/custom_extensions_common.txt"

# METASPLOIT SCAN SCRIPT
METASPLOIT_SCAN_SCRIPT='./metasploit_scan_script'

# NMAP FILES
SCRIPT_SYN='script-syn'
UDP='udp'
SYN='syn'
```

## New features
* _**Customization**_ (see above)
* _**Multi-target specification**_
    * You can specify up to 254 hosts (C-class network)
* _**New CLI interface**_
* _**More powerfull Nmap scan**_
* _**Better directory hierarchy**_
* _**Automatic research of Metasploit module associated with CVE code found**_
* _**Recognition of services exposed on not canonical ports**_ (ex: http on 7000)
* _**Print out and save credentials found**_


## Twin Brother
During the development of Kaboom was born a parallel project called **trigmap** (trigger Nmap).
This tool performs the same tasks of Kaboom, but with a different philosophy; infact, it uses only **Nmap** to execute
his work.
Generally Kaboom isn't better than Trigmap and vice versa, but simply it's a good thing to use both the scripts to gather more evidences.

For more informations about this tool take a look [to this link](https://github.com/Leviathan36/trigmap).

<br>
<br>

-------------------------------------
## Disclaimer:
Author assume no liability and are not responsible for any misuse or damage caused by this program.

Kaboom is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

## License:
Kaboom is released under GPLv3 license. See [LICENSE](LICENSE) for more details.
