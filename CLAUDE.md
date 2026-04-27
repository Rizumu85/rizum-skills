# Rizum Agent Guidelines

Behavioral guidelines to ensure deliberate planning, useful documentation, and clear communication. Merge with project-specific instructions as needed.

**Activation:** Use this skill only when the user explicitly invokes `rizum-guidelines`, `/rizum-guidelines`, or asks to use Rizum Guidelines. Do not activate it automatically for general coding tasks.

**Sticky use:** After explicit activation, treat Rizum Guidelines as active for the current project or conversation until the user says to stop. Because skills may not be reloaded automatically in later turns, write a short working agreement into the project docs during the first activated turn. Prefer adding it to `plan.md` under a `Working Agreement` section; if `plan.md` is missing, add it to `analysis.md` after creating or reading the required docs. The note should say: `Rizum Guidelines are active for this project/thread until the user says otherwise.`

**Tradeoff:** These guidelines bias toward deliberate planning and useful handoff documentation over immediate, undocumented coding.

## 1. Mandatory Documentation

**First read what already exists, then create only what is missing.**

Before writing project code, inspect the project root for existing `analysis.md`, `design.md`, and `plan.md`.

- If the files already exist, read them first and continue from their current state.
- If one or more files are missing, create only the missing files.
- If the existing docs are stale, update the relevant section before changing code.
- Do not overwrite useful existing context just to make a fresh template.

Use the files this way:

- `analysis.md`: technical implementation analysis. Write down API docs read, reference implementations inspected, relevant code findings, constraints, edge cases, and the technical conclusions you draw from that research.
- `design.md`: UI, interaction, and user experience design. For non-UI work, use it for user-facing behavior, workflow design, and product-level tradeoffs. It must begin with a `Project Goal` section that states what the project is trying to achieve in plain language.
- `plan.md`: execution plan. It should contain high-level direction sections, and each high-level direction should contain concrete implementation checklist steps.

## 2. Connected, Testable Planning

**Plan at two levels: direction first, implementation steps second.**

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

Keep implementation steps small enough to verify independently, but not so tiny that the plan becomes noisy. Add or adjust small steps during the agent/user conversation when it helps the work stay clear.

## 3. User Testing Guidance

**When the user needs to test, tell them at the right moment and make the steps easy to follow.**

When a plan step requires user testing, pause at the right time and clearly ask the user to test before continuing. Do this after the relevant change is implemented and after any user-requested or debug-required checks are complete.

Give the user a small, beginner-friendly checklist. Assume the user knows only a little programming. Avoid vague instructions like "test it". Say exactly what to open, what to click or run, what result should appear, and what information to report back if something looks wrong.

A good testing handoff looks like this:

- What changed: one short sentence.
- How to test: 2-5 numbered steps the user can follow.
- Expected result: what success should look like.
- What to tell me: the specific error, screenshot, log line, or behavior to send back.

Keep these testing steps small enough that the user can complete them without needing to understand the whole codebase.

## 4. Living Documents

**Keep documentation useful, not noisy.**

Do not update the documents for every tiny thought or line-level change. Update them when the high-level direction changes, when the implementation approach changes, when new technical findings matter, or when a plan item is completed.

- Update `analysis.md` when new API docs, reference code, or technical findings change the implementation understanding.
- Update `design.md` when UI, interaction, UX, or user-facing behavior decisions change.
- Update `plan.md` when a high-level direction changes, implementation steps change, or checklist items are completed.
- It is fine to add or adjust concrete plan substeps during collaboration, but keep them appropriately sized.

## 5. Execution and Testing Constraints

**Do not run checks by default. Let user feedback drive debug checks.**

- Do not run full project compilations or comprehensive test suites unless the user explicitly asks.
- Do not run syntax checks by default.
- Run syntax, static, build, or test commands only when the user asks, or when user feedback/debugging makes that check necessary.
- Leave functional testing and end-to-end verification to the user unless they explicitly ask the agent to perform it.

## 6. Bilingual Communication Protocol

**Summarize in Chinese, document in English.**

- Write all project files, code, comments, `analysis.md`, `design.md`, `plan.md`, and technical documentation strictly in English.
- When outputting the summary of your changes in the chat interface, write the summary in Chinese.
- Keep all other parts of the chat response in English where appropriate.

These guidelines are working if the project has useful and current `analysis.md`, `design.md`, and `plan.md` files; `design.md` starts with the project goal; `analysis.md` captures technical implementation research; `plan.md` separates high-level direction from implementation steps; user testing handoffs are beginner-friendly; checks are only run when requested or debug-driven; and chat change summaries are consistently delivered in Chinese.
