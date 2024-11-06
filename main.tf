terraform {
  cloud {
    organization = "cmshome"
    workspaces {
      name = "tfclass"
    }
  }
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.3.0"
    }
  }
}

provider "local" {
  # Configuration options
}

variable "product" {
  type        = string
  description = "A HashiCorp product name"
  default     = "Terraform"
}

variable "user" {
  type        = string
  description = "username"
  default     = "root"
}

resource "local_file" "tf_file" {
  content  = "\n This is a CSX ${var.product} workshop, ${var.user} is in. \n\n"
  filename = "${path.module}/terraform.txt"
}

output "text" {
  value = local_file.tf_file.content
}
