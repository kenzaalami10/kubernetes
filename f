[devops@DEVAD1M ~]$ kubectl get pods -n kube-system -l k8s-app=kube-dns
NAME                       READY   STATUS             RESTARTS         AGE
coredns-58767d876d-q2jlq   0/1     CrashLoopBackOff   10 (3m30s ago)   29m
coredns-58767d876d-qvv8h   0/1     CrashLoopBackOff   10 (3m9s ago)    29m
[devops@DEVAD1M ~]$ kubectl logs -n kube-system coredns-58767d876d-q2jlq
plugin/forward: no nameservers found
[devops@DEVAD1M ~]$ kubectl logs -n kube-system coredns-58767d876d-qvv8h
plugin/forward: no nameservers found
[devops@DEVAD1M ~]$ kubectl delete pod -n kube-system -l k8s-app=kube-dns
pod "coredns-58767d876d-q2jlq" deleted
pod "coredns-58767d876d-qvv8h" deleted
[devops@DEVAD1M ~]$ kubectl get daemonset kube-flannel-ds -n kube-flannel -o yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  annotations:
    deprecated.daemonset.template.generation: "1"
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"apps/v1","kind":"DaemonSet","metadata":{"annotations":{},"labels":{"app":"flannel","k8s-app":"flannel","tier":"node"},"name":"kube-flannel-ds","namespace":"kube-flannel"},"spec":{"selector":{"matchLabels":{"app":"flannel","k8s-app":"flannel"}},"template":{"metadata":{"labels":{"app":"flannel","k8s-app":"flannel","tier":"node"}},"spec":{"affinity":{"nodeAffinity":{"requiredDuringSchedulingIgnoredDuringExecution":{"nodeSelectorTerms":[{"matchExpressions":[{"key":"kubernetes.io/os","operator":"In","values":["linux"]}]}]}}},"containers":[{"args":["--ip-masq","--kube-subnet-mgr"],"command":["/opt/bin/flanneld"],"env":[{"name":"POD_NAME","valueFrom":{"fieldRef":{"fieldPath":"metadata.name"}}},{"name":"POD_NAMESPACE","valueFrom":{"fieldRef":{"fieldPath":"metadata.namespace"}}},{"name":"EVENT_QUEUE_DEPTH","value":"5000"}],"image":"10.173.181.26/flannel/flannel:v0.25.1","name":"kube-flannel","resources":{"requests":{"cpu":"100m","memory":"50Mi"}},"securityContext":{"capabilities":{"add":["NET_ADMIN","NET_RAW"]},"privileged":false},"volumeMounts":[{"mountPath":"/run/flannel","name":"run"},{"mountPath":"/etc/kube-flannel/","name":"flannel-cfg"},{"mountPath":"/run/xtables.lock","name":"xtables-lock"}]}],"hostNetwork":true,"initContainers":[{"args":["-f","/flannel","/opt/cni/bin/flannel"],"command":["cp"],"image":"10.173.181.26/flannel/flannel-cni-plugin:v1.4.0-flannel1","name":"install-cni-plugin","volumeMounts":[{"mountPath":"/opt/cni/bin","name":"cni-plugin"}]},{"args":["-f","/etc/kube-flannel/cni-conf.json","/etc/cni/net.d/10-flannel.conflist"],"command":["cp"],"image":"10.173.181.26/flannel/flannel:v0.25.1","name":"install-cni","volumeMounts":[{"mountPath":"/etc/cni/net.d","name":"cni"},{"mountPath":"/etc/kube-flannel/","name":"flannel-cfg"}]}],"priorityClassName":"system-node-critical","serviceAccountName":"flannel","tolerations":[{"effect":"NoSchedule","operator":"Exists"}],"volumes":[{"hostPath":{"path":"/run/flannel"},"name":"run"},{"hostPath":{"path":"/opt/cni/bin"},"name":"cni-plugin"},{"hostPath":{"path":"/etc/cni/net.d"},"name":"cni"},{"configMap":{"name":"kube-flannel-cfg"},"name":"flannel-cfg"},{"hostPath":{"path":"/run/xtables.lock","type":"FileOrCreate"},"name":"xtables-lock"}]}}}}
  creationTimestamp: "2024-06-12T08:02:40Z"
  generation: 1
  labels:
    app: flannel
    k8s-app: flannel
    tier: node
  name: kube-flannel-ds
  namespace: kube-flannel
  resourceVersion: "4454"
  uid: d12de439-9420-47aa-9af0-a4b6058202c9
