[devops@CAASPFEAD1M ~]$  kubectl get pods -A
NAMESPACE        NAME                                                     READY   STATUS    RESTARTS      AGE
gitops           argo-argocd-application-controller-0                     1/1     Running   1             46h
gitops           argo-argocd-applicationset-controller-85c7998fb7-zcqvr   1/1     Running   1             46h
gitops           argo-argocd-dex-server-5665d665cf-lk96g                  1/1     Running   1             46h
gitops           argo-argocd-notifications-controller-6bb6c87884-crh68    1/1     Running   1             46h
gitops           argo-argocd-redis-5f7b564cdd-df2x6                       1/1     Running   1             46h
gitops           argo-argocd-repo-server-58b6dcf65b-qb7nf                 1/1     Running   1             46h
gitops           argo-argocd-server-bcf7df76f-b2bwh                       1/1     Running   1             46h
kube-flannel     kube-flannel-ds-8djzn                                    1/1     Running   1             29d
kube-flannel     kube-flannel-ds-scl6g                                    1/1     Running   1             29d
kube-flannel     kube-flannel-ds-wqt6q                                    1/1     Running   2             28d
kube-system      coredns-76f75df574-7fbd6                                 1/1     Running   1             29d
kube-system      coredns-76f75df574-9xhgt                                 1/1     Running   1             29d
kube-system      csi-nfs-controller-754d97675f-d5q96                      4/4     Running   4             29d
kube-system      csi-nfs-node-54rg9                                       3/3     Running   6             28d
kube-system      csi-nfs-node-67rt8                                       3/3     Running   3             29d
kube-system      csi-nfs-node-xc946                                       3/3     Running   3             29d
kube-system      etcd-caaspfead1m                                         1/1     Running   6             29d
kube-system      kube-apiserver-caaspfead1m                               1/1     Running   6             29d
kube-system      kube-controller-manager-caaspfead1m                      1/1     Running   7             29d
kube-system      kube-proxy-6mp8b                                         1/1     Running   2             28d
kube-system      kube-proxy-fq4ns                                         1/1     Running   2             29d
kube-system      kube-proxy-ftk87                                         1/1     Running   1             29d
kube-system      kube-scheduler-caaspfead1m                               1/1     Running   7             29d
kube-system      snapshot-controller-7459bf48f4-rhwfj                     1/1     Running   1             29d
metallb-system   controller-756c6b677-7fn9g                               1/1     Running   1             29d
metallb-system   speaker-frlcf                                            1/1     Running   2 (45h ago)   29d
metallb-system   speaker-h6jdp                                            1/1     Running   4 (45h ago)   28d
metallb-system   speaker-hjprn                                            1/1     Running   2 (45h ago)   29d
test             adservice-75f484448-zhb8s                                1/1     Running   0             41h
test             cartservice-85f48d85f6-wjz5h                             1/1     Running   0             43h
test             checkoutservice-684f8fcb89-9kjt4                         1/1     Running   0             43h
test             currencyservice-d989f5975-c8z8c                          1/1     Running   0             43h
test             frontend-657884c9fb-4ffck                                1/1     Running   0             40h
test             paymentservice-6c8765d999-8qq8d                          1/1     Running   0             43h
test             productcatalogservice-65f567f79-qghcm                    1/1     Running   0             43h
test             recommendationservice-776b98c67c-rfc6h                   1/1     Running   0             43h
test             redis-cart-6445b468ff-dsn4m                              1/1     Running   0             43h
test             shippingservice-74d6479b95-sd657                         1/1     Running   0             43h
[devops@CAASPFEAD1M ~]$
