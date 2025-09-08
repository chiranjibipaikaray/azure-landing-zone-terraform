# Azure Landing Zone Terraform

Terraform code to deploy a modular Azure Landing Zone including networking, compute, storage, and security components. Supports multiple environments: **dev**, **stage**, and **prod**.

---

## Architecture

+-------------------+
| Resource Group |
| +---------------+ |
| | Virtual Network| |
| | + Subnets | |
| +---------------+ |
| +---------------+ |
| | NSG / Security| |
| +---------------+ |
| +---------------+ |
| | VMs / Storage | |
| +---------------+ |
+-------------------+

yaml
Copy code

---

## Folder Structure

azure-landing-zone-terraform/
├── modules/ # Reusable modules (VNet, VM, Storage, Security)
├── environments/ # Separate dev, stage, prod configurations
├── .github/ # CI/CD workflows
├── README.md
└── .gitignore

yaml
Copy code

---

## Prerequisites

- Terraform >= 1.5.0
- Azure CLI
- Git

---

## Usage

### Dev Environment
```bash
cd environments/dev
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
Stage Environment
bash
Copy code
cd environments/stage
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
Prod Environment
bash
Copy code
cd environments/prod
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
Modules Overview
azurerm_vnet - Creates virtual network and subnets

azurerm_subnet - Creates individual subnets

azurerm_vm - Deploys virtual machines

azurerm_storage - Storage accounts

azurerm_keyvault - KeyVault and secrets

azurerm_lb - Load balancers

azurerm_public_ip - Public IPs

azurerm_bastion - Bastion host

azurerm_rg - Resource groups

Notes
Each environment has its own provider, variables, and tfvars files (Option 2: Full isolation)

CI/CD is configured via GitHub Actions in .github/workflows/terraform-ci.yml

Do not commit secrets in tfvars files

Follow the folder structure to maintain modularity and reusability

yaml
Copy code

---

Ye file **ready-to-use**, professional aur recruiter-friendly hai.  

Tum bas apne repo me `README.md` replace ya paste kar do.