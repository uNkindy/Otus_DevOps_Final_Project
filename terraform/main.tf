resource "yandex_compute_instance" "gitlab" {
  name = "gitlab"

#  count = var.count_vms

  resources {
    cores  = 4
    memory = 12
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.image_size
    }
  }

  # scheduling_policy {
  #   preemptible = true
  # }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
}