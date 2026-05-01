# Terraform VPC Module

## 📌 Overview

This Terraform module is used to create a basic AWS network setup.

It will:

- Create a VPC
- Create multiple subnets
- Support both **public** and **private** subnets
- Automatically configure internet access for public subnets

---

## 🚀 What This Module Does

### 1. VPC

- Creates a VPC using the given CIDR block

### 2. Subnets

- Creates multiple subnets inside the VPC
- Each subnet can be:
  - Public
  - Private

### 3. Public Subnet Setup

For public subnets, the module will:

- Create an Internet Gateway (IGW)
- Create a Route Table
- Add route: `0.0.0.0/0 → IGW`
- Associate route table with public subnets

### 4. Private Subnets

- Private subnets are created without internet access

---

## 📥 Inputs

| Name          | Description                    | Type        |
| ------------- | ------------------------------ | ----------- |
| vpc_config    | VPC configuration (CIDR, name) | object      |
| subnet_config | Subnet configurations          | map(object) |

---

## 📤 Outputs

| Name       | Description            |
| ---------- | ---------------------- |
| vpc_id     | ID of created VPC      |
| subnet_ids | IDs of created subnets |

---

## 🧪 Example Usage

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

## 🧠 Notes

- Public subnets get internet access via IGW
- Private subnets remain isolated
- Designed for simple and scalable network setup

---

## ✅ Summary

This module helps you quickly create a VPC with public and private subnets, along with required networking components.
