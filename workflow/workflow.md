# Linux Task 03 — Complete Practical Workflow

> This is a learning workflow. Perform the commands yourself on the designated Linux lab system and record the exact commands/results you actually use.

---

## Phase 1 — Environment Preparation

### Step 1. Confirm your current account

**Run as:** current user

```bash
whoami
```

**Purpose:** Confirms which account is currently active.

**Expected result:** Your current Linux username is displayed.

**Verification:** Run `whoami` again if you change users later.

**Evidence:** Capture this only if useful for your lab record.

---

## Phase 2 — Create `forensic01`

### Step 2. Create the required user

**Run as:** ROOT/SUDO

A suitable command for the task requirements is:

```bash
sudo useradd -m -s /bin/bash forensic01
```

**Purpose:** Creates `forensic01`, creates a home directory, and assigns `/bin/bash`.

**Expected result:** The account is created without an error.

**Verification:**

```bash
getent passwd forensic01
```

Confirm that the entry includes `/home/forensic01` and `/bin/bash`.

**Evidence:** Capture the verification output if required for your records.

### Step 3. Add `forensic01` to sudo

**Run as:** ROOT/SUDO

```bash
sudo usermod -aG sudo forensic01
```

**Purpose:** Adds `forensic01` to the sudo group without replacing existing supplementary groups.

**Verification:**

```bash
id forensic01
```

Confirm that `sudo` appears among the groups.

**Evidence:** Capture the `id forensic01` output.

### Step 4. Set the password

**Run as:** ROOT/SUDO

```bash
sudo passwd forensic01
```

**Purpose:** Sets a password for `forensic01`.

**Expected result:** Linux prompts for and confirms the new password.

**Verification:** Do not paste the password into this repository.

**Evidence:** Do not capture or store the password.

---

## Phase 3 — Login as `forensic01`

### Step 5. Switch to `forensic01`

**Run as:** ROOT/SUDO or an account permitted to switch users

```bash
su - forensic01
```

Enter the password when prompted.

**Purpose:** Starts a login shell as `forensic01`.

**Verification:**

```bash
whoami
```

Expected result:

```text
forensic01
```

**Evidence:** Capture the terminal showing the account if useful.

---

## Phase 4 — Create Logs

### Step 6. Create the logs directory

**Run as:** `forensic01`

```bash
mkdir -p /home/forensic01/logs/
```

**Purpose:** Creates the required log directory.

**Verification:**

```bash
ls -ld /home/forensic01/logs/
```

**Evidence:** Capture the directory listing if required.

### Step 7. Create `sys_events.log` using `cat` and `echo`

**Run as:** `forensic01`

The task specifically requires using `cat` and `echo` and requires at least 20 mock-log lines. Build the content yourself so your command history reflects what you actually performed.

Example method using `cat`:

```bash
cat > /home/forensic01/logs/sys_events.log
```

Enter at least 20 mock-log lines. Include timestamps and make sure some lines contain:

- `ERROR`
- `WARNING`
- `INFO`
- `user01`
- `root`

Finish the `cat` input with `Ctrl+D`.

You can also use `echo` to add lines, for example:

```bash
echo "2026-10-01 20:00:00 INFO user01 session started" >> /home/forensic01/logs/sys_events.log
```

**Important:** The activity requires `cat` and `echo`; do not replace this with a different method.

**Verification:**

```bash
wc -l /home/forensic01/logs/sys_events.log
cat /home/forensic01/logs/sys_events.log
```

Confirm there are at least 20 lines and the required terms appear.

**Evidence:** Capture a screenshot showing the log and/or line count.

---

## Phase 5 — Log Filtering & Analysis

### Step 8. Find all `ERROR` lines

**Run as:** `forensic01`

From the logs directory:

```bash
cd /home/forensic01/logs/
grep "ERROR" sys_events.log
```

**Purpose:** Lists lines containing the keyword `ERROR`.

**Verification:** Confirm every displayed line contains `ERROR`.

**Evidence:** Capture the grep output.

### Step 9. Extract `root` or `user01` lines

**Run as:** `forensic01`

```bash
grep -E "root|user01" sys_events.log
```

**Purpose:** Uses extended regular expressions to select lines containing either `root` or `user01`.

**Verification:** Confirm the displayed lines mention one of those terms.

**Evidence:** Capture the output.

### Step 10. Pipe grep results to `less`

**Run as:** `forensic01`

For ERROR lines:

```bash
grep "ERROR" sys_events.log | less
```

For `root`/`user01` lines:

```bash
grep -E "root|user01" sys_events.log | less
```

**Purpose:** Sends grep output into `less` for interactive viewing.

**Note:** `less` is interactive. Press `q` to leave it.

**Evidence:** Capture the terminal if your instructor requires proof of this step.

### Step 11. Save ERROR output to `error_report.txt`

**Run as:** `forensic01`

```bash
grep "ERROR" sys_events.log > error_report.txt
```

**Purpose:** Redirects the ERROR-filtered output into `error_report.txt`.

**Verification:**

```bash
cat error_report.txt
```

**Evidence:** Capture `cat error_report.txt` or a suitable `ls -l` plus content check.

---

## Phase 6 — head, tail, and cat

### Step 12. Show first five lines

**Run as:** `forensic01`

```bash
head -n 5 sys_events.log
```

**Purpose:** Displays the first five lines.

**Evidence:** Capture the output if required.

### Step 13. Show last five lines

**Run as:** `forensic01`

```bash
tail -n 5 sys_events.log
```

**Purpose:** Displays the last five lines.

**Evidence:** Capture the output if required.

### Step 14. View the complete log

