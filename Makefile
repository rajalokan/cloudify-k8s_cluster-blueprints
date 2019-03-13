
bootstrap:
	cfy install openstack.yaml \
		-b k8s_cluster \
		-i server_name=k8s \
		-i resource_count=3

uninstall:
	cfy uninstall k8s_cluster -p ignore_failure=true

output:
	cfy deployment outputs k8s_cluster

cancel_install:
	cfy exec cancel `cfy exec li -d k8s_cluster | grep "started " | cut -d'|' -f2`
