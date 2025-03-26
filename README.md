# Cisco Switch Configuration Script

## Description
This script automates the configuration of a Cisco switch, allowing users to set up various network settings, VLANs, port security, QoS, and more.

## Prerequisites
- PowerShell version 5.1 or higher
- Cisco switch model compatible with the commands used in the script

## Usage
To run the script, execute it in a PowerShell environment. You will need to provide specific configuration details as outlined in the script.

## Configuration Options
- **Switch Hostname**: The name assigned to the switch (e.g., `Switch1`).
- **Management IP**: The IP address for the management interface (e.g., `192.168.1.10`).
- **Subnet Mask**: The subnet mask for the management interface (e.g., `255.255.255.0`).
- **Default Gateway**: The gateway for the management network (e.g., `192.168.1.1`).
- **VLANs**: List of VLAN IDs and names to be created.
- **Trunk Ports**: Ports that will carry multiple VLANs.
- **Access Ports**: Ports that will belong to a specific VLAN.
- **QoS Settings**: Traffic prioritization and policy maps.

## Example Configuration
Here’s an example of what you might provide:
- **Hostname**: `Switch1`
- **Management IP**: `192.168.1.10`
- **Subnet Mask**: `255.255.255.0`
- **Default Gateway**: `192.168.1.1`
- **VLANs**:
  - VLAN 10: `Sales`
  - VLAN 20: `Engineering`
  - VLAN 30: `IT`
- **Trunk Ports**: `GigabitEthernet0/1`
- **Access Ports**:
  - `GigabitEthernet0/2 - VLAN 10`
  - `GigabitEthernet0/3 - VLAN 20`

## License
This script is licensed under the MIT License.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any suggestions or improvements.
