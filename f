
[devops@DEVAD1M ~]$ kubectl get pods -n kube-system
NAME                              READY   STATUS             RESTARTS      AGE
coredns-58767d876d-h9jfq          0/1     CrashLoopBackOff   5 (83s ago)   4m12s
coredns-58767d876d-zrx8c          0/1     CrashLoopBackOff   5 (82s ago)   4m12s
etcd-devad1m                      1/1     Running            2             60m
kube-apiserver-devad1m            1/1     Running            2 (61m ago)   60m
kube-controller-manager-devad1m   1/1     Running            2             60m
kube-proxy-skl2m                  1/1     Running            0             60m
kube-scheduler-devad1m            1/1     Running            2             60m
[devops@DEVAD1M ~]$ kubectl describe pods coredns-58767d876d-h9jfq
Error from server (NotFound): pods "coredns-58767d876d-h9jfq" not found
[devops@DEVAD1M ~]$ kubectl describe pods -n coredns-58767d876d-h9jfq
No resources found in coredns-58767d876d-h9jfq namespace.
[devops@DEVAD1M ~]$ kubectl describe pods coredns-58767d876d-h9jfq -n kube-system
Name:                 coredns-58767d876d-h9jfq
Namespace:            kube-system
Priority:             2000000000
Priority Class Name:  system-cluster-critical
Service Account:      coredns
Node:                 devad1m/10.173.144.180
Start Time:           Wed, 12 Jun 2024 09:10:46 +0100
Labels:               k8s-app=kube-dns
                      pod-template-hash=58767d876d
Annotations:          <none>
Status:               Running
IP:                   10.85.0.8
IPs:
  IP:           10.85.0.8
