# agent-workshop-launch

Launch pages for hands-on workshops built on
[agent-ai-skills](https://github.com/peterchang77/agent-ai-skills) ([website](https://peterchang77.github.io/agent-ai-skills/)).
Each workshop has its own folder with an overview, a launch link, step-by-step setup, and the small scripts that run
in Google Cloud Shell. The main materials repo stays generic; everything specific to one event lives here.

## Workshops

| Workshop | Date |
|---|---|
| [Accelerating Clinical Science with AI and Coding Agents (UCI ICTS FFAST)](workshops/uci-ffast-2026/) | 2026-10-14 |

## Add a workshop

1. Copy an existing folder: `cp -r workshops/uci-ffast-2026 workshops/<slug>`.
2. Edit its `README.md` (overview, dates, links), `START.txt` (text printed on launch), and `go.sh` if needed.
3. In the README, update the launch link's `cloudshell_print` and `cloudshell_workspace` paths to `workshops/<slug>/...`.
4. Reuse screenshots from `shared/images/`. Never commit screenshots that show login codes unless they are blurred.
5. Tag the final state (for example `git tag <slug>`) so the workshop stays reproducible.

Everything here is public, because Cloud Shell requires a public repo. Do not add credentials or private data.
