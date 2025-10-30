# 🚀 Terraform CI/CD Pipeline with AWS S3 Remote Backend

### 🧩 Overview
This repository demonstrates an automated Infrastructure as Code (IaC) setup using **Terraform** with **AWS** and **GitHub Actions CI/CD**.  
It provisions and manages AWS resources with a secure **S3 remote backend** for state management and **DynamoDB** for state locking.

---

### ⚙️ Features

✅ Automated Terraform `init`, `plan`, and `apply` using GitHub Actions  
✅ AWS S3 bucket for remote backend (encrypted + versioned)  
✅ DynamoDB table for state locking (prevent conflicts)  
✅ Manual trigger for safe `terraform destroy`  
✅ Secure secret management via GitHub Actions Secrets  
✅ Reusable and production-ready pipeline

---

### 🧰 Tools & Technologies

- **Terraform v1.13.4**
- **AWS (S3, DynamoDB)**
- **GitHub Actions**
- **IaC (Infrastructure as Code)**

---

### 🏗️ Workflow Explanation

#### 1️⃣ Deploy Workflow (`.github/workflows/terraform-deploy.yml`)
- Runs automatically on every `push`.
- Executes Terraform `init`, `plan`, and `apply`.
- Stores state securely in an S3 bucket with DynamoDB lock.

#### 2️⃣ Destroy Workflow (`.github/workflows/terraform-destroy.yml`)
- Triggered **manually** from GitHub Actions → “Run workflow”.
- Executes `terraform destroy -auto-approve`.

---

### 🔐 Environment Variables (Stored in GitHub Secrets)
| Secret Name | Description |
|--------------|-------------|
| `AWS_ACCESS_KEY_ID` | AWS IAM User Access Key |
| `AWS_SECRET_ACCESS_KEY` | AWS IAM User Secret Key |
| `AWS_DEFAULT_REGION` | AWS region (e.g. us-east-1) |

---

---

### 🌐 AWS Infrastructure Created

| Resource | Description | Example |
|-----------|--------------|---------|
| 🏠 **VPC** | Custom Virtual Private Cloud | CIDR: `10.0.0.0/16` |
| 🌐 **Subnet** | Public subnet in the VPC | CIDR: `10.0.1.0/24` |
| 🔒 **Security Group** | Allows SSH (22) and HTTP (80) access | Default ingress rules |
| 💻 **EC2 Instance** | Launches an Ubuntu/Amazon Linux instance | With key pair and SG |
| 💾 **S3 Bucket** | Stores Terraform remote state | Versioned + Encrypted |
| 📊 **DynamoDB Table** | Manages state locking | Prevents concurrent updates |

---

### 📤 Terraform Outputs Example

| Output | Description |
|---------|-------------|
| `vpc_id` | ID of created VPC |
| `subnet_id` | ID of created subnet |
| `security_group_id` | ID of created security group |
| `instance_public_ip` | Public IP of the EC2 instance |

---

### 🧠 Deployment Flow (Visual)

flowchart TD
    A[Push Code to GitHub] --> B[GitHub Actions Triggered]
    B --> C[Terraform Init & Plan]
    C --> D[Terraform Apply]
    D --> E[AWS Infrastructure Created]
    E --> F[S3 Stores State]
    F --> G[DynamoDB Locks State]
    G --> H[Manual Destroy Trigger (Optional)]
