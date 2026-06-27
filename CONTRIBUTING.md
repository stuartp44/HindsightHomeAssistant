# Contributing

## Commit format (required)

All commits must use Conventional Commits:

<type>(<scope>): <subject>

Examples:

- fix(addon): run app as non-root for embedded postgres
- ci(workflows): add release and smoke test pipelines
- docs(readme): clarify setup steps

## Rules

- Keep subject short and specific.
- Use lower-case type values.
- Prefer one logical change per commit.
- Allowed types: build, chore, ci, docs, feat, fix, perf, refactor, revert, style, test.

## Why this matters

- Release Please uses commit history to build release notes and versions.
- Small scoped commits make debugging and rollback safer.
