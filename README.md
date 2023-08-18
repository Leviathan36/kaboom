![Release](https://img.shields.io/badge/release-stable%201.0.0-green.svg)
![Language](https://img.shields.io/badge/made%20with-bash-brightgreen.svg)
![License](https://img.shields.io/badge/license-GPLv3-blue.svg)
![LastUpdate](https://img.shields.io/badge/last%20update-2019%2F05-orange.svg)
![TestedOn](https://img.shields.io/badge/tested%20on-Kali%20Linux-red.svg)

<p align="center"><img src="https://github.com/Leviathan36/kaboom/blob/master/kaboom_images/logo.png" width="80%" height="auto"></p>

# Kaboom - Automated Penetration Testing

## About
Kaboom is an automatism for penetration tests. It performs several tasks for the first two phases of the test: information gathering and vulnerability assessment.
All information collected is saved into a simple-to-browse directory hierarchy, even in the case of multiple targets.

## Details
Kaboom performs several tasks:

1. **Information Gathering**
   - Port scan (**Nmap**)
   - Web resources enumeration (**Dirb**)

2. **Vulnerability Assessment**
   - Web vulnerability assessment (**Nikto** - **Dirb**)
   - Vulnerability assessment (**Nmap** - **Metasploit**)
   - Automatic Vulnerabilities research (**Searchsploit** - **Metasploit**)
   - Dictionary Attacks (**Hydra**)
       - SSH
       - POP3
       - IMAP
       - RDP

## Usage
Kaboom can be used in two ways:

- Interactive mode:
  `kaboom [ENTER]`, and the script does the rest

![Interactive Mode](https://github.com/Leviathan36/kaboom/blob/master/kaboom_images/screenshots/interactive_mode.png)

- NON-interactive mode:
  `kaboom -t <target_ip> -f <report_path> [-p one_or_more_phases]`

**For more screenshots, see the [screenshots directory](https://github.com/Leviathan36/kaboom/tree/master/kaboom_images/screenshots/) of the repository.**

## Directory Hierarchy
<p align="center"><img src="https://github.com/Leviathan36/kaboom/blob/master/kaboom_images/dir_hierarchy.PNG" width="80%" height="auto"></p>

## Customization
It's possible to customize the script by changing the value of variables at the beginning of the file. In particular, you can choose the wordlists used by Hydra and Dirb, specify another Metasploit scan script, and change the output file names.

```bash
#KABOOM_PATH=''		# THE PATH COULD BE SET HERE INSTEAD OF IN BASHRC FILE

if [[ "$KABOOM_PATH" == '' ]]; then
	KABOOM_PATH='.'
fi

# ... (rest of the customization variables)

New Features

    Customization (see above)
    Multi-target specification
    New CLI interface
    More powerful Nmap scan
    Better directory hierarchy
    Automatic research of Metasploit module associated with CVE code found
    Recognition of services exposed on non-canonical ports
    Print out and save credentials found

Twin Brother - Trigmap

During the development of Kaboom, a parallel project called trigmap (trigger Nmap) was born. This tool performs the same tasks as Kaboom but with a different philosophy; it uses only Nmap to execute its work.
Generally, Kaboom isn't better than Trigmap and vice versa, but it's a good thing to use both scripts to gather more evidence.
For more information about this tool, visit the trigmap repository.
Disclaimer:

The author assumes no liability and is not responsible for any misuse or damage caused by this program.

Kaboom is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
License:

Kaboom is released under the GPLv3 license. See LICENSE for more details.

kotlin


Feel free to use and customize this Markdown content as needed for your documentation.








