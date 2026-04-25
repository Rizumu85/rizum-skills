# Rizum Skills

[English](./README.md) | [中文](./README.zh.md)

Rizum Skills is a small set of personal rules for AI coding agents.

It is meant for people who want agents to slow down a little, write down the plan, keep that plan updated, and leave full testing to the human unless asked otherwise.

The main rule file is [`AGENTS.md`](./AGENTS.md). The Claude and Cursor files are copies or mirrors so different tools can read the same rules.

The installable skill is called `rizum-guidelines`.

## What It Does

- Makes the agent check for `analysis.md`, `design.md`, and `plan.md`.
- Makes the agent create missing planning files before editing code.
- Makes `design.md` start with the project goal.
- Keeps `plan.md` as a checklist and updates it while work happens.
- Limits self-checking to syntax or static checks.
- Leaves full testing to you.
- Uses English for files and Chinese for chat summaries.

## Install The Global Rules

Clone the repo:

```bash
git clone https://github.com/Rizumu85/rizum-skills.git ~/rizum-skills
cd ~/rizum-skills
```

Run the installer:

```bash
./install.sh
```

This links the rules into:

- Claude Code: `~/.claude/CLAUDE.md`
- Codex CLI/Desktop: `~/.codex/AGENTS.md`

For Cursor, the installer copies the rules to your clipboard. Paste them into Cursor User Rules.

## Install The Codex Skill

Use this if you want Codex Desktop to expose the skill as `rizum-guidelines`:

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --url https://github.com/Rizumu85/rizum-skills/tree/main/skills/rizum-guidelines
```

Restart Codex Desktop after installing.

The skill is explicit-only. Use it by saying something like:

```text
Use rizum-guidelines for this task.
```

After you invoke it, the agent should write a short working agreement into the project docs, usually in `plan.md`. That makes later turns easier to resume, even if the skill itself is not automatically reloaded.

## Install In Claude

Add this repository as a Claude marketplace:

```text
https://github.com/Rizumu85/rizum-skills
```

The Claude package should show as `Rizum skills`.

The skill command stays:

```text
/rizum-guidelines
```

## Update

Pull the latest repo:

```bash
cd ~/rizum-skills
git pull
```

Then restart the app that reads the rules.

For Codex Desktop skill installs, reinstall or copy the updated skill file into:

```text
~/.codex/skills/rizum-guidelines/SKILL.md
```

## Project-Only Use

If you only want these rules for one project, copy the files into that project:

```bash
cp ~/rizum-skills/AGENTS.md /path/to/project/AGENTS.md
cp ~/rizum-skills/CLAUDE.md /path/to/project/CLAUDE.md
```

## Files

```text
rizum-skills/
├── AGENTS.md
├── CLAUDE.md
├── README.md
├── README.zh.md
├── .claude-plugin/
├── skills/rizum-guidelines/SKILL.md
├── install.sh
└── sync.sh
```

## License

MIT
