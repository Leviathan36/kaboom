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








