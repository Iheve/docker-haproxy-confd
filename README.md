# haproxy-confd

Docker container running HAProxy backed by confd.

Run an app on IP address: 172.16.0.10:80.
Advertise it on etcd:
```bash
etcdctl set /services/myapp/myuser '{"hostname":"example.dev", "name":"myuser", "ip":"172.16.0.10", "port": "80"}'
```

And voilà!

## Develop
If you want to develop, please put the confd bin in your local folder before docker build (it's faster like this):
```bash
wget https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64
```
