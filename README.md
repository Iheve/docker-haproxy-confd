# haproxy-confd

Docker container running HAProxy backed by confd.

Run an app on IP address: 172.16.0.10:80.
Advertise it on etcd:
```bash
etcdctl set /services/myapp/mydomain.dev '{"ip":"172.16.0.10", "port": "80"}'
```

Configure a default backend:
```bash
etcdctl set /services/default '{"app":"myapp", "hostname":"mydomain.dev"}'
```

Add a certicate for your default backend and mount it!
```bash
ls /data/server-wide/haproxy/approved-certs/mydomain.dev.pem
/usr/bin/docker run\
--name haproxy-confd\
-p 80:80\
-p 443:443\
-v /data/server-wide/haproxy/approved-certs/:/etc/haproxy/approved-certs/\
pierreozoux/haproxy-confd
```

And voilà!

## Develop
If you want to develop, please put the confd bin in your local folder before docker build (it's faster like this):
```bash
wget https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64
```
