# Lynis Reference Scripts and Audit Outputs

**Author:** Likith Bandaru

## Introduction

This repository contains reference source-code excerpts and terminal outputs from two existing Lynis security audit tests. These tests were studied as the baseline for developing two custom security audit scripts.

## Reference Test 1: PKGS-7420 — Automatic Upgrade Toolkit

**Source file:** `tests_ports_packages`

**Purpose:** Detects tools used to automatically download and apply software upgrades.

The test checks for supported automatic-upgrade tools, records whether a toolkit is found, and provides a suggestion when no toolkit is detected.

**Files:**
- `PKGS-7420/reference_script.sh` — Reference source-code excerpt.
- `PKGS-7420/reference_output.txt` — Actual audit output.

## Reference Test 2: KRNL-6000 — Kernel Hardening

**Source file:** `tests_kernel_hardening`

**Purpose:** Compares current system configuration values with expected values in the Lynis scan profile.

The test displays matching or different sysctl values and reports settings that may need adjustment.

**Files:**
- `KRNL-6000/reference_script.sh` — Reference source-code excerpt.
- `KRNL-6000/reference_output.txt` — Actual audit output.

## Enhanced Security Audit Scripts

Two custom scripts were developed based on these reference areas:

1. **Automatic Security Updates Audit** — Checks package installation, APT automatic-update configuration, timer status, and update logs.
2. **ICMP Security Configuration Audit** — Checks selected ICMP-related settings, redirect configuration, and reverse-path filtering.

The enhanced scripts are maintained in a separate repository:

https://github.com/likithbandaru/lynis-security-enhancements

## Learning Outcomes

- Understood how existing Lynis audit tests are structured.
- Learned how security settings are compared against expected values.
- Practised reading terminal audit results and identifying warnings.
- Developed custom Bash scripts to perform additional security checks.

## Acknowledgement

The reference code belongs to the Lynis project and its contributors. The reference excerpts are included for educational purposes. The custom enhancements are maintained separately.
