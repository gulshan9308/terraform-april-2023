```hcl
module "install_Gitlab" {
  source  = "gulshan9308/vpc/module"
  version = "0.0.1"
  region = "us-east-2"
  cidr_vpc = "10.0.0.0/16"
  cidr_group3_public1 = "10.0.1.0/24"
  cidr_group3_public2 = "10.0.2.0/24"
  cidr_group3_public3 = "10.0.3.0/24"
  cidr_group3_private1 = "10.0.101.0/24"
  cidr_group3_private2 = "10.0.102.0/24"
  cidr_group3_private3 = "10.0.103.0/24"
  key_name = "ohio-key"
  instance_type = "t2.large"
}
```