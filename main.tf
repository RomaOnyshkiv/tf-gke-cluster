terraform {
  backend "gcs" {
    bucket = "doki-bucket"
    prefix = "terraform/state"
  }
}

provider "google" {

  project = var.GOOGLE_PROJECT
  region  = var.GOOGLE_REGION

}
module "gke_cluster" {
  source         = "github.com/RomaOnyshkiv/tf-google-gke-cluster"
  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = var.GKE_NUM_NODES
}


module "github_repository" {
  source                   = "github.com/RomaOnyshkiv/tf-github-repository"
  github_owner             = var.GITHUB_OWNER
  github_token             = var.GITHUB_TOKEN
  repository_name          = var.FLUX_GITHUB_REPO
  public_key_openssh       = module.tls_private_key.public_key_openssh
  public_key_openssh_title = "flux0"
}

module "flux_bootstrap" {
  source            = "github.com/RomaOnyshkiv/tf-fluxcd-flux-bootstrap"
  github_repository = "${var.GITHUB_OWNER}/${var.FLUX_GITHUB_REPO}"
  private_key       = module.tls_private_key.private_key_pem
  github_token      = var.GITHUB_TOKEN
}

module "tls_private_key" {
  source    = "github.com/RomaOnyshkiv/tf-hashicorp-tls-keys"
  algorithm = "RSA"
}

module "kind_cluster" {
  source = "github.com/den-vasyliev/tf-kind-cluster"
}
