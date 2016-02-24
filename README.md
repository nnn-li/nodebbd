NodeBB是建立与的NodeJS，并作出快速而有力。 



## 用法

redis 实例

```
docker run --name zan-redis -d -p 6379:6379 nodebb/docker:centos-redis
docker run --name zan-redis -d -p 6379:6379 nodebb/docker:ubuntu-redis
```


接下来，启动NodeBB实例，因此它与刚刚推出的Redis实例链接。


```
docker run --name nodebbd --link zan-redis:redis -p 80:80 -p 443:443 -p 4567:4567 -P -t -i zanjs/nodebbd

```

这个默认的端口是  4567. Ports 80, and 443 . 
您可以保留默认端口或改变它.

```
docker start my-forum-nodebb
```



