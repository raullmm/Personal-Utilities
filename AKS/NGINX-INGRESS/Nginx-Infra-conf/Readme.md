To set up a nginx that has been deployed by Helm. We need to make sure that is following this page:


Ingress Class Issues -->

To avoid this problem:

https://github.com/kubernetes/ingress-nginx/issues/10246

We need to follow this:

https://kubernetes.github.io/ingress-nginx/user-guide/k8s-122-migration/#how-can-i-easily-install-multiple-instances-of-the-ingress-nginx-controller-in-the-same-cluster
