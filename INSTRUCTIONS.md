# OpenCode Devkit Instructions

Core rules and guidelines for OpenCode projects.

## Security (CRITICAL)

**Before ANY commit:**

- No hardcoded secrets (API keys, passwords, tokens)
- All user inputs validated
- SQL injection prevention (parameterized queries)
- XSS prevention (sanitized HTML)
- CSRF protection enabled

**If security issue found:**

1. STOP immediately
2. Use **security-reviewer** agent
3. Fix CRITICAL issues before continuing
4. Rotate any exposed secrets

**Secret Management:**

```typescript
// NEVER
const apiKey = "sk-proj-xxxxx";

// ALWAYS
const apiKey = process.env.OPENAI_API_KEY;
if (!apiKey) throw new Error("OPENAI_API_KEY not configured");
```

> **Refer to:** `.agents/skills/coding-standards` for full code quality standards

---

## Testing (MANDATORY)

**Coverage:** 90%+ required

**TDD Workflow:**

1. Write test first (RED)
2. Run test - should FAIL
3. Write minimal implementation (GREEN)
4. Run test - should PASS
5. Refactor (IMPROVE)
6. Verify 90%+ coverage

**Test Types Required:**

- Unit Tests - Individual functions
- Integration Tests - API endpoints, DB operations
- E2E Tests - Critical user flows (Playwright)

> **Refer to:** `.agents/skills/testing` for detailed testing patterns

---

## Git Workflow

**Commit Format:**

```
<type>: <description>
```

Types: feat, fix, refactor, docs, test, chore, perf, ci

**Feature Implementation:**

1. Use **planner** agent
2. Use **tdd-guide** agent
3. Use **code-reviewer** agent after writing code
4. Commit with detailed messages

---

## Agent Orchestration

| Agent                | Purpose                 | When to Use             |
| -------------------- | ----------------------- | ----------------------- |
| planner              | Implementation planning | Complex features        |
| architect            | System design           | Architectural decisions |
| tdd-guide            | Test-driven development | New features, bug fixes |
| code-reviewer        | Code review             | After writing code      |
| security-reviewer    | Security analysis       | Before commits          |
| build-error-resolver | Fix build errors        | When build fails        |
| e2e-runner           | E2E testing             | Critical user flows     |
| refactor-cleaner     | Dead code cleanup       | Code maintenance        |
| doc-updater          | Documentation           | Updating docs           |
| database-reviewer    | Database optimization   | SQL, schema design      |

> **Refer to:** `AGENTS.md` for full agent documentation

---

## Available Skills

Skills are loaded from `.agents/skills/`:

| Skill                       | Description                       |
| --------------------------- | --------------------------------- |
| coding-standards            | Code quality, TypeScript patterns |
| testing                     | TDD, E2E, Playwright patterns     |
| frontend-patterns           | React, state management           |
| backend-patterns            | Server patterns, APIs             |
| api-design                  | REST API design                   |
| e2e-testing                 | Playwright patterns               |
| expect                      | Adversarial browser testing       |
| bun-runtime                 | Bun-specific patterns             |
| mcp-server-patterns         | MCP server development            |
| organization-best-practices | Project organization              |
| better-auth-best-practices  | Authentication patterns           |
| two-factor-authentication   | 2FA implementation                |
| email-and-password          | Email/password auth               |
| create-auth-skill           | Building auth skills              |
| verification-loop           | Verification patterns             |

---

## Commands Available

- `/plan` - Create implementation plan
- `/tdd` - Enforce TDD workflow
- `/code-review` - Review code changes
- `/security` - Run security review
- `/build-fix` - Fix build errors
- `/e2e` - Generate E2E tests
- `/refactor-clean` - Remove dead code

---

## After Writing Code

Run these manually (no hooks in OpenCode):

- `bun run fmt` - Format code
- `bun run typecheck` - Type check
- Check for console.log statements

---

## Success Metrics

- All tests pass (90%+ coverage)
- No security vulnerabilities
- Code is readable and maintainable
- User requirements met
