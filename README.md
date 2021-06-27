# Create a Minecraft 1.17 Server in Oracle Cloud with Terraform and Ansible

This project is based on Todd Sharp's tutorial [How To Set Up and Run a (Really Powerful) Free Minecraft Server in the Cloud](https://blogs.oracle.com/developers/how-to-set-up-and-run-a-really-powerful-free-minecraft-server-in-the-cloud/comment-submitted?cid=25c4a526-1684-47e2-baf4-db7e9a9f1b40). I generated [Terraform](https://recursive.codes/blog/post/1794) to create the VM and VCN and configured the [Remote Exec Provisioner](https://www.terraform.io/docs/language/resources/provisioners/remote-exec.html) to upload files and run an Ansible playbook to perform a zero-touch deployment of the Minecraft server.

## Server specs (Always-Free Tier Eligible)
- VM.Standard.A1.Flex (Ampere Arm-based processor)
- 2 OCPU and 6GB of RAM

## Installation
* Install [Terraform](https://terraform.io/) with a package manager or by downlading the binary. 
*  Follow the directions in [How To Set Up and Run a (Really Powerful) Free Minecraft Server in the Cloud](https://blogs.oracle.com/developers/) to set up your Oracle Cloud tenancy.
*  Generate [an API signing key.](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm#two)
* Generate [an ssh key pair](https://www.oracle.com/webfolder/technetwork/tutorials/obe/cloud/compute-iaas/generating_ssh_key/generate_ssh_key.html).  You will populate your public key in the `TF_VAR_ssh_authorized_keys` variable.

## Usage
* You will need a `.tfvars` file with the the following values:
```
export TF_VAR_tenancy_ocid="ocid1.tenancy.oc1.."
export TF_VAR_compartment_ocid="ocid1.tenancy.oc1.."
export TF_VAR_user_ocid="ocid1.user.oc1..a"
export TF_VAR_fingerprint=""
export TF_VAR_private_key_path=""
export TF_VAR_private_key_password=""
export TF_VAR_ssh_authorized_keys=`cat ~/.ssh/oci_key.pub`
export TF_VAR_region="us-ashburn-1"
export TF_VAR_ad"="ad1"
```
Source variables with `source .tfvars`
* Deploy
  * `terraform init`
  * `terraform plan`
  * `terraform apply`

* Connect to the console with tmux<br>
I implemented [minecraft-tmux-service](https://github.com/moonlight200/minecraft-tmux-service/) by [moonlight200](https://github.com/moonlight200) so that the server starts with a systemd unit on system boot and runs in a `tmux` session. You can connect to the console with: 
```
sudo su - minecraft /opt/minecraft/oci/service.sh attach
```

## Note
* The OCI regions us-phoenix-1, us-ashburn-1, eu-frankfurt-1, and uk-london-1 have 3 Availability Domains. Selection of availability domain in `oci_core_instance` -> `minecraft_server_test_vm` -> `availability_domain` will default to 0 for AD1 but if you need to override this setting in a multi-AD region, you can do so with the `ad` variable in your `.tfvars` file.

## License
Copyright (C) 2021 James Pemantell

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

## Contact
Author: James Pemantell<br>
Email: pbin2au@gmail.com<br>

