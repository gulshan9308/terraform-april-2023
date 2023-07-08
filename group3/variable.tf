variable region {
    type = string
    default = "us-east-2"
}
variable cidr_vpc {
    type = string
    default = "10.0.0.0/16"
}
variable cidr_public1 {
    type = string
    default = "10.0.1.0/24"
}
variable cidr_public2 {
    type = string
    default = "10.0.2.0/24"
}
variable cidr_public3 {
    type = string
    default = "10.0.3.0/24"
}
variable cidr_private1 {
    type = string
    default = "10.0.101.0/24"
}
variable cidr_private2 {
    type = string
    default = "10.0.102.0/24"
}
variable cidr_private3 {
    type = string
    default = "10.0.103.0/24"
}
variable instance_type {
    type = string
    default = "t2.medium"
}
variable key_pair {
    type = string
    default = "ohio-key"
}