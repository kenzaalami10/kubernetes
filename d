
[devops@DEVAD1M ~]$ kubectl describe pods  kube-flannel-ds-spmwn -n kube-flannel
Name:                 kube-flannel-ds-spmwn
Namespace:            kube-flannel
Priority:             2000001000
Priority Class Name:  system-node-critical
Service Account:      flannel
Node:                 devad1m/10.173.144.180
Start Time:           Wed, 12 Jun 2024 12:18:02 +0100
Labels:               app=flannel
                      controller-revision-hash=6588f777c4
                      k8s-app=flannel
                      pod-template-generation=2
                      tier=node
Annotations:          kubectl.kubernetes.io/restartedAt: 2024-06-12T12:18:02+01:00
Status:               Running
IP:                   10.173.144.180
IPs:
  IP:           10.173.144.180
Controlled By:  DaemonSet/kube-flannel-ds
Init Containers:
  install-cni:
    Container ID:  cri-o://e5085ad2161e8dd5f9daeaa95d2a4bf2a41ee06e70f982968edef2644e3739ea
    Image:         10.173.181.26/flannel/flannel-cni-plugin:v1.4.0-flannel1
    Image ID:      10.173.181.26/flannel/flannel-cni-plugin@sha256:df20243bc02a79df2cc87f9b307d6fdafd009554875980bd9833f121ace10fe4
    Port:          <none>
    Host Port:     <none>
    Command:
      cp
    Args:
      -f
      /flannel
      /opt/cni/bin/flannel
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Wed, 12 Jun 2024 12:18:03 +0100
      Finished:     Wed, 12 Jun 2024 12:18:03 +0100
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /opt/cni/bin from cni-plugin (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-hsglw (ro)
  install-cni-config:
    Container ID:  cri-o://21c7bc8a1b692cd0d5c99c99f4368b56ced5e557805b1eaa0f65950355cde655
    Image:         10.173.181.26/flannel/flannel:v0.25.1
    Image ID:      10.173.181.26/flannel/flannel@sha256:23bee68d408a6834232d867156213511a45ca0c6a3fdc9b9f30e646e9469e999
    Port:          <none>
    Host Port:     <none>
    Command:
      cp
    Args:
      -f
      /etc/kube-flannel/cni-conf.json
      /etc/cni/net.d/10-flannel.conflist
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Wed, 12 Jun 2024 12:18:03 +0100
      Finished:     Wed, 12 Jun 2024 12:18:03 +0100
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /etc/cni/net.d from cni (rw)
      /etc/kube-flannel/ from flannel-cfg (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-hsglw (ro)
Containers:
  kube-flannel:
    Container ID:  cri-o://9e32ca303998d00cc12af571e8ca3b2e63c43a4264837790704cec6c49c11d36
    Image:         10.173.181.26/flannel/flannel:v0.25.1
    Image ID:      10.173.181.26/flannel/flannel@sha256:23bee68d408a6834232d867156213511a45ca0c6a3fdc9b9f30e646e9469e999
    Port:          <none>
    Host Port:     <none>
    Command:
      /opt/bin/flanneld
    Args:
      --ip-masq
      --kube-subnet-mgr
    State:          Waiting
      Reason:       CrashLoopBackOff
    Last State:     Terminated
      Reason:       Error
      Exit Code:    1
      Started:      Wed, 12 Jun 2024 12:18:43 +0100
      Finished:     Wed, 12 Jun 2024 12:18:43 +0100
    Ready:          False
    Restart Count:  3
    Requests:
      cpu:     100m
      memory:  50Mi
    Environment:
      POD_NAME:       kube-flannel-ds-spmwn (v1:metadata.name)
      POD_NAMESPACE:  kube-flannel (v1:metadata.namespace)
    Mounts:
      /etc/kube-flannel/ from flannel-cfg (rw)
      /run/flannel from run (rw)
      /run/xtables.lock from xtables-lock (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-hsglw (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True
  Initialized                 True
  Ready                       False
  ContainersReady             False
  PodScheduled                True
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
    Type:          HostPath (bare host directory volume)
    Path:          /run/xtables.lock
    HostPathType:  FileOrCreate
  kube-api-access-hsglw:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              <none>
Tolerations:                 :NoSchedule op=Exists
                             node.kubernetes.io/disk-pressure:NoSchedule op=Exists
                             node.kubernetes.io/memory-pressure:NoSchedule op=Exists
                             node.kubernetes.io/network-unavailable:NoSchedule op=Exists
                             node.kubernetes.io/not-ready:NoExecute op=Exists
                             node.kubernetes.io/pid-pressure:NoSchedule op=Exists
                             node.kubernetes.io/unreachable:NoExecute op=Exists
                             node.kubernetes.io/unschedulable:NoSchedule op=Exists
Events:
  Type     Reason     Age                From               Message
  ----     ------     ----               ----               -------
  Normal   Scheduled  57s                default-scheduler  Successfully assigned kube-flannel/kube-flannel-ds-spmwn to devad1m
  Normal   Pulled     56s                kubelet            Container image "10.173.181.26/flannel/flannel-cni-plugin:v1.4.0-flannel1" already present on machine
  Normal   Created    56s                kubelet            Created container install-cni
  Normal   Started    56s                kubelet            Started container install-cni
  Normal   Pulled     56s                kubelet            Container image "10.173.181.26/flannel/flannel:v0.25.1" already present on machine
  Normal   Created    56s                kubelet            Created container install-cni-config
  Normal   Started    56s                kubelet            Started container install-cni-config
  Normal   Pulled     16s (x4 over 55s)  kubelet            Container image "10.173.181.26/flannel/flannel:v0.25.1" already present on machine
  Normal   Created    16s (x4 over 55s)  kubelet            Created container kube-flannel
  Normal   Started    16s (x4 over 55s)  kubelet            Started container kube-flannel
  Warning  BackOff    0s (x5 over 53s)   kubelet            Back-off restarting failed container kube-flannel in pod kube-flannel-ds-spmwn_kube-flannel(c55eb337-9965-405c-9fa8-562f04266ae3)
[devops@DEVAD1M ~]$
