Kaboom Pentest Tool - Enum Folder Documentation
Enum Folder Overview

The "enum" folder within the Kaboom pentest tool contains various resources and scripts that are used for enumerating information during the penetration testing process. Enumerating information is a crucial step in understanding the target system's configuration and potential vulnerabilities.
Files and Resources
nmap-scripts

This subfolder contains custom Nmap scripts that extend the tool's capabilities for service identification and vulnerability assessment. The scripts are organized based on their functionalities.

    custom-service-detection.nse: Custom Nmap script for detecting specific services and versions.
    vuln-scans.nse: Nmap scripts for vulnerability scanning.

wordlists

In this subfolder, you'll find a collection of wordlists that can be used for various purposes, such as dictionary attacks, brute-forcing, and content discovery.

    common.txt: A common wordlist for dictionary attacks on web applications.
    passwords.txt: A list of common passwords for testing against authentication mechanisms.

Examples
Using Custom Nmap Scripts

Navigate to the "nmap-scripts" subfolder to find a collection of custom Nmap scripts. To use these scripts during a penetration test, follow these steps:

    Open a terminal window.
    Navigate to the Kaboom installation directory: cd /path/to/kaboom/enum/nmap-scripts
    Run Nmap with a custom script: nmap -p 80 --script custom-service-detection.nse target_ip

The custom Nmap script will perform service detection on port 80 of the target IP and provide insights into the detected service.
Wordlist Utilization

The "wordlists" subfolder contains wordlists that can be valuable for password testing, content discovery, and more. For instance, you can use the "common.txt" wordlist with tools like Hydra for performing dictionary attacks on web applications:

css

hydra -l admin -P /path/to/kaboom/enum/wordlists/common.txt target_ip http-post-form "/login.php:user=^USER^&pass=^PASS^:Login failed"

This command uses the "common.txt" wordlist to test for common passwords in an HTTP login form.
Contributing

We encourage the community to contribute additional custom Nmap scripts and wordlists that can enhance the effectiveness of the Kaboom tool. Refer to the Contributing Guidelines for more information on how to contribute.
License

The resources in the "enum" folder are subject to the same GNU General Public License that applies to the entire Kaboom pentest tool.

Feel free to customize this example to match the contents and purpose of the "enum" folder within your project. Providing clear explanations of the resources and their intended usage will help users make the most of your tool's capabilities.
