sudo docker exec -it 0d78cf63e9b1 cat /etc/gitlab/initial_root_password

sudo docker exec -it  /bin/bash
cat /etc/gitlab/initial_root_password

sudo docker run -d --name gitlab-runner --restart always -v /srv/gitlabrunner/config:/etc/gitlab-runner -v /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner:latest

sudo docker exec -it docker-runner gitlab-runner register \
 --url http://158.160.120.38/ \
 --non-interactive \
 --locked=false \
 --name DockerRunner \
 --executor shell \
 --docker-image alpine:latest \
 --registration-token GR1348941KLtCPA9vcAPHeEKdN-zz \
 --tag-list "linux,xenial,ubuntu,docker" \
 --run-untagged


 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTdeHy0cPddPZyfhd1ClMhxbjPYzH6UtK3f0vkm4fqpBUcw0iNPuvbg+wn5Uv/+p8+hJaOoiq4eJUplHEE/l+yt1TqiO4AP8JLFAr60RoIrrBdJSQESj5s8hL3XWdkP0MghkkYVTzdfgD6vb/Ji24SEeiqiqZVoqd6yFHm593tRV1fk1VQ1To9ZjtpjCfCZH4tnnpvfrQ980SVczYrjFQ+W2tc3Zu5U8fMTzV+f6Xh6r1b01pU+m3tobVXgznaCInOnDzej4iJ1IJ95tMoJ5QNTOXa9M81S5YVGTUHAOG/U0OgH+jaT3Q4QS/iyRI5VJ2gngRKp3RJaOSxBGcyLIdAG/1eOcx20KD4KG5RrrsHDbKueeqJmcD3jiLWB4qVSlBmcSrGzI2RyTNDSg4JEygVx32YPQtaC6o0u5eUOeB7XGT43qknm3PygwJwujGmK02/+dfWC+bhju0DxQxffhj7LmLKwTQp2zPlevEca76CwP/DsIi5Oij/BpqmpkwedKk= kita@server


 VzJGqFp2LYNfxctS9/b/zfzWOrNpNSB6PbRSrFzvLMA=