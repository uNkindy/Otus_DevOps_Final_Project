resource "local_file" "inventory" {
  content = templatefile("templates/inventory.yml.tpl",
    {
        gitlab =  yandex_compute_instance.gitlab.network_interface.0.nat_ip_address
    }
  )
  filename = "../ansible/inventory.yml"
}