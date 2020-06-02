# HP_Pavilion_15-cb073tx_Hackintosh

这是我使用的惠普光影精灵3黑苹果引导文件，包含了Clover和OpenCore双引导。

## 电脑配置

CPU: Intel Core i5-7300HQ

GPU: Intel HD Graphics 630（Nvidia GeForce GTX 1050 已屏蔽）

声卡: Realtek ALC295（layout-id = 23）

网卡: Intel 7265ngw（已更换为 Broadcom BCM94360CS2）+ Realtek RTL8111

## Clover配置说明

Clover版本为5118，驱动目前最新。

这个EFI中 CLOVER/kexts/Other 只保留了必要的驱动，Intel蓝牙驱动在 CLOVER/kexts/Off 里面，有需要的话建议安装完成后再添加到Other中。（来自大佬 zxystd 的项目 https://github.com/zxystd/IntelBluetoothFirmware ）

CLOVER/drivers/UEFI 中的内存驱动由 AptioMemoryFix.efi 换成 OsxAptioFix3Drv.efi ，解决了 Clover 引导 Linux 时会卡在 “载入初始化内存盘” 的问题。

啰嗦模式默认开启，安装完成后可以将启动参数-v删除。

电池补丁在 SSDT-BAT0.aml 中，亮度快捷键在 SSDT-FN.aml 中，避免因为DSDT冲突导致打过补丁的DSDT无法使用。

睡眠补丁在 SSDT-GPRW.aml 中，默认不启用。如果BIOS版本低于F.18可能存在睡眠秒醒问题，有需要请自行修改 config.plist 以启用。建议优先考虑更新BIOS。

USB端口已经打过补丁，不影响USB3.0速率。

添加了风扇转速显示补丁 SSDT-FANS.aml，但只能显示转速，无法通过软件控制。具体教程详见远景论坛帖子 http://bbs.pcbeta.com/viewthread-1829706-1-1.html ，计算公式已经修改为正确公式了。

序列号已经洗白，但已经被使用过。请参照教程自行洗白。机型建议不用修改。

触摸板和耳麦输入有关问题见下！

注意，SmUUID和CustomUUID已经暂时留空，填写说明见下！

## OpenCore配置说明

OpenCore版本为0.5.9，使用了OC原始的GUI界面，驱动目前最新。

在使用这个EFI前请确保你对于CLOVER和OC引导有了足够的了解，能够应对一些突发状况并会自救。

由于 OC 的 内存驱动 与相关 quirk 似乎与 Linux 有冲突，暂时没办法正常引导 Linux ，会卡在 “载入初始化内存盘” 。

所有的ACPI补丁全部拆出来放在了SSDT里面，大多数和clover差不多，而且更严谨。所有OC的补丁可以用于Clover引导。

由于OC默认所有操作系统使用同一套DSDT，所以有时会出现无法引导Windows的现象。通过 SSDT-OC-XOSI.aml 补丁对DSDT中操作系统参数设置为Win 10即可正常引导。从BIOS版本F.19开始，ACPI表中补全了Windows的系统参数信息，不再需要这个补丁。该补丁默认启用，但建议考虑更新BIOS。( 相关说明可在宪武大佬的项目 https://github.com/daliansky/OC-little 中看到）

睡眠补丁在 SSDT-GPRW.aml 里，默认不启用。BIOS低于F.18版本可能存在睡眠秒醒问题，请自行启用。建议优先考虑更新BIOS。

添加了SSDT-ARTC.aml补丁，修复了每次重启时都会重启两次的问题（感谢 OpenCore技术交流群 的 iStar 大佬）。该补丁功能与 Clover 中勾选 AppleRTC 选项效果等同。

Kexts中添加了Intel蓝牙驱动，但是默认禁用。有需要的话请自行启用。

序列号和Clover里的是同一份，记得自己洗白。

触摸板和耳麦输入有关问题见下！

注意，SystemUUID已经暂时留空，填写说明见下！

## 有关 ELAN PS/2 触摸板多手势驱动

由于 VoodooPS2Controller.kext v1.9.2 只支持移动和按键点击，新版本只支持 Synaptics 触摸板，所以只能使用 ApplePS2SmartTouchPad.kext 。这个驱动10.12时就已经有了，但是由于闭源且原作者不再维护，故在新版系统存在一定bug。我只能修改对应手势使其与新版系统默认设置对应，其他的就没办法了。

使用说明详见远景论坛帖子 http://bbs.pcbeta.com/viewthread-1819242-1-1.html 。

## ALC295_PlugFix

用于修复耳麦二合一插孔插入耳麦时无法切换到外置麦克风的问题，内有使用说明。

## 关于 Type-C 接口视频输出

### 方法一：（感谢 OpenCore技术交流群 的 iStar 大佬）

添加启动参数 agdpmod=vit9696 来禁用 Board-id 侦测，选择合适的 platformid 即可正常输出。

### 方法二：（直接修改系统驱动 AGDP ，不推荐）

详见远景论坛帖子 http://bbs.pcbeta.com/viewthread-1834012-1-2.html ，以及 http://bbs.pcbeta.com/viewthread-1760287-1-1.html 。

疑似因为 Kext to patch 方法在10.14之后失效（至少缓冲帧注入这方面失效了），上述的第二个帖子的方法在10.15中不管用，这里只讲修改系统驱动文件的方式。

（10.15版本系统中，先终端执行 sudo mount -o rw / && killall Finder 解锁文件系统）通过修改 System/Library/Extensions 中的 AppleGraphicsControl.kext/Contents/PlugIns/AppleGraphicsDevicePolicy.kext/Contents/Info.plist ，在 <key>ConfigMap</key> 中添加一项自己的 Board-id，对应值为 none。（无法直接修改的话可以拷贝一份出来，修改后再覆盖回去。）Board-id 可在 config.plist 的 SMBIOS 信息中得到。

之后一定要重建缓存！可以使用 Kext Utility ，Hackintool 或者 Kext Updater 等工具，或者终端执行指令。重启后，Type-C接口即可输出图像信号。（由于家境贫寒，只测试了HDMI输出，VGA和DP请自行尝试。）

注意，本方法修改了系统文件，所以每次更新系统后都需要重新操作一次。并且，如果修改了机型，那么 Info.plist 中的 Board-id 也要重新填写。

关于platformid的选择可以看我的帖子 http://bbs.pcbeta.com/viewthread-1849749-1-1.html 。

## Clover中 SmUUID / CustomUUID 和OC中 SystemUUID 填写说明

详见远景论坛帖子 http://bbs.pcbeta.com/viewthread-1838605-5-1.html 的 85 楼。

该操作主要为了避免使用OC引导Windows时因为主板UUID注入变化导致激活信息失效的问题。

按照maojinbing大佬的说法，Clover中的 CustomUUID 和OC中的 SystemUUID 应该填写主板的UUID，在Windows系统PowerShell中执行 wmic csproduct get uuid 即可获得。

Clover中的 SmUUID（硬件UUID）可以暂时不填写。正常情况下，MLB和ROM一致的话，SmUUID 的值不会改变。所以在洗白并且填写正确的 CustomUUID（Clover）/ SystemUUID（OC）之后，可以在 关于本机-系统报告-硬件概览 中看到此时的硬件UUID，复制并填入 config.plist 中的 SmUUID 即可。

## 交流群

惠普电脑装Mac交流群: 543758684

OpenCore技术交流群: 538643249
