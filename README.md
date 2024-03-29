# HP_Pavilion_15-cb073tx_Hackintosh

这是我使用的惠普光影精灵3黑苹果引导文件，包含了 Clover 和 OpenCore 双引导。

## 电脑配置

CPU: Intel Core i5-7300HQ

GPU: Intel HD Graphics 630（NVidia GeForce GTX 1050 已屏蔽）

声卡: Realtek ALC295（layout-id = 24）

网卡: Intel 7265ngw（已更换为 Broadcom BCM94360CS2）+ Realtek RTL8111

## Clover 配置说明

Clover 版本 为 5149，支持安装和引导 macOS Ventura 13 Beta。

修复了 Type-C 接口 的视频输出和音频输出（感谢OC交流群大佬 @常原）。

使用 VirtualSMC 替代 FakeSMC，支持双风扇转速显示（感谢 GitHub 大佬 [1alessandro1](https://github.com/1alessandro1) 和 [vit9696](https://github.com/vit9696)）。

不再提供睡眠补丁，如有需要请在历史版本中自行提取添加。

不再支持 FileVault 2，如有需要使用或者误开启请参考历史版本自行添加相关驱动。

序列号已经洗白，但已经被使用过。请参照教程自行洗白。机型建议不用修改。

耳麦输入有关问题见下！

注意，SmUUID 和 CustomUUID 已经暂时留空，填写说明见下！

## OpenCore 配置说明

OpenCore 版本为 0.8.5，支持安装和引导 macOS Ventura 13 Beta 8。

修复了 Type-C 接口的视频输出和音频输出（感谢OC交流群大佬 @常原）。

修复了从 Windows 系统重启后进入其他系统（如 Linux，macOS 等）扬声器没有声音的问题（感谢OC交流群大佬 @哞 @常原）。

使用 VirtualSMC + SMCSuperIO，支持双风扇转速显示。

更新了新的电池补丁（感谢OC交流群大佬 @iStar @常原），解决 OC 引导 Windows 时睡眠唤醒后部分设备断电无法使用的问题（键盘，触摸板，网卡等）。

添加了 SSDT-RTC0.aml 补丁，修复了每次重启时都会重启两次的问题（感谢OC交流群大佬 @iStar）。该补丁功能与 Clover 中勾选 FixRTC 选项效果等同。

不再提供操作系统补丁和睡眠补丁，如有需要请在历史版本中提取并自行添加。

不支持 FileVault 2 以及磁盘加密、安全启动等功能，如有需要请自行参照使用手册开启对应功能。

序列号和 Clover 里的是同一份，记得自己洗白。

耳麦输入有关问题见下！

注意，SystemUUID 已经暂时留空，填写说明见下！

## 有关 ELAN PS/2 触摸板多手势驱动

VoodooPS2 从 2.1.7 版本开始合并了 ELAN TouchPad 驱动相关代码，已经完全支持触摸板多手势。故替换了 ApplePS2SmartTouchPad.kext，操作更加顺滑。

（ApplePS2SmartTouchPad.kext 驱动修改和使用说明详见远景论坛帖子 http://bbs.pcbeta.com/viewthread-1819242-1-1.html ）

## ALCPlugFix-Swift

https://github.com/black-dragon74/ALCPlugFix-Swift

用于修复耳麦二合一插孔插入耳麦时无法切换到外置麦克风的问题，内有使用说明。

## 关于 Type-C 接口视频输出（感谢OC交流群大佬 @iStar）

添加启动参数 agdpmod=vit9696 来禁用 Board-id 侦测，选择合适的 platformid 即可正常输出。

（platformid 的选择可以看我的帖子 http://bbs.pcbeta.com/viewthread-1849749-1-1.html ）

## 关于 Type-C 接口 HDMI_DP 数字音频输出

在声卡设备属性添加 device-id 属性，类型 Data ，字段值 70A10000 ；添加 compatible 属性，类型 String ，字段值 pci8086,a170 ，即可正常使用音频输出。

## 关于风扇转速显示补丁

详情见 FanSpeedDisplay 文件夹，内有说明以及相关资料。

## Clover 中 SmUUID / CustomUUID 和 OC 中 SystemUUID 填写说明

详见远景论坛帖子 http://bbs.pcbeta.com/viewthread-1838605-5-1.html 的 85 楼。

该操作主要为了避免使用 OC 引导 Windows 时因为 主板 UUID 注入变化导致激活信息失效的问题。

按照 maojinbing 大佬 的说法，Clover 中的 CustomUUID 和 OC 中的 SystemUUID 应该填写 主板 的 UUID，在 Windows 系统中以管理员身份运行 PowerShell，执行 wmic csproduct get uuid 即可获得。

Clover 中的 SmUUID（硬件UUID）可以暂时不填写。正常情况下，MLB 和 ROM 一致的话，SmUUID 的值不会改变。所以在洗白并且填写正确的 CustomUUID（Clover）/ SystemUUID（OC）之后，可以在 关于本机-系统报告-硬件概览 中看到此时的 硬件 UUID，复制并填入 config.plist 中的 SmUUID 即可。

## 交流群

惠普电脑装Mac交流群: 145090108

OpenCore车技交流群: 838739020
