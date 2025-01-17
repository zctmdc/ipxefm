# ipxefm
**IPXE File Manager!** Support `WIM`, `ISO`, `IMG`, `RAMOS`, `ISCSI` network boot templates (`BIOS`/`UEFI`)
Using ipxe, automatically determine `legacybios` and `uefi (64-bit)` environments and boot `WIM`, `ISO`, `IMG`, `RAMOS` in different ways
`ipxe.bios` and `ipxe.efi` are dedicated files for `tinypxe` or `pxegrub` menus (original without embedded scripts)
The files in the nas directory are suitable for use in router system environments such as Linux
`ipxeboot-ipxe.efi`, `ipxeboot-snponly.efi` and `ipxeboot-undionly.kpxe` are universal boot files, suitable for various network boot loaders (Synology & openwrt, etc.)
You can download the complete `ipxefm.7z` package from **Tencent QQ group** `146859089`, which contains the demo `mini.wim` (edited)

**IPXE文件管理器!**支持启动`WIM`、`ISO`、`IMG`、`RAMOS`、`ISCSI`的网启模板(`BIOS`/`UEFI`)
使用ipxe，自动判断`legacybios`和`uefi(64位)`环境，用不同方式启动`WIM`、`ISO`、`IMG`、`RAMOS`

`ipxe.bios`和`ipxe.efi`为`tinypxe`或`pxelinux`菜单调用专用文件(原版无嵌入脚本)

nas目录下的文件适合在软路由或linux系系统环境用

`ipxeboot-ipxe.efi`, `ipxeboot-snponly.efi`和`ipxeboot-undionly.kpxe`为通用启动文件，
适合各种网启启动器通用(群晖&openwrt等)


可以从**腾讯QQ群**`146859089`下载完整的`ipxefm.7z`包，里面包含演示的`mini.wim`


![image](https://github.com/zwj4031/ipxefm/blob/main/bin/ipxefm.gif)

Application video <https://www.bilibili.com/video/BV1Sf4y1x7ea>

If PE cannot obtain an IP address due to missing `network card drivers`, you can add your `driver` directory to `app\inject\default\drivers.7z`
Or rename your `driver package` directly to drivers.7z

应用视频: <https://www.bilibili.com/video/BV1Sf4y1x7ea>

如果pe无法取得IP地址是因为缺少`网卡驱动`，可以加入你的`驱动`目录到`app\inject\default`下的`drivers.7z`
或者直接把你的`驱动包`改名为`drivers.7z`（已编辑）

补充说明：
- [`ipxe` 文件更新](http://wuyou.net/forum.php?mod=viewthread&tid=418863)
- [`ipxe` 文件区别](http://wuyou.net/forum.php?mod=viewthread&tid=418863&page=1#pid3972035)
- <https://ipxe.org/start>
- [`openwrt` 等使用 `dnsmasq` 教程](doc/dnsmasq.md)
- [Openwrt dnsmasq 添加教程](https://www.bilibili.com/video/BV1AX4y1K7Hz), openwrt的配置方式也是直接编辑dnsmasq.conf这个文件
