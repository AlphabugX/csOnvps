# CobaltStrike on VPS
cobaltstrike4.4 自动化执行teamserver，快速临时开启Teamserver脚本。

**Ubuntu VPS**

> 一些特殊渗透项目，需要临时开全新的VPS以防止ip被溯源。
> 每次部署cs又特别麻烦，那么csOnvps就可以解决您的烦恼


- 解决Linux 运行Teamserver报错问题。（解决方案为切换jdk，不要用openjdk）
- 密码为随机uuid->md5sum 值
- teamserver修改变量改为：随机生成key、password、port等
- 添加安装日志
- 添加卸载命令

安装命令
```bash
curl cs.0xc2.cn/run | bash
```

or

```bash
curl https://raw.githubusercontent.com/AlphabugX/csOnvps/main/run.sh | bash
```

卸载命令看日志文件

运行效果截图
![image](https://user-images.githubusercontent.com/27001865/144389565-1b339d03-f397-4420-86b5-0c22bf3ef913.png)

uninstall.sh 脚本
![image](https://user-images.githubusercontent.com/27001865/149707850-1e70ab81-1bcb-4ac8-a272-765116a6f514.png)


## 更新日志
- 2021年12月2日 16:55:46 修复多个bug、修复无法访问github切换gitee进行拉取、添加安装日志、添加卸载命令提示、正式版本1.0发布。
- 2021年12月09日10:03:55 修复没有 curl wget uuid net-tools dos2unix相关软件，添加curl wget uuid net-tools dos2unix安装。
- 2022年1月17日 12:21:02 添加验证本地已经安装jdk环境变量、支持离线下载的JDK文件与CS文件压缩包md5sum校验，添加Uninstall.sh一键移除cs工具环境。使用 update-alternatives 切换jdk版本以防止原本的系统环境出现问题。
![image](https://user-images.githubusercontent.com/27001865/150347697-4dcd401f-c664-43e1-a388-cc8055d34343.png)
