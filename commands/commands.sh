#!/usr/bin/env bash
# Linux Task 03 — command reference
# IMPORTANT:
# This is a command sheet, not a blind automation script.
# Some commands require interaction and some must be run as different users.

# ============================================================
# PART 1 — CREATE forensic01
# RUN AS: ROOT/SUDO
# ============================================================

sudo useradd -m -s /bin/bash forensic01
sudo usermod -aG sudo forensic01
sudo passwd forensic01

# Verify account, home directory, shell, and groups:
getent passwd forensic01
id forensic01

# ============================================================
# SWITCH TO forensic01
# RUN AS: ROOT/SUDO OR AUTHORIZED USER
# ============================================================

su - forensic01

# Verify:
whoami

# ============================================================
# PART 1 — LOG DIRECTORY
# RUN AS: forensic01
# ============================================================

mkdir -p /home/forensic01/logs/
cd /home/forensic01/logs/

# ============================================================
# CREATE sys_events.log
# RUN AS: forensic01
# ============================================================
# The task specifically requires cat and echo.
# Use cat interactively to enter at least 20 mock-log lines,
# then use echo to add additional lines as needed.
#
# Example:
# cat > /home/forensic01/logs/sys_events.log
# [manually enter at least 20 lines containing timestamps
# and some ERROR, WARNING, INFO, user01, and root entries]
# [press Ctrl+D]
#
# Example echo:
echo "2026-10-01 20:00:00 INFO user01 session started" >> /home/forensic01/logs/sys_events.log

# Verify:
wc -l /home/forensic01/logs/sys_events.log
cat /home/forensic01/logs/sys_events.log

# ============================================================
# PART 2 — LOG FILTERING
# RUN AS: forensic01
# ============================================================

grep "ERROR" sys_events.log
grep -E "root|user01" sys_events.log

# Pipe grep results to less:
grep "ERROR" sys_events.log | less
grep -E "root|user01" sys_events.log | less

# Press q to exit less.

# Save ERROR output:
grep "ERROR" sys_events.log > error_report.txt

# Verify:
cat error_report.txt

# First and last five lines:
head -n 5 sys_events.log
tail -n 5 sys_events.log

# Full log:
cat sys_events.log

# ============================================================
# PART 3 — PERMISSIONS AND OWNERSHIP
# RUN AS: forensic01 unless marked otherwise
# ============================================================

touch confidential.txt
chmod 600 confidential.txt

# Verify permissions:
ls -l confidential.txt

# Change owner:
# RUN AS: ROOT/SUDO
sudo chown root confidential.txt

# Verify owner:
ls -l confidential.txt

# Attempt access as forensic01:
cat confidential.txt

# Record the actual result; do not fabricate it.

# ============================================================
# PART 4 — TEMPORARY USERS
# RUN AS: ROOT/SUDO
# ============================================================

sudo useradd -m guest1
sudo useradd -m guest2

# Add guest1 to sudo:
sudo usermod -aG sudo guest1

# Verify:
id guest1
id guest2

# Remove guest2 including its home directory:
sudo userdel -r guest2

# Verify actual system response:
id guest2
ls -ld /home/guest2
