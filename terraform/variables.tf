variable "aws_provider" {
  type = object({
    region          = string
    assume_role_arn = string
  })

  default = {
    region          = "us-west-1"
    assume_role_arn = "arn:aws:iam::968225077300:role/devops-na-nuvem-week-terraform-role"
  }
}

variable "tags" {
  type = object({
    Environment = string
    Project     = string
  })

  default = {
    Environment = "production"
    Project     = "devops-na-nuvem-week"
  }
}

variable "vpc" {
  type = object({
    name                        = string
    cidr                        = string
    internet_gateway_name       = string
    nat_gateway_name            = string
    public_route_table_name     = string
    private_route_table_name    = string
    nat_gateway_elastic_ip_name = string
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = string
    }))
    private_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = string
    }))
  })

  default = {
    name                        = "devops-na-nuvem-week-vpc"
    cidr                        = "10.0.0.0/24"
    internet_gateway_name       = "devops-na-nuvem-week-vpc-internet-gateway"
    nat_gateway_name            = "devops-na-nuvem-week-vpc-nat-gateway"
    public_route_table_name     = "devops-na-nuvem-week-vpc-public-route-table"
    private_route_table_name    = "devops-na-nuvem-week-vpc-private-route-table"
    nat_gateway_elastic_ip_name = "devops-na-nuvem-week-vpc-nat-gateway-elastic-ip"
    public_subnets = [{
      name                    = "devops-na-nuvem-week-vpc-public-subnet-1a"
      cidr_block              = "10.0.0.0/26"
      availability_zone       = "us-west-1a"
      map_public_ip_on_launch = true
      },
      {
        name                    = "devops-na-nuvem-week-vpc-public-subnet-1c"
        cidr_block              = "10.0.0.64/26"
        availability_zone       = "us-west-1c"
        map_public_ip_on_launch = true
    }]
    private_subnets = [{
      name                    = "devops-na-nuvem-week-vpc-private-subnet-1a"
      cidr_block              = "10.0.0.128/26"
      availability_zone       = "us-west-1a"
      map_public_ip_on_launch = false
      },
      {
        name                    = "devops-na-nuvem-week-vpc-private-subnet-1c"
        cidr_block              = "10.0.0.192/26"
        availability_zone       = "us-west-1c"
        map_public_ip_on_launch = false
    }]
  }
}

variable "eks_cluster" {
  type = object({
    name                      = string
    enabled_cluster_log_types = list(string)
    role_name                 = string
    node_group = object({
      name           = string
      role_name      = string
      instance_types = list(string)
      capacity_type  = string
      scaling_config = object({
        desired_size = number
        max_size     = number
        min_size     = number
      })
    })
  })

  default = {
    name      = "devops-na-nuvem-week-eks-cluster"
    role_name = "devops-na-nuvem-week-eks-cluster-role"
    node_group = {
      name           = "devops-na-nuvem-week-eks-cluster-node-group"
      role_name      = "devops-na-nuvem-week-eks-cluster-node-group-role"
      instance_types = ["t3.small"]
      capacity_type  = "ON_DEMAND"
      scaling_config = {
        desired_size = 2
        max_size     = 2
        min_size     = 2
      }
    }
    enabled_cluster_log_types = [
      "api",
      "audit",
      "authenticator",
      "controllerManager",
      "scheduler",
    ]
  }
}

variable "ecr_repositories" {
  type = object({
    frontend = string
    backend  = string
  })

  default = {
    frontend = "devops-na-nuvem-week/production/frontend"
    backend  = "devops-na-nuvem-week/production/backend"
  }
}

variable "acm_certificate" {
  type = object({
    domain_name       = string
    validation_method = string
  })

  default = {
    domain_name       = "devopsnanuvemweek.com"
    validation_method = "DNS"
  }
}

variable "domain" {
  type    = string
  default = "devopsnanuvemweek.com"
}
