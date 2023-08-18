#!/bin/bash

# Set target IP address and output directory
target_ip="ATTACK-IP"
output_dir="testscan"

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Nmap Scan (XML Output)
# You need to craft your own Nmap scan script and place here for basic recon
echo "Initiating Nmap scan on $target_ip..."
nmap -p- -sS -T4 -Pn -A -vv --version-all --script=default,auth,vuln -oX "$output_dir/nmap_scan.xml" "$target_ip"
msfconsole -q -x "db_import $output_dir/nmap_scan.xml; vulns search type:exploit; vulns search type:auxiliary; exit"

# Print completion message
echo "Vulnerability Scan Completed. Results saved in $output_dir directory."

# Everything works in this scritp
