
![Build and Deploy](https://github.com/kratostaine/spring-authorization-server/actions/workflows/continuous-integration-workflow.yml/badge.svg)
![Release](https://img.shields.io/badge/release-stable%201.0.0-green.svg)
![Language](https://img.shields.io/badge/made%20with-bash-brightgreen.svg)
![License](https://img.shields.io/badge/license-GPLv3-blue.svg)
![TestedOn](https://img.shields.io/badge/tested%20on-Kali%20Linux-red.svg)





<p align="center"><img src="https://static.dribbble.com/users/948184/screenshots/5611449/431_bob_omb_db.gif" width="100%"</p>

# 𝐤𝐚𝐛𝐨𝐨𝐦-𝐀𝐏𝐓: 𝐀𝐝𝐯𝐚𝐧𝐜𝐞𝐝 𝐏𝐞𝐧𝐭𝐫𝐚𝐭𝐢𝐨𝐧 𝐓𝐞𝐜𝐡𝐧𝐨𝐥𝐨𝐠𝐲 <i>𝚙𝚎𝚗/𝚝𝚎𝚌𝚑</i>

In the ever-evolving landscape of cybersecurity, the need for robust penetration testing tools is paramount. Introducing Kaboom-APT, a powerful and versatile automaton designed to revolutionize the way penetration testing is conducted. With a comprehensive set of features focused on information gathering and vulnerability assessment, Kaboom-APT stands as a testament to efficient and effective testing methodologies.

 ## 𝐔𝐧𝐥𝐞𝐚𝐬𝐡𝐢𝐧𝐠 𝐭𝐡𝐞 𝐏𝐨𝐰𝐞𝐫 𝐨𝐟 𝐊𝐚𝐛𝐨𝐨𝐦-𝐀𝐏𝐓

Kaboom-APT, short for "Advance Penetration Testing," is an intelligent and automated solution meticulously crafted to simplify the complexities of penetration testing. Its purpose is clear: to equip security professionals with an advanced tool that seamlessly integrates into their workflow, enhancing their capabilities and efficiency.

## 𝐄𝐥𝐞𝐯𝐚𝐭𝐢𝐧𝐠 𝐘𝐨𝐮𝐫 𝐓𝐞𝐬𝐭𝐢𝐧𝐠 𝐏𝐡𝐚𝐬𝐞𝐬

At its core, Kaboom-APT is a multi-faceted tool that excels in two fundamental phases of penetration testing: information gathering and vulnerability assessment. This automated powerhouse streamlines the process, allowing testers to focus on analyzing results rather than grappling with manual tasks.

### 𝙸𝚗𝚏𝚘𝚛𝚖𝚊𝚝𝚒𝚘𝚗 𝙶𝚊𝚝𝚑𝚎𝚛𝚒𝚗𝚐

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

## 𝐄𝐦𝐩𝐨𝐰𝐞𝐫𝐢𝐧𝐠 𝐂𝐮𝐬𝐭𝐨𝐦𝐢𝐳𝐚𝐭𝐢𝐨𝐧
Kaboom-APT empowers you to customize its behavior by adjusting variables at the script's outset. This allows you to tailor the tool to your specific requirements, whether it's selecting wordlists for Hydra and Dirb, specifying a Metasploit scan script, or refining output file names.

## 𝐄𝐦𝐛𝐫𝐚𝐜𝐞 𝐭𝐡𝐞 𝐅𝐮𝐭𝐮𝐫𝐞 𝐨𝐟 𝐏𝐞𝐧𝐞𝐭𝐫𝐚𝐭𝐢𝐨𝐧 𝐓𝐞𝐬𝐭𝐢𝐧𝐠

Kaboom-APT ushers in a new era of penetration testing, where automation, efficiency, and precision converge to yield unparalleled results. With its advanced features and user-friendly interface, Kaboom-APT is your ally in fortifying digital landscapes against potential threats. Experience the power of Kaboom-APT and elevate your penetration testing game today.

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

Kaboom-APT - 'Advancing Penetration Testing' in the Cybersecurity Realm
Introduction


The Evolving Landscape of Cybersecurity and the Need for Robust Tools

# Kaboom-APT - Advanced Penetration Testing

## Introduction

In the rapidly advancing digital age, the importance of cybersecurity has grown exponentially. With organizations and individuals relying on interconnected systems and data, the potential risks posed by cyber threats have become more severe and pervasive. Security breaches, data leaks, and other cyberattacks can lead to dire consequences, ranging from financial losses to reputational damage. In this landscape, the role of penetration testing has emerged as a critical component of a robust cybersecurity strategy.

Penetration testing, often referred to as ethical hacking, is the practice of simulating cyberattacks on a system or network to identify vulnerabilities and weaknesses before malicious actors can exploit them. This proactive approach enables organizations to uncover potential security flaws, assess the effectiveness of their defense mechanisms, and take preemptive measures to mitigate risks. As the complexity of technology and the methods of attack continue to evolve, the demand for sophisticated and powerful penetration testing tools has never been greater.

## Kaboom-APT: Empowering Security Professionals in the Digital Battlefield

In response to the growing need for advanced penetration testing tools, Kaboom-APT emerges as a prominent player in the field. It stands as a testament to the collective endeavor of security professionals who are dedicated to fortifying digital assets against the persistent and evolving threats of the digital world. Kaboom-APT is more than just a tool; it's a comprehensive suite of capabilities designed to equip security experts with the means to defend against an ever-expanding array of cyber risks.

At its core, Kaboom-APT is an advanced penetration testing tool that has been meticulously crafted to cater to the multifaceted demands of modern cybersecurity challenges. The tool embodies a holistic approach, seamlessly integrating various functionalities to address the intricacies of information gathering and vulnerability assessment. Its creation is a direct response to the realization that a one-size-fits-all solution is insufficient in the realm of cybersecurity.

## A Deep Dive into Kaboom-APT's Capabilities

### Fine-Tuned Information Gathering

One of Kaboom-APT's crowning achievements lies in its proficiency in information gathering. In the reconnaissance phase of penetration testing, where understanding the target's infrastructure is paramount, Kaboom-APT shines. It employs sophisticated techniques to scan and map the target network, identifying potential entry points and weaknesses that adversaries might exploit. This comprehensive insight empowers security professionals to fortify weak points and bolster defenses.

### Navigating the Vulnerability Landscape

Vulnerability assessment is a cornerstone of effective penetration testing. Kaboom-APT excels in this area, offering a multifaceted approach to identifying vulnerabilities within the target system or network. By leveraging both automated and manual techniques, it meticulously inspects potential weak spots, exposing areas that require immediate attention. This process is critical in preventing cybercriminals from exploiting vulnerabilities that might lead to unauthorized access or data breaches.

## Streamlining the Penetration Testing Process

Kaboom-APT's significance extends beyond its individual capabilities; it offers a holistic approach that streamlines the entire penetration testing process. Its integration of various tools and techniques into a cohesive framework minimizes the complexities often associated with cybersecurity assessments. This streamlined workflow empowers security professionals to focus on analysis and action, rather than grappling with disparate tools and fragmented processes.

## Conclusion

In an era where cybersecurity is paramount, Kaboom-APT emerges as a pivotal player in the ongoing battle to secure digital assets. Its comprehensive suite of capabilities, meticulous engineering, and holistic approach set it apart as a tool that empowers security professionals to proactively safeguard against cyber threats. As the digital landscape continues to evolve, Kaboom-APT stands as a beacon of innovation, helping to fortify the digital world against the ever-persistent forces of cybercrime.

---

## Kaboom-APT's New Features: Enhancing Cybersecurity Arsenal

### Customization: Tailoring to Precision

Kaboom-APT recognizes that each engagement requires a unique approach. With its customization feature, security professionals can calibrate the tool according to their specific requirements. The ability to adjust variables at the outset empowers users to tailor Hydra and Dirb wordlists, specify alternative Metasploit scan scripts, and personalize output file names. This level of precision ensures a bespoke experience, aligning the tool with the tester's distinct objectives.

### Multifaceted Exploration: Multi-Target Specification

In the realm of penetration testing, efficiency is paramount. Kaboom-APT understands this need and answers with its multi-target specification feature. Testers can now efficiently assess a multitude of targets by defining up to 254 hosts within a C-class network. This expansion of scope enhances the tool's versatility, allowing testers to comprehensively analyze a broader attack surface.

### Elevating Interaction: The New CLI Interface

A revamped Command Line Interface (CLI) redefines how users interact with Kaboom-APT. The CLI's intuitive design simplifies command entry and navigation, ensuring a seamless experience. This enhancement serves as a testament to Kaboom-APT's commitment to user-centric design, making it more accessible to both seasoned professionals and newcomers alike.

### Precision in Discovery: Enhanced Nmap Scans

Kaboom-APT's Nmap scan functionality has undergone a transformation, delivering results that are more comprehensive and precise than ever before. Testers can now glean detailed insights into open ports and services, facilitating the identification of vulnerabilities. This feature enhances the efficiency of vulnerability assessment, a cornerstone of penetration testing.

### Structured Clarity: Streamlined Directory Hierarchy

Managing collected data across multiple targets is often a formidable task. Kaboom-APT has mitigated this challenge by introducing an optimized directory hierarchy. This structure not only simplifies data organization but also expedites the analysis process. The enhanced directory hierarchy underscores Kaboom-APT's commitment to efficient information management.

### Automating Insights: Automatic Metasploit Research

Kaboom-APT simplifies the often intricate process of associating Metasploit modules with CVE codes. By automating this task, the tool expedites exploit identification during vulnerability assessments. This feature enhances the efficiency of the assessment phase, saving valuable time while ensuring thorough results.

### Widening the Scope: Non-Canonical Port Recognition

Modern networks often harbor services on non-canonical ports, deviating from traditional assignments. Kaboom-APT's non-canonical port recognition feature empowers testers to detect and assess services on such ports. This extension of coverage underscores the tool's adaptability, allowing testers to identify vulnerabilities irrespective of port assignment.

### Harnessing Credentials: Efficient Credentials Management

Credentials uncovered during dictionary attacks are a goldmine of information. Kaboom-APT recognizes the significance of this data and introduces a feature that allows testers to retrieve, print, and save credentials. This management feature ensures critical information is easily accessible for in-depth analysis and comprehensive reporting.

### Twin Brother - Trigmap: A Parallel Endeavor

As Kaboom-APT evolved, a parallel project named Trigmap (Trigger Nmap) emerged. Trigmap shares similar objectives with Kaboom-APT but adopts a distinct approach. This sibling tool relies exclusively on Nmap to execute its tasks. The synergy between Kaboom-APT and Trigmap enriches penetration testing endeavors, offering a comprehensive toolkit for varying scenarios.

To delve deeper into Trigmap's capabilities, visit the Trigmap repository.

### Ethical Responsibility: The Kaboom-APT Disclaimer

Kaboom-APT is a tool designed to empower cybersecurity professionals. However, its potency must be wielded responsibly. The author underscores that Kaboom


<p align="center"><img src="https://github.com/Leviathan36/kaboom/blob/master/kaboom_images/logo.png" width="100%" height="auto">
