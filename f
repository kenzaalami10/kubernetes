kubectl get pods -n kube-system -l k8s-app=kube-dns
kubectl logs -n kube-system <nom-du-pod-coredns>

Modifier le déploiement de CoreDNS

sh

kubectl edit deployment coredns -n kube-system

Redémarrer les pods CoreDNS

sh

kubectl delete pod -n kube-system -l k8s-app=kube-dns

Vérifier et configurer Flannel

sh

kubectl get daemonset kube-flannel-ds -n kube-flannel -o yaml
kubectl edit daemonset kube-flannel-ds -n kube-flannel

Redéployer Flannel si nécessaire

sh

kubectl apply -f kube-flannel.yaml
