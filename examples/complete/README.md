# Terraform VPC Module Usage

## 📌 Overview

This project uses a reusable Terraform module to create a VPC with public and private subnets.

It supports:

- Custom VPC configuration
- Multiple subnets
- Public and private subnet separation
- Internet access for public subnets

---

## 🚀 Usage

### `main.tf`

```hcl
module "vpc" {
  source = "./module/vpc"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "my-test-vpc"
  }

  subnet_config = {
    public_subnet-1 = {
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1a"
      public     = true
    }

    public_subnet-2 = {
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1a"
      public     = true
    }

    private_subnet = {
      cidr_block = "10.0.2.0/24"
      az         = "us-east-1b"
    }
  }
}
```

---

### `outputs.tf`

```hcl
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}
```

---

## 📤 Outputs

After running Terraform, you will get:

- **vpc_id** → ID of the created VPC
- **public_subnets** → List of public subnet IDs
- **private_subnets** → List of private subnet IDs

---

## 🧠 Notes

- Public subnets are created with internet access
- Internet Gateway and Route Table are automatically configured for public subnets
- Private subnets do not have direct internet access
- Make sure subnet CIDR blocks do not overlap

---

## ⚠️ Important

- Ensure unique CIDR blocks for each subnet
- Example issue: both public subnets use same CIDR → this will fail
- Update CIDR like:
  - `10.0.1.0/24`
  - `10.0.2.0/24`

---

## ▶️ How to Run

```bash
terraform init
terraform plan
terraform apply
```

---

## ✅ Summary

This setup helps you quickly provision a VPC with structured networking using a reusable Terraform module.
