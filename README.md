Build image
----
```
./build.sh
```
edit docker-compose.yaml with your stuff
```
docker-compose up -d
```


Start image with domains(and letsencrypt certificates + autorenewal):
----
```
docker run -d --name nginx -e domains='test.skiproject.no,testen.skiproject.no,tezt.skiproject.no' -e email='email@email.com' -e production='1' -p 80:80 -p 443:443 -ti nginxssl
```


Start image without domain:
----
```
docker run -d --name nginx -p 80:80 -p 443:443 -ti kjerid/ngincrypt
```

PS: When you start the image with domain options you need to have the A records pointed towards the docker host machine.
  
  
ENV Variables:  
production - can be 1 and 0 - 0 will add --test-cert in creation for testing (to avoid hitting letsencrypt limits  
email - email for letsencrypt contactinfo  
domains - domains you ssl on, separated with comma ','
