Kaboom Pentest Tool - Sandbox Folder Documentation
Sandbox Folder Overview

The "sandbox" folder within the Kaboom pentest tool serves as a safe and isolated environment for conducting tests, experiments, and simulations without affecting the actual target systems. This folder contains various resources to set up a controlled testing environment.
Files and Resources
Dockerfiles

This subfolder contains Dockerfiles that define the setup and configuration of Docker containers for specific testing scenarios. Docker containers provide an isolated environment that replicates the target system's characteristics.

    web-app/Dockerfile: Dockerfile for setting up a web application environment.
    network-lab/Dockerfile: Dockerfile for creating a network lab with multiple interconnected systems.

Scripts

In this subfolder, you'll find scripts that facilitate the automated creation, management, and teardown of sandbox environments.

    setup-web-app.sh: Shell script to automatically set up a web application environment using Docker.
    setup-network-lab.sh: Shell script to create a network lab environment with interconnected Docker containers.

Examples
Setting Up a Web Application Sandbox

To create a sandbox environment for testing a web application, follow these steps:

    Open a terminal window.
    Navigate to the Kaboom installation directory: cd /path/to/kaboom/sandbox
    Run the setup script: ./scripts/setup-web-app.sh

The script will use the web-app/Dockerfile to create a Docker container with the web application environment. You can then access the web application within the container for testing purposes.
Creating a Network Lab

To set up a network lab environment for simulating network interactions, use the following steps:

    Open a terminal window.
    Navigate to the Kaboom installation directory: cd /path/to/kaboom/sandbox
    Run the setup script: ./scripts/setup-network-lab.sh

The script will create multiple Docker containers with different IP addresses and interconnected networks, allowing you to simulate network scenarios and test various network-based attacks and defenses.
Contributing

Community contributions that enhance the sandbox environment setup or provide additional scripts are welcome. Refer to the Contributing Guidelines for more details on how to contribute.
License

The resources in the "sandbox" folder are governed by the GNU General Public License applied to the entire Kaboom pentest tool.
