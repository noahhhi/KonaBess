# KonaBess Native CLI & Magisk/KernelSU Auto-Undervolt Module

[English](#english) | [中文说明](#中文说明)

---

## 中文说明

### 简介
**KonaBess Native CLI** 是基于官方 [libxzr/KonaBess](https://github.com/libxzr/KonaBess) 底层规则库与 ARM64 工具链构建的**免 APK 原生命令行调压工具与 Magisk / KernelSU 自愈模块**。

专为追求极简、自动化与底层稳定性的高级用户设计：
1. **彻底免除 APK 安装**：无需安装庞大的 Java 图形应用，通过系统原生终端直接管理。
2. **系统 OTA 更新后自动打补丁**：内置 `service.sh` 守护服务，系统 OTA 升级刷写覆盖 Boot 后，开机自动重新提取、打补丁、重打包并刷入 Boot/vendor_boot，降压永久生效。
3. **5 阶段满载真机稳定性压测**：内置基于 WebGL 2.0 原生全分辨率分形光线步进着色器的 GPU 满载压测工具，结合 `devfreq` 硬件死锁，对各频点施加持续 99% GPU 算力压力并实时监控驱动故障（`ft_hang_intr_status`）。
4. **阶梯式调压与快速回退（Ladder & Bump）**：支持一键下压到底线（`set-floor`）以及遇错自动上调一档（`bump <freq>`），精准摸底芯片体质。
5. **多平台通用适配**：同时支持骁龙 855（`msmnile`，如 Google Pixel 4 / 4 XL）与骁龙 8 Gen 3（`pineapple`，如 OnePlus 12）等现代高通芯片平台。

---

### 安装方法

#### 方式一：Magisk / KernelSU / APatch 刷入（推荐）
1. 在 [Releases](https://github.com/noahhhi/KonaBess/releases) 下载 `KonaBess-CLI-Universal-v2.0.zip`。
2. 在 Magisk / KernelSU / APatch 模块管理页面直接选择本地安装并重启。
3. 重启后打开 Termux 或电脑 `adb shell`，执行 `su` 获取 root 后，即可直接输入 `konabess-cli`。

#### 方式二：手动直接推送到设备
```bash
adb root
adb push cli/konabess-cli /system/bin/konabess-cli
adb chmod 755 /system/bin/konabess-cli
```

---

### 常用命令指南

```bash
# 1. 查看当前 GPU 频点、电压等级、默认值与当前降压差值
konabess-cli status

# 2. 运行 5 阶段真机 GPU 满载压力测试（测试各频段稳定性）
konabess-cli test

# 3. 将所有频点直接设为理论最低工作电压底线
konabess-cli set-floor

# 4. 若某个频点在重载或高温下不稳定，一键上调该频点一档电压
konabess-cli bump 585    # 针对 585MHz 上调一档并自动重打包刷入
konabess-cli bump 427    # 针对 427MHz 上调一档

# 5. 切换预设档位 (safe 保守 / deep 深度平衡 / floor 极限底线)
konabess-cli profile deep
konabess-cli patch-all

# 6. 一键恢复官方原厂镜像
konabess-cli restore

# 7. 查看自动更新历史日志
konabess-cli log
```

---

## English

### Introduction
**KonaBess Native CLI** is a headless, APK-free command-line GPU undervolting manager and Magisk/KernelSU auto-patch module based on the core rules and ARM64 toolchain of [libxzr/KonaBess](https://github.com/libxzr/KonaBess).

Key Features:
- **No APK Required**: Completely removes the need for Android GUI applications.
- **OTA Survival & Auto-Patching**: Automatically re-patches and re-flashes the boot or vendor_boot partition after system updates.
- **5-Stage Full Load Stress Testing**: Embedded WebGL 2.0 fractal raymarching shader + devfreq clock clamping for 99% GPU load validation.
- **Ladder-based Auto-Bumping**: Allows stepping voltages up or down on the Qualcomm RPMh ladder with instant re-flashing.
- **Universal Multi-SoC Support**: Supports Snapdragon 855 (`msmnile`) up to Snapdragon 8 Gen 3 (`pineapple`).

### Installation
Flash `KonaBess-CLI-Universal-v2.0.zip` in Magisk, KernelSU, or APatch. Reboot, then run `konabess-cli` as root.
