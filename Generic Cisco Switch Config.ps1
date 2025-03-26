#To create a script that sets up a **Cisco switch**, you will need to provide specific information about the **network configuration**, including **basic settings**, **security configurations**, **VLANs**, and **QoS settings**. Here’s a list of the information you’ll need to provide for a comprehensive **switch setup** script:

## **1. General Information:**
#- **Switch Hostname**: The name you want to assign to the switch (e.g., `Switch1`).
#- **Switch IP Address**: The IP address for the management interface (e.g., `192.168.1.10`).
#- **Subnet Mask**: The subnet mask for the management interface (e.g., `255.255.255.0`).
#- **Default Gateway**: The gateway for the management network (e.g., `192.168.1.1`).
#- **DNS Servers**: If you want the switch to resolve domain names, provide DNS server IPs.

#---

## **2. VLAN Configuration:**
#- **VLANs to be created**: List of VLAN IDs and names (e.g., `VLAN 10 - Sales`, `VLAN 20 - Engineering`, `VLAN 30 - IT`).
#- **VLAN interfaces (SVIs)**: IP addresses for each VLAN's **Switched Virtual Interface** (e.g., `VLAN 10 - 192.168.10.1/24`).
#- **Trunk Ports**: The ports that will carry multiple VLANs (e.g., `GigabitEthernet0/1`).
#- **Access Ports**: The ports that will belong to a specific VLAN (e.g., `GigabitEthernet0/2 - VLAN 10`).

#---

## **3. Port Security Settings:**
#- **Port Security**: Whether to enable port security to limit the number of devices per port.
#- **Maximum Number of MAC Addresses**: How many devices can connect to a port (e.g., `2` devices per port).
#- **Violation Actions**: What action to take if a security violation occurs (e.g., `Shutdown`, `Restrict`, `Protect`).

#---

## **4. Interface Configuration:**
#- **Port Descriptions**: Descriptive names for each port (e.g., `GigabitEthernet0/1 - Connection to Core Switch`).
#- **Port Speed and Duplex**: Settings for port speed and duplex (e.g., `Auto`, `1000Mbps Full`).
#- **Enable/Disable Ports**: Whether to bring up or shut down specific ports (e.g., `GigabitEthernet0/1` should be enabled, `GigabitEthernet0/2` should be disabled).

#---

## **5. QoS Settings:**
#- **Traffic Prioritization**: Which traffic types to prioritize (e.g., **Modbus, FINS, BACnet**).
#- **Traffic Classes**: Define DSCP values for different traffic (e.g., DSCP `46` for real-time traffic, DSCP `34` for medium priority).
#- **Policy Map**: Define bandwidth allocation and priority rules (e.g., give 50% bandwidth to industrial control protocols).
#- **Interfaces to Apply QoS**: Specify which interfaces should have QoS applied (e.g., `GigabitEthernet0/1`).

#---

## **6. Security Settings:**
#- **Password Configuration**: Set up **console**, **vty**, and **enable passwords**.
#- **SSH Access**: Whether to enable SSH for secure remote access (e.g., `ip domain-name` and `crypto` commands).
#- **Access Control Lists (ACLs)**: Whether to set up **ACLs** to restrict traffic (e.g., to allow only certain IP ranges).
#- **Banner Settings**: Optional message that appears on login (e.g., `Login Banner`).

#---

## **7. Management Configuration:**
#- **SNMP Configuration**: SNMP community strings and access control (e.g., `public`, `private`).
#- **Syslog Configuration**: Set up **syslog** servers for logging.
#- **NTP Configuration**: Time synchronization settings using **NTP servers**.

#---

## **8. Redundancy and High Availability:**
#- **Spanning Tree Protocol (STP)**: Whether to configure STP, and which type (e.g., `PVST+`, `RSTP`).
#- **EtherChannel**: If you need to configure aggregated links (e.g., between switches or to servers).
#- **HSRP/VRRP/GLBP**: For **redundant gateways** and **high availability**.

#---

## **9. DHCP and Routing:**
#- **DHCP Configuration**: If the switch will be acting as a DHCP server for VLANs.
#- **Routing Configuration**: If Layer 3 routing is enabled on the switch (e.g., to route between VLANs using **SVIs**).
#- **Static Routes**: Any static routing needed for **Layer 3 switches**.

#---

## **10. Backup and Restore:**
#- **TFTP/FTP Server for Backup**: Where to back up the configuration (e.g., **TFTP server**).
#- **Automated Configuration Backup**: Whether you want to automate the backup process using **scripts**.

#---

## **11. Logging and Monitoring:**
#- **Syslog Server IP**: IP of the syslog server for logging events.
#- **SNMP Monitoring**: If SNMP will be used for monitoring, include community strings and SNMP settings.

#---

## **Example Input:**
#Here’s an example of what you might provide:

#- **Hostname**: `Switch1`
#- **Management IP**: `192.168.1.10`
#- **Subnet Mask**: `255.255.255.0`
#- **Default Gateway**: `192.168.1.1`
#- **VLANs**:
#  - VLAN 10: `Sales`
#  - VLAN 20: `Engineering`
#  - VLAN 30: `IT`
#- **Trunk Ports**: `GigabitEthernet0/1`
#- **Access Ports**:
#  - `GigabitEthernet0/2 - VLAN 10`
#  - `GigabitEthernet0/3 - VLAN 20`
#- **QoS Policy**:
#  - **FINS and Modbus**: `High Priority (DSCP 46)`
#  - **BACnet**: `Medium Priority (DSCP 34)`
#- **Port Security**: `Enable, 2 MAC addresses per port`

#---

