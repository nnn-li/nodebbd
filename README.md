NodeBB使用NodeJS 强力驱动，数据实时响应。 


## 中文翻译


> 安装 和 后台 ui  都已经翻译了

并且 发送邮件服务插件 已经集成了 ，都已经完美通过测试 , 目前在做一系列的 中文插件，方便中国程序员


如果您想加入 我们一起翻译 , 为开源社区做出一点点贡献.
 

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




---

这个默认的端口是  4567. Ports 80, and 443 . 
您可以保留默认端口或改变它.

```
docker start nodebbd
```



