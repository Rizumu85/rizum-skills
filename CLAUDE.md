# Rizum Agent Guidelines

Behavioral guidelines for coding agents that need planning, handoff docs, and clear user communication.

**Activation:** Use this skill only when the user explicitly invokes `rizum-guidelines`, `/rizum-guidelines`, or asks to use Rizum Guidelines.

**Tradeoff:** These guidelines bias toward deliberate planning and useful handoff documentation over speed. For trivial tasks, use judgment.

## 1. Persist Activation

**If Rizum is active, write it down where future agents will read it.**

After explicit activation:
- Treat Rizum Guidelines as active for this project/thread until the user says otherwise.
- Add this exact line to each relevant agent-facing doc: `Rizum Guidelines are active for this project/thread until the user says otherwise.`
- Prefer `AGENTS.md` for Codex and `CLAUDE.md` for Claude when those files exist or belong in the project.
- If agent instruction files are unavailable, add the line to project docs, preferably `plan.md` under `Working Agreement`.
- Do not create global rules or unrelated config unless the user asks.

The goal is simple: later turns should recover the agreement by reading project files, even if the skill is not reloaded.

## 2. Ground The Work

**Read first. Create only what is missing.**

Before project code changes:
- Check for `analysis.md`, `design.md`, and `plan.md` in the project root.
- Read existing docs before writing new ones.
- Create only missing docs.
- Update stale sections before code changes.
- Never overwrite useful context just to install a template.

Use the docs this way:
- `analysis.md`: technical implementation analysis. Capture API docs read, reference implementations inspected, relevant code findings, constraints, edge cases, and conclusions.
- `design.md`: UI, interaction, UX, and user-facing behavior. Start with `Project Goal` in plain language.
- `plan.md`: high-level directions with concrete implementation steps under each direction.

## 3. Plan In Two Layers

**Direction first. Steps second.**

Structure `plan.md` like this:

```md
## Working Agreement

- Rizum Guidelines are active for this project/thread until the user says otherwise.

## Direction 1: Short Name

Goal: One sentence describing this direction.

- [ ] Concrete implementation step
- [ ] Concrete implementation step

## Direction 2: Short Name

Goal: One sentence describing this direction.

- [ ] Concrete implementation step
- [ ] Concrete implementation step
```

Good plan steps are:
- Concrete enough to verify.
- Small enough to finish independently.
- Not so tiny that the plan becomes noise.
- Grouped under the direction they serve.

## 4. Keep Docs Alive, Not Loud

**Update when direction changes. Don't narrate every keystroke.**

Update docs when:
- The high-level direction changes.
- The implementation approach changes.
- New API docs, reference code, or technical findings matter.
- User feedback changes the plan.
- A meaningful plan item is completed.

Do not update docs for every tiny thought, line edit, or local cleanup.

## 5. Let The User Test

**When the user needs to test, make it easy.**

When a change needs user verification, pause at the right moment and give a beginner-friendly handoff:
- What changed: one short sentence.
- How to test: 2-5 numbered steps.
- Expected result: what success looks like.
- What to send back: screenshot, exact error, log line, or behavior.

Avoid vague instructions like "test it". Say what to open, click, run, and observe.

## 6. Don't Run Checks By Default

**No syntax, build, or test commands unless there is a reason.**

- Do not run full project compilations or comprehensive test suites unless the user asks.
- Do not run syntax checks by default.
- Run syntax, static, build, or test commands only when the user asks, or when user feedback/debugging makes the check necessary.
- Leave functional and end-to-end testing to the user unless they explicitly ask the agent to perform it.

## 7. Communicate Bilingually

**English in files. Chinese in summaries.**

- Write project files, code, comments, `analysis.md`, `design.md`, `plan.md`, and technical docs in English.
- Summarize chat changes in Chinese.
- Keep other chat content in English when that is more natural for the task.

These guidelines are working if the project has useful `analysis.md`, `design.md`, and `plan.md`; `design.md` starts with `Project Goal`; `plan.md` separates directions from implementation steps; activation is visible in agent-facing docs; user testing handoffs are clear; checks only run when requested or debug-driven; and change summaries are in Chinese.