**Run as:** `forensic01`

```bash
cat sys_events.log
```

**Purpose:** Displays the full log contents.

**Evidence:** Capture only if required; the task mainly requires the operation.

---

## Phase 7 — Permissions and Ownership

### Step 15. Create `confidential.txt`

**Run as:** `forensic01`

```bash
touch confidential.txt
```

**Purpose:** Creates the required file inside `logs/`.

**Verification:**

```bash
ls -l confidential.txt
```

### Step 16. Set owner read/write and deny group/others

**Run as:** `forensic01`

```bash
chmod 600 confidential.txt
```

**Purpose:** `600` gives the owner read/write access and gives group and others no permissions.

**Verification:**

```bash
ls -l confidential.txt
```

Expected permission pattern:

```text
-rw-------
```

The exact owner/group names depend on the system and must be verified from your actual output.

**Evidence:** Capture the `ls -l` permission check. This is one of the task's example evidence items.

### Step 17. Change owner to `root`

**Run as:** ROOT/SUDO

```bash
sudo chown root confidential.txt
```

**Purpose:** Changes the file owner to `root`.

**Verification:**

```bash
ls -l confidential.txt
```

Confirm the owner field is `root`.

**Evidence:** Capture `ls -l confidential.txt`.

### Step 18. Attempt to read or edit as `forensic01`

**Run as:** `forensic01`

Attempt to read:

```bash
cat confidential.txt
```

You may also attempt an edit using an editor available in your lab, but do not fabricate the result.

**Purpose:** Observe how ownership and permissions affect access.

**Important:** Record exactly what happens on your system. The repository does not pre-fill the outcome.

**Evidence:** Capture the actual terminal result.

---

## Phase 8 — Temporary User Management

### Step 19. Create `guest1`

**Run as:** ROOT/SUDO

```bash
sudo useradd -m guest1
```

**Verification:**

```bash
id guest1
```

### Step 20. Create `guest2`

**Run as:** ROOT/SUDO

```bash
sudo useradd -m guest2
```

**Verification:**

```bash
id guest2
```

### Step 21. Add `guest1` to sudo

**Run as:** ROOT/SUDO

```bash
sudo usermod -aG sudo guest1
```

**Verification:**

```bash
id guest1
```

Confirm `sudo` is included.

### Step 22. Remove `guest2` including its home directory

**Run as:** ROOT/SUDO

```bash
sudo userdel -r guest2
```

**Purpose:** Removes `guest2` and requests removal of its home directory.

**Verification:**

```bash
id guest2
```

The account should no longer be resolvable. Also check that the home directory is absent:

```bash
ls -ld /home/guest2
```

Record the actual system response.

**Safety note:** Run this only for the temporary lab account `guest2`.

---

## Phase 9 — Evidence Collection

Capture evidence while the relevant command/output is visible.

Recommended filenames:

```text
01-forensic01-user.png
02-forensic01-sudo.png
03-logs-directory.png
04-sys-events-log.png
05-grep-error.png
06-grep-root-user01.png
07-error-report.png
08-head-tail.png
09-confidential-permissions.png
10-confidential-root-owner.png
11-confidential-access-attempt.png
12-guest-users.png
13-guest1-sudo.png
14-guest2-removed.png
```

Only keep screenshots that actually correspond to commands you performed.

---

## Phase 10 — Final Submission

### Step 23. Save exact commands

Create or complete:

```text
submission/commands_used.txt
```

Paste the exact commands you actually used, not commands copied from this template if you changed them.

### Step 24. Complete the explanations

In `submission/final-output.txt`, provide:

1. A 2–3 line explanation of `grep`.
2. A 2–3 line explanation of `chown`.
3. A 2–3 line explanation of `usermod`.
4. A short explanation of what you learned from trying to access `confidential.txt` after its ownership changed.

### Step 25. Final verification

Before submission, verify:

```bash
id forensic01
getent passwd forensic01
ls -ld /home/forensic01/logs/
ls -l /home/forensic01/logs/
id guest1
id guest2
```

For `guest2`, the expected verification is that the account has been removed; record the actual output.

Then confirm your screenshots and submission files are complete.

---

# Final Verification Checklist

- [ ] `forensic01` created with a home directory
- [ ] `forensic01` uses `/bin/bash`
- [ ] `forensic01` added to sudo
- [ ] Password set
- [ ] Logged in as `forensic01`
- [ ] `/home/forensic01/logs/` created
- [ ] `sys_events.log` created using `cat` and `echo`
- [ ] At least 20 mock-log lines present
- [ ] Timestamps included
- [ ] `ERROR` included
- [ ] `WARNING` included
- [ ] `INFO` included
- [ ] `user01` included
- [ ] `root` included
- [ ] `grep "ERROR" sys_events.log` completed
- [ ] `grep -E "root|user01" sys_events.log` completed
- [ ] Grep output piped to `less`
- [ ] ERROR output saved to `error_report.txt`
- [ ] First 5 lines displayed
- [ ] Last 5 lines displayed
- [ ] Full log viewed with `cat`
- [ ] `confidential.txt` created
- [ ] Permissions set to owner read/write, group/others no access
- [ ] Owner changed to `root`
- [ ] Access attempt performed as `forensic01`
- [ ] `guest1` created
- [ ] `guest2` created
- [ ] `guest1` added to sudo
- [ ] `guest2` removed with home directory
- [ ] Key screenshots captured
- [ ] `commands_used.txt` contains exact commands actually used
- [ ] `grep` explanation completed
- [ ] `chown` explanation completed
- [ ] `usermod` explanation completed
- [ ] Confidential-file access lesson documented
