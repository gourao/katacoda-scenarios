In this step, you will install Portworx on 3 seperate hosts and configure a 3 node Portworx cluster.

## Install the OCI bundle

Portworx runs as an OCI runC container.  You can install the bundle by running the following **command**

`sudo docker run --entrypoint \
   /runc-entry-point.sh \
   --rm -i --privileged=true \
   -v /opt/pwx:/opt/pwx \
   -v /etc/pwx:/etc/pwx \
   portworx/px-enterprise:1.2.11-rc8`{{execute}}
