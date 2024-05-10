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
  source         = "https://github.com/RomaOnyshkiv/tf-gke-cluster"
  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = var.GKE_NUM_NODES
}