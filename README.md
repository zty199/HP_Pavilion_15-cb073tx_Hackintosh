# HP_Pavilion_15-cb073tx_Hackintosh

这是我使用的惠普光影精灵3黑苹果引导文件，包含了 Clover 和 OpenCore 双引导。

## 电脑配置

CPU: Intel Core i5-7300HQ

GPU: Intel HD Graphics 630（NVidia GeForce GTX 1050 已屏蔽）

声卡: Realtek ALC295（layout-id = 24）

网卡: Intel 7265ngw（已更换为 Broadcom BCM94360CS2）+ Realtek RTL8111

## Clover 配置说明

Clover 版本 为 5129，支持安装和引导 macOS Big Sur 11.3 Beta。

修复了 Type-C 接口 的视频输出和音频输出（感谢OC交流群大佬 @常原）。

添加了风扇转速显示补丁 SSDT-FANS.aml，但只能显示转速，无法通过软件控制。（具体教程详见远景论坛帖子 http://bbs.pcbeta.com/viewthread-1829706-1-1.html ，计算公式已经修改为正确公式）

不再提供睡眠补丁，如有需要请在历史版本中自行提取添加。

序列号已经洗白，但已经被使用过。请参照教程自行洗白。机型建议不用修改。

耳麦输入有关问题见下！

注意，SmUUID和CustomUUID已经暂时留空，填写说明见下！

## OpenCore 配置说明

OpenCore 版本为 0.6.6，支持安装和引导 macOS Big Sur 11.3 Beta。

修复了 Type-C 接口的视频输出和音频输出（感谢OC交流群大佬 @常原）。

更新了新的电池补丁（感谢OC交流群大佬 @iStar 和 @常原），解决OC引导Windows时睡眠唤醒后部分设备断电无法使用的问题（键盘，触摸板，网卡等）。

添加了 SSDT-RTC0.aml 补丁，修复了每次重启时都会重启两次的问题（感谢OC交流群大佬 @iStar）。该补丁功能与 Clover 中勾选 FixRTC 选项效果等同。

不再提供操作系统补丁和睡眠补丁，如有需要请在历史版本中提取并自行添加。

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

使用 AppleALC.kext + FakePCIID.kext + FakePCIID_Intel_HDMI_Audio.kext ，在声卡设备属性添加 device-id 属性，类型 Data ，字段值 70A10000 ，即可正常使用音频输出。使用 USB DAC 转换3.5mm耳机接口与此无关，可正常使用。（EFI 中定制了 FakePCIID，合并了驱动补丁为一个）

## Clover 中 SmUUID / CustomUUID 和 OC 中 SystemUUID 填写说明

详见远景论坛帖子 http://bbs.pcbeta.com/viewthread-1838605-5-1.html 的 85 楼。

该操作主要为了避免使用 OC 引导 Windows 时因为 主板 UUID 注入变化导致激活信息失效的问题。

按照 maojinbing 大佬 的说法，Clover 中的 CustomUUID 和 OC 中的 SystemUUID 应该填写 主板 的 UUID，在 Windows 系统中以管理员身份运行 PowerShell，执行 wmic csproduct get uuid 即可获得。

Clover 中的 SmUUID（硬件UUID）可以暂时不填写。正常情况下，MLB 和 ROM 一致的话，SmUUID 的值不会改变。所以在洗白并且填写正确的 CustomUUID（Clover）/ SystemUUID（OC）之后，可以在 关于本机-系统报告-硬件概览 中看到此时的 硬件 UUID，复制并填入 config.plist 中的 SmUUID 即可。

## 交流群

惠普电脑装Mac交流群: 543758684

OpenCore技术交流群: 538643249
