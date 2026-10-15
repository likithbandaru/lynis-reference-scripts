# Lynis Reference Scripts and Audit Outputs

**Author:** Likith Bandaru

## Introduction

This repository contains reference source-code excerpts and terminal outputs from existing Lynis security audit tests. The `PKGS-7420` test was selected as the main reference for developing two custom automatic-update audit scripts.

## Reference Test: PKGS-7420 — Automatic Upgrade Toolkit

**Source file:** `tests_ports_packages`

**Purpose:** Detects tools used to automatically download and apply software upgrades.

The test checks for supported automatic-upgrade tools, records whether a toolkit is found, and provides a suggestion when no toolkit is detected.

**Files:**

- `PKGS-7420/reference_script.sh` — Reference source-code excerpt.
- `PKGS-7420/reference_output.txt` — Actual audit output.

## Enhanced Security Audit Scripts

Two custom scripts were developed using the automatic-update audit area as their starting point:

1. **CUST-9001 — Automatic Security Updates Audit:** Checks package installation, effective APT automatic-update settings, the APT upgrade timer, and the unattended-upgrades log file.
2. **CUST-9003 — Automatic Update Service Status Audit:** Checks package installation, the enabled and active status of APT update timers, and whether the automatic upgrade service is reported as failed.

The enhanced scripts are maintained in a separate repository:

[https://github.com/likithbandaru/lynis-security-enhancements](https://github.com/likithbandaru/lynis-security-enhancements)

## Learning Outcomes

- Understood how existing Lynis audit tests are structured.
- Learned how automatic-upgrade tools and system configuration checks are examined.
- Practised reading terminal audit results and interpreting warnings.
- Developed custom Bash scripts to perform additional automatic-update checks.

## Conclusion

This project helped me understand how Lynis performs security audits by checking system configurations and detecting potential security issues. By studying the `PKGS-7420` reference test, I developed two custom Bash scripts to examine automatic-update configuration and service status. This work improved my understanding of Linux security auditing, Bash scripting, and interpreting audit results.

## Acknowledgement

I acknowledge the Lynis project and its contributors for the original reference code used for learning and comparison. The reference excerpts are included for educational purposes, and the custom enhancements are maintained separately.

**Lynis project:** [https://github.com/CISOfy/lynis](https://github.com/CISOfy/lynis)
