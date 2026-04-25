---
name: rizum-guidelines
description: Use only when the user explicitly invokes rizum-guidelines or asks to use Rizum Guidelines. Do not activate automatically for general coding tasks.
license: MIT
version: 1.0.4
---

# Rizum Guidelines

Behavioral guidelines to ensure structured planning, living documentation, and clear communication. Merge with project-specific instructions as needed.

**Activation:** Use this skill only when the user explicitly invokes `rizum-guidelines`, `/rizum-guidelines`, or asks to use Rizum Guidelines. Do not activate it automatically for general coding tasks.

**Sticky use:** After explicit activation, treat Rizum Guidelines as active for the current project or conversation until the user says to stop. Because skills may not be reloaded automatically in later turns, write a short working agreement into the project docs during the first activated turn. Prefer adding it to `plan.md` under a `Working Agreement` section; if `plan.md` is missing, add it to `analysis.md` after creating or reading the required docs. The note should say: `Rizum Guidelines are active for this project/thread until the user says otherwise.`

**Tradeoff:** These guidelines bias toward deliberate planning and continuous documentation over immediate, undocumented coding.

## 1. Mandatory Documentation

**Always ground your work in explicit analysis, design, and planning.**

Before writing project code, inspect the project root for existing `analysis.md`, `design.md`, and `plan.md`.

- If the files already exist, read them first and continue from their current state.
- If one or more files are missing, create only the missing files.
- If the existing docs are stale, update them before changing code.
- Do not overwrite useful existing context just to make a fresh template.

Use the files this way:

- `analysis.md`: understanding of the problem, constraints, assumptions, edge cases, and discoveries.
- `design.md`: architectural choices, system shape, API contracts, UI/UX patterns, and tradeoffs.
- `plan.md`: actionable checklist connected to `analysis.md` and `design.md`.

`design.md` must begin with a `Project Goal` section. The first section should state what the project is trying to achieve in plain language before any implementation details.

## 2. Connected, Testable Planning

**Bridge the gap between theory and execution with actionable steps.**

- Ensure `plan.md` directly references and connects to the context established in both `analysis.md` and `design.md`.
- Break down the plan into sequential steps using To-Do checklists, such as `- [ ]`.
- Size your steps appropriately: they must be small enough to be independently testable and verifiable, but not so micro-granular that they clutter the plan.

## 3. User Testing Guidance

**When the user needs to test, tell them at the right moment and make the steps easy to follow.**

When a plan step requires user testing, pause at the right time and clearly ask the user to test before continuing. Do this after the relevant change is implemented and any allowed syntax/static checks are complete.

Give the user a small, beginner-friendly checklist. Assume the user knows only a little programming. Avoid vague instructions like "test it". Say exactly what to open, what to click or run, what result should appear, and what information to report back if something looks wrong.

A good testing handoff looks like this:

- What changed: one short sentence.
- How to test: 2-5 numbered steps the user can follow.
- Expected result: what success should look like.
- What to tell me: the specific error, screenshot, log line, or behavior to send back.

Keep these testing steps small enough that the user can complete them without needing to understand the whole codebase.

## 4. Living Documents

**Keep your documentation synced with reality.**

- Actively update the To-Do list in `plan.md`, such as `- [x]`, every time a step is completed.
- Treat your documentation as agile. If working feedback, bugs, or new discoveries cause the actual implementation to shift, stop and update `analysis.md`, `design.md`, and `plan.md` to reflect the new direction.
- Never let the code drift away from the documentation.

## 5. Execution and Testing Constraints

**Delegate full testing to the user. Limit self-verification to syntax.**

- Do not attempt to run full project compilations or execute comprehensive test suites.
- Leave functional testing and end-to-end verification to the user.
- If you need to verify code correctness during implementation, restrict your checks strictly to basic syntax validation and static error checking.

## 6. Bilingual Communication Protocol

**Summarize in Chinese, document in English.**

- Write all project files, code, comments, `analysis.md`, `design.md`, `plan.md`, and technical documentation strictly in English.
- When outputting the summary of your changes in the chat interface, write the summary in Chinese.
- Keep all other parts of the chat response in English where appropriate.

These guidelines are working if the project directory always contains up-to-date `analysis.md`, `design.md`, and `plan.md` files; `design.md` starts with the project goal; context is easily transferable between agents; execution matches the checked-off steps; full testing is safely delegated to the user; documentation shifts dynamically with implementation changes; and chat change summaries are consistently delivered in Chinese.
