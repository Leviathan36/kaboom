#!/bin/bash

# Set target IP address and output directory
target_ip="10.10.11.217"
output_dir="testscan"

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Nmap Scan (XML Output)
echo "Initiating Nmap scan on $target_ip..."
nmap -p- -sS -T4 -Pn -A -vv --version-all --script=default,auth,vuln -oX "$output_dir/nmap_scan.xml" "$target_ip"

# Gobuster Scan for HTTP and HTTPS
echo "Starting Gobuster scan on $target_ip (HTTP)..."
gobuster dir -u "http://$target_ip" -w /usr/share/wordlists/dirb/common.txt -x php,txt,html -t 50 -o "$output_dir/gobuster_http_scan.txt" -v -r

# Uncomment the following lines for HTTPS Gobuster scan
echo "Starting Gobuster scan on $target_ip (HTTPS)..."
gobuster dir -u "https://$target_ip" -w /usr/share/wordlists/dirb/common.txt -x php,txt,html -t 50 -o "$output_dir/gobuster_https_scan.txt" -v -k -r

# Sn1per Scan (Soft Stealthy Scan)
echo "Commencing Sn1per soft scan on $target_ip..."
sniper -t "$target_ip" -m all -o "$output_dir/sn1per_scan"

# [Fix this workflow!]

# Metasploit Scan (Example: HTTP Vulnerability Checks)
# Uncomment and configure the following lines for Metasploit scan
echo "Initiating Metasploit vulnerability scan on $target_ip..."
msfconsole -q -x "db_import $output_dir/nmap_scan.xml; vulns search type:exploit; vulns search type:auxiliary; exit"

# Print completion message
echo "Vulnerability Scan Completed. Results saved in $output_dir directory."

# Everything works except the msfconsole command. Further investigation needed for workflow setup.
