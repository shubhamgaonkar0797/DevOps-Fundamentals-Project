#!/bin/bash

# Report file
REPORT="log-report.txt"

echo "=====================================" > $REPORT
echo "      LINUX SYSTEM LOG REPORT" >> $REPORT
echo "=====================================" >> $REPORT
echo "Generated on: $(date)" >> $REPORT
echo "" >> $REPORT

# Failed Login Attempts
echo "1. Failed Login Attempts" >> $REPORT
echo "------------------------" >> $REPORT
grep "Failed password" /var/log/auth.log 2>/dev/null >> $REPORT
grep "FAILED LOGIN" /var/log/secure 2>/dev/null >> $REPORT
echo "" >> $REPORT

# SSH Login Activity
echo "2. SSH Login Activity" >> $REPORT
echo "---------------------" >> $REPORT
grep "sshd" /var/log/auth.log 2>/dev/null >> $REPORT
grep "sshd" /var/log/secure 2>/dev/null >> $REPORT
echo "" >> $REPORT

# System Errors
echo "3. System Errors" >> $REPORT
echo "----------------" >> $REPORT
grep -i "error" /var/log/syslog 2>/dev/null >> $REPORT
grep -i "error" /var/log/messages 2>/dev/null >> $REPORT
echo "" >> $REPORT

# Warning Messages
echo "4. Warning Messages" >> $REPORT
echo "-------------------" >> $REPORT
grep -i "warning" /var/log/syslog 2>/dev/null >> $REPORT
grep -i "warning" /var/log/messages 2>/dev/null >> $REPORT
echo "" >> $REPORT

echo "Report generated successfully: $REPORT"
