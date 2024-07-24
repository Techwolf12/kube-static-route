# Kube-static-route

This was made to have Kubernetes always use a static external IP on DigitalOcean.  
Instructions can be found here: https://techwolf12.nl/blog/digitalocean-kubernetes-static-ipv4

 
Set SILENT env var to true to only log changes 

Disclaimer! This should no longer be used. When a Node's default route is changed, it is then unable to contact the Control plane and it's associated components. Instead, take a look at DigitalOcean's own (https://github.com/digitalocean/k8s-staticroute-operator)[static route operator] and only set routes for IP ranges you want to access like this.
