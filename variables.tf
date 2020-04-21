#### Main section ####

variable "gcp_project" {
  description = "Your working project"
  type        = string
  default     = "root-patrol-273614"
}

variable "cred_file" {
  description = "Path to the json file with credentials"
  type        = string
  default     = "local/credentials.json"
}

variable "gcp_regions" {
  description = "List of the GCP regions"
  type        = list(string)
  default     = ["europe-west2", "us-west2", "asia-east2"]
}

variable "regions" {
  description = "Region identifiers to build variables"
  type        = list(string)
  default     = ["eu", "us", "asia"]
}

variable "gcp_zones_asia" {
  description = "Available zones for Asia-east2 region"
  type        = list(string)
  default     = ["asia-east2-a", "asia-east2-b", "asia-east2-c"]
}

variable "gcp_zones_europe" {
  description = "Available zones for Europe-west2 region"
  type        = list(string)
  default     = ["europe-west2-a", "europe-west2-b", "europe-west2-c"]
}

variable "gcp_zones_us" {
  description = "Available zones for us-west2 region"
  type        = list(string)
  default     = ["us-west2-a", "us-west2-b", "us-west2-c"]
}

variable "vm_types" {
  description = "VM types for different environments"
  type        = map
  default = {
    dev  = "g1-small"
    qa   = "n1-standard-1"
    prod = "n1-standard-4"
  }
}

variable "vm_images" {
  description = "Images for different VMs"
  type        = map
  default = {
    bastion  = "projects/centos-cloud/global/images/centos-8-v20200413"
    frontend = "projects/root-patrol-273614/global/images/dev-web-160420"
  }
}

#### General Network and Firewall rules variables ####

variable "landing_zone_vpc" {
  description = "Name of the VPC for a landing zone"
  type        = string
  default     = "lnd-vpc"
}

variable "development_vpc" {
  description = "Name of the VPC for dev environment"
  type        = string
  default     = "dev-vpc"
}

variable "qa_vpc" {
  description = "Name of the VPC for qa environment"
  type        = string
  default     = "qa-vpc"
}

variable "prod_vpc" {
  description = "Name of the VPC for prod environment"
  type        = string
  default     = "prod-vpc"
}


#### LND variables ####

variable "lnd_iprange" {
  description = "IP range for lnd VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "lnd_pirs" {
  description = "Primary IP ranges for landing zone vpc"
  type        = list(string)
  default     = ["10.1.10.0/24", "10.1.20.0/24", "10.1.30.0/24"]
}

variable "lnd_subnet_names" {
  description = "Names of the subnets in landing vpc"
  type        = map
  default = {
    eu   = "lnd_subnet_europe"
    us   = "lnd_subnet_us"
    asia = "lnd_subnet_asia"
  }
}


#### DEV VPC variables ####

variable "dev_iprange" {
  description = "IP range for dev VPC"
  type        = string
  default     = "10.2.0.0/16"
}

variable "dev_pirs" {
  description = "Primary IP ranges for dev vpc"
  type        = list(string)
  default     = ["10.2.10.0/24", "10.2.20.0/24", "10.2.30.0/24"]
}

variable "dev_subnet_names" {
  description = "Names of the subnets in dev vpc"
  type        = map
  default = {
    eu   = "dev_subnet_europe"
    us   = "dev_subnet_us"
    asia = "dev_subnet_asia"
  }
}
