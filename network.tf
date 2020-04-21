module "lnd_vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 2.3"

  project_id   = var.gcp_project
  network_name = var.landing_zone_vpc
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name               = "$lookup(var.lnd_subnet_names, var.regions[0])"
      subnet_ip                 = "${var.lnd_pirs[0]}"
      subnet_region             = "${var.gcp_regions[0]}"
      subnet_flow_logs          = "true"
      subnet_flow_logs_interval = "INTERVAL_5_MIN"
      subnet_flow_logs_sampling = 0.5
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      description               = "European landing zone subnet"
    },
    {
      subnet_name               = "$lookup(var.lnd_subnet_names, var.regions[1])"
      subnet_ip                 = "${var.lnd_pirs[1]}"
      subnet_region             = "${var.gcp_regions[1]}"
      subnet_flow_logs          = "true"
      subnet_flow_logs_interval = "INTERVAL_5_MIN"
      subnet_flow_logs_sampling = 0.5
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      description               = "US landing zone subnet"
    },
    {
      subnet_name               = "$lookup(var.lnd_subnet_names, var.regions[2])"
      subnet_ip                 = "${var.lnd_pirs[2]}"
      subnet_region             = "${var.gcp_regions[2]}"
      subnet_flow_logs          = "true"
      subnet_flow_logs_interval = "INTERVAL_5_MIN"
      subnet_flow_logs_sampling = 0.5
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      description               = "Asia landing zone subnet"
    }
  ]
}

module "dev_vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 2.3"

  project_id   = var.gcp_project
  network_name = var.development_vpc
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name               = "$lookup(var.dev_subnet_names, var.regions[0])"
      subnet_ip                 = "${var.dev_pirs[0]}"
      subnet_region             = "${var.gcp_regions[0]}"
      subnet_flow_logs          = "true"
      subnet_flow_logs_interval = "INTERVAL_5_MIN"
      subnet_flow_logs_sampling = 0.5
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      description               = "European subnet"
    },
    {
      subnet_name               = "$lookup(var.dev_subnet_names, var.regions[1])"
      subnet_ip                 = "${var.dev_pirs[1]}"
      subnet_region             = "${var.gcp_regions[1]}"
      subnet_flow_logs          = "true"
      subnet_flow_logs_interval = "INTERVAL_5_MIN"
      subnet_flow_logs_sampling = 0.5
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      description               = "US dev subnet"
    },
    {
      subnet_name               = "$lookup(var.dev_subnet_names, var.regions[2])"
      subnet_ip                 = "${var.dev_pirs[2]}"
      subnet_region             = "${var.gcp_regions[2]}"
      subnet_flow_logs          = "true"
      subnet_flow_logs_interval = "INTERVAL_5_MIN"
      subnet_flow_logs_sampling = 0.5
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      description               = "Asia dev subnet"
    }
  ]
}