## **Script Structure:**
#Once you have all the necessary information, the script can be designed to automate the switch configuration. The script could include:
#- Setting the **hostname** and **management IP**.
#- Creating **VLANs** and assigning ports.
#- Setting up **QoS** based on traffic types.
#- Configuring **security** settings (e.g., passwords, SSH).
#- Applying **STP, EtherChannel, or other redundancy protocols**.

#---

# PowerShell Script to Generate Cisco Switch Configuration
# This script sets up a Cisco switch with the specified configurations.

# Define switch basic information
$hostname = "Switch1"
$managementIP = "192.168.1.10"
$subnetMask = "255.255.255.0"
$defaultGateway = "192.168.1.1"

# Define VLAN information
$vlanConfig = @(
    @{VLANID = 10; Name = "Sales"; IP = "192.168.10.1/24"},
    @{VLANID = 20; Name = "Engineering"; IP = "192.168.20.1/24"},
    @{VLANID = 30; Name = "IT"; IP = "192.168.30.1/24"}
)

# Define trunk and access ports
$trunkPorts = @("GigabitEthernet0/1")
$accessPorts = @(
    @{Port = "GigabitEthernet0/2"; VLAN = 10},
    @{Port = "GigabitEthernet0/3"; VLAN = 20},
    @{Port = "GigabitEthernet0/4"; VLAN = 30}
)

# Define QoS settings
$qosPolicyName = "ICS_QOS"
$qosClassFINSModbus = "INDUSTRIAL_CONTROL"
$qosClassBACnet = "BUILDING_AUTOMATION"
$dscpFINSModbus = "46" # DSCP value for FINS and Modbus traffic
$dscpBACnet = "34" # DSCP value for BACnet traffic


# Define security settings
$portSecurity = "2" # Max 2 devices per port
$securityViolationAction = "shutdown"

# Output Cisco CLI Commands
$cliCommands = @()

# Set Hostname and Management IP
$cliCommands += "Switch(config)# hostname $hostname"
$cliCommands += "Switch(config)# interface vlan 1"
$cliCommands += "Switch(config-if)# ip address $managementIP $subnetMask"
$cliCommands += "Switch(config-if)# no shutdown"
$cliCommands += "Switch(config-if)# exit"
$cliCommands += "Switch(config)# ip default-gateway $defaultGateway"

# Configure VLANs and IP addresses
foreach ($vlan in $vlanConfig) {
    $cliCommands += "Switch(config)# vlan $($vlan.VLANID)"
    $cliCommands += "Switch(config-vlan)# name $($vlan.Name)"
    $cliCommands += "Switch(config-vlan)# exit"
    $cliCommands += "Switch(config)# interface vlan $($vlan.VLANID)"
    $cliCommands += "Switch(config-if)# ip address $($vlan.IP)"
    $cliCommands += "Switch(config-if)# no shutdown"
    $cliCommands += "Switch(config-if)# exit"
}

# Configure Trunk Ports
foreach ($port in $trunkPorts) {
    $cliCommands += "Switch(config)# interface $port"
    $cliCommands += "Switch(config-if)# switchport mode trunk"
    $cliCommands += "Switch(config-if)# exit"
}

# Configure Access Ports
foreach ($port in $accessPorts) {
    $cliCommands += "Switch(config)# interface $($port.Port)"
    $cliCommands += "Switch(config-if)# switchport mode access"
    $cliCommands += "Switch(config-if)# switchport access vlan $($port.VLAN)"
    $cliCommands += "Switch(config-if)# exit"
}

# Configure QoS
$cliCommands += "Switch(config)# mls qos"
$cliCommands += "Switch(config)# class-map match-any $qosClassFINSModbus"
$cliCommands += "Switch(config-cmap)# match protocol fins"
$cliCommands += "Switch(config-cmap)# match protocol modbus-tcp"
$cliCommands += "Switch(config-cmap)# exit"
$cliCommands += "Switch(config)# class-map match-any $qosClassBACnet"
$cliCommands += "Switch(config-cmap)# match protocol bacnet"
$cliCommands += "Switch(config-cmap)# exit"
$cliCommands += "Switch(config)# policy-map $qosPolicyName"
$cliCommands += "Switch(config-pmap)# class $qosClassFINSModbus"
$cliCommands += "Switch(config-pmap-c)# priority $dscpFINSModbus  # Guarantees 50% bandwidth for FINS & Modbus"

$cliCommands += "Switch(config-pmap-c)# exit"
$cliCommands += "Switch(config-pmap)# class $qosClassBACnet"
$cliCommands += "Switch(config-pmap-c)# bandwidth percent $dscpBACnet  # Allocates 30% bandwidth for BACnet"

$cliCommands += "Switch(config-pmap-c)# exit"
$cliCommands += "Switch(config)# interface range GigabitEthernet0/1 - 4"
$cliCommands += "Switch(config-if-range)# service-policy input $qosPolicyName"
$cliCommands += "Switch(config-if-range)# exit"

# Configure Port Security
foreach ($port in $accessPorts) {
    $cliCommands += "Switch(config)# interface $($port.Port)"
    $cliCommands += "Switch(config-if)# switchport port-security"
    $cliCommands += "Switch(config-if)# switchport port-security maximum $portSecurity"
    $cliCommands += "Switch(config-if)# switchport port-security violation $securityViolationAction"
    $cliCommands += "Switch(config-if)# switchport port-security mac-address sticky"
    $cliCommands += "Switch(config-if)# exit"
}

# Output CLI Commands to the console
$cliCommands | ForEach-Object { Write-Host $_ }

# Optionally, save the configuration to a file
$cliCommands | Out-File -FilePath "C:\Switch_Config.txt"

Write-Host "Switch Configuration generated and saved to C:\Switch_Config.txt"
