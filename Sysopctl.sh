#!/bin/bash

# Command name and version
COMMAND_NAME="sysopctl"
VERSION="v0.1.0"

# Function to display help
show_help() {
    echo "Usage: $COMMAND_NAME [command] [options]"
    echo "Commands:"
    echo "  service list             - List all active services"
    echo "  system load              - Show system load averages"
    echo "  service start <name>     - Start a service"
    echo "  service stop <name>      - Stop a service"
    echo "  disk usage               - Display disk usage"
    echo "  process monitor          - Show real-time process activity"
    echo "  logs analyze             - Analyze critical system logs"
    echo "  backup <path>            - Backup files from <path>"
    echo "Options:"
    echo "  --help                   - Display this help message"
    echo "  --version                - Display the command version"
}

# Function to display version
show_version() {
    echo "$COMMAND_NAME $VERSION"
}

# Function to detect if systemd is available
is_systemd_active() {
    pidof systemd > /dev/null 2>&1
}

# Function for service list command
service_list() {
    if is_systemd_active; then
        systemctl list-units --type=service
    else
        service --status-all
    fi
}

# Function to start a service
service_start() {
    local service_name="$1"
    if is_systemd_active; then
        systemctl start "$service_name"
    else
        service "$service_name" start
    fi
    echo "Service $service_name started."
}

# Function to stop a service
service_stop() {
    local service_name="$1"
    if is_systemd_active; then
        systemctl stop "$service_name"
    else
        service "$service_name" stop
    fi
    echo "Service $service_name stopped."
}

# Check for no arguments
if [ $# -eq 0 ]; then
    show_help
    exit 1
fi

# Parse options
case "$1" in
    --help)
        show_help
        exit 0
        ;;
    --version)
        show_version
        exit 0
        ;;
    service)
        case "$2" in
            list)
                service_list
                exit 0
                ;;
            start)
                if [ -z "$3" ]; then
                    echo "Error: Service name required."
                    exit 1
                fi
                service_start "$3"
                exit 0
                ;;
            stop)
                if [ -z "$3" ]; then
                    echo "Error: Service name required."
                    exit 1
                fi
                service_stop "$3"
                exit 0
                ;;
            *)
                echo "Error: Unknown service command '$2'."
                exit 1
                ;;
        esac
        ;;
    system)
        if [ "$2" == "load" ]; then
            uptime
            exit 0
        else
            echo "Error: Unknown system command '$2'."
            exit 1
        fi
        ;;
    disk)
        if [ "$2" == "usage" ]; then
            df -h
            exit 0
        else
            echo "Error: Unknown disk command '$2'."
            exit 1
        fi
        ;;
    process)
        if [ "$2" == "monitor" ]; then
            top
            exit 0
        else
            echo "Error: Unknown process command '$2'."
            exit 1
        fi
        ;;
    logs)
        if [ "$2" == "analyze" ]; then
            journalctl -p crit
            exit 0
        else
            echo "Error: Unknown logs command '$2'."
            exit 1
        fi
        ;;
    backup)
        if [ -z "$2" ]; then
            echo "Error: Path required for backup."
            exit 1
        fi
        rsync -av --progress "$2" /backup/location/  # Adjust this path as needed
        echo "Backup initiated for $2."
        exit 0
        ;;
    *)
        echo "Error: Unknown command '$1'."
        show_help
        exit 1
        ;;
esac
