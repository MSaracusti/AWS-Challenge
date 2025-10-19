# AWS
# AWS Technical Challenge – Terraform Solution

## 📘 Overview

This repository contains a Terraform-based solution for the AWS Technical Challenge. The goal is to provision a secure and scalable AWS environment that hosts a basic web server, implements proper network segmentation, and includes lifecycle-managed S3 buckets.

---

## 🚀 Deployment Instructions

### Prerequisites
- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- Access to an AWS account

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/MSaracusti/AWS.git
   cd AWS

🧱 Architecture & Design Decisions

VPC Design: 1 VPC with 4 subnets across 2 AZs, segmented into public and private.
Security: Security groups restrict access based on role and subnet.
Scalability: ASG spans private subnets with min/max instance limits.
Storage: S3 buckets with lifecycle policies for cost optimization.
Modularity: Terraform modules used for each major component.


📂 Assumptions

Public subnets are used for internet-facing resources.
Private subnets are used for backend services.
IAM roles are scoped to least privilege.
Lifecycle policies are applied using S3 bucket rules.

📈 Improvement Plan

Priority	Improvement			        Notes
High		Add HTTPS support	        Currently only HTTP is configured
Medium		Add CloudWatch monitoring	For EC2 and ALB
Low		    Parameterize more variables	For flexibility across environments

🔍 Operational Gaps

No centralized logging or monitoring configured.
No CI/CD pipeline for Terraform deployment.
No automated testing of infrastructure.


📸 Evidence of Deployment
Include:

Screenshots of AWS Console
Terraform apply logs
CLI output

🗺️ Solution Diagram
!Solution Diagram

📚 References

Coalfire Terraform Modules
Terraform AWS Provider Docs
AWS Architecture Icons


🧠 Design Commentary
Challenges faced and how they were addressed:

Subnet routing and NAT configuration
IAM policy scoping
Lifecycle rule syntax for S3