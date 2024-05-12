##### Authentification

variable "cloud_id" {
  description = "Cloud ID"
}

variable "folder_id" {
  description = "Folder ID"
}

variable "service_account_key_file" {
  description = "Service File"
}

variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}

##### Yandex Compute Instance Parameters

# variable "count_vms" {
#   description = "Count of VMs"
# }

variable "image_id" {
  description = "Image ID"
}

variable "image_size" {
  description = "Image size"
}

variable "subnet_id" {
  description = "Subnet ID"
}

variable "public_key_path" {
  description = "Public SSH key"
}

variable "private_key_path" {
  description = "Private SSH key"
}