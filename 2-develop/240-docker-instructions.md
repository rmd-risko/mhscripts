## Docker Instructions

https://hub.docker.com/search

To list all containers:
~~~
docker ps -a
~~~

To list all downloaded images:
~~~
docker images -a
~~~

---

#### Docker clean

To clean:
~~~
docker system prune -a
~~~

This will remove:
  - All stopped containers;
  - All networks not used by at least one container;
  - All images without at least one container associated to them;
  - All build cache.

