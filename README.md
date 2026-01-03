# Mikrotik CHR – Network Support Engineer Task

## Candidate
Waqar Rawal

## What is this project?
This project shows how I installed and configured a Mikrotik CHR router, applied security rules, automated RADIUS configuration using Ansible, and deployed a Hotspot network.

## Tools Used
- VirtualBox  
- Mikrotik CHR  
- Winbox  
- Ansible (on Ubuntu using WSL)  
- GitHub  

## Work Performed

### 1. Mikrotik CHR Installation
Installed Mikrotik CHR on VirtualBox and verified access.

### 2. Firewall Rule
Configured a firewall rule to block traffic to IP **1.1.1.1** on **TCP port 443**.

### 3. RADIUS Automation
Installed Ansible on Ubuntu (WSL) and created an automated playbook to configure RADIUS with:
- Server: **35.227.71.209**
- Secret: **testing123**
- Service: **hotspot**

### 4. Verification
Verified RADIUS configuration in Winbox and captured screenshots.

### 5. Hotspot Configuration
Added a second interface, configured Hotspot service, and exported full router configuration.

## Challenges Faced
- Network issues in WSL
- SSH authentication setup
- RouterOS Hotspot configuration

## Result
A complete working network with firewall protection, automated RADIUS authentication, and operational Hotspot service.

