
[devops@worker1 ~]$ kubectl get pods -A
NAMESPACE      NAME                              READY   STATUS             RESTARTS      AGE
kube-flannel   kube-flannel-ds-qq7gf             0/1     CrashLoopBackOff   2 (27s ago)   46s
kube-system    coredns-58767d876d-kl6zz          0/1     CrashLoopBackOff   5 (43s ago)   3m48s
kube-system    coredns-58767d876d-nx7w8          0/1     CrashLoopBackOff   5 (37s ago)   3m48s
kube-system    etcd-worker1                      1/1     Running            1             4m2s
kube-system    kube-apiserver-worker1            1/1     Running            1             4m2s
kube-system    kube-controller-manager-worker1   1/1     Running            1             4m2s
kube-system    kube-proxy-2t6rg                  1/1     Running            0             3m48s
kube-system    kube-scheduler-worker1            1/1     Running            1             4m2s
[devops@worker1 ~]$ clear
[devops@worker1 ~]$ kubectl get pods -A
NAMESPACE      NAME                              READY   STATUS             RESTARTS      AGE
kube-flannel   kube-flannel-ds-qq7gf             0/1     Error              3 (40s ago)   59s
kube-system    coredns-58767d876d-kl6zz          0/1     CrashLoopBackOff   5 (56s ago)   4m1s
kube-system    coredns-58767d876d-nx7w8          0/1     CrashLoopBackOff   5 (50s ago)   4m1s
kube-system    etcd-worker1                      1/1     Running            1             4m15s
kube-system    kube-apiserver-worker1            1/1     Running            1             4m15s
kube-system    kube-controller-manager-worker1   1/1     Running            1             4m15s
kube-system    kube-proxy-2t6rg                  1/1     Running            0             4m1s
kube-system    kube-scheduler-worker1            1/1     Running            1             4m15s
[devops@worker1 ~]$ kubectl describe pods  kube-flannel-ds-qq7gf -n kube-flannel
Name:                 kube-flannel-ds-qq7gf
Namespace:            kube-flannel
Priority:             2000001000
Priority Class Name:  system-node-critical
Service Account:      flannel
Node:                 worker1/10.173.144.181
Start Time:           Wed, 12 Jun 2024 14:40:13 +0100
Labels:               app=flannel
                      controller-revision-hash=f5bb4fb6f
                      k8s-app=flannel
                      pod-template-generation=1
                      tier=node
Annotations:          <none>
Status:               Running
IP:                   10.173.144.181
IPs:
  IP:           10.173.144.181
