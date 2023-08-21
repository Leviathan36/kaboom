import nmap
import subprocess
import xml.etree.ElementTree as ET

def run_nmap_scan(target_ip, output_file):
    nm = nmap.PortScanner()
    nm.scan(target_ip, arguments='-sV -oX ' + output_file)

def parse_nmap_output(nmap_xml_file):
    vulnerabilities = []

    tree = ET.parse(nmap_xml_file)
    root = tree.getroot()

    for host in root.findall('host'):
        for port in host.findall('ports/port'):
            service_name = port.find('service').get('name')
            product = port.find('service').get('product')
            version = port.find('service').get('version')

            if 'vulnerable_service' in service_name.lower():
                vulnerabilities.append({
                    'product': product,
                    'version': version
                })

    return vulnerabilities

def generate_metasploit_file(vulnerabilities, output_file):
    with open(output_file, 'w') as f:
        for vuln in vulnerabilities:
            f.write(f'use {vuln["product"]}\n')
            f.write(f'set RHOSTS <target_ip>\n')
