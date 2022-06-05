variable "project_name" {
  type    = string
  default = "azrsnsgtl"
}

variable "default_location" {
  type    = string
  default = "West Europe"
}

variable "hub_vnet_iprange" {
  type    = string
  default = "10.1.0.0/23"
}

variable "hub_subnet1_iprange" {
  type    = string
  default = "10.1.1.0/27"
}

variable "gateway_subnet_iprange" {
  type    = string
  default = "10.1.0.0/27"
}
variable "services_vnet_iprange" {
  type    = string
  default = "10.1.2.0/23"
}

variable "services_subnet1_iprange" {
  type    = string
  default = "10.1.2.0/24"
}

variable "services_subnet2_iprange" {
  type    = string
  default = "10.1.3.0/24"
}

variable "resource_vnet1_iprange" {
  type    = string
  default = "10.1.4.0/23"
}

variable "resource_subnet1_iprange" {
  type    = string
  default = "10.1.4.0/26"

}