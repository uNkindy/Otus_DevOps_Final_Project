### Final Progect for Otus Otus DevOps Courses
___

#### Данный репозиторий создан для автоматизации разворачивания инфрастурктуры в целях выполнения финального проекта по курсу DevOps

___

1. Описание стенда

Стенд состоит из следующих частей:
- YC облако с настроенным кластером Kubernetes
- ВМ, расположенная в YC

Стенд автоматизирует разворачивание ВМ в YC, устанавливает необходимое ПО для выполнения финального проекта

2. Требования для разворачивания стенда
- git
- task
- ansible
- terraform
- kubectl
- helm

3. Запуск деплоя стенда в YC
Запуск оптимизирован при помощи утилиты Task. Для деплоя приложения необходимо выполнить команду:

```console
git clone <repo>
cd <repo>
task deploy_gitlab
```
Описание доступных task команд:
```console
task
```

4. Процесс разворачивания стенда
- terraform создает ВМ в YC согласно настроенным tfvars
- terraform создает dynamic inventory файл для ansible
- запускается ansible playbook, который устанавливает: gitlab (omni, docker compose), gitlab-runner, helm, docker engine, инициализирует YC Kubernetes.
 
Для успешной инициализации YC необходимо поместить в папку ansible/playbooks/files кофигурационные файлы для YC и kubectl.

5. Доступ к интерфейсу gitlab 

На ВМ выполнить команду. Команда выведет временный пароль для доступа к gitlab

```console
sudo docker exec -it <gitlab_docker_image_hash> cat /etc/gitlab/initial_root_password
```

6. Установка Grafana Prometheus Loki Stack

Установка стека мониторинга производится при помощи helm. Необходимые манифесты для установки находятся в папке ./helm

```console
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
kubectl create namespace monitoring
helm install kube-prom-stack prometheus-community/kube-prometheus-stack -n monitoring -f helm/kube-prometheus-stack/values.yaml
kubectl apply -f helm/kube-prometheus-stack/ingress_grafana.yaml
kubectl apply -f helm/kube-prometheus-stack/prometheus_app_service_monitor.yaml
```

В файле ingress_grafana.yaml необходимо заменить IP адрес хоста на релевантный адрес kubernetes load balancer.

 helm upgrade --install --namespace monitoring logging grafana/loki -f helm/kube-prometheus-stack/values_minio.yaml --set loki.auth_enabled=false --set loki.useTestSchema=true