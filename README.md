# DaaC: Detection-Engineering as a Code
This repository is used to conceptualize the automation of detection engieering, such that manual decoder and rule entries to SIEM tools are eliminated.

## Configuration
Perform the following configuration steps after cloning the repository.

- #### **SIEM**
Follow the below steps to prepare your SIEM host:
1. [Install the Wazuh SIEM on a host](https://documentation.wazuh.com/current/installation-guide/index.html).
   
2. Make sure that the host has a public IP address.

3. Generate a public key for SSH login.
  
4. Enable SSH service and define the port for SSH login.

- #### **GITHUB**
Follow the below steps on GitHub to prepare GitHub Actions CI for the DaaC repository:
1. Navigate to **Settings** > **Secrets and variables** > **Actions** to create the following repository secrets:

|**Name**             |**Secret**                                        |
|---------------------|--------------------------------------------------|
| USERNAME            | <USERNAME_OF_SIEM_HOST>                          |
| SERVER              | <PUBLIC_IP_OF_SIEM_HOST>                         |
| SSH_KEY             | <PUBLIC_KEY_OF_SIEM_HOST>                        |
| PORT                | <SSH_PORT_OF+SIEM_HOST>                          |

## Usage
This guides the use of the repository to create new or modify existing rulesets for automated integration with the SIEM.

- ### Creating or Modifying Custom Decoders
Create new or modify existing custom decoders in the **ruleset** > **decoders** directory of the DaaC repository.

- ### Creating or Modifying Custom Rules
Create new or modify existing custom rules in the **ruleset** > **rules** directory of the DaaC repository.
