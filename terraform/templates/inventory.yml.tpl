---
all:
  vars:
    master_host: ${gitlab}

  hosts:
    gitlab:
        ansible_host: ${gitlab}
