# Rizum Skills

Personal behavioral guidelines for AI coding agents — **Claude Code**, **Cursor**, and **Codex CLI** — kept in one place and synced across every machine and every project.

The rules themselves live in [`AGENTS.md`](./AGENTS.md). That file is the single source of truth; the other copies (`CLAUDE.md`, `.cursor/rules/rizum-agent.mdc`) are mirrors of the same content so each tool sees its expected filename.

The installable skill is named `rizum-guidelines`.

## What it enforces

- Mandatory planning via `analysis.md`, `design.md`, `plan.md` before code
- Plans as living to-do checklists that stay in sync with the code
- Self-verification limited to syntax checks; full testing delegated to you
- Bilingual protocol: all docs in English, chat summaries in Chinese

Read [`AGENTS.md`](./AGENTS.md) for the full text.

## Install (one-time per machine)

```bash
git clone https://github.com/Rizumu85/rizum-skills.git ~/rizum-skills
cd ~/rizum-skills
./install.sh
```

This does three things:

| Agent | Where it installs | How it applies |
|---|---|---|
| **Claude Code** | Symlinks `~/.claude/CLAUDE.md` → `AGENTS.md` | Loaded automatically as user memory for every session |
| **Codex CLI** | Symlinks `~/.codex/AGENTS.md` → `AGENTS.md` | Loaded automatically as global agent instructions |
| **Cursor** | Copies content to clipboard + prints instructions | Paste into Cursor → Settings → Rules → User Rules |

Because Claude Code and Codex use symlinks, any `git pull` in `~/rizum-skills` instantly updates those agents — no re-install needed. Cursor is the only one that needs a manual paste when the rules change (Cursor stores User Rules inside the app, not on disk).

## Install as a Skill

For Codex Desktop skill installation:

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo Rizumu85/rizum-skills \
  --path skills/rizum-guidelines
```

Restart Codex Desktop after installing. Use the skill as `rizum-guidelines`.

## Sync updates

When you push a change to the repo:

```bash
~/rizum-skills/sync.sh
```

Or manually:

```bash
cd ~/rizum-skills && git pull
```

The Claude and Codex symlinks pick up the new content on next session. For Cursor, re-run `./install.sh` to copy the fresh rules to your clipboard, then paste into Settings → Rules.

## Editing the rules

1. Edit `AGENTS.md` (that's the source of truth).
2. Mirror the edit into `CLAUDE.md` and `.cursor/rules/rizum-agent.mdc` so anyone reading the repo sees consistent content — or just run the helper:
   ```bash
   cp AGENTS.md CLAUDE.md
   # for the .mdc, keep the YAML frontmatter and replace everything below it
   ```
3. Commit and push:
   ```bash
   git add -A && git commit -m "update rules" && git push
   ```
4. On each machine: `~/rizum-skills/sync.sh`.

## Per-project override

If you want these rules to apply to a specific project (not globally):

```bash
# Claude Code / Codex CLI
cp ~/rizum-skills/AGENTS.md /path/to/your/project/AGENTS.md
cp ~/rizum-skills/CLAUDE.md /path/to/your/project/CLAUDE.md

# Cursor
mkdir -p /path/to/your/project/.cursor/rules
cp ~/rizum-skills/.cursor/rules/rizum-agent.mdc /path/to/your/project/.cursor/rules/
```

Per-project files take precedence over the global ones when both exist.

## Uninstall

```bash
rm ~/.claude/CLAUDE.md    # removes the symlink, not the source
rm ~/.codex/AGENTS.md
# In Cursor: Settings → Rules → clear User Rules
```

## Repo layout

```
rizum-skills/
├── AGENTS.md                         # source of truth
├── CLAUDE.md                         # mirror for Claude Code
├── .claude-plugin/                   # Claude marketplace metadata
├── skills/rizum-guidelines/          # installable Codex/Claude skill
├── .cursor/rules/rizum-agent.mdc     # Cursor rule (with frontmatter)
├── install.sh                        # set up global symlinks + Cursor clipboard
├── sync.sh                           # git pull + re-run install
└── README.md
```

## License

MIT
