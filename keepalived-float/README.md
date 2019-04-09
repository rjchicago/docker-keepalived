# Keepalived-Float

**Keepalived-Float** is the "*float*" (a.k.a. keepalived itself and the floating IP) in the <a href="https://github.com/rjchicago/docker-keepalived">**Docker-Keepalived**</a> setup.

The float container is where Keepalived is actually running. It is created by the anchor containers running on each manager node, and it monitors the anchor process in order to decide current host status (this is *vrrp_script* in keepalived).

**NOTE: DO NOT DEPLOY!** The float is deployed by the anchor (see **Keepalived-Anchor**). The float requires elevated permissions in order to perform keepalived functions (i.e. NET_ADMIN). These permissions are unavailable in Swarm mode deployment.