#!/bin/bash

# Set target IP address and output directory
target_ip="ATTACK-IP"
output_dir="testscan"

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Nmap Scan (XML Output)
 echo "Running Nmap scan on $target_ip..."
 nmap -p- -sS -T4 -Pn -A -vv --version-all --script=default,auth,vuln -oX "$output_dir/nmap_scan.xml" "$target_ip"

# Gobuster Scan for HTTP and HTTPS
 echo "Running Gobuster scan on $target_ip (HTTP)..."
 gobuster dir -u "http://$target_ip" -w /usr/share/wordlists/dirb/common.txt -x php,txt,html -t 50 -o "$output_dir/gobuster_http_scan.txt" -v -r

echo "Running Gobuster scan on $target_ip (HTTPS)..."
gobuster dir -u "https://$target_ip" -w /usr/share/wordlists/dirb/common.txt -x php,txt,html -t 50 -o "$output_dir/gobuster_https_scan.txt" -v -k -r

# DirBuster Scan for HTTP and HTTPS
echo "Running DirBuster scan on $target_ip (HTTP)..."
dirbuster -u "http://$target_ip" -l /usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt -X php,txt,html

cho "Running DirBuster scan on $target_ip (HTTPS)..."
dirbuster -u "https://$target_ip" -l /usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt -X php,txt,html

# Sn1per Scan (Soft Stealthy Scan)
echo "Running Sn1per soft scan on $target_ip..."
sniper -t "$target_ip" -m all

# Metasploit Scan (Example: HTTP Vuln Checks)
 echo "Running Metasploit vulnerability scan on $target_ip..."
 msfconsole -q -x "db_import $output_dir/nmap_scan.xml; vulns search type:exploit; vulns search type:auxiliary; exit"

# Print completion message
echo "Vulnerability Scan Complete. Results saved in $output_dir directory."

# Everything works besides the msfconsole cmd. Will need to look into and set up a workflow.
