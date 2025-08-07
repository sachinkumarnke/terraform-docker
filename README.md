# Terraform Docker Website

A simple Infrastructure as Code project that uses Terraform to build and deploy a Docker containerized website.

## Project Structure

```
terraform-docker/
├── mani.tf              # Main Terraform configuration
├── website/             # Website source files
│   ├── Dockerfile       # Docker image configuration
│   └── index.html       # Static website content
└── README.md           # This file
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [Docker](https://docs.docker.com/get-docker/) installed and running
- Docker provider for Terraform

## Quick Start

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Plan the deployment**
   ```bash
   terraform plan
   ```

3. **Deploy the infrastructure**
   ```bash
   terraform apply
   ```

4. **Access the website**
   Open your browser and navigate to: `http://localhost:8888`

## What This Does

- Builds a Docker image from the `website/` directory using nginx
- Creates and runs a Docker container named `terraform-website`
- Exposes the website on port 8888 (maps to container port 80)
- Serves a static HTML page with infrastructure-themed content

## Configuration Details

### Docker Image
- **Base**: nginx:latest
- **Content**: Static HTML files from `website/` directory
- **Port**: Exposes port 80 internally

### Docker Container
- **Name**: terraform-website
- **Port Mapping**: 8888 (host) → 80 (container)
- **Image**: Built from local Dockerfile

## Cleanup

To destroy the infrastructure and remove containers:

```bash
terraform destroy
```

## Customization

- Modify `website/index.html` to change the website content
- Update `website/Dockerfile` to customize the container configuration
- Edit `mani.tf` to change container settings or add more resources

## Troubleshooting

- Ensure Docker is running before executing Terraform commands
- Check if port 8888 is available on your system
- Verify Terraform and Docker provider versions are compatible