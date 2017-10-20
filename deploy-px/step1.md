In this step, you will install Portworx on 3 seperate hosts and configure a 3 node Portworx cluster.

## Install etcd

Portworx relies on an external key value database (KVDB) like `etcd` or `consul` to store it's cluster discovery and bootstrap information.

>**Note:**<br/>In a production environment, please deploy a multi node etcd cluster following these instructions: https://coreos.com/etcd 

`NODE1=$(hostname -I | awk '{print $1}') \
   docker run \
   -p 2379:2379 \
   --volume=/var/lib/etcd:/etcd-data \
   --name etcd quay.io/coreos/etcd:latest \
   /usr/local/bin/etcd \
   --data-dir=/etcd-data --name node1 \
   --initial-advertise-peer-urls http://${NODE1}:2380 \
   --listen-peer-urls http://${NODE1}:2380 \
   --advertise-client-urls http://${NODE1}:2379 \
   --listen-client-urls http://${NODE1}:2379 \
   --initial-cluster node1=http://${NODE1}:2380`{{execute}}


### Note the IP address of this host

`echo $NODE1`{{execute}}

