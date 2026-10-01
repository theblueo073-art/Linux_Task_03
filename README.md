# Linux Task 03 — User Management, Log Filtering & Permissions

## Project Description

This repository is a GitHub-ready workflow for **Linux Task 03**. It is a practical exercise covering:

- New user creation and sudo access
- Switching to a specified user
- Directory and mock-log creation
- `grep`, piping, redirection, `head`, `tail`, and `cat`
- File permissions and ownership
- Temporary user management
- Evidence and submission preparation

This repository is a **lab template**. It does not contain fabricated command output, screenshots, usernames beyond those specified by the task, or completed results.

## Objective

Complete the Linux practical exercise while demonstrating user/account management, text-processing tools, permissions, ownership, and basic evidence collection.

## Lab Requirements

The uploaded task specifies the following:

1. Create user `forensic01` with a home directory and `/bin/bash`.
2. Add `forensic01` to the sudo group.
3. Set a password for `forensic01`.
4. Login as `forensic01`.
5. Create `/home/forensic01/logs/`.
6. Create `sys_events.log` using `cat` and `echo`, with at least 20 mock-log lines.
7. Include some log lines containing `ERROR`, `WARNING`, `INFO`, `user01`, `root`, and timestamps.
8. Use `grep` to find `ERROR` lines.
9. Use `grep -E` to extract lines mentioning `root` or `user01`.
10. Pipe the grep results to `less`.
11. Save the output to `error_report.txt`.
12. Show the first and last five log lines with `head` and `tail`.
13. View the entire log with `cat`.
14. Create `confidential.txt`.
15. Set it to read/write for the owner and no access for group/others.
16. Change its owner to `root` using `sudo`.
17. Attempt to read or edit it as `forensic01`.
18. Create `guest1` and `guest2`.
19. Add `guest1` to the sudo group.
20. Remove `guest2`, including its home directory.

## Technologies / Tools

- Linux
- Bash
- `useradd`
- `usermod`
- `passwd`
- `su`
- `mkdir`
- `cat`
- `echo`
- `grep`
- `grep -E`
- `less`
- Shell redirection
- `head`
- `tail`
- `chmod`
- `chown`
- `userdel`

## Prerequisites

- A Linux environment where you have permission to perform user-management commands.
- Root access or a user with `sudo` privileges.
- Ability to use the terminal.
- Complete the commands in the order shown in `workflow/workflow.md`.

## Environment / Setup

The task itself requires Linux commands and specifies the users, paths, and shell. It does not specify a particular Linux distribution.

Some commands require elevated privileges. Those are marked **ROOT/SUDO** in the workflow. Commands intended to be run as `forensic01` are marked **FORENSIC01**.

## Project Structure

```text
linux-task-03/
├── README.md
├── .gitignore
├── docs/
│   ├── README.md
│   └── task-overview.md
├── workflow/
│   ├── README.md
│   └── workflow.md
├── commands/
│   ├── README.md
│   └── commands.sh
├── scripts/
│   └── README.md
├── evidence/
│   ├── README.md
│   ├── screenshots/
│   │   └── .gitkeep
│   └── terminal-output/
│       └── .gitkeep
└── submission/
    ├── README.md
    ├── commands_used.txt
    └── final-output.txt
```

## Step-by-Step Workflow

Use `workflow/workflow.md` as the main practical guide.

The workflow is divided into:

1. User setup
2. User login and log creation
3. Log filtering and analysis
4. Permissions and ownership
5. Temporary user management
6. Evidence collection
7. Final verification and submission

## Commands

The ordered command reference is in `commands/commands.sh`.

Important: `commands.sh` is intentionally a **reference command sheet**, not a script to blindly execute from top to bottom. Some commands require passwords or manual interaction, and the task intentionally requires observing access behavior.

## Expected Results

The exact results depend on your Linux environment and the commands you perform. The repository therefore does not contain completed outputs.

You should verify that:

- `forensic01` exists with the required home directory and `/bin/bash`.
- `forensic01` belongs to the sudo group.
- `/home/forensic01/logs/` exists.
- `sys_events.log` contains at least 20 mock-log lines with the specified terms.
- `grep` produces the required filtering results.
- `error_report.txt` contains the saved ERROR-filter output.
- `head` and `tail` display the first and last five lines.
- `confidential.txt` has owner read/write access and no group/other access.
- Ownership changes to `root`.
- The access behavior for `forensic01` is observed and documented.
- `guest1` and `guest2` are created.
- `guest1` is added to sudo.
- `guest2` is removed together with its home directory.

## Evidence Requirements

The task requires screenshots of key terminal outputs, including examples such as:

- `grep` results
- `ls -l`
- Permission checks

See `evidence/README.md` for the recommended evidence sequence and filenames.

Do **not** create fake screenshots or paste invented terminal results into the repository.

## Submission Requirements

The task requires:

- A text file containing the exact commands used: `commands_used.txt`
- Screenshots of key terminal outputs
- A short explanation of:
  - What `grep` does (2–3 lines)
  - What `chown` does (2–3 lines)
  - What `usermod` does (2–3 lines)
  - What was learned from attempting to access `confidential.txt` after changing ownership

The submission workspace is in `submission/`.

## Troubleshooting

### Permission denied

Check the current user and file permissions:

```bash
whoami
ls -l /home/forensic01/logs/
```

If the command requires elevated privileges, use `sudo` where the task specifies it.

### Confirm the current user

```bash
whoami
```

The task requires logging in as `forensic01` before performing the normal-user portions.

### Check user information

```bash
id forensic01
```

### Check the shell

```bash
getent passwd forensic01
```

### Check permissions

```bash
ls -l /home/forensic01/logs/confidential.txt
```

## Safety / Permission Notes

This activity changes system users, groups, ownership, and home directories. Perform it only on the designated lab Linux system.

In particular, `userdel -r guest2` removes the `guest2` account and its home directory. Verify that `guest2` is the temporary lab account before running the command.

## Final Verification Checklist

- [ ] `forensic01` created with a home directory
- [ ] `forensic01` uses `/bin/bash`
- [ ] `forensic01` added to sudo group
- [ ] Password set for `forensic01`
- [ ] Logged in as `forensic01`
- [ ] `/home/forensic01/logs/` created
- [ ] `sys_events.log` created with `cat` and `echo`
- [ ] At least 20 mock-log lines created
- [ ] Required keywords and timestamps included
- [ ] `grep "ERROR"` completed
- [ ] `grep -E "root|user01"` completed
- [ ] Grep output piped to `less`
- [ ] Output saved to `error_report.txt`
- [ ] First five log lines displayed
- [ ] Last five log lines displayed
- [ ] Full log viewed with `cat`
- [ ] `confidential.txt` created
- [ ] `confidential.txt` set to owner read/write only
- [ ] Ownership changed to `root`
- [ ] Access attempt made as `forensic01`
- [ ] `guest1` created
- [ ] `guest2` created
- [ ] `guest1` added to sudo group
- [ ] `guest2` removed with its home directory
- [ ] Required screenshots captured
- [ ] Exact commands saved to `commands_used.txt`
- [ ] Required explanations completed