Controlled By:  DaemonSet/kube-flannel-ds
Init Containers:
  install-cni-plugin:
    Container ID:  cri-o://ef455a458699c04cfd59f61125294091162b0846c2da86eb052d0968efcc1ab6
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
      Started:      Wed, 12 Jun 2024 14:40:14 +0100
      Finished:     Wed, 12 Jun 2024 14:40:14 +0100
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /opt/cni/bin from cni-plugin (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-v7bmm (ro)
  install-cni:
    Container ID:  cri-o://3a5b5b5fbe020df07712185572e43f4aa90bf401dbf882e073346cb6fd54851c
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
      Started:      Wed, 12 Jun 2024 14:40:16 +0100
      Finished:     Wed, 12 Jun 2024 14:40:16 +0100
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /etc/cni/net.d from cni (rw)
      /etc/kube-flannel/ from flannel-cfg (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-v7bmm (ro)
Containers:
  kube-flannel:
    Container ID:  cri-o://158fe6129620a1355f6d0ce24d0ada59f58430ca23858cb0aba813fe468b4bd1
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
      Started:      Wed, 12 Jun 2024 14:41:02 +0100
      Finished:     Wed, 12 Jun 2024 14:41:03 +0100
    Ready:          False
    Restart Count:  3
    Requests:
      cpu:     100m
      memory:  50Mi
    Environment:
      POD_NAME:           kube-flannel-ds-qq7gf (v1:metadata.name)
      POD_NAMESPACE:      kube-flannel (v1:metadata.namespace)
      EVENT_QUEUE_DEPTH:  5000
    Mounts:
      /etc/kube-flannel/ from flannel-cfg (rw)
      /run/flannel from run (rw)
      /run/xtables.lock from xtables-lock (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-v7bmm (ro)
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
  kube-api-access-v7bmm:
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
  Normal   Scheduled  75s                default-scheduler  Successfully assigned kube-flannel/kube-flannel-ds-qq7gf to worker1
  Normal   Pulling    74s                kubelet            Pulling image "10.173.181.26/flannel/flannel-cni-plugin:v1.4.0-flannel1"
  Normal   Pulled     74s                kubelet            Successfully pulled image "10.173.181.26/flannel/flannel-cni-plugin:v1.4.0-flannel1" in 472ms (473ms including waiting)
  Normal   Created    74s                kubelet            Created container install-cni-plugin
  Normal   Started    74s                kubelet            Started container install-cni-plugin
  Normal   Pulling    73s                kubelet            Pulling image "10.173.181.26/flannel/flannel:v0.25.1"
  Normal   Pulled     72s                kubelet            Successfully pulled image "10.173.181.26/flannel/flannel:v0.25.1" in 1.357s (1.357s including waiting)
  Normal   Created    72s                kubelet            Created container install-cni
  Normal   Started    72s                kubelet            Started container install-cni
  Normal   Pulled     26s (x4 over 71s)  kubelet            Container image "10.173.181.26/flannel/flannel:v0.25.1" already present on machine
  Normal   Created    26s (x4 over 71s)  kubelet            Created container kube-flannel
  Normal   Started    26s (x4 over 71s)  kubelet            Started container kube-flannel
  Warning  BackOff    12s (x5 over 67s)  kubelet            Back-off restarting failed container kube-flannel in pod kube-flannel-ds-qq7gf_kube-flannel(c16f4b48-8e2c-423a-9c5a-ae62ae07e4f9)
[devops@worker1 ~]$ ^C
[devops@worker1 ~]$ kubectl delete pod coredns-58767d876d-kl6zz -n kube-system
pod "coredns-58767d876d-kl6zz" deleted
[devops@worker1 ~]$ kubectl get pods -A
NAMESPACE      NAME                              READY   STATUS              RESTARTS        AGE
kube-flannel   kube-flannel-ds-qq7gf             0/1     CrashLoopBackOff    4 (64s ago)     2m36s
kube-system    coredns-58767d876d-5g4ns          0/1     ContainerCreating   0               3s
kube-system    coredns-58767d876d-nx7w8          0/1     CrashLoopBackOff    5 (2m27s ago)   5m38s
kube-system    etcd-worker1                      1/1     Running             1               5m52s
kube-system    kube-apiserver-worker1            1/1     Running             1               5m52s
kube-system    kube-controller-manager-worker1   1/1     Running             1               5m52s
kube-system    kube-proxy-2t6rg                  1/1     Running             0               5m38s
kube-system    kube-scheduler-worker1            1/1     Running             1               5m52s
[devops@worker1 ~]$ kubectl get pods -A
NAMESPACE      NAME                              READY   STATUS              RESTARTS        AGE
kube-flannel   kube-flannel-ds-qq7gf             0/1     CrashLoopBackOff    4 (66s ago)     2m38s
kube-system    coredns-58767d876d-5g4ns          0/1     ContainerCreating   0               5s
kube-system    coredns-58767d876d-nx7w8          0/1     CrashLoopBackOff    5 (2m29s ago)   5m40s
kube-system    etcd-worker1                      1/1     Running             1               5m54s
kube-system    kube-apiserver-worker1            1/1     Running             1               5m54s
kube-system    kube-controller-manager-worker1   1/1     Running             1               5m54s
kube-system    kube-proxy-2t6rg                  1/1     Running             0               5m40s
kube-system    kube-scheduler-worker1            1/1     Running             1               5m54s
[devops@worker1 ~]$ journalctl -u kubelet
Hint: You are currently not seeing messages from other users and the system.
      Users in the 'systemd-journal' group can see all messages. Pass -q to
      turn off this notice.
No journal files were opened due to insufficient permissions.
[devops@worker1 ~]$ sudo journalctl -u kubelet
-- Logs begin at Mon 2024-06-10 17:39:17 +01, end at Wed 2024-06-12 14:43:15 +01. --
juin 10 17:39:22 worker1 systemd[1]: Started kubelet: The Kubernetes Node Agent.
juin 10 17:39:22 worker1 kubelet[1980]: Flag --container-runtime-endpoint has been deprecated, This parameter should be set via the config file specified by the Kubelet's --config flag. See https://kuberne>
juin 10 17:39:22 worker1 kubelet[1980]: Flag --pod-infra-container-image has been deprecated, will be removed in a future release. Image garbage collector will get sandbox image information from CRI.
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.788327    1980 server.go:204] "--pod-infra-container-image will not be pruned by the image garbage collector in kubelet and should also be set in the >
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.801470    1980 server.go:487] "Kubelet version" kubeletVersion="v1.29.2"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.801501    1980 server.go:489] "Golang settings" GOGC="" GOMAXPROCS="" GOTRACEBACK=""
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.801744    1980 server.go:919] "Client rotation is on, will bootstrap in background"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.804784    1980 certificate_store.go:130] Loading cert/key pair from "/var/lib/kubelet/pki/kubelet-client-current.pem".
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.811592    1980 dynamic_cafile_content.go:157] "Starting controller" name="client-ca-bundle::/etc/kubernetes/pki/ca.crt"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.838423    1980 server.go:717] "Failed to get the kubelet's cgroup. Kubelet system container metrics may be missing." err="cpu and memory cgroup hierar>
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.843747    1980 server.go:745] "--cgroups-per-qos enabled, but --cgroup-root was not specified.  defaulting to /"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.844147    1980 container_manager_linux.go:265] "Container manager verified user specified cgroup-root exists" cgroupRoot=[]
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.844347    1980 container_manager_linux.go:270] "Creating Container Manager object based on Node Config" nodeConfig={"RuntimeCgroupsName":"","SystemCgr>
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.844379    1980 topology_manager.go:138] "Creating topology manager with none policy"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.844389    1980 container_manager_linux.go:301] "Creating device plugin manager"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.845079    1980 state_mem.go:36] "Initialized new in-memory state store"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.845214    1980 kubelet.go:396] "Attempting to sync node with API server"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.845237    1980 kubelet.go:301] "Adding static pod path" path="/etc/kubernetes/manifests"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.845267    1980 kubelet.go:312] "Adding apiserver pod source"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.845286    1980 apiserver.go:42] "Waiting for node sync before watching apiserver pods"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.848016    1980 kuberuntime_manager.go:258] "Container runtime initialized" containerRuntime="cri-o" version="1.29.2" apiVersion="v1"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.848864    1980 kubelet.go:809] "Not starting ClusterTrustBundle informer because we are in static kubelet mode"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.850495    1980 server.go:1256] "Started kubelet"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.850586    1980 server.go:162] "Starting to listen" address="0.0.0.0" port=10250
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.850819    1980 ratelimit.go:55] "Setting rate limiting for endpoint" service="podresources" qps=100 burstTokens=10
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.851062    1980 server.go:233] "Starting to serve the podresources API" endpoint="unix:/var/lib/kubelet/pod-resources/kubelet.sock"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.851891    1980 server.go:461] "Adding debug handlers to kubelet server"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.853324    1980 fs_resource_analyzer.go:67] "Starting FS ResourceAnalyzer"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.853539    1980 volume_manager.go:291] "Starting Kubelet Volume Manager"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.853649    1980 desired_state_of_world_populator.go:151] "Desired state populator starts to run"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.855261    1980 reconciler_new.go:29] "Reconciler: start to sync state"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.856623    1980 factory.go:221] Registration of the systemd container factory successfully
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.857083    1980 factory.go:221] Registration of the crio container factory successfully
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.857147    1980 factory.go:219] Registration of the containerd container factory failed: unable to create containerd client: containerd: cannot unix di>
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.905028    1980 cpu_manager.go:214] "Starting CPU manager" policy="none"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.905052    1980 cpu_manager.go:215] "Reconciling" reconcilePeriod="10s"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.905073    1980 state_mem.go:36] "Initialized new in-memory state store"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.905688    1980 state_mem.go:88] "Updated default CPUSet" cpuSet=""
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.905722    1980 state_mem.go:96] "Updated CPUSet assignments" assignments={}
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.905730    1980 policy_none.go:49] "None policy: Start"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.906242    1980 memory_manager.go:170] "Starting memorymanager" policy="None"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.906272    1980 state_mem.go:35] "Initializing new in-memory state store"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.906856    1980 state_mem.go:75] "Updated machine memory state"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.916930    1980 kubelet_network_linux.go:50] "Initialized iptables rules." protocol="IPv4"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.920846    1980 kubelet_network_linux.go:50] "Initialized iptables rules." protocol="IPv6"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.920892    1980 status_manager.go:217] "Starting to sync pod status with apiserver"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.920920    1980 kubelet.go:2329] "Starting kubelet main sync loop"
juin 10 17:39:22 worker1 kubelet[1980]: E0610 17:39:22.920969    1980 kubelet.go:2353] "Skipping pod synchronization" err="[container runtime status check may not have completed yet, PLEG is not healthy: p>
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.931479    1980 manager.go:479] "Failed to read data from checkpoint" checkpoint="kubelet_internal_checkpoint" err="checkpoint is not found"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.931751    1980 plugin_manager.go:118] "Starting Kubelet Plugin Manager"
juin 10 17:39:22 worker1 kubelet[1980]: E0610 17:39:22.932361    1980 container_manager_linux.go:514] "Failed to find cgroups of kubelet" err="cpu and memory cgroup hierarchy not unified.  cpu: /, memory: >
juin 10 17:39:22 worker1 kubelet[1980]: E0610 17:39:22.935125    1980 eviction_manager.go:282] "Eviction manager: failed to get summary stats" err="failed to get node info: node \"worker1\" not found"
juin 10 17:39:22 worker1 kubelet[1980]: I0610 17:39:22.955481    1980 kubelet_node_status.go:73] "Attempting to register node" node="worker1"
juin 10 17:39:25 worker1 kubelet[1980]: E0610 17:39:25.902673    1980 kubelet_node_status.go:96] "Unable to register node with API server" err="Post \"https://10.173.144.179:6443/api/v1/nodes\": dial tcp 1>
juin 10 17:39:25 worker1 kubelet[1980]: W0610 17:39:25.902774    1980 reflector.go:539] vendor/k8s.io/client-go/informers/factory.go:159: failed to list *v1.CSIDriver: Get "https://10.173.144.179:6443/apis>

[devops@worker1 ~]$
