# Summary
This repository was created for reproduce https://github.com/helm/helm/issues/7957 issue.

## How to use

 1. checkout
 2. `pip install yq`
 3. `./ports.sh`

## Script output
ports
release "ports" uninstalled
Release "ports" does not exist. Installing it now.
NAME: ports
LAST DEPLOYED: Tue Apr 21 11:17:07 2020
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
## Test: 00_values_3_ports.yaml
### VALUES
```
ports:
- name: http
  containerPort: 80
  protocol: TCP
- name: grpc-look-aside
  containerPort: 8080
  hostPort: 34567
  protocol: TCP
- name: grpc-service
  containerPort: 8080
  protocol: TCP
```
### EXPECTED
```
[
  {
    "containerPort": 80,
    "name": "http",
    "protocol": "TCP"
  },
  {
    "containerPort": 8080,
    "hostPort": 34567,
    "name": "grpc-look-aside",
    "protocol": "TCP"
  },
  {
    "containerPort": 8080,
    "name": "grpc-service",
    "protocol": "TCP"
  }
]
```
### ACTUAL
```
[
  {
    "containerPort": 80,
    "name": "http",
    "protocol": "TCP"
  },
  {
    "containerPort": 8080,
    "hostPort": 34567,
    "name": "grpc-look-aside",
    "protocol": "TCP"
  },
  {
    "containerPort": 8080,
    "name": "grpc-service",
    "protocol": "TCP"
  }
]
```

Release "ports" has been upgraded. Happy Helming!
NAME: ports
LAST DEPLOYED: Tue Apr 21 11:17:13 2020
NAMESPACE: default
STATUS: deployed
REVISION: 2
TEST SUITE: None
## Test: 10_values_2_ports.yaml
### VALUES
```
ports:
- name: http
  containerPort: 80
  protocol: TCP
- name: grpc-service
  containerPort: 8080
  protocol: TCP
```
### EXPECTED
```
[
  {
    "containerPort": 80,
    "name": "http",
    "protocol": "TCP"
  },
  {
    "containerPort": 8080,
    "name": "grpc-service",
    "protocol": "TCP"
  }
]
```
### ACTUAL
```
[
  {
    "containerPort": 80,
    "name": "http",
    "protocol": "TCP"
  }
]
```