Controlled By:  ReplicaSet/coredns-58767d876d
Containers:
  coredns:
    Container ID:  cri-o://13afcbf24af410216f7c911735487d7326b64de9276f1f334c78536e665c95fc
    Image:         10.173.181.26/coredns:v1.11.1
    Image ID:      10.173.181.26/coredns@sha256:54dcce8c8e5073d043ad8d4c4a74ecf4fba40134cc2185da7c697c97a1fa8943
    Ports:         53/UDP, 53/TCP, 9153/TCP
    Host Ports:    0/UDP, 0/TCP, 0/TCP
    Args:
      -conf
      /etc/coredns/Corefile
    State:          Waiting
      Reason:       CrashLoopBackOff
    Last State:     Terminated
      Reason:       Error
      Exit Code:    1
      Started:      Wed, 12 Jun 2024 09:13:35 +0100
      Finished:     Wed, 12 Jun 2024 09:13:35 +0100
    Ready:          False
    Restart Count:  5
    Limits:
      memory:  170Mi
    Requests:
      cpu:        100m
      memory:     70Mi
    Liveness:     http-get http://:8080/health delay=60s timeout=5s period=10s #success=1 #failure=5
    Readiness:    http-get http://:8181/ready delay=0s timeout=1s period=10s #success=1 #failure=3
    Environment:  <none>
    Mounts:
      /etc/coredns from config-volume (ro)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-tc9t2 (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True
  Initialized                 True
  Ready                       False
  ContainersReady             False
  PodScheduled                True
Volumes:
  config-volume:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      coredns
    Optional:  false
  kube-api-access-tc9t2:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              kubernetes.io/os=linux
Tolerations:                 CriticalAddonsOnly op=Exists
                             node-role.kubernetes.io/control-plane:NoSchedule
                             node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                    From               Message
  ----     ------     ----                   ----               -------
  Normal   Scheduled  4m57s                  default-scheduler  Successfully assigned kube-system/coredns-58767d876d-h9jfq to devad1m
  Warning  Unhealthy  4m57s                  kubelet            Readiness probe failed: Get "http://10.85.0.8:8181/ready": dial tcp 10.85.0.8:8181: connect: connection refused
  Warning  BackOff    3m42s (x9 over 4m55s)  kubelet            Back-off restarting failed container coredns in pod coredns-58767d876d-h9jfq_kube-system(2173c4d4-3f98-4568-baa4-670ecb9b8167)
  Normal   Pulled     3m30s (x5 over 4m57s)  kubelet            Container image "10.173.181.26/coredns:v1.11.1" already present on machine
  Normal   Created    3m30s (x5 over 4m57s)  kubelet            Created container coredns
  Normal   Started    3m30s (x5 over 4m57s)  kubelet            Started container coredns
[devops@DEVAD1M ~]$

















[devops@DEVAD1M ~]$ kubectl get configmap coredns -n kube-system
NAME      DATA   AGE
coredns   1      59m
[devops@DEVAD1M ~]$ kubectl get configmap coredns -n kube-system -o yaml
apiVersion: v1
data:
  Corefile: |
    .:53 {
        errors
        health {
           lameduck 5s
        }
        ready
        kubernetes cluster.local in-addr.arpa ip6.arpa {
           pods insecure
           fallthrough in-addr.arpa ip6.arpa
           ttl 30
        }
        prometheus :9153
        forward . /etc/resolv.conf {
           max_concurrent 1000
        }
        cache 30
        loop
        reload
        loadbalance
    }
kind: ConfigMap
metadata:
  creationTimestamp: "2024-06-12T07:14:38Z"
  name: coredns
  namespace: kube-system
  resourceVersion: "219"
  uid: d51c7a2e-f479-4a0c-982a-a0298c7a98a0
[devops@DEVAD1M ~]$ kubectl describe daemonset kube-flannel-ds -n kube-flannel
Name:           kube-flannel-ds
Selector:       app=flannel,k8s-app=flannel
Node-Selector:  <none>
Labels:         app=flannel
                k8s-app=flannel
                tier=node
Annotations:    deprecated.daemonset.template.generation: 1
Desired Number of Nodes Scheduled: 1
Current Number of Nodes Scheduled: 0
Number of Nodes Scheduled with Up-to-date Pods: 0
Number of Nodes Scheduled with Available Pods: 0
Number of Nodes Misscheduled: 0
Pods Status:  0 Running / 0 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:           app=flannel
                    k8s-app=flannel
                    tier=node
  Service Account:  flannel
  Init Containers:
   install-cni-plugin:
    Image:      10.173.181.26/flannel/flannel-cni-plugin:v1.4.0-flannel1
    Port:       <none>
    Host Port:  <none>
    Command:
      cp
    Args:
      -f
      /flannel
      /opt/cni/bin/flannel
    Environment:  <none>
    Mounts:
      /opt/cni/bin from cni-plugin (rw)
   install-cni:
    Image:      10.173.181.26/flannel/flannel:v0.25.1
    Port:       <none>
    Host Port:  <none>
    Command:
      cp
    Args:
      -f
      /etc/kube-flannel/cni-conf.json
      /etc/cni/net.d/10-flannel.conflist
    Environment:  <none>
    Mounts:
      /etc/cni/net.d from cni (rw)
      /etc/kube-flannel/ from flannel-cfg (rw)
  Containers:
   kube-flannel:
    Image:      10.173.181.26/flannel/flannel:v0.25.1
    Port:       <none>
    Host Port:  <none>
    Command:
      /opt/bin/flanneld
    Args:
      --ip-masq
      --kube-subnet-mgr
    Requests:
      cpu:     100m
      memory:  50Mi
    Environment:
      POD_NAME:            (v1:metadata.name)
      POD_NAMESPACE:       (v1:metadata.namespace)
      EVENT_QUEUE_DEPTH:  5000
    Mounts:
      /etc/kube-flannel/ from flannel-cfg (rw)
      /run/flannel from run (rw)
      /run/xtables.lock from xtables-lock (rw)
  Volumes:
   run:
    Type:          HostPath (bare host directory volume)
    Path:          /run/flannel
    HostPathType:
   cni-plugin:
    Type:          HostPath (bare host directory volume)
    Path:          /opt/cni/bin
    HostPathType:
   cni:
    Type:          HostPath (bare host directory volume)
    Path:          /etc/cni/net.d
    HostPathType:
   flannel-cfg:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      kube-flannel-cfg
    Optional:  false
   xtables-lock:
    Type:               HostPath (bare host directory volume)
    Path:               /run/xtables.lock
    HostPathType:       FileOrCreate
  Priority Class Name:  system-node-critical
Events:
  Type     Reason        Age                 From                  Message
  ----     ------        ----                ----                  -------
  Warning  FailedCreate  51s (x18 over 11m)  daemonset-controller  Error creating: pods "kube-flannel-ds-" is forbidden: error looking up service account kube-flannel/flannel: serviceaccount "flannel" not found
[devops@DEVAD1M ~]$ el
Pods Status:  0 Running / 0 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:           app=flannel
                    k8s-app=flannel
                    tier=node
  Service Account:  flannel
  Init Containers:
   install-cni-plugin:
    Image:      10.173.181.26/flannel/flannel-cni-plugin:v1.4.0-flannel1
    Port:       <none>
    Host Port:  <none>
    Command:
      cp
    Args:
      -f
      /flannel
      /opt/cni/bin/flannel
    Environment:  <none>
    Mounts:
      /opt/cni/bin from cni-plugin (rw)
   install-cni:
    Image:      10.173.181.26/flannel/flannel:v0.25.1
    Port:       <none>
    Host Port:  <none>
    Command:
      cp
    Args:
      -f
      /etc/kube-flannel/cni-conf.json
      /etc/cni/net.d/10-flannel.conflist
    Environment:  <none>
    Mounts:
      /etc/cni/net.d from cni (rw)
      /etc/kube-flannel/ from flannel-cfg (rw)
  Containers:
   kube-flannel:
    Image:      10.173.181.26/flannel/flannel:v0.25.1
    Port:       <none>
    Host Port:  <none>
    Command:
      /opt/bin/flanneld
    Args:
      --ip-masq
      --kube-subnet-mgr
    Requests:
      cpu:     100m
      memory:  50Mi
    Environment:
      POD_NAME:            (v1:metadata.name)
      POD_NAMESPACE:       (v1:metadata.namespace)
      EVENT_QUEUE_DEPTH:  5000
    Mounts:
      /etc/kube-flannel/ from flannel-cfg (rw)
      /run/flannel from run (rw)
      /run/xtables.lock from xtables-lock (rw)
  Volumes:
   run:
bash: el: commande inconnue...
    Type:          HostPath (bare host directory volume)
    Path:          /run/flannel
    HostPathType:
   cni-plugin:
    Type:          HostPath (bare host directory volume)
    Path:          /opt/cni/bin
    HostPathType:
   cni:
    Type:          HostPath (bare host directory volume)
    Path:          /etc/cni/net.d
    HostPathType:
   flannel-cfg:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      kube-flannel-cfg
    Optional:  false
   xtables-lock:
    Type:               HostPath (bare host directory volume)
    Path:               /run/xtables.lock
    HostPathType:       FileOrCreate
  Priority Class Name:  system-node-critical
Events:
  Type     Reason        Age                 From                  Message
  ----     ------        ----                ----                  -------
  Warning  FailedCreate  51s (x18 over 11m)  daemonset-controller  Error creating: pods "kube-flannel-ds-" is forbidden: error looking up service account kube-flannel/flannel: serviceaccount "flannel" not found
