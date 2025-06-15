# GitLab CE + GitLab Runner + Terraform CI/CD on AWS

Deploy resources using Terraform through Gitlab CI 

## Overview

This project demonstrates how to:
- Install **GitLab CE** on a VM
- Set up **GitLab Runner**
- Automate **Automate infrastructure provisioning using Terraform**
- Use **GitLab CI/CD** pipelines to manage infrastructure

---

## 1. Install GitLab CE (Community Edition)

### Prerequisites
- Ubuntu 20.04+ VM
- sudo access
- Open port 80 & 443

### Installation Steps

```bash
# Add GitLab package repo
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

# Update the repo

sudo apt-get update -y
sudo apt-get install debian-archive-keyring 

# Install GitLab CE
sudo EXTERNAL_URL="http://<your_server_ip>/valid_domain_name" apt-get install gitlab-ce

# Validate the status

sudo gitlab-ctl status

```

> Get the temporary password from `cat /etc/gitlab/initial_root_password` and Access GitLab via`http://<your_server_ip>`

---

## 2. Install GitLab Runner

### On the same or another VM:

```bash
# Add GitLab Runner repo
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash

# Install GitLab Runner
sudo apt-get install gitlab-runner

# Register GitLab Runner
sudo gitlab-runner register

#Validate the status

sudo gitlab-runner status 
```

### During registration:
- **URL**: `http://<your_gitlab_ip>`
- **Token**: From GitLab → Settings → CI/CD → Runners
- **Executor**: `shell` or `docker`
- **Description/Tags**: `dev-runner` # You can provide any value

---

## 3. Install Terraform

Install terraform by using this `https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli`

## 4. Setup AWS Credentials as GitLab CI/CD Variables

Go to:
`GitLab Project → Settings → CI/CD → Variables`

Add AWS secret keys for terraform to authenticate.

`AWS_ACCESS_KEY_ID` & `AWS_SECRET_ACCESS_KEY` 

In this case credentials not needed to pass in .gitlab-ci yml.

---

###  Explanation
This folder structure stores all Terraform modules in the terraform_modules directory, which can be referenced from other folders (different environments or projects).

- Reusable Terraform modules
- Separate environment configs for dev & prod
- GitLab Runners decoupled for both environment and stored secrets in CI/CD variables.
- Manual `apply` stage  to approve the changes to prevent accidental changes

- terraform_modules -  Contains the Terraform modules.

- dev -  It deploy dev resources with its own Terraform state file.
- prod - It deploy Prod environment resources with its own Terraform state file

