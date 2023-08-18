![Release](https://img.shields.io/badge/release-stable%201.0.0-green.svg)
![Language](https://img.shields.io/badge/made%20with-bash-brightgreen.svg)
![License](https://img.shields.io/badge/license-GPLv3-blue.svg)
![LastUpdate](https://img.shields.io/badge/last%20update-2019%2F05-orange.svg)
![TestedOn](https://img.shields.io/badge/tested%20on-Kali%20Linux-red.svg)

<p align="center"><img src="https://github.com/Leviathan36/kaboom/blob/master/kaboom_images/logo.png" width="80%" height="auto">
<img src="https://static.dribbble.com/users/948184/screenshots/5611449/431_bob_omb_db.gif" width="80%"</p>

# kaboom-APT: Advanced Pentration Technology (pentech)

In the ever-evolving landscape of cybersecurity, the need for robust penetration testing tools is paramount. Introducing Kaboom-APT, a powerful and versatile automaton designed to revolutionize the way penetration testing is conducted. With a comprehensive set of features focused on information gathering and vulnerability assessment, Kaboom-APT stands as a testament to efficient and effective testing methodologies.

## Unleashing the Power of Kaboom-APT

Kaboom-APT, short for "Advance Penetration Testing," is an intelligent and automated solution meticulously crafted to simplify the complexities of penetration testing. Its purpose is clear: to equip security professionals with an advanced tool that seamlessly integrates into their workflow, enhancing their capabilities and efficiency.

## Elevating Your Testing Phases

At its core, Kaboom-APT is a multi-faceted tool that excels in two fundamental phases of penetration testing: information gathering and vulnerability assessment. This automated powerhouse streamlines the process, allowing testers to focus on analyzing results rather than grappling with manual tasks.

### Information Gathering

Kaboom-APT efficiently conducts comprehensive information gathering through the following methods:

- **Port Scanning**: Leveraging the power of Nmap, Kaboom-APT scans ports to identify potential entry points, offering insights into the network's structure.

- **Web Resources Enumeration**: Through Dirb, Kaboom-APT identifies and catalogs web resources, providing a thorough understanding of the target's online presence.

### Vulnerability Assessment

Kaboom-APT empowers testers to perform thorough vulnerability assessments, enabling them to uncover potential weaknesses:

- **Web Vulnerability Assessment**: By utilizing tools such as Nikto and Dirb, Kaboom-APT identifies vulnerabilities in web applications, ensuring they meet the highest security standards.

- **Automatic Vulnerabilities Research**: Kaboom-APT automatically integrates with Searchsploit and Metasploit, streamlining the process of identifying and mitigating vulnerabilities.

- **Dictionary Attacks**: Employing Hydra, Kaboom-APT conducts dictionary attacks against open services, targeting common protocols such as SSH, POP3, IMAP, and RDP.

## Seamless Usage for Diverse Scenarios

Kaboom-APT is designed to accommodate various scenarios, offering two distinct modes of operation:

- **Interactive Mode**: In this mode, executing `kaboom` with no parameters triggers an automated sequence of tasks, allowing the script to handle the complexities, while you focus on results.

- **Non-Interactive Mode**: For tailored testing, use the command `kaboom -t <target_ip> -f <report_path> [-p phases]` to customize the process according to your needs.

![Interactive Mode](https://github.com/Leviathan36/kaboom/blob/master/kaboom_images/screenshots/interactive_mode.png)

## Empowering Customization

Kaboom-APT empowers you to customize its behavior by adjusting variables at the script's outset. This allows you to tailor the tool to your specific requirements, whether it's selecting wordlists for Hydra and Dirb, specifying a Metasploit scan script, or refining output file names.

## Embrace the Future of Penetration Testing

Kaboom-APT ushers in a new era of penetration testing, where automation, efficiency, and precision converge to yield unparalleled results. With its advanced features and user-friendly interface, Kaboom-APT is your ally in fortifying digital landscapes against potential threats. Experience the power of Kaboom-APT and elevate your penetration testing game today.






#KABOOM_PATH='' # THE PATH COULD BE SET HERE INSTEAD OF IN BASHRC FILE

if [[ "$KABOOM_PATH" == '' ]]; then
KABOOM_PATH='.'
fi

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

 ... (rest of the customization variables)

# Kaboom-APT - Advanced Penetration Testing

## About
Kaboom-APT is an advanced penetration testing tool designed to empower security professionals with a wide range of capabilities. The tool excels in information gathering and vulnerability assessment, streamlining the penetration testing process.

## New Features

Kaboom-APT introduces a suite of powerful new features, enhancing its effectiveness and versatility:

### Customization
Tailor Kaboom-APT to your specific needs by adjusting variables at the script's outset. Modify Hydra and Dirb wordlists, specify alternative Metasploit scan scripts, and personalize output file names for a tailored experience.

### Multi-target Specification
Efficiently test multiple targets with Kaboom-APT's multi-target specification. Define up to 254 hosts (C-class network) for thorough testing and analysis, expanding the tool's scope.

### New CLI Interface
Experience a revamped Command Line Interface (CLI) for seamless interaction with Kaboom-APT. The intuitive interface simplifies command entry and navigation.

### Enhanced Nmap Scans
Kaboom-APT's Nmap scan functionality has been refined, delivering more comprehensive and accurate results. Obtain detailed insights into open ports and services, aiding vulnerability identification.

### Streamlined Directory Hierarchy
Benefit from an optimized directory hierarchy for effortless organization and analysis of collected data. The improved structure facilitates management across multiple targets.

### Automatic Metasploit Research
Kaboom-APT automates the association of Metasploit modules with CVE codes, accelerating exploit identification during vulnerability assessments.

### Non-Canonical Port Recognition
Detect and assess services on non-canonical ports, expanding Kaboom-APT's coverage to include services deviating from standard port assignments.

### Credentials Management
Retrieve, print, and save credentials uncovered during dictionary attacks. This feature ensures critical information is accessible for analysis and reporting.

## Twin Brother - Trigmap

As Kaboom-APT evolved, a parallel project named Trigmap (Trigger Nmap) emerged. Trigmap, while sharing similar objectives, relies solely on Nmap for its tasks. Combining both tools enriches penetration testing efforts.

Learn more about Trigmap in the [Trigmap repository](https://github.com/Leviathan36/trigmap).

## Disclaimer

Kaboom-APT is provided with no warranty, and the author assumes no liability for misuse or damage. Users must practice ethical and responsible use during penetration testing activities.

## License

Kaboom-APT is released under the GPLv3 license. Refer to the [LICENSE](LICENSE) file for detailed terms and conditions.







