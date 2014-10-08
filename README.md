# haproxy-confd

Docker container running HAProxy backed by confd.

Run a app on IP address: 172.16.0.10:80.
Advertise it on etcd:
```bash
etcdctl set /services/myapp/myuser '{"hostname":"example.dev", "name":"myuser", "ip":"172.16.0.10", "port": "80"}'
```

And voilà!
