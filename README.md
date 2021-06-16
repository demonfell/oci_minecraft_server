# Create a Minecraft 1.17 Server in Oracle Cloud with Terraform

This project is based on Todd Sharp's tutorial [How To Set Up and Run a (Really Powerful) Free Minecraft Server in the Cloud](https://blogs.oracle.com/developers/how-to-set-up-and-run-a-really-powerful-free-minecraft-server-in-the-cloud/comment-submitted?cid=25c4a526-1684-47e2-baf4-db7e9a9f1b40). I generated [Terraform](https://recursive.codes/blog/post/1794) to create the VM and then used the [Remote Exec Provisioner](https://www.terraform.io/docs/language/resources/provisioners/remote-exec.html) to do a zero touch deployment of the Minecraft server.

## Server specs (Always-Free Tier Eligible)
- VM.Standard.A1.Flex (Ampere Arm-based processor)
- 2 OCPU and 6GB of RAM

## Installation
* Install [Terraform](https://terraform.io/) with a package manager or by downlading the binary. 
*  Follow the directions in [How To Set Up and Run a (Really Powerful) Free Minecraft Server in the Cloud](https://blogs.oracle.com/developers/) to set up your Oracle Cloud tenancy.
*  Generate [an API signing key.](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm#two)
* Generate (an ssh key pair)[https://www.oracle.com/webfolder/technetwork/tutorials/obe/cloud/compute-iaas/generating_ssh_key/generate_ssh_key.html]. You will populate your public key in the `TF_VAR_ssh_authorized_keys` variable.

## Usage
* You will need a `.tfvars` file with the the following values:
```
export TF_VAR_tenancy_ocid="ocid1.tenancy.oc1.."
export TF_VAR_compartment_ocid="ocid1.tenancy.oc1.."
export TF_VAR_user_ocid="ocid1.user.oc1..a"
export TF_VAR_fingerprint=""
export TF_VAR_private_key_path=""
export TF_VAR_private_key_password=""
export TF_VAR_ssh_authorized_keys=""
export TF_VAR_region="us-ashburn-1"
```
Source variables with `source .tfvars`
* Deploy
** `terraform init`
** `terraform plan`
** `terraform apply`

## Known issues
* Region in my example is Ashburn, and if you choose a different region, you will need to change `data "oci_identity_availability_domain"` in `main.tf`.
* Since server starts running at the end of deployment, you will need to press Control-C to exit the terraform apply and it will show failed.

# Contact
Author: James Pemantell<br>
Email: pbin2au@gmail.com<br>

