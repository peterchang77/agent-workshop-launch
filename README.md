# agent-workshop-launch

Tiny launcher for hands-on workshops built on
[agent-ai-skills](https://github.com/peterchang77/agent-ai-skills). It opens a
Google Cloud Shell session, prints instructions, and installs the workshop data
and Kiro CLI with one command (`bash go.sh`).

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/peterchang77/agent-workshop-launch&cloudshell_print=START.txt&cloudshell_workspace=.&show=terminal)

## Layout

- `main`: template for new workshops.
- One branch per workshop (for example `uci-ffast-2026`) with that event's `START.txt` and `go.sh`.
  Launch a specific branch by adding `&cloudshell_git_branch=<branch>` to the link.

## New workshop

```bash
git switch -c <slug> main      # edit START.txt / go.sh, then push the branch
```

Launch link:

```
https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/peterchang77/agent-workshop-launch&cloudshell_git_branch=<slug>&cloudshell_print=START.txt&cloudshell_workspace=.&show=terminal
```

Nothing sensitive belongs here: the repo is public and Cloud Shell requires that.
Sign-in to Kiro uses the Google device flow; no credentials are stored in this repo.
