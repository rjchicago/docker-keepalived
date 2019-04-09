
# Docker-Keepalived

**Docker-Keepalived** enables you to run **Keepalived** in your Docker Swarm.

### Why would you want to run Keepalived in Docker Swarm?
If you've found this project, chances are you have your reasons. Likely, you simply want to avoid an additional load-balancer in front your Swarm. Now with Docker-Keepalived you can do just that!


### Deploy Example

```
docker stack deploy -c docker-stack.yml keepalived
```
