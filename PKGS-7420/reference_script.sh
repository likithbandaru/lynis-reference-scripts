    # Test        : PKGS-7420
    # Description : Detect toolkit to automatically download and apply upgrades
    Register --test-no PKGS-7420 --weight L --network NO --category security --description "Detect toolkit to automatically download and apply upgrades"
    if [ ${SKIPTEST} -eq 0 ]; then
        UNATTENDED_UPGRADES_TOOLKIT=0
        UNATTENDED_UPGRADES_TOOL=""
        UNATTENDED_UPGRADES_OPTION_AVAILABLE=0

        case "${OS}" in
            "Linux")
                for DIST in CentOS Debian Fedora RHEL Ubuntu; do
                    if [ "${LINUX_VERSION}" = "${DIST}" ] || [ "${LINUX_VERSION_LIKE}" = "${DIST}" ]; then
                        UNATTENDED_UPGRADES_OPTION_AVAILABLE=1
                    fi
                done

                if [ ${UNATTENDED_UPGRADES_OPTION_AVAILABLE} -eq 1 ]; then
                    # Test available tools for Linux
                    if [ -f "${ROOTDIR}bin/auter" ]; then
                        UNATTENDED_UPGRADES_TOOL="auter"
                        UNATTENDED_UPGRADES_TOOLKIT=1
                        LogText "Result: found ${UNATTENDED_UPGRADES_TOOL}"
                        Report "unattended_upgrade_tool[]=${UNATTENDED_UPGRADES_TOOL}"
                    fi
                    if [ -f "${ROOTDIR}sbin/yum-cron" ]; then
                        UNATTENDED_UPGRADES_TOOL="yum-cron"
                        UNATTENDED_UPGRADES_TOOLKIT=1
                        LogText "Result: found ${UNATTENDED_UPGRADES_TOOL}"
                        Report "unattended_upgrade_tool[]=${UNATTENDED_UPGRADES_TOOL}"
                    fi
                    if [ -f "${ROOTDIR}usr/bin/dnf-automatic" ]; then
                        UNATTENDED_UPGRADES_TOOL="dnf-automatic"
                        UNATTENDED_UPGRADES_TOOLKIT=1
                        LogText "Result: found ${UNATTENDED_UPGRADES_TOOL}"
                        Report "unattended_upgrade_tool[]=${UNATTENDED_UPGRADES_TOOL}"
                    fi
                    if [ -f "${ROOTDIR}usr/bin/unattended-upgrade" ]; then
                        UNATTENDED_UPGRADES_TOOL="unattended-upgrade"
                        UNATTENDED_UPGRADES_TOOLKIT=1
                        LogText "Result: found ${UNATTENDED_UPGRADES_TOOL}"
                        Report "unattended_upgrade_tool[]=${UNATTENDED_UPGRADES_TOOL}"
                    fi
                fi
            ;;
        esac

        if [ ${UNATTENDED_UPGRADES_OPTION_AVAILABLE} -eq 1 ]; then
            if [ ${UNATTENDED_UPGRADES_TOOLKIT} -eq 1 ]; then
                AddHP 5 5
                Display --indent 2 --text "- Toolkit for automatic upgrades (${UNATTENDED_UPGRADES_TOOL})" --result "${STATUS_FOUND}" --color GREEN
            else
                AddHP 1 5
                Display --indent 2 --text "- Toolkit for automatic upgrades" --result "${STATUS_NOT_FOUND}" --color YELLOW
                LogText "Result: no toolkit for automatic updates discovered"
                ReportSuggestion "${TEST_NO}" "Consider using a tool to automatically apply upgrades"
            fi
        fi

        Report "unattended_upgrade_option_available=${UNATTENDED_UPGRADES_OPTION_AVAILABLE}"
    fi
#
#################################################################################
#

WaitForKeyPress
