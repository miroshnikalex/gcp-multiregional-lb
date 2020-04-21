provider "google" {
  project     = var.gcp_project
  credentials = file(var.cred_file)
}

provider "google-beta" {
  project     = var.gcp_project
  credentials = file(var.cred_file)
}

terraform {
  backend "gcs" {
    credentials = "local/credentials.json"
    bucket      = "tf-state-bkt-204090"
    prefix      = "terraform/state/multiregional-lb"
  }
}
