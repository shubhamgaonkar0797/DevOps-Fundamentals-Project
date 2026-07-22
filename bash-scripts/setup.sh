#!/bin/bash

# Check Apache service status
if systemctl is-active --quiet apache2 || systemctl is-active --quiet httpd
then
    echo "Apache service is running."
else
    echo "Apache service is stopped."
    echo "Restarting Apache service..."

    # Restart Apache (Ubuntu/Debian uses apache2, CentOS/RHEL uses httpd)
    if systemctl list-unit-files | grep -q "^apache2.service"; then
        sudo systemctl restart apache2
        SERVICE="apache2"
    else
        sudo systemctl restart httpd
        SERVICE="httpd"
    fi

    # Verify restart
    if systemctl is-active --quiet "$SERVICE"; then
        echo "Apache service restarted successfully."
    else
        echo "Failed to restart Apache service."
    fi
fi
