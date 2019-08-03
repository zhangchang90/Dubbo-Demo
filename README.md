# Dubbo-Demo-consumer
将之前的SSM项目用dubbo拆分为consumer和provider 两个项目

## 架构：

注册中心：zookeeper-3.5.1-alpha

consumer：将之前的SSM项目拆分，包括controller和页面

provider：将之前的SSM项目拆分，包括service，dao

# 测试MOP
## 1.安装zookeeper
ps: 运行zkServer.cmd闪退，可编辑该脚本，添加pause查看错误信息。

因为测试环境，zookeeper，Dubbo Admin，consumer，provider四个项目运行在同一主机，需要修改占用的端口号以防冲突。

修改conf/zoo.cfg文件：

记录客户连接端口号clientPort=2181

修改admin.serverPort=8090
## 2.安装Dubbo Admin 
按照Dubbo官方文档即可

## 3.启动controller和service 两个项目
ps:注意两个项目都部署在了tomcat上，需要使用不同的端口号。

## 4.测试
可以在Dubbo Admin中发现暴露的服务，以及连接的消费者。

测试页面功能和之前的SSM项目一致。

# 总结

### 使用Dubbo后，Bean中的模型必须实现Serializable接口；
### PageHelper如果在controller层调用会失效，要写在service中；
分页插件的原理是利用同一个线程的threadlocal变量传递分页标记。dubbo之后，变量无法传递。
### POM引入Dubbo后，依赖的spring context版本会和原来的spring版本冲突，可通过<exclusion> 标签解决
<dependency>
    <groupId>org.apache.dubbo</groupId>
    <artifactId>dubbo</artifactId>
    <version>2.7.3</version>
    <exclusions> 
      <exclusion> 
        <groupId>org.springframework</groupId> 
        <artifactId>spring-context</artifactId> 
       </exclusion> 
    </exclusions>
</dependency>
### 报错：NoSuchMethodError:org.apache.zookeeper.server.quorum.flexible.QuorumMaj.<init>(Ljava/util/Map
开始怀疑出现这个错误的原因是因为zookeeper服务器的版本与zookeeper.jar的版本不一致，调整之后依旧不行，将tomcat服务器clean之后再启动项目解决。

### 报错：ClassNotFoundException: org.apache.curator.framework.recipes.cache.TreeCacheListener
加入依赖解决。
        <!-- https://mvnrepository.com/artifact/org.apache.curator/curator-recipes -->
        <dependency>
            <groupId>org.apache.curator</groupId>
            <artifactId>curator-recipes</artifactId>
            <version>4.2.0</version>
        </dependency>
