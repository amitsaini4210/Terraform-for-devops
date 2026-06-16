# 🚀 AWS Infrastructure as Code with Terraform

![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge\&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge\&logo=amazonaws)
![EC2](https://img.shields.io/badge/EC2-Compute-FF9900?style=for-the-badge\&logo=amazonec2)
![S3](https://img.shields.io/badge/S3-Storage-569A31?style=for-the-badge\&logo=amazons3)
![DynamoDB](https://img.shields.io/badge/DynamoDB-StateLocking-4053D6?style=for-the-badge\&logo=amazondynamodb)

---

## 📖 Overview

This project provisions AWS infrastructure using **Terraform** and follows Infrastructure as Code (IaC) best practices.

The infrastructure includes:

* ✅ AWS EC2 Instance Deployment
* ✅ Amazon S3 Bucket for Remote State Storage
* ✅ DynamoDB Table for State Locking
* ✅ SSH Key Authentication
* ✅ Variables Management
* ✅ Outputs Configuration
* ✅ Remote Backend Support

---

## 🏗️ Architecture

```text
                   ┌──────────────────┐
                   │   Terraform CLI  │
                   └─────────┬────────┘
                             │
                             ▼
                ┌─────────────────────────┐
                │     AWS Provider        │
                └─────────┬───────────────┘
                          │
        ┌─────────────────┼─────────────────┐
        │                 │                 │
        ▼                 ▼                 ▼

 ┌────────────┐   ┌──────────────┐   ┌─────────────┐
 │ EC2 Server │   │ S3 Backend   │   │ DynamoDB    │
 │ (Compute)  │   │ State File   │   │ State Lock  │
 └────────────┘   └──────────────┘   └─────────────┘
```

---

## 📂 Project Structure

```text
terraform-aws-project/
│
├── ec2.tf
├── s3.tf
├── dynamoDB.tf
├── providers.tf
├── terraform.tf
├── variable.tf
├── outputs.tf
├── terra-key-ec2.pub
│
└── README.md
```

---

## 📄 File Description

| File Name          | Description                                 |
| ------------------ | ------------------------------------------- |
| `providers.tf`     | AWS Provider configuration                  |
| `terraform.tf`     | Terraform version and backend configuration |
| `ec2.tf`           | Creates AWS EC2 instance                    |
| `s3.tf`            | Creates Amazon S3 bucket for remote state   |
| `dynamoDB.tf`      | Creates DynamoDB table for state locking    |
| `variable.tf`      | Defines reusable variables                  |
| `outputs.tf`       | Displays infrastructure outputs             |
| `terra-key-ec2.pub` | SSH public key for EC2 access               |

---

## ⚙️ Prerequisites

Before deploying, ensure the following are installed:

* Terraform >= 1.x
* AWS CLI
* AWS Account
* IAM User with required permissions
* SSH Key Pair

Verify installations:

```bash
terraform -version
aws --version
```

---

## 🔑 Configure AWS Credentials

Configure AWS CLI:

```bash
aws configure
```

Provide:

```text
AWS Access Key ID
AWS Secret Access Key
Default Region
Output Format
```

Verify credentials:

```bash
aws sts get-caller-identity
```

---

## 🚀 Deployment Steps

### 1️⃣ Clone Repository

```bash
git clone https://github.com/yourusername/terraform-aws-project.git

cd terraform-aws-project
```

---

### 2️⃣ Initialize Terraform

```bash
terraform init
```

---

### 3️⃣ Validate Configuration

```bash
terraform validate
```

---

### 4️⃣ Review Execution Plan

```bash
terraform plan
```

---

### 5️⃣ Apply Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

when prompted.

---

## 📤 Outputs

After successful deployment Terraform displays:

```text
EC2 Instance ID
EC2 Public IP
EC2 Public DNS
S3 Bucket Name
DynamoDB Table Name
```

View outputs anytime:

```bash
terraform output
```

---

## 🔐 Connect to EC2 Instance

Use SSH:

```bash
ssh -i terra-key-ec2.pem ec2-user@<PUBLIC-IP>
```

Example:

```bash
ssh -i terra-key-ec2.pem ec2-user@54.xx.xx.xx
```

---

## 🌍 Remote State Management

### Amazon S3

Stores:

```text
terraform.tfstate
```

Benefits:

* Centralized state storage
* Team collaboration
* Backup and recovery
* Secure infrastructure tracking

### DynamoDB

Provides:

```text
Terraform State Locking
```

Benefits:

* Prevents simultaneous execution
* Avoids state corruption
* Ensures consistency

---

## 🔄 Terraform Workflow

```text
terraform init
       │
       ▼
terraform validate
       │
       ▼
terraform plan
       │
       ▼
terraform apply
       │
       ▼
Infrastructure Created
       │
       ▼
terraform destroy
```

---

## 🛡️ Security Best Practices

* Never commit private `.pem` files.
* Use IAM Roles where possible.
* Restrict Security Group access.
* Enable S3 bucket versioning.
* Follow Least Privilege IAM policies.
* Store secrets in AWS Secrets Manager.

---

## 🧹 Destroy Infrastructure

To remove all resources:

```bash
terraform destroy
```

Confirm:

```text
yes
```

---

## 🎯 Features

* Infrastructure as Code (IaC)
* AWS EC2 Automation
* Remote State Storage
* State Locking Mechanism
* SSH Key Integration
* Reusable Variables
* Dynamic Outputs
* Production Ready Structure

---

## 🛠️ Technologies Used

| Technology   | Purpose                |
| ------------ | ---------------------- |
| Terraform    | Infrastructure as Code |
| AWS EC2      | Virtual Server         |
| AWS S3       | Remote State Storage   |
| AWS DynamoDB | State Locking          |
| AWS IAM      | Access Management      |
| AWS CLI      | AWS Management         |

---

## 🤝 Contributing

1. Fork the repository

2. Create a new branch

```bash
git checkout -b feature-name
```

3. Commit changes

```bash
git commit -m "Added new feature"
```

4. Push to GitHub

```bash
git push origin feature-name
```

5. Open a Pull Request

---

## 📜 License

This project is licensed under the MIT License.

---

## ⭐ Support

If this project helped you:

⭐ Star the Repository

🍴 Fork the Repository

📢 Share with the Community

---

### Made with ❤️ using Terraform & AWS
