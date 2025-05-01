# sandboxer

Temporary deployment environment for our Zealand project. This is based on https://github.com/Turbulentarius/sandboxer

I have switched from using bind mounts to Named Volumes, as they simplify managing permissions significantly;
Named Volumes enables data sharing between containers while preventing accidental changes to file permissions caused by UID discrepancies between the host and container.

Again, Traefik is used for enabling easy plug-and play of new websites and services. 

Run the containers:
```
docker compose up
```

Stop the containers:
```
docker compose stop
```
Or hit `CTRL` + `C` inside your console window.

View your running containers after starting them:
```
docker ps
```

If you need CLI access to the database:

```
docker exec -it sandboxer-[prefix]-db bash
mariadb -uroot -p
```

