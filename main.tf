terraform {
  backend "gcs" {
    bucket = "doki-bucket"
    prefix = "terraform/state"
  }
}

module "github_repository" {
  source              = "github.com/RomaOnyshkiv/tf-gke-cluster"
  github_owner        = var.GITHUB_OWNER
  github_token        = var.GITHUB_TOKEN
}
module "gke_cluster" {
  source         = "github.com/RomaOnyshkiv/tf-google-gke-cluster"
  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = var.GKE_NUM_NODES
}