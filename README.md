
# Docker-Keepalived

**Docker-Keepalived** enables you to run **Keepalived** in your Docker Swarm.

### Why would you want to run Keepalived in Docker Swarm?
If you've found this project, chances are that you have your reasons. More than likely, you simply want to avoid an additional load-balancer in front your Swarm. Now, with **Docker-Keepalived**, you can do just that!

### Services in the **Docker-Keepalived** Project:
* **Keepalived-Anchor**
* **Keepalived-Float**
* **Keepalived-Buoy**


### Deploy Example

```
docker stack deploy -c docker-compose.yml keepalived
```
