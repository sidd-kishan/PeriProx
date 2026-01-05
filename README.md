# PeriProx

**Peripheral Proxy — Linux USB drivers as a backend for Windows-on-ARM via USB/IP**

---

## Overview

**PeriProx** is a system that uses **Linux as a live USB driver backend** for
**Windows-on-ARM**.

Instead of rewriting or porting USB drivers for Windows, PeriProx allows:

- Physical USB devices to be driven by **Linux**
- USB protocol semantics to be exported using **USB/IP**
- Windows-on-ARM to consume the device as if it were locally attached

Linux effectively becomes a **peripheral proxy**, exposing real hardware
behavior to Windows in a controlled, inspectable, and reproducible way.

---

## Motivation

Many USB devices lack usable Windows drivers because:

- Vendors are defunct
- Documentation is unavailable
- Drivers are NDA-locked
- Firmware behavior is undocumented

Linux already contains **working, production-quality USB drivers** for such
devices.

> **PeriProx reuses Linux drivers as a living hardware specification.**

---


**Key idea:**  
**Linux owns the hardware. Windows observes the behavior.**

---

## Features

- Linux-backed USB device proxying
- USB/IP transport over TCP
- Works with **Windows 11 on ARM**
- Supports class and vendor USB drivers
- USB traffic tracing and inspection
- Deterministic, reproducible behavior
- Suitable for reverse engineering and driver development

---

## Use Cases

- 🧟 Driver resurrection for dead hardware
- 🔬 USB protocol reverse engineering
- 🧪 Device behavior analysis
- 🧰 WinUSB / KMDF development aid
- 🧱 NDA-free black-box driver modeling
- 🔍 USB fuzzing and fault injection

---

## Environment

### PeriProx Backend

- Alpine Linux (custom kernel)
- QEMU (aarch64)
- VirtIO block + networking
- USB/IP enabled kernel

### Client

- Windows 11 on ARM
- `usbipd-win`
- WinUSB / KMDF drivers

---

## Kernel Requirements

Alpine’s stock kernels **do not include USB/IP**.

PeriProx requires a kernel built with:
CONFIG_USB=y
CONFIG_USBIP_CORE=y
CONFIG_USBIP_HOST=y
CONFIG_USBIP_VHCI_HCD=y

