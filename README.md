# harbor-arm-build

测试2.12.2版本，启动成功

测试2.11.2版本，启动成功

测试2.10.3版本，启动成功

- 文件保存位置：https://hub.docker.com/r/hank997/harbor-arm/tags
    - `docker pull hank997/harbor-arm:2.11.2`
- 对应腾讯云仓库如下，tags后面会带上`arm64`的标号，例如镜像： 
    - `docker pull ccr.ccs.tencentyun.com/hank997/harbor-arm:2.12.2-arm64`

```bash
# hank997/harbor-arm:2.12.2
docker run -it --rm -v $PWD:/pack ccr.ccs.tencentyun.com/hank997/harbor-arm:2.12.2-arm64 mv harbor-offline-installer-2.12.2.tgz /pack
# 2.11.2
# 2.10.3
```
