terraform {
  required_version = "~> 1.5"

  cloud {
    organization = "nacl30d"

    workspaces {
      name = "nacl30d_com"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4"
    }
  }
}

provider "cloudflare" {}

data "cloudflare_accounts" "default" {
  name = "nacl30d"
}
