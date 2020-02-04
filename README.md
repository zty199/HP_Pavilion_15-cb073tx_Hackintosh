# HP_Pavilion_15-cb073tx_Hackintosh

这是我使用的惠普光影精灵3黑苹果引导文件，包含了Clover和OpenCore双引导。

## 电脑配置

CPU: Intel Core i5-7300HQ

GPU: Intel HD Graphics 630 (Nvidia GeForce GTX 1050 已屏蔽)

声卡: ALC295 (layout-id = 28)

网卡: Broadcom 94360CS2 + Realtek RTL8111

## Clover配置说明

Clover版本为5103，驱动目前最新。

这个EFI中CLOVER/kexts/other只保留了必要的驱动，博通网卡驱动在CLOVER/kexts/Off里面，建议安装完成后再添加到other中。

啰嗦模式默认开启，安装完成后可以将启动参数-v删除。

重新把电池补丁放在了SSDT-BATT.aml中，亮度快捷键放在了SSDT-FN.aml中，避免因为DSDT冲突导致打过补丁的DSDT无法使用。

睡眠补丁在SSDT-GPRW.aml中，默认不启用。如果BIOS版本为F.18应该可以正常睡眠，旧版BIOS存在睡眠秒醒问题。有需要请自行修改config.plist以启用。

USB端口已经打过补丁，不影响USB3.0速率。

添加了风扇转速显示补丁SSDT-FANS.aml，但只能显示转速，无法通过软件控制。

序列号已经洗白，但已经被使用过。请参照教程自行洗白。机型建议不用修改。

## OpenCore配置说明

OpenCore版本为0.5.5，驱动目前最新。

在使用这个EFI前请确保你对于CLOVER和OC引导有了足够的了解，能够应对一些突发状况并会自救。

所有的ACPI补丁全部拆出来放在了SSDT里面，大多数和clover差不多，而且更严谨。少数补丁由于OC中ACPI改名问题不通用。

由于OC默认所有操作系统使用同一套DSDT，所以有时会出现无法引导Windows的现象。通过SSDT-OC-XOSI.aml补丁对DSDT中操作系统参数设置为Win 10即可正常引导。（相关说明可在宪武大老的项目github/OC-little中看到）

睡眠补丁在SSDT-GPRW.aml里，默认不启用。BIOS低于F.18版本可能存在睡眠秒醒问题，请自行启用。

序列号和Clover里的是同一份，记得自己洗白。

别的应该没啥了，想试试就用用看。

## 交流群

惠普电脑装Mac交流群:543758684

OpenCore技术交流群:538643249
