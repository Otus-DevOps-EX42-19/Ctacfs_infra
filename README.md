# Ctacfs_infra
Ctacfs Infra repository

# Подключение через бастион
```shell
ssh -A -t 35.232.58.92 ssh 10.0.128.3
```

# Создание алиаса
```shell
echo -n "#connect to the someinternalhost\nalias connect='ssh -A -t 35.232.58.92 ssh 10.128.0.3'" >> ~/.bashrc
source ~/.bashrc
```

# Cloud Bastion

bastion_IP = 35.232.58.92

someinternalhost_IP = 10.128.0.3


