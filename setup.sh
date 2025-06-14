#!/bin/bash

help() {
    echo -e "\nUsage: $0 [OPTIONS]\n"
    echo "Available options:"
    echo "  --timezone          Set timezone to Asia/Jakarta"
    echo "  --update            Update the installed packages and package cache"
    echo "  --dev-tools         Install Git, Curl, ZIP, Python3 and Python3-pip"
    echo "  --docker            Install Docker package"
    echo "  --all               Execute all options"
    echo -e "  --help              Show this help\n"
}

set_timezone() {
    timedatectl set-timezone "Asia/Jakarta"
    timedatectl
    echo -e "\nTimezone set to Asia/Jakarta\n"
}

update_package() {
    dnf update -y
    echo -e "\nPackage updated\n"
}

install_dev_tools() {
    dnf install -y --allowerasing git curl zip python3 python3-pip
    echo -e "\nDev tools installed\n"
}

install_docker() {
    dnf install -y docker
    systemctl start docker
    systemctl enable docker
    docker --version
    echo -e "\nDocker installed\n"
}

main() {
    
    if ! grep -q "Amazon Linux 2023" /etc/os-release; then
        echo "Sorry, this script is for Amazon Linux 2023 only."
        exit 1
    fi
    
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root or use sudo."
        exit 1
    fi
    
    if [ $# -eq 0 ]; then
        help
        exit 0
    fi
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            --timezone)
                set_timezone
                shift
            ;;
            --update)
                update_package
                shift
            ;;
            --dev-tools)
                install_dev_tools
                shift
            ;;
            --docker)
                install_docker
                shift
            ;;
            --all)
                set_timezone
                update_package
                install_dev_tools
                install_docker
                shift
            ;;
            --help)
                help
                exit 0
            ;;
            *)
                echo -e "\nUnknown option: $1"
                help
                exit 1
            ;;
        esac
    done
}

main "$@"