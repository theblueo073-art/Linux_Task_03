# Linux Task 03 — Task Overview

## Part 1: New User Setup (Permissions & Access Control)

### 1. Create a New User

- Create a new user named `forensic01` with a home directory and `/bin/bash` shell.
- Add the user to the sudo group.
- Set a password for the user.

### 2. Switch to the New User

- Login as `forensic01`.

### 3. Create Directories and Files

- Create `/home/forensic01/logs/`.
- Create `sys_events.log` using `cat` and `echo`.
- The log must contain at least 20 lines of mock logs.
- Some lines must include `ERROR`, `WARNING`, `INFO`, `user01`, `root`, and timestamps.

## Part 2: Log Filtering & Analysis

### 1. Use grep

- Find and list all lines containing `ERROR`.
- Extract only lines mentioning `root` or `user01`.

Required task commands:

```bash
grep "ERROR" sys_events.log
grep -E "root|user01" sys_events.log
```

### 2. Piping & Redirection

- Pipe the grep results to `less`.
- Save the output to `error_report.txt`.

### 3. head and tail

- Show the first five lines.
- Show the last five lines.

### 4. cat

- Concatenate and view the full log.

## Part 3: Permissions and Ownership Control

### 1. File Permissions

Create `confidential.txt` in `logs/`.

Set permissions so:

- Owner: read/write
- Group: no access
- Others: no access

### 2. Ownership

Use `sudo` to change the owner of `confidential.txt` to `root`.

### 3. Observation

Try editing or reading the file as `forensic01` after ownership changes.

## Part 4: User Management Commands

- Create `guest1`.
- Create `guest2`.
- Add `guest1` to the sudo group.
- Remove `guest2` from the system, including the home directory.

## Submission

The task requires:

- `commands_used.txt` containing the exact commands used.
- Screenshots of key terminal outputs, including examples such as grep results, `ls -l`, and permission checks.
- 2–3 line explanations of `grep`, `chown`, and `usermod`.
- A short explanation of what was learned from attempting to access `confidential.txt` after its ownership was changed.
