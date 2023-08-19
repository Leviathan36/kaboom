import subprocess
import sys
import os
import time
from termcolor import colored
from tabulate import tabulate
import pandas as pd
import matplotlib.pyplot as plt

# Ensure Python version compatibility
if sys.version_info.major < 3 or sys.version_info.minor < 9:
    print(colored('[!] Please install Python 3.9 or higher. Exiting.', 'yellow'))
    sys.exit(1)

# Define theHarvester command parameters
domain = "https://enginueeur.com"
filename = "custom_results"
sources = "bing,anubis,brave"
limit = "2000"
dns_server = "1.1.1.1"
takeover_check = True
screenshots_dir = "screenshots_dir"

# Construct theHarvester command
command = [
    "theHarvester",
    "-d", domain,
    "-f", filename,
    "-b", sources,
    "-l", limit,
    "-vv",
    "-e", dns_server,
    "-t" if takeover_check else "",
    "--virtual-host",
    "--screenshot", screenshots_dir,
    "-s"
]

# Print the script's objective
print(colored("Running theHarvester to gather open-source intelligence.", 'cyan'))

# Execute the theHarvester command
print(colored("Executing theHarvester command with the following options:", 'cyan'))
print("  " + " ".join(command))  # Display the command string

start_time = time.time()
subprocess.run(command)
end_time = time.time()

# Display completion message
print(colored("theHarvester script completed.", 'green'))

# Generate a report
execution_time = end_time - start_time
report_data = [
    ["Domain", domain],
    ["Output File", filename],
    ["Sources", sources],
    ["Limit", limit],
    ["DNS Server", dns_server],
    ["Takeover Check", "Enabled" if takeover_check else "Disabled"],
    ["Screenshots Dir", screenshots_dir],
]

report_table = tabulate(report_data, headers=["Parameter", "Value"], tablefmt="grid")
print(colored("\nReport:\n", 'cyan'))
print(report_table)

# Parse theHarvester output and extract source statistics
print(colored("\nParsing theHarvester output...\n", 'cyan'))

source_stats = {}
current_source = None

with open(filename + '.txt', 'r') as output_file:
    lines = output_file.readlines()

for line in lines:
    if line.startswith("[*] Searching"):
        current_source = line.split()[2][:-1]
    elif line.strip() == "":
        current_source = None
    elif current_source and line.startswith("[*]"):
        key, value = line[4:].strip().split(": ")
        source_stats.setdefault(current_source, {})[key] = value

# Generate a report
report_data = [
    ["Domain", domain],
    ["Output File", filename],
    ["Sources", sources],
    ["Limit", limit],
    ["DNS Server", dns_server],
    ["Takeover Check", "Enabled" if takeover_check else "Disabled"],
    ["Screenshots Dir", screenshots_dir],
]

report_table = tabulate(report_data, headers=["Parameter", "Value"], tablefmt="grid")
print(colored("\nReport:\n", 'cyan'))
print(report_table)

# Generate a bar graph depicting subdomains per source
plt.figure(figsize=(10, 6))
for source, stats in source_stats.items():
    plt.bar(source, int(stats.get("Hosts", 0)), color='skyblue')
plt.title('Number of Subdomains from Each Source')
plt.xlabel('Source')
plt.ylabel('Number of Subdomains')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()

# Save the graph as an image
graph_filename = 'subdomains_by_source.png'
plt.savefig(graph_filename)
print(colored(f"Bar graph saved as: {graph_filename}\n", 'green'))

# Display the graph
plt.show()
