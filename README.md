# cobaltstrike on server
cobaltstrike4.4 自动化执行teamserver，快速临时开启Teamserver脚本。
**Ubuntu VPS**
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

## 更新日志
- 2021年12月2日 16:55:46 修复多个bug、修复无法访问github切换gitee进行拉取、添加安装日志、添加卸载命令提示、正式版本1.0发布。