spec:
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: flannel
      k8s-app: flannel
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: flannel
        k8s-app: flannel
        tier: node
    spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: kubernetes.io/os
                operator: In
                values:
                - linux
      containers:
      - args:
        - --ip-masq
        - --kube-subnet-mgr
        command:
        - /opt/bin/flanneld
        env:
        - name: POD_NAME
          valueFrom:
            fieldRef:
              apiVersion: v1
              fieldPath: metadata.name
        - name: POD_NAMESPACE
          valueFrom:
            fieldRef:
              apiVersion: v1
              fieldPath: metadata.namespace
        - name: EVENT_QUEUE_DEPTH
          value: "5000"
        image: 10.173.181.26/flannel/flannel:v0.25.1
        imagePullPolicy: IfNotPresent
        name: kube-flannel
        resources:
          requests:
            cpu: 100m
            memory: 50Mi
        securityContext:
          capabilities:
            add:
            - NET_ADMIN
            - NET_RAW
          privileged: false
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
        volumeMounts:
        - mountPath: /run/flannel
          name: run
        - mountPath: /etc/kube-flannel/
          name: flannel-cfg
        - mountPath: /run/xtables.lock
          name: xtables-lock
      dnsPolicy: ClusterFirst
      hostNetwork: true
      initContainers:
      - args:
        - -f
        - /flannel
        - /opt/cni/bin/flannel
        command:
        - cp
        image: 10.173.181.26/flannel/flannel-cni-plugin:v1.4.0-flannel1
        imagePullPolicy: IfNotPresent
        name: install-cni-plugin
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
        volumeMounts:
        - mountPath: /opt/cni/bin
          name: cni-plugin
      - args:
        - -f
        - /etc/kube-flannel/cni-conf.json
        - /etc/cni/net.d/10-flannel.conflist
        command:
        - cp
        image: 10.173.181.26/flannel/flannel:v0.25.1
        imagePullPolicy: IfNotPresent
        name: install-cni
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
        volumeMounts:
        - mountPath: /etc/cni/net.d
          name: cni
        - mountPath: /etc/kube-flannel/
          name: flannel-cfg
      priorityClassName: system-node-critical
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      serviceAccount: flannel
      serviceAccountName: flannel
      terminationGracePeriodSeconds: 30
      tolerations:
      - effect: NoSchedule
        operator: Exists
      volumes:
      - hostPath:
          path: /run/flannel
          type: ""
        name: run
      - hostPath:
          path: /opt/cni/bin
          type: ""
        name: cni-plugin
      - hostPath:
          path: /etc/cni/net.d
          type: ""
        name: cni
      - configMap:
          defaultMode: 420
          name: kube-flannel-cfg
        name: flannel-cfg
      - hostPath:
          path: /run/xtables.lock
          type: FileOrCreate
        name: xtables-lock
  updateStrategy:
    rollingUpdate:
      maxSurge: 0
      maxUnavailable: 1
    type: RollingUpdate
status:
  currentNumberScheduled: 0
  desiredNumberScheduled: 1
  numberMisscheduled: 0
  numberReady: 0
  numberUnavailable: 1
  observedGeneration: 1
[devops@DEVAD1M ~]$ kubectl apply -f kube-flannel.yaml
daemonset.apps/kube-flannel-ds unchanged
[devops@DEVAD1M ~]$ kubectl get pods
No resources found in default namespace.
[devops@DEVAD1M ~]$ kubectl get pods -n kube-system
NAME                              READY   STATUS             RESTARTS      AGE
coredns-58767d876d-h9jfq          0/1     CrashLoopBackOff   2 (11s ago)   32s
coredns-58767d876d-zrx8c          0/1     CrashLoopBackOff   2 (10s ago)   32s
etcd-devad1m                      1/1     Running            2             56m
kube-apiserver-devad1m            1/1     Running            2 (57m ago)   56m
kube-controller-manager-devad1m   1/1     Running            2             56m
kube-proxy-skl2m                  1/1     Running            0             56m
kube-scheduler-devad1m            1/1     Running            2             56m
[devops@DEVAD1M ~]$ kubectl get pods -n kube-flannel
No resources found in kube-flannel namespace.
[devops@DEVAD1M ~]$
