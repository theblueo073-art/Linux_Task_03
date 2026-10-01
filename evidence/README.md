# Evidence Collection

The uploaded task requires screenshots of key terminal outputs, with examples including:

- `grep` results
- `ls -l`
- Permission checks

The evidence folders are placeholders only. No fake screenshots or fake command output are included.

## Recommended Evidence Sequence

| Filename | What to capture | What it proves |
|---|---|---|
| `01-forensic01-user.png` | `getent passwd forensic01` / `id forensic01` | User and account configuration |
| `02-forensic01-sudo.png` | `id forensic01` | `forensic01` is in sudo |
| `03-logs-directory.png` | `ls -ld /home/forensic01/logs/` | Required directory exists |
| `04-sys-events-log.png` | `wc -l` and/or log content | At least 20 mock-log lines and required content |
| `05-grep-error.png` | `grep "ERROR" sys_events.log` | ERROR filtering |
| `06-grep-root-user01.png` | `grep -E "root|user01" sys_events.log` | root/user01 filtering |
| `07-error-report.png` | `cat error_report.txt` | Redirected ERROR output |
| `08-head-tail.png` | `head -n 5` and `tail -n 5` | First/last five lines |
| `09-confidential-permissions.png` | `ls -l confidential.txt` | Owner-only read/write permissions |
| `10-confidential-root-owner.png` | `ls -l confidential.txt` | Ownership changed to root |
| `11-confidential-access-attempt.png` | Actual `cat`/edit attempt | Observed access behavior |
| `12-guest-users.png` | `id guest1` and `id guest2` | Temporary users created |
| `13-guest1-sudo.png` | `id guest1` | guest1 added to sudo |
| `14-guest2-removed.png` | Actual verification after `userdel -r guest2` | guest2 removal |

## Screenshot Rules

- Capture the actual terminal output from your lab.
- Make sure the command and relevant result are visible.
- Do not edit the output to manufacture a result.
- Do not include passwords.
- Use the suggested filenames only if they match the evidence you actually captured.
